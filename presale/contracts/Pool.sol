// SPDX-License-Identifier: MIT

pragma solidity ^0.7.6;

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
        uint256 c = a + b;
        if (c < a) return (false, 0);
        return (true, c);
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
        if (b > a) return (false, 0);
        return (true, a - b);
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) return (true, 0);
        uint256 c = a * b;
        if (c / a != b) return (false, 0);
        return (true, c);
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
        if (b == 0) return (false, 0);
        return (true, a / b);
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
        if (b == 0) return (false, 0);
        return (true, a % b);
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) return 0;
        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "SafeMath: division by zero");
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "SafeMath: modulo by zero");
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        return a - b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryDiv}.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        return a % b;
    }
}

library AddressUpgradeable {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(
            address(this).balance >= amount,
            "Address: insufficient balance"
        );

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{value: amount}("");
        require(
            success,
            "Address: unable to send value, recipient may have reverted"
        );
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data)
        internal
        returns (bytes memory)
    {
        return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return
            functionCallWithValue(
                target,
                data,
                value,
                "Address: low-level call with value failed"
            );
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(
            address(this).balance >= value,
            "Address: insufficient balance for call"
        );
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{value: value}(
            data
        );
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data)
        internal
        view
        returns (bytes memory)
    {
        return
            functionStaticCall(
                target,
                data,
                "Address: low-level static call failed"
            );
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) private pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

abstract contract Initializable {
    /**
     * @dev Indicates that the contract has been initialized.
     */
    bool private _initialized;

    /**
     * @dev Indicates that the contract is in the process of being initialized.
     */
    bool private _initializing;

    /**
     * @dev Modifier to protect an initializer function from being invoked twice.
     */
    modifier initializer() {
        require(
            _initializing || _isConstructor() || !_initialized,
            "Initializable: contract is already initialized"
        );

        bool isTopLevelCall = !_initializing;
        if (isTopLevelCall) {
            _initializing = true;
            _initialized = true;
        }

        _;

        if (isTopLevelCall) {
            _initializing = false;
        }
    }

    /// @dev Returns true if and only if the function is running in the constructor
    function _isConstructor() private view returns (bool) {
        return !AddressUpgradeable.isContract(address(this));
    }
}

abstract contract ContextUpgradeable is Initializable {
    function __Context_init() internal initializer {
        __Context_init_unchained();
    }

    function __Context_init_unchained() internal initializer {}

    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }

    uint256[50] private __gap;
}

abstract contract OwnableUpgradeable is Initializable, ContextUpgradeable {
    address private _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    function __Ownable_init() internal initializer {
        __Context_init_unchained();
        __Ownable_init_unchained();
    }

    function __Ownable_init_unchained() internal initializer {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
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
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(
            newOwner != address(0),
            "Ownable: new owner is the zero address"
        );
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

    uint256[49] private __gap;
}

library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(
            address(this).balance >= amount,
            "Address: insufficient balance"
        );

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{value: amount}("");
        require(
            success,
            "Address: unable to send value, recipient may have reverted"
        );
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data)
        internal
        returns (bytes memory)
    {
        return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return
            functionCallWithValue(
                target,
                data,
                value,
                "Address: low-level call with value failed"
            );
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(
            address(this).balance >= value,
            "Address: insufficient balance for call"
        );
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{value: value}(
            data
        );
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data)
        internal
        view
        returns (bytes memory)
    {
        return
            functionStaticCall(
                target,
                data,
                "Address: low-level static call failed"
            );
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data)
        internal
        returns (bytes memory)
    {
        return
            functionDelegateCall(
                target,
                data,
                "Address: low-level delegate call failed"
            );
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) private pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(
        IERC20 token,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(
            token,
            abi.encodeWithSelector(token.transfer.selector, to, value)
        );
    }

    function safeTransferFrom(
        IERC20 token,
        address from,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(
            token,
            abi.encodeWithSelector(token.transferFrom.selector, from, to, value)
        );
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require(
            (value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(
            token,
            abi.encodeWithSelector(token.approve.selector, spender, value)
        );
    }

    function safeIncreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(
            value
        );
        _callOptionalReturn(
            token,
            abi.encodeWithSelector(
                token.approve.selector,
                spender,
                newAllowance
            )
        );
    }

    function safeDecreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(
            value,
            "SafeERC20: decreased allowance below zero"
        );
        _callOptionalReturn(
            token,
            abi.encodeWithSelector(
                token.approve.selector,
                spender,
                newAllowance
            )
        );
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(
            data,
            "SafeERC20: low-level call failed"
        );
        if (returndata.length > 0) {
            // Return data is optional
            // solhint-disable-next-line max-line-length
            require(
                abi.decode(returndata, (bool)),
                "SafeERC20: ERC20 operation did not succeed"
            );
        }
    }
}

