// SPDX-License-Identifier: MIT

pragma solidity ^0.7.6;

import "./Pool.sol";

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _transferOwnership(_msgSender());
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(
            newOwner != address(0)
        );
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

contract PoolFactory is Ownable {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    address[] public pools;

    enum Tier {
        Unverified,
        Bronze,
        Silver,
        Gold,
        Platinum,
        Diamond
    } // Enum

    mapping(Tier => uint256) public tierWiseHardCap;

    mapping(address => bool) public isExisting;

    uint256[2] public fees;
    uint256 public createFee;

    address payable public feeWallet;
    IKronosLock lock;

    uint256 public minSoftCap;

    uint256 public tvl;
    uint256 public curPool;

    constructor(
        uint256 fee1,
        uint256 fee2,
        address _feeWallet,
        address _lockContract
    ) {
        fees[0] = fee1;
        fees[1] = fee2;
        createFee = 3 * 10**17;
        tvl = 0;
        feeWallet = payable(_feeWallet);
        lock = IKronosLock(_lockContract);
        minSoftCap = 250e14;
        tierWiseHardCap[Tier.Unverified] = 2000e14;
        tierWiseHardCap[Tier.Bronze] = 5000e14;
        tierWiseHardCap[Tier.Silver] = 10000e14;
        tierWiseHardCap[Tier.Gold] = 25000e14;
        tierWiseHardCap[Tier.Platinum] = 50000e14;
        tierWiseHardCap[Tier.Diamond] = 100000e14;
    }

    function setMinSoftCap(uint256 _minSoftCap) external onlyOwner {
        require(_minSoftCap > 0);
        minSoftCap = _minSoftCap;
    }

    function setHardCapTier(Tier tier, uint256 amount) external onlyOwner {
        require(amount > 0);
        tierWiseHardCap[tier] = amount;
    }

    function getPools() public view returns (address[] memory a) {
        return pools;
    }

    function getFees() public view returns (uint256[2] memory a) {
        return fees;
    }

    function setValues(
        uint256 _newfee1,
        uint256 _newfee2,
        uint256 _createFee,
        address payable _newFeeWallet
    ) external onlyOwner {
        fees[0] = _newfee1;
        fees[1] = _newfee2;
        createFee = _createFee;
        feeWallet = _newFeeWallet;
    }

    function removePoolForToken(address token) external {
        isExisting[token] = false;
    }

    function estimateTokenAmount(
        uint256[2] memory _rateSettings,
        uint256[2] memory _capSettings,
        uint256 _liquidityPercent,
        uint256 _teamtoken
    ) public view returns (uint256) {
        uint256 tokenamount = _rateSettings[0]
            .mul(_capSettings[1])
            .mul(100)
            .div(100 - fees[0])
            .div(1e18);

        uint256 liquidityBnb = _capSettings[1]
            .mul(_liquidityPercent)
            .div(100)
            .mul(_rateSettings[1]);
        uint256 liquidityToken = liquidityBnb.div(1e18).mul(100).div(
            100 - fees[1]
        );

        uint256 totaltoken = tokenamount + liquidityToken + _teamtoken;

        return totaltoken;
    }

    function upgradeTier(address payable presale, uint256 tier)
        external
        onlyOwner
    {
        Pool(presale).setTier(tier);
        Pool(presale).upgradeHardCap(tierWiseHardCap[Tier(tier)]);
    }

    function createPool(
        address[4] memory _addrs, // [0] = owner, [1] = token, [2] = router, [3] = governance
        uint256[2] memory _rateSettings, // [0] = rate, [1] = uniswap rate
        uint256[2] memory _contributionSettings, // [0] = min, [1] = max
        uint256[2] memory _capSettings, // [0] = soft cap, [1] = hard cap
        uint256[3] memory _timeSettings, // [0] = start, [1] = end, [2] = unlock seconds
        // uint256[3] memory _vestings,
        bool _isWhitelist,
        uint256[5] memory _teamVestings,
        string memory _urls,
        uint256 _liquidityPercent,
        uint256 _refundType,
        string memory _poolDetails
    ) external payable {
        require(_capSettings[0] >= minSoftCap,"softcap >= minSoftCap");
        uint256 totaltoken = estimateTokenAmount(
            _rateSettings,
            _capSettings,
            _liquidityPercent,
            _teamVestings[0]
        );

        if (isExisting[_addrs[1]] == false) {
            require(msg.value >= createFee, "Fee must pay");
            Pool pool = new Pool();
            pools.push(address(pool));
            for (uint256 i = pools.length - 1; i > 0; i--)
                pools[i] = pools[i - 1];
            pools[0] = address(pool);
            isExisting[_addrs[1]] = true;

            IERC20(_addrs[1]).approve(address(pool), totaltoken);

            IERC20(_addrs[1]).transferFrom(
                msg.sender,
                address(pool),
                totaltoken
            );
            _addrs[3] = feeWallet;
            pool.initialize(
                _addrs,
                _rateSettings,
                _contributionSettings,
                _capSettings,
                _timeSettings,
                fees,
                _isWhitelist,
                _teamVestings,
                _urls,
                _liquidityPercent,
                _refundType,
                _poolDetails,
                lock
            );
        }
    }

    receive() external payable {}
}