enum Tokentype {
    LPToken,
    Normal
}

interface IKronosLock {
    function lockTokens(
        address token,
        uint256 amount,
        uint256 unlockDate,
        bool feeInBnb,
        Tokentype _tokenType
    ) external payable returns (uint256);

    function withdrawTokens(
        uint256 _id,
        Tokentype _tokenType,
        address _tokenAddress,
        address transferTo
    ) external;
}

interface IUniswapV2Factory {
    event PairCreated(
        address indexed token0,
        address indexed token1,
        address pair,
        uint256
    );

    function feeTo() external view returns (address);

    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);

    function allPairs(uint256) external view returns (address pair);

    function allPairsLength() external view returns (uint256);

    function createPair(address tokenA, address tokenB)
        external
        returns (address pair);

    function setFeeTo(address) external;

    function setFeeToSetter(address) external;
}

interface IUniswapV2Router01 {
    function factory() external pure returns (address);

    function WETH() external pure returns (address);

    function addLiquidityETH(
        address token,
        uint256 amountTokenDesired,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    )
        external
        payable
        returns (
            uint256 amountToken,
            uint256 amountETH,
            uint256 liquidity
        );
}

interface IUniswapV2Router02 is IUniswapV2Router01 {}

interface IPoolFactory {
    function removePoolForToken(address token) external;
}

contract Pool is OwnableUpgradeable {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    using Address for address payable;

    uint256 constant MINIMUM_LOCK_DAYS = 5 minutes;

    enum PoolState {
        inUse,
        completed,
        cancelled
    }

    enum Tier {
        Unverified,
        Bronze,
        Silver,
        Gold,
        Platinum,
        Diamond
    } // Enum
    Tier public tier = Tier.Bronze;

    address public factory;
    address public router;
    address public governance;

    address public token;
    uint256 public rate;
    uint256 public minContribution;
    uint256 public maxContribution;
    uint256 public softCap;
    uint256 public hardCap;

    uint256 public startTime;
    uint256 public endTime;

    uint256 private tokenFeePercent;
    uint256 private ethFeePercent;

    uint256 public liquidityListingRate;
    uint256 public liquidityUnlockTime;
    uint256 public liquidityLockDays;
    uint256 public liquidityPercent;
    uint256 public refundType;

    string public poolDetails;

    PoolState public poolState;

    uint256 public totalRaised;
    uint256 public totalVolumePurchased;
    uint256 public totalClaimed;
    uint256 public totalRefunded;

    uint256 private tvl;
    IKronosLock public lock;
    uint256 public locknumber;

    bool public completedKyc;

    string public urls;

    mapping(address => uint256) public contributionOf;
    mapping(address => uint256) public purchasedOf;
    mapping(address => uint256) public claimedOf;
    mapping(address => uint256) public refundedOf;

    address[] public contributors;
    uint256[] public c_amounts;

    // uint256[3] public vestings;
    uint256[5] public teamVestings;

    bool public isWhitelist;

    uint256 public finalizeTime;
    uint256 public claimedTeamVesting;

    address[] public whitelists;

    event Contributed(
        address indexed user,
        uint256 amount,
        uint256 volume,
        uint256 total
    );

    event WithdrawnContribution(address indexed user, uint256 amount);

    event Claimed(address indexed user, uint256 volume, uint256 total);

    event Finalized(uint256 liquidity, uint256 finishAt);

    modifier inProgress() {
        require(
            poolState == PoolState.inUse,
            "Pool is either completed or cancelled"
        );
        require(block.timestamp < endTime, "Pool ended");
        require(totalRaised < hardCap, "Hardcap reached");
        _;
    }

    modifier onlyOperator() {
        require(
            msg.sender == owner() || msg.sender == governance,
            "Only operator"
        );
        _;
    }

    modifier onlyGovernance() {
        require(msg.sender == governance, "Only governance");
        _;
    }

    receive() external payable {
        if (msg.value > 0) contribute();
    }

    function upgradeHardCap(uint256 _hardCap) external {
        require(factory == msg.sender, "Not allowed");
        hardCap = _hardCap;
    }

    function setTier(uint256 _tier) external {
        require(factory == msg.sender, "Not allowed");
        tier = Tier(_tier);
    }

    function initialize(
        address[4] memory _addrs, // [0] = owner, [1] = token, [2] = router, [3] = governance
        uint256[2] memory _rateSettings, // [0] = rate, [1] = uniswap rate
        uint256[2] memory _contributionSettings, // [0] = min, [1] = max
        uint256[2] memory _capSettings, // [0] = soft cap, [1] = hard cap
        uint256[3] memory _timeSettings, // [0] = start, [1] = end, [2] = unlock seconds
        uint256[2] memory _feeSettings, // [0] = token fee percent, [1] = eth fee percent
        // uint256[3] memory _vestings, //[0] = first release percent, [1] = period minutes, [2] = each cycle percent
        bool _isWhitelist,
        uint256[5] memory _teamVestings, //[0] = total team token, [1] = first release minute, [2] = first release percent, [3] = period minutes, [4] = each cycle percent
        string memory _urls,
        uint256 _liquidityPercent,
        uint256 _refundType,
        string memory _poolDetails,
        IKronosLock _lock
    ) external initializer {
        require(factory == address(0), "Pool: Forbidden");
        require(_addrs[0] != address(0), "Invalid owner address");
        require(
            _contributionSettings[0] <= _contributionSettings[1],
            "Min contribution amount must <= max"
        );
        require(
            _capSettings[0] <= _capSettings[1],
            "Softcap must be >= 50% of hardcap"
        );
        require(
            _timeSettings[0] > block.timestamp,
            "Start time should be in the future"
        );
        require(
            _timeSettings[0] < _timeSettings[1],
            "End time must be after start time"
        );
        require(
            _timeSettings[2] >= MINIMUM_LOCK_DAYS,
            "Liquidity unlock time must be at least 30 days after pool is finalized"
        );
        require(
            _feeSettings[0] >= 0 &&
                _feeSettings[0] <= 100 &&
                _feeSettings[1] >= 0 &&
                _feeSettings[1] <= 100,
            "Invalid fee settings. Must be percentage (0 -> 100)"
        );
        require(
            _rateSettings[0] >= _rateSettings[1],
            "Liquidity listing rate must be less than or equal to pool listing rate"
        );
        require(
            _liquidityPercent >= 30 && _liquidityPercent <= 100,
            "Invalid liquidity percentage"
        );
        require(
            _refundType == 0 || _refundType == 1,
            "Refund type must be 0 or 1"
        );
        OwnableUpgradeable.__Ownable_init();
        transferOwnership(_addrs[0]);
        factory = msg.sender;
        token = _addrs[1];
        router = _addrs[2];
        governance = _addrs[3];
        rate = _rateSettings[0];
        liquidityListingRate = _rateSettings[1];
        minContribution = _contributionSettings[0];
        maxContribution = _contributionSettings[1];
        softCap = _capSettings[0];
        hardCap = _capSettings[1];
        startTime = _timeSettings[0];
        endTime = _timeSettings[1];
        liquidityLockDays = _timeSettings[2];
        tokenFeePercent = _feeSettings[0];
        ethFeePercent = _feeSettings[1];
        liquidityPercent = _liquidityPercent;
        refundType = _refundType;
        poolDetails = _poolDetails;
        poolState = PoolState.inUse;
        urls = _urls;
        // vestings = _vestings;
        isWhitelist = _isWhitelist;
        teamVestings = _teamVestings;
        lock = _lock;
    }

    function contribute() public payable inProgress {
        require(msg.value > 0, "Cant contribute 0");
        if (isWhitelist) {
            uint256 f = 0;
            for (uint256 i = 0; i < whitelists.length; i++) {
                if (whitelists[i] == msg.sender) {
                    f = 1;
                    break;
                }
            }
            require(f == 1, "Not whitelisted");
        }

        uint256 userTotalContribution = contributionOf[msg.sender].add(
            msg.value
        );

        if (hardCap.sub(totalRaised) >= minContribution) {
            require(
                userTotalContribution >= minContribution,
                "Min contribution not reached"
            );
        }
        require(
            userTotalContribution <= maxContribution,
            "Contribute more than allowed"
        );
        require(
            totalRaised.add(msg.value) <= hardCap,
            "Buying amount exceeds hard cap"
        );
        if (contributionOf[msg.sender] == 0) {
            contributors.push(msg.sender);
        }
        contributionOf[msg.sender] = userTotalContribution;
        totalRaised = totalRaised.add(msg.value);
        uint256 volume = msg.value.mul(rate).div(1e18);
        require(volume > 0, "too small Contribution");
        purchasedOf[msg.sender] = purchasedOf[msg.sender].add(volume);
        totalVolumePurchased = totalVolumePurchased.add(volume);
        getC_Amounts();
        emit Contributed(msg.sender, msg.value, volume, totalVolumePurchased);
    }

    function claim() public {
        require(poolState == PoolState.completed, "Pool is not close yet");
        require(
            claimedOf[msg.sender] != purchasedOf[msg.sender],
            "Already claimed"
        );
        uint256 volume = purchasedOf[msg.sender];
        claimedOf[msg.sender] = claimedOf[msg.sender].add(volume);
        totalClaimed = totalClaimed.add(volume);
        IERC20(token).safeTransfer(msg.sender, volume);
        emit Claimed(msg.sender, volume, totalClaimed);
    }

    function withdrawContribution() external {
        if (poolState == PoolState.inUse) {
            require(block.timestamp >= endTime, "Pool is in progress");
            require(totalRaised < softCap, "Soft cap reached");
        } else {
            require(
                poolState == PoolState.cancelled,
                "Cannot withdraw contribution"
            );
        }
        require(refundedOf[msg.sender] == 0, "Already withdrawn contribution");
        require(claimedOf[msg.sender] == 0, "Already claimed");

        uint256 refundAmount = contributionOf[msg.sender];
        refundedOf[msg.sender] = refundAmount;
        totalRefunded = totalRefunded.add(refundAmount);
        contributionOf[msg.sender] = 0;

        payable(msg.sender).sendValue(refundAmount);
        emit WithdrawnContribution(msg.sender, refundAmount);
    }

    function finalize() external onlyOperator {
        require(
            poolState == PoolState.inUse,
            "Pool was finialized or cancelled"
        );
        require(
            totalRaised == hardCap ||
                hardCap.sub(totalRaised) < minContribution ||
                (totalRaised >= softCap && block.timestamp >= endTime),
            "It is not time to finish"
        );

        poolState = PoolState.completed;

        uint256 bnbFee = totalRaised.mul(ethFeePercent).div(100);
        uint256 tokenFee = totalVolumePurchased.mul(tokenFeePercent).div(100);

        uint256 liquidityBnb = totalRaised
            .sub(bnbFee)
            .mul(liquidityPercent)
            .div(100);
        uint256 liquidityToken = liquidityBnb.mul(liquidityListingRate).div(
            1e18
        );

        uint256 remainingBnb = address(this).balance.sub(liquidityBnb).sub(
            bnbFee
        );
        uint256 remainingToken = 0;

        uint256 totalTokenSpent = liquidityToken
            .add(tokenFee)
            .add(totalVolumePurchased)
            .add(teamVestings[0]);
        uint256 balance = IERC20(token).balanceOf(address(this));
        if (balance > totalTokenSpent) {
            remainingToken = balance.sub(totalTokenSpent);
        }

        // Pay platform fees
        payable(governance).sendValue(bnbFee);
        IERC20(token).safeTransfer(governance, tokenFee);

        // Refund remaining
        if (remainingBnb > 0) {
            payable(owner()).sendValue(remainingBnb);
        }

        if (remainingToken > 0) {
            // 0: refund, 1: burn
            if (refundType == 0) {
                IERC20(token).safeTransfer(owner(), remainingToken);
            } else {
                IERC20(token).safeTransfer(address(0xdead), remainingToken);
            }
        }

        tvl = liquidityBnb.mul(2);

        IERC20(token).approve(router, liquidityToken);

        (, , uint256 liquidity) = IUniswapV2Router02(router).addLiquidityETH{
            value: liquidityBnb
        }(
            token,
            liquidityToken,
            liquidityToken,
            liquidityBnb,
            address(this),
            block.timestamp
        );
        liquidityUnlockTime = block.timestamp + liquidityLockDays;
        finalizeTime = block.timestamp;
        tvl = 0;
        address swapFactory = IUniswapV2Router02(router).factory();
        address pair = IUniswapV2Factory(swapFactory).getPair(
            IUniswapV2Router02(router).WETH(),
            token
        );
        uint256 pairamount = IERC20(pair).balanceOf(address(this));
        IERC20(pair).approve(address(lock), pairamount);
        locknumber = IKronosLock(lock).lockTokens(
            pair,
            pairamount,
            liquidityUnlockTime,
            false,
            Tokentype.LPToken
        );
        emit Finalized(liquidity, block.timestamp);
    }

    function cancel() external onlyOperator {
        require(
            poolState == PoolState.inUse,
            "Pool was either finished or cancelled"
        );
        poolState = PoolState.cancelled;
        IPoolFactory(factory).removePoolForToken(token);
        IERC20(token).safeTransfer(
            owner(),
            IERC20(token).balanceOf(address(this))
        );
    }

    function withdrawLeftovers() external onlyOperator {
        require(poolState == PoolState.cancelled, "Pool was not cancelled");

        IERC20(token).safeTransfer(
            owner(),
            IERC20(token).balanceOf(address(this))
        );
    }

    function withdrawTeamVestings() external onlyOperator {
        require(poolState == PoolState.completed, "Pool was not finalized");
        require(teamVestings[0] > 0, "Team Vesting not selected");
        require(
            block.timestamp > endTime &&
                block.timestamp.sub(endTime) > teamVestings[1],
            "It's not time to Withdraw"
        );
        uint256 amount = 0;
        amount = teamVestings[0].mul(teamVestings[2]).div(100);
        amount = amount.add(
            teamVestings[0].mul(
                (block.timestamp.sub(endTime).sub(teamVestings[1]))
                    .div(teamVestings[3])
                    .mul(teamVestings[4])
                    .div(100)
            )
        );
        if (amount > teamVestings[0]) amount = teamVestings[0];
        amount = amount.sub(claimedTeamVesting);
        require(amount > 0, "There is no claimed amount");
        claimedTeamVesting = claimedTeamVesting.add(amount);
        IERC20(token).safeTransfer(owner(), amount);
    }

    function emergencyWithdraw(
        address token_,
        address to_,
        uint256 amount_
    ) external onlyGovernance {
        address swapFactory = IUniswapV2Router02(router).factory();
        address pair = IUniswapV2Factory(swapFactory).getPair(
            IUniswapV2Router02(router).WETH(),
            token
        );
        require(token_ != pair, "Cann't withdraw. withdrawLiquidity() instead");
        IERC20(token_).safeTransfer(to_, amount_);
    }

    function emergencyWithdraw(address payable to_, uint256 amount_)
        external
        onlyGovernance
    {
        to_.sendValue(amount_);
    }

    function updatePoolDetails(string memory details_) external onlyOperator {
        poolDetails = details_;
    }

    function setGovernance(address governance_) external onlyGovernance {
        governance = governance_;
    }

    function setWhiteLists(address[] memory _whitelists)
        external
        onlyOwner
    {
        isWhitelist = _whitelists.length != 0;
        whitelists = _whitelists;
    }

    function getWhiteLists() public view returns (address[] memory) {
        return whitelists;
    }

    function getContributionAmount(address user_)
        public
        view
        returns (uint256, uint256)
    {
        uint256 contributed = contributionOf[user_];

        // Bought all their allocation
        if (contributed >= maxContribution) {
            return (0, 0);
        }

        uint256 availableToBuy = remainingContribution();
        uint256 remainingAllocation = maxContribution.sub(contributed);

        // How much bnb is one token
        if (availableToBuy > remainingAllocation) {
            if (contributed > 0) {
                return (0, remainingAllocation);
            } else {
                return (minContribution, remainingAllocation);
            }
        } else {
            if (contributed > 0) {
                return (0, availableToBuy);
            } else {
                if (availableToBuy < minContribution) {
                    return (0, availableToBuy);
                } else {
                    return (minContribution, availableToBuy);
                }
            }
        }
    }

    function remainingContribution() public view returns (uint256) {
        return hardCap.sub(totalRaised);
    }

    function getContributors() public view returns (address[] memory a) {
        return contributors;
    }

    function convert(uint256 amountInWei) public view returns (uint256) {
        return amountInWei.mul(rate).div(1e18);
    }

    function getData1()
        public
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256,
            string memory a,
            PoolState,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        return (
            rate,
            softCap,
            hardCap,
            liquidityPercent,
            liquidityLockDays,
            totalRaised,
            startTime,
            endTime,
            urls,
            poolState,
            liquidityListingRate,
            refundType,
            minContribution,
            maxContribution
        );
    }

    function getC_Amounts() public {
        delete c_amounts;
        for (uint256 i = 0; i < contributors.length; i++)
            c_amounts.push(contributionOf[contributors[i]]);
    }

    function getData2()
        public
        view
        returns (
            address,
            address[] memory a,
            uint256[] memory b,
            address,
            uint256,
            uint256,
            uint256,
            address,
            // uint256[3] memory c,
            uint256[5] memory d,
            uint256
        )
    {
        uint256 teamVestingAmount = 0;
        if (
            teamVestings[0] > 0 &&
            block.timestamp > endTime &&
            block.timestamp.sub(endTime) > teamVestings[1]
        ) {
            teamVestingAmount = teamVestings[0].mul(teamVestings[2]).div(100);
            teamVestingAmount = teamVestingAmount.add(
                teamVestings[0].mul(
                    (block.timestamp.sub(endTime).sub(teamVestings[1]))
                        .div(teamVestings[3])
                        .mul(teamVestings[4])
                        .div(100)
                )
            );
            if (teamVestingAmount > teamVestings[0])
                teamVestingAmount = teamVestings[0];
            teamVestingAmount = teamVestingAmount.sub(claimedTeamVesting);
        }
        return (
            owner(),
            contributors,
            c_amounts,
            router,
            liquidityUnlockTime,
            claimedTeamVesting,
            finalizeTime,
            token,
            // vestings,
            teamVestings,
            teamVestingAmount
        );
    }

    function getData3(address account)
        public
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        uint256 claimAmount = purchasedOf[account];
        if (finalizeTime == 0) claimAmount = 0;

        return (
            claimAmount,
            contributionOf[account],
            refundedOf[account],
            claimedOf[account],
            purchasedOf[account]
        );
    }

    function withdrawTokens(
        uint256 _id,
        Tokentype _tokenType,
        address _tokenAddress
    ) external onlyOwner {
        IKronosLock(lock).withdrawTokens(
            _id,
            _tokenType,
            _tokenAddress,
            msg.sender
        );
    }
}
