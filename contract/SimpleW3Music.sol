// Sources flattened with hardhat v2.12.5 https://hardhat.org

// File @openzeppelin/contracts/utils/introspection/IERC165.sol@v4.3.2

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}


// File @openzeppelin/contracts/token/ERC721/IERC721.sol@v4.3.2


pragma solidity ^0.8.0;

/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721 is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
}


// File @openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol@v4.3.2


pragma solidity ^0.8.0;

/**
 * @title ERC-721 Non-Fungible Token Standard, optional metadata extension
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 */
interface IERC721Metadata is IERC721 {
    /**
     * @dev Returns the token collection name.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the token collection symbol.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the Uniform Resource Identifier (URI) for `tokenId` token.
     */
    function tokenURI(uint256 tokenId) external view returns (string memory);
}


// File @openzeppelin/contracts/token/ERC721/IERC721Receiver.sol@v4.3.2


pragma solidity ^0.8.0;

/**
 * @title ERC721 token receiver interface
 * @dev Interface for any contract that wants to support safeTransfers
 * from ERC721 asset contracts.
 */
interface IERC721Receiver {
    /**
     * @dev Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     *
     * It must return its Solidity selector to confirm the token transfer.
     * If any other value is returned or the interface is not implemented by the recipient, the transfer will be reverted.
     *
     * The selector can be obtained in Solidity with `IERC721.onERC721Received.selector`.
     */
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}


// File @openzeppelin/contracts/utils/Address.sol@v4.3.2


pragma solidity ^0.8.0;

/**
 * @dev Collection of functions related to the address type
 */
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
        require(address(this).balance >= amount, "Address: insufficient balance");

        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain `call` is an unsafe replacement for a function call: use this
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
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
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
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
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
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
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

        (bool success, bytes memory returndata) = target.staticcall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
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

        (bool success, bytes memory returndata) = target.delegatecall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Tool to verifies that a low level call was successful, and revert if it wasn't, either by bubbling the
     * revert reason using the provided one.
     *
     * _Available since v4.3._
     */
    function verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

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


// File @openzeppelin/contracts/utils/Context.sol@v4.3.2


pragma solidity ^0.8.0;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}


// File @openzeppelin/contracts/utils/introspection/ERC165.sol@v4.3.2


pragma solidity ^0.8.0;

/**
 * @dev Implementation of the {IERC165} interface.
 *
 * Contracts that want to implement ERC165 should inherit from this contract and override {supportsInterface} to check
 * for the additional interface id that will be supported. For example:
 *
 * ```solidity
 * function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
 *     return interfaceId == type(MyInterface).interfaceId || super.supportsInterface(interfaceId);
 * }
 * ```
 *
 * Alternatively, {ERC165Storage} provides an easier to use but more expensive implementation.
 */
abstract contract ERC165 is IERC165 {
    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IERC165).interfaceId;
    }
}


// File @openzeppelin/contracts/utils/Strings.sol@v4.3.2


pragma solidity ^0.8.0;

/**
 * @dev String operations.
 */
library Strings {
    bytes16 private constant _HEX_SYMBOLS = "0123456789abcdef";

    /**
     * @dev Converts a `uint256` to its ASCII `string` decimal representation.
     */
    function toString(uint256 value) internal pure returns (string memory) {
        // Inspired by OraclizeAPI's implementation - MIT licence
        // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation.
     */
    function toHexString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0x00";
        }
        uint256 temp = value;
        uint256 length = 0;
        while (temp != 0) {
            length++;
            temp >>= 8;
        }
        return toHexString(value, length);
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation with fixed length.
     */
    function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i) {
            buffer[i] = _HEX_SYMBOLS[value & 0xf];
            value >>= 4;
        }
        require(value == 0, "Strings: hex length insufficient");
        return string(buffer);
    }
}


// File @openzeppelin/contracts/token/ERC721/ERC721.sol@v4.3.2


pragma solidity ^0.8.0;







/**
 * @dev Implementation of https://eips.ethereum.org/EIPS/eip-721[ERC721] Non-Fungible Token Standard, including
 * the Metadata extension, but not including the Enumerable extension, which is available separately as
 * {ERC721Enumerable}.
 */
contract ERC721 is Context, ERC165, IERC721, IERC721Metadata {
    using Address for address;
    using Strings for uint256;

    // Token name
    string private _name;

    // Token symbol
    string private _symbol;

    // Mapping from token ID to owner address
    mapping(uint256 => address) private _owners;

    // Mapping owner address to token count
    mapping(address => uint256) private _balances;

    // Mapping from token ID to approved address
    mapping(uint256 => address) private _tokenApprovals;

    // Mapping from owner to operator approvals
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    /**
     * @dev Initializes the contract by setting a `name` and a `symbol` to the token collection.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165, IERC165) returns (bool) {
        return
        interfaceId == type(IERC721).interfaceId ||
        interfaceId == type(IERC721Metadata).interfaceId ||
        super.supportsInterface(interfaceId);
    }

    /**
     * @dev See {IERC721-balanceOf}.
     */
    function balanceOf(address owner) public view virtual override returns (uint256) {
        require(owner != address(0), "ERC721: balance query for the zero address");
        return _balances[owner];
    }

    /**
     * @dev See {IERC721-ownerOf}.
     */
    function ownerOf(uint256 tokenId) public view virtual override returns (address) {
        address owner = _owners[tokenId];
        require(owner != address(0), "ERC721: owner query for nonexistent token");
        return owner;
    }

    /**
     * @dev See {IERC721Metadata-name}.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev See {IERC721Metadata-symbol}.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev See {IERC721Metadata-tokenURI}.
     */
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString())) : "";
    }

    /**
     * @dev Base URI for computing {tokenURI}. If set, the resulting URI for each
     * token will be the concatenation of the `baseURI` and the `tokenId`. Empty
     * by default, can be overriden in child contracts.
     */
    function _baseURI() internal view virtual returns (string memory) {
        return "";
    }

    /**
     * @dev See {IERC721-approve}.
     */
    function approve(address to, uint256 tokenId) public virtual override {
        address owner = ERC721.ownerOf(tokenId);
        require(to != owner, "ERC721: approval to current owner");

        require(
            _msgSender() == owner || isApprovedForAll(owner, _msgSender()),
            "ERC721: approve caller is not owner nor approved for all"
        );

        _approve(to, tokenId);
    }

    /**
     * @dev See {IERC721-getApproved}.
     */
    function getApproved(uint256 tokenId) public view virtual override returns (address) {
        require(_exists(tokenId), "ERC721: approved query for nonexistent token");

        return _tokenApprovals[tokenId];
    }

    /**
     * @dev See {IERC721-setApprovalForAll}.
     */
    function setApprovalForAll(address operator, bool approved) public virtual override {
        require(operator != _msgSender(), "ERC721: approve to caller");

        _operatorApprovals[_msgSender()][operator] = approved;
        emit ApprovalForAll(_msgSender(), operator, approved);
    }

    /**
     * @dev See {IERC721-isApprovedForAll}.
     */
    function isApprovedForAll(address owner, address operator) public view virtual override returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    /**
     * @dev See {IERC721-transferFrom}.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        //solhint-disable-next-line max-line-length
        require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");

        _transfer(from, to, tokenId);
    }

    /**
     * @dev See {IERC721-safeTransferFrom}.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        safeTransferFrom(from, to, tokenId, "");
    }

    /**
     * @dev See {IERC721-safeTransferFrom}.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) public virtual override {
        require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");
        _safeTransfer(from, to, tokenId, _data);
    }

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * `_data` is additional data, it has no specified format and it is sent in call to `to`.
     *
     * This internal function is equivalent to {safeTransferFrom}, and can be used to e.g.
     * implement alternative mechanisms to perform token transfer, such as signature-based.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function _safeTransfer(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) internal virtual {
        _transfer(from, to, tokenId);
        require(_checkOnERC721Received(from, to, tokenId, _data), "ERC721: transfer to non ERC721Receiver implementer");
    }

    /**
     * @dev Returns whether `tokenId` exists.
     *
     * Tokens can be managed by their owner or approved accounts via {approve} or {setApprovalForAll}.
     *
     * Tokens start existing when they are minted (`_mint`),
     * and stop existing when they are burned (`_burn`).
     */
    function _exists(uint256 tokenId) internal view virtual returns (bool) {
        return _owners[tokenId] != address(0);
    }

    /**
     * @dev Returns whether `spender` is allowed to manage `tokenId`.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function _isApprovedOrOwner(address spender, uint256 tokenId) internal view virtual returns (bool) {
        require(_exists(tokenId), "ERC721: operator query for nonexistent token");
        address owner = ERC721.ownerOf(tokenId);
        return (spender == owner || getApproved(tokenId) == spender || isApprovedForAll(owner, spender));
    }

    /**
     * @dev Safely mints `tokenId` and transfers it to `to`.
     *
     * Requirements:
     *
     * - `tokenId` must not exist.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function _safeMint(address to, uint256 tokenId) internal virtual {
        _safeMint(to, tokenId, "");
    }

    /**
     * @dev Same as {xref-ERC721-_safeMint-address-uint256-}[`_safeMint`], with an additional `data` parameter which is
     * forwarded in {IERC721Receiver-onERC721Received} to contract recipients.
     */
    function _safeMint(
        address to,
        uint256 tokenId,
        bytes memory _data
    ) internal virtual {
        _mint(to, tokenId);
        require(
            _checkOnERC721Received(address(0), to, tokenId, _data),
            "ERC721: transfer to non ERC721Receiver implementer"
        );
    }

    /**
     * @dev Mints `tokenId` and transfers it to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {_safeMint} whenever possible
     *
     * Requirements:
     *
     * - `tokenId` must not exist.
     * - `to` cannot be the zero address.
     *
     * Emits a {Transfer} event.
     */
    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), "ERC721: mint to the zero address");
        require(!_exists(tokenId), "ERC721: token already minted");

        _beforeTokenTransfer(address(0), to, tokenId);

        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(address(0), to, tokenId);
    }

    /**
     * @dev Destroys `tokenId`.
     * The approval is cleared when the token is burned.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     *
     * Emits a {Transfer} event.
     */
    function _burn(uint256 tokenId) internal virtual {
        address owner = ERC721.ownerOf(tokenId);

        _beforeTokenTransfer(owner, address(0), tokenId);

        // Clear approvals
        _approve(address(0), tokenId);

        _balances[owner] -= 1;
        delete _owners[tokenId];

        emit Transfer(owner, address(0), tokenId);
    }

    /**
     * @dev Transfers `tokenId` from `from` to `to`.
     *  As opposed to {transferFrom}, this imposes no restrictions on msg.sender.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     *
     * Emits a {Transfer} event.
     */
    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {
        require(ERC721.ownerOf(tokenId) == from, "ERC721: transfer of token that is not own");
        require(to != address(0), "ERC721: transfer to the zero address");

        _beforeTokenTransfer(from, to, tokenId);

        // Clear approvals from the previous owner
        _approve(address(0), tokenId);

        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);
    }

    /**
     * @dev Approve `to` to operate on `tokenId`
     *
     * Emits a {Approval} event.
     */
    function _approve(address to, uint256 tokenId) internal virtual {
        _tokenApprovals[tokenId] = to;
        emit Approval(ERC721.ownerOf(tokenId), to, tokenId);
    }

    /**
     * @dev Internal function to invoke {IERC721Receiver-onERC721Received} on a target address.
     * The call is not executed if the target address is not a contract.
     *
     * @param from address representing the previous owner of the given token ID
     * @param to target address that will receive the tokens
     * @param tokenId uint256 ID of the token to be transferred
     * @param _data bytes optional data to send along with the call
     * @return bool whether the call correctly returned the expected magic value
     */
    function _checkOnERC721Received(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) private returns (bool) {
        if (to.isContract()) {
            try IERC721Receiver(to).onERC721Received(_msgSender(), from, tokenId, _data) returns (bytes4 retval) {
                return retval == IERC721Receiver.onERC721Received.selector;
            } catch (bytes memory reason) {
                if (reason.length == 0) {
                    revert("ERC721: transfer to non ERC721Receiver implementer");
                } else {
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
        } else {
            return true;
        }
    }

    /**
     * @dev Hook that is called before any token transfer. This includes minting
     * and burning.
     *
     * Calling conditions:
     *
     * - When `from` and `to` are both non-zero, ``from``'s `tokenId` will be
     * transferred to `to`.
     * - When `from` is zero, `tokenId` will be minted for `to`.
     * - When `to` is zero, ``from``'s `tokenId` will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {}
}


pragma solidity ^0.8.0;

/**
 * @title ERC-721 Non-Fungible Token Standard, optional enumeration extension
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 */
interface IERC721Enumerable is IERC721 {
    /**
     * @dev Returns the total amount of tokens stored by the contract.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns a token ID owned by `owner` at a given `index` of its token list.
     * Use along with {balanceOf} to enumerate all of ``owner``'s tokens.
     */
    function tokenOfOwnerByIndex(address owner, uint256 index) external view returns (uint256 tokenId);

    /**
     * @dev Returns a token ID at a given `index` of all the tokens stored by the contract.
     * Use along with {totalSupply} to enumerate all tokens.
     */
    function tokenByIndex(uint256 index) external view returns (uint256);
}

pragma solidity ^0.8.0;

abstract contract ERC721Enumerable is ERC721, IERC721Enumerable {
    // Mapping from owner to list of owned token IDs
    mapping(address => mapping(uint256 => uint256)) internal _ownedTokens;

    // Mapping from token ID to index of the owner tokens list
    mapping(uint256 => uint256) private _ownedTokensIndex;

    // Array with all token ids, used for enumeration
    uint256[] private _allTokens;

    // Mapping from token id to position in the allTokens array
    mapping(uint256 => uint256) private _allTokensIndex;

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(IERC165, ERC721) returns (bool) {
        return interfaceId == type(IERC721Enumerable).interfaceId || super.supportsInterface(interfaceId);
    }

    /**
     * @dev See {IERC721Enumerable-tokenOfOwnerByIndex}.
     */
    function tokenOfOwnerByIndex(address owner, uint256 index) public view virtual override returns (uint256) {
        require(index < ERC721.balanceOf(owner), "ERC721Enumerable: owner index out of bounds");
        return _ownedTokens[owner][index];
    }

    /**
     * @dev See {IERC721Enumerable-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {
        return _allTokens.length;
    }

    /**
     * @dev See {IERC721Enumerable-tokenByIndex}.
     */
    function tokenByIndex(uint256 index) public view virtual override returns (uint256) {
        require(index < ERC721Enumerable.totalSupply(), "ERC721Enumerable: global index out of bounds");
        return _allTokens[index];
    }

    /**
     * @dev Hook that is called before any token transfer. This includes minting
     * and burning.
     *
     * Calling conditions:
     *
     * - When `from` and `to` are both non-zero, ``from``'s `tokenId` will be
     * transferred to `to`.
     * - When `from` is zero, `tokenId` will be minted for `to`.
     * - When `to` is zero, ``from``'s `tokenId` will be burned.
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override {
        super._beforeTokenTransfer(from, to, tokenId);

        if (from == address(0)) {
            _addTokenToAllTokensEnumeration(tokenId);
        } else if (from != to) {
            _removeTokenFromOwnerEnumeration(from, tokenId);
        }
        if (to == address(0)) {
            _removeTokenFromAllTokensEnumeration(tokenId);
        } else if (to != from) {
            _addTokenToOwnerEnumeration(to, tokenId);
        }
    }

    /**
     * @dev Private function to add a token to this extension's ownership-tracking data structures.
     * @param to address representing the new owner of the given token ID
     * @param tokenId uint256 ID of the token to be added to the tokens list of the given address
     */
    function _addTokenToOwnerEnumeration(address to, uint256 tokenId) private {
        uint256 length = ERC721.balanceOf(to);
        _ownedTokens[to][length] = tokenId;
        _ownedTokensIndex[tokenId] = length;
    }

    /**
     * @dev Private function to add a token to this extension's token tracking data structures.
     * @param tokenId uint256 ID of the token to be added to the tokens list
     */
    function _addTokenToAllTokensEnumeration(uint256 tokenId) private {
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

    /**
     * @dev Private function to remove a token from this extension's ownership-tracking data structures. Note that
     * while the token is not assigned a new owner, the `_ownedTokensIndex` mapping is _not_ updated: this allows for
     * gas optimizations e.g. when performing a transfer operation (avoiding double writes).
     * This has O(1) time complexity, but alters the order of the _ownedTokens array.
     * @param from address representing the previous owner of the given token ID
     * @param tokenId uint256 ID of the token to be removed from the tokens list of the given address
     */
    function _removeTokenFromOwnerEnumeration(address from, uint256 tokenId) private {
        // To prevent a gap in from's tokens array, we store the last token in the index of the token to delete, and
        // then delete the last slot (swap and pop).

        uint256 lastTokenIndex = ERC721.balanceOf(from) - 1;
        uint256 tokenIndex = _ownedTokensIndex[tokenId];

        // When the token to delete is the last token, the swap operation is unnecessary
        if (tokenIndex != lastTokenIndex) {
            uint256 lastTokenId = _ownedTokens[from][lastTokenIndex];

            _ownedTokens[from][tokenIndex] = lastTokenId; // Move the last token to the slot of the to-delete token
            _ownedTokensIndex[lastTokenId] = tokenIndex; // Update the moved token's index
        }

        // This also deletes the contents at the last position of the array
        delete _ownedTokensIndex[tokenId];
        delete _ownedTokens[from][lastTokenIndex];
    }

    /**
     * @dev Private function to remove a token from this extension's token tracking data structures.
     * This has O(1) time complexity, but alters the order of the _allTokens array.
     * @param tokenId uint256 ID of the token to be removed from the tokens list
     */
    function _removeTokenFromAllTokensEnumeration(uint256 tokenId) private {
        // To prevent a gap in the tokens array, we store the last token in the index of the token to delete, and
        // then delete the last slot (swap and pop).

        uint256 lastTokenIndex = _allTokens.length - 1;
        uint256 tokenIndex = _allTokensIndex[tokenId];

        // When the token to delete is the last token, the swap operation is unnecessary. However, since this occurs so
        // rarely (when the last minted token is burnt) that we still do the swap here to avoid the gas cost of adding
        // an 'if' statement (like in _removeTokenFromOwnerEnumeration)
        uint256 lastTokenId = _allTokens[lastTokenIndex];

        _allTokens[tokenIndex] = lastTokenId; // Move the last token to the slot of the to-delete token
        _allTokensIndex[lastTokenId] = tokenIndex; // Update the moved token's index

        // This also deletes the contents at the last position of the array
        delete _allTokensIndex[tokenId];
        _allTokens.pop();
    }
}


// File contracts/IERC5018.sol

pragma solidity ^0.8.0;

interface IERC5018 {
    // Large storage methods
    function write(bytes memory name, bytes memory data) external payable;

    function read(bytes memory name) external view returns (bytes memory, bool);

    // return (size, # of chunks)
    function size(bytes memory name) external view returns (uint256, uint256);

    function remove(bytes memory name) external returns (uint256);

    function countChunks(bytes memory name) external view returns (uint256);

    // Chunk-based large storage methods
    function writeChunk(
        bytes memory name,
        uint256 chunkId,
        bytes memory data
    ) external payable;

    function readChunk(bytes memory name, uint256 chunkId) external view returns (bytes memory, bool);

    function chunkSize(bytes memory name, uint256 chunkId) external view returns (uint256, bool);

    function removeChunk(bytes memory name, uint256 chunkId) external returns (bool);

    function truncate(bytes memory name, uint256 chunkId) external returns (uint256);

    function refund() external;

    function destruct() external;

    function getChunkHash(bytes memory name, uint256 chunkId) external view returns (bytes32);
}


// File contracts/optimize/SlotHelper.sol

pragma solidity ^0.8.0;

library SlotHelper {
    uint256 internal constant SLOTDATA_RIGHT_SHIFT = 32;
    uint256 internal constant LEN_OFFSET = 224;
    uint256 internal constant FIRST_SLOT_DATA_SIZE = 28;

    function putRaw(mapping(uint256 => bytes32) storage slots, bytes memory datas) internal returns (bytes32 mdata) {
        uint256 len = datas.length;
        mdata = encodeMetadata(datas);
        if (len > FIRST_SLOT_DATA_SIZE) {
            bytes32 value;
            uint256 ptr;
            assembly {
                ptr := add(datas, add(0x20, FIRST_SLOT_DATA_SIZE))
            }
            for (uint256 i = 0; i < (len - FIRST_SLOT_DATA_SIZE + 32 - 1) / 32; i++) {
                assembly {
                    value := mload(ptr)
                }
                ptr = ptr + 32;
                slots[i] = value;
            }
        }
    }

    function encodeMetadata(bytes memory data) internal pure returns (bytes32 medata) {
        uint256 datLen = data.length;
        uint256 value;
        assembly {
            value := mload(add(data, 0x20))
        }

        datLen = datLen << LEN_OFFSET;
        value = value >> SLOTDATA_RIGHT_SHIFT;

        medata = bytes32(value | datLen);
    }

    function decodeMetadata(bytes32 mdata) internal pure returns (uint256 len, bytes32 data) {
        len = decodeLen(mdata);
        data = mdata << SLOTDATA_RIGHT_SHIFT;
    }

    function decodeMetadataToData(bytes32 mdata) internal pure returns (uint256 len, bytes memory data) {
        len = decodeLen(mdata);
        mdata = mdata << SLOTDATA_RIGHT_SHIFT;
        data = new bytes(len);
        assembly {
            mstore(add(data, 0x20), mdata)
        }
    }

    function getRaw(mapping(uint256 => bytes32) storage slots, bytes32 mdata)
    internal
    view
    returns (bytes memory data)
    {
        uint256 datalen;
        (datalen, data) = decodeMetadataToData(mdata);

        if (datalen > FIRST_SLOT_DATA_SIZE) {
            uint256 ptr = 0;
            bytes32 value = 0;
            assembly {
                ptr := add(data, add(0x20, FIRST_SLOT_DATA_SIZE))
            }
            for (uint256 i = 0; i < (datalen - FIRST_SLOT_DATA_SIZE + 32 - 1) / 32; i++) {
                value = slots[i];
                assembly {
                    mstore(ptr, value)
                }
                ptr = ptr + 32;
            }
        }
    }

    function getRawAt(
        mapping(uint256 => bytes32) storage slots,
        bytes32 mdata,
        uint256 memoryPtr
    ) internal view returns (uint256 datalen, bool found) {
        bytes32 datapart;
        (datalen, datapart) = decodeMetadata(mdata);

        // memoryPtr:memoryPtr+32 is allocated for the data
        uint256 dataPtr = memoryPtr;
        assembly {
            mstore(dataPtr, datapart)
        }

        if (datalen > FIRST_SLOT_DATA_SIZE) {
            uint256 ptr = 0;
            bytes32 value = 0;

            assembly {
                ptr := add(dataPtr, FIRST_SLOT_DATA_SIZE)
            }
            for (uint256 i = 0; i < (datalen - FIRST_SLOT_DATA_SIZE + 32 - 1) / 32; i++) {
                value = slots[i];
                assembly {
                    mstore(ptr, value)
                }
                ptr = ptr + 32;
            }
        }

        found = true;
    }

    function isInSlot(bytes32 mdata) internal pure returns (bool succeed) {
        return decodeLen(mdata) > 0;
    }

    function encodeLen(uint256 datalen) internal pure returns (bytes32 res) {
        res = bytes32(datalen << LEN_OFFSET);
    }

    function decodeLen(bytes32 mdata) internal pure returns (uint256 res) {
        res = uint256(mdata) >> LEN_OFFSET;
    }

    function addrToBytes32(address addr) internal pure returns (bytes32) {
        return bytes32(uint256(uint160(addr)));
    }

    function bytes32ToAddr(bytes32 bt) internal pure returns (address) {
        return address(uint160(uint256(bt)));
    }
}


// File contracts/Memory.sol


pragma solidity ^0.8.0;

library Memory {
    // Size of a word, in bytes.
    uint256 internal constant WORD_SIZE = 32;
    // Size of the header of a 'bytes' array.
    uint256 internal constant BYTES_HEADER_SIZE = 32;
    // Address of the free memory pointer.
    uint256 internal constant FREE_MEM_PTR = 0x40;

    // Compares the 'len' bytes starting at address 'addr' in memory with the 'len'
    // bytes starting at 'addr2'.
    // Returns 'true' if the bytes are the same, otherwise 'false'.
    function equals(
        uint256 addr,
        uint256 addr2,
        uint256 len
    ) internal pure returns (bool equal) {
        assembly {
            equal := eq(keccak256(addr, len), keccak256(addr2, len))
        }
    }

    // Compares the 'len' bytes starting at address 'addr' in memory with the bytes stored in
    // 'bts'. It is allowed to set 'len' to a lower value then 'bts.length', in which case only
    // the first 'len' bytes will be compared.
    // Requires that 'bts.length >= len'
    function equals(
        uint256 addr,
        uint256 len,
        bytes memory bts
    ) internal pure returns (bool equal) {
        require(bts.length >= len);
        uint256 addr2;
        assembly {
            addr2 := add(
            bts,
            /*BYTES_HEADER_SIZE*/
            32
            )
        }
        return equals(addr, addr2, len);
    }

    // Allocates 'numBytes' bytes in memory. This will prevent the Solidity compiler
    // from using this area of memory. It will also initialize the area by setting
    // each byte to '0'.
    function allocate(uint256 numBytes) internal pure returns (uint256 addr) {
        // Take the current value of the free memory pointer, and update.
        assembly {
            addr := mload(
            /*FREE_MEM_PTR*/
            0x40
            )
            mstore(
            /*FREE_MEM_PTR*/
            0x40,
            add(addr, numBytes)
            )
        }
        uint256 words = (numBytes + WORD_SIZE - 1) / WORD_SIZE;
        for (uint256 i = 0; i < words; i++) {
            assembly {
                mstore(
                add(
                addr,
                mul(
                i,
                /*WORD_SIZE*/
                32
                )
                ),
                0
                )
            }
        }
    }

    // Copy 'len' bytes from memory address 'src', to address 'dest'.
    // This function does not check the or destination, it only copies
    // the bytes.
    function copy(
        uint256 src,
        uint256 dest,
        uint256 len
    ) internal pure {
        // Copy word-length chunks while possible
        // Reverse copy to prevent out of memory bound error
        src = src + len;
        dest = dest + len;
        for (; len >= WORD_SIZE; len -= WORD_SIZE) {
            dest -= WORD_SIZE;
            src -= WORD_SIZE;

            assembly {
                mstore(dest, mload(src))
            }
        }

        if (len == 0) {
            return;
        }

        // Copy remaining bytes
        src = src - len;
        dest = dest - len;
        assembly {
            mstore(dest, mload(src))
        }
    }

    // Returns a memory pointer to the provided bytes array.
    function ptr(bytes memory bts) internal pure returns (uint256 addr) {
        assembly {
            addr := bts
        }
    }

    // Returns a memory pointer to the data portion of the provided bytes array.
    function dataPtr(bytes memory bts) internal pure returns (uint256 addr) {
        assembly {
            addr := add(
            bts,
            /*BYTES_HEADER_SIZE*/
            32
            )
        }
    }

    // This function does the same as 'dataPtr(bytes memory)', but will also return the
    // length of the provided bytes array.
    function fromBytes(bytes memory bts) internal pure returns (uint256 addr, uint256 len) {
        len = bts.length;
        assembly {
            addr := add(
            bts,
            /*BYTES_HEADER_SIZE*/
            32
            )
        }
    }

    // Creates a 'bytes memory' variable from the memory address 'addr', with the
    // length 'len'. The function will allocate new memory for the bytes array, and
    // the 'len bytes starting at 'addr' will be copied into that new memory.
    function toBytes(uint256 addr, uint256 len) internal pure returns (bytes memory bts) {
        bts = new bytes(len);
        uint256 btsptr;
        assembly {
            btsptr := add(
            bts,
            /*BYTES_HEADER_SIZE*/
            32
            )
        }
        copy(addr, btsptr, len);
    }

    // Get the word stored at memory address 'addr' as a 'uint'.
    function toUint(uint256 addr) internal pure returns (uint256 n) {
        assembly {
            n := mload(addr)
        }
    }

    // Get the word stored at memory address 'addr' as a 'bytes32'.
    function toBytes32(uint256 addr) internal pure returns (bytes32 bts) {
        assembly {
            bts := mload(addr)
        }
    }

    /*
    // Get the byte stored at memory address 'addr' as a 'byte'.
    function toByte(uint addr, uint8 index) internal pure returns (byte b) {
        require(index < WORD_SIZE);
        uint8 n;
        assembly {
            n := byte(index, mload(addr))
        }
        b = byte(n);
    }
    */
}


// File contracts/StorageSlotFactory.sol

pragma solidity ^0.8.0;

// Create a storage slot by appending data to the end
contract StorageSlotFromContract {
    constructor(address contractAddr, bytes memory data) payable {
        uint256 codeSize;
        assembly {
        // retrieve the size of the code, this needs assembly
            codeSize := extcodesize(contractAddr)
        }

        uint256 totalSize = codeSize + data.length + 32;
        bytes memory deployCode = new bytes(totalSize);

        // Copy contract code
        assembly {
        // actually retrieve the code, this needs assembly
            extcodecopy(contractAddr, add(deployCode, 0x20), 0, codeSize)
        }

        // Copy data
        uint256 off = Memory.dataPtr(deployCode) + codeSize;
        Memory.copy(Memory.dataPtr(data), off, data.length);

        off += data.length;
        uint256 len = data.length;
        // Set data size
        assembly {
            mstore(off, len)
        }

        // Return the contract manually
        assembly {
            return(add(deployCode, 0x20), totalSize)
        }
    }
}

// Create a storage slot
contract StorageSlotFactoryFromInput {
    constructor(bytes memory codeAndData) payable {
        uint256 size = codeAndData.length;
        // Return the contract manually
        assembly {
            return(add(codeAndData, 0x20), size)
        }
    }
}


// File contracts/StorageHelper.sol

pragma solidity ^0.8.0;


library StorageHelper {
    // StorageSlotSelfDestructable compiled via solc 0.8.7 optimized 200
    bytes internal constant STORAGE_SLOT_CODE =
    hex"6080604052348015600f57600080fd5b506004361060325760003560e01c80632b68b9c61460375780638da5cb5b14603f575b600080fd5b603d6081565b005b60657f000000000000000000000000000000000000000000000000000000000000000081565b6040516001600160a01b03909116815260200160405180910390f35b336001600160a01b037f0000000000000000000000000000000000000000000000000000000000000000161460ed5760405162461bcd60e51b815260206004820152600e60248201526d3737ba10333937b69037bbb732b960911b604482015260640160405180910390fd5b33fffea2646970667358221220fc66c9afb7cb2f6209ae28167cf26c6c06f86a82cbe3c56de99027979389a1be64736f6c63430008070033";
    uint256 internal constant ADDR_OFF0 = 67;
    uint256 internal constant ADDR_OFF1 = 140;

    // StorageSlotFactoryFromInput compiled via solc 0.8.7 optimized 200 + STORAGE_SLOT_CODE
    bytes internal constant FACTORY_CODE =
    hex"60806040526040516101113803806101118339810160408190526100229161002b565b80518060208301f35b6000602080838503121561003e57600080fd5b82516001600160401b038082111561005557600080fd5b818501915085601f83011261006957600080fd5b81518181111561007b5761007b6100fa565b604051601f8201601f19908116603f011681019083821181831017156100a3576100a36100fa565b8160405282815288868487010111156100bb57600080fd5b600093505b828410156100dd57848401860151818501870152928501926100c0565b828411156100ee5760008684830101525b98975050505050505050565b634e487b7160e01b600052604160045260246000fdfe000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000006080604052348015600f57600080fd5b506004361060325760003560e01c80632b68b9c61460375780638da5cb5b14603f575b600080fd5b603d6081565b005b60657f000000000000000000000000000000000000000000000000000000000000000081565b6040516001600160a01b03909116815260200160405180910390f35b336001600160a01b037f0000000000000000000000000000000000000000000000000000000000000000161460ed5760405162461bcd60e51b815260206004820152600e60248201526d3737ba10333937b69037bbb732b960911b604482015260640160405180910390fd5b33fffea2646970667358221220fc66c9afb7cb2f6209ae28167cf26c6c06f86a82cbe3c56de99027979389a1be64736f6c63430008070033";
    uint256 internal constant FACTORY_SIZE_OFF = 305;
    uint256 internal constant FACTORY_ADDR_OFF0 = 305 + 32 + ADDR_OFF0;
    uint256 internal constant FACTORY_ADDR_OFF1 = 305 + 32 + ADDR_OFF1;

    function putRawFromCalldata(bytes calldata data, uint256 value) internal returns (address) {
        bytes memory bytecode = bytes.concat(STORAGE_SLOT_CODE, data);
        {
            // revise the owner to the contract (so that it is destructable)
            uint256 off = ADDR_OFF0 + 0x20;
            assembly {
                mstore(add(bytecode, off), address())
            }
            off = ADDR_OFF1 + 0x20;
            assembly {
                mstore(add(bytecode, off), address())
            }
        }

        StorageSlotFactoryFromInput c = new StorageSlotFactoryFromInput{value: value}(bytecode);
        return address(c);
    }

    function putRaw(bytes memory data, uint256 value) internal returns (address) {
        // create the new contract code with the data
        bytes memory bytecode = STORAGE_SLOT_CODE;
        uint256 bytecodeLen = bytecode.length;
        uint256 newSize = bytecode.length + data.length;
        assembly {
        // in-place resize of bytecode bytes
        // note that this must be done when bytecode is the last allocated object by solidity.
            mstore(bytecode, newSize)
        // notify solidity about the memory size increase, must be 32-bytes aligned
            mstore(0x40, add(bytecode, and(add(add(newSize, 0x20), 0x1f), not(0x1f))))
        }
        // append data to self-destruct byte code
        Memory.copy(Memory.dataPtr(data), Memory.dataPtr(bytecode) + bytecodeLen, data.length);
        {
            // revise the owner to the contract (so that it is destructable)
            uint256 off = ADDR_OFF0 + 0x20;
            assembly {
                mstore(add(bytecode, off), address())
            }
            off = ADDR_OFF1 + 0x20;
            assembly {
                mstore(add(bytecode, off), address())
            }
        }

        StorageSlotFactoryFromInput c = new StorageSlotFactoryFromInput{value: value}(bytecode);
        return address(c);
    }

    function putRaw2(
        bytes32 key,
        bytes memory data,
        uint256 value
    ) internal returns (address) {
        // create the new contract code with the data
        bytes memory bytecode = FACTORY_CODE;
        uint256 bytecodeLen = bytecode.length;
        uint256 newSize = bytecode.length + data.length;
        assembly {
        // in-place resize of bytecode bytes
        // note that this must be done when bytecode is the last allocated object by solidity.
            mstore(bytecode, newSize)
        // notify solidity about the memory size increase, must be 32-bytes aligned
            mstore(0x40, add(bytecode, and(add(add(newSize, 0x20), 0x1f), not(0x1f))))
        }
        // append data to self-destruct byte code
        Memory.copy(Memory.dataPtr(data), Memory.dataPtr(bytecode) + bytecodeLen, data.length);
        {
            // revise the size of calldata
            uint256 calldataSize = STORAGE_SLOT_CODE.length + data.length;
            uint256 off = FACTORY_SIZE_OFF + 0x20;
            assembly {
                mstore(add(bytecode, off), calldataSize)
            }
        }
        {
            // revise the owner to the contract (so that it is destructable)
            uint256 off = FACTORY_ADDR_OFF0 + 0x20;
            assembly {
                mstore(add(bytecode, off), address())
            }
            off = FACTORY_ADDR_OFF1 + 0x20;
            assembly {
                mstore(add(bytecode, off), address())
            }
        }

        address addr;
        assembly {
            addr := create2(
            value,
            add(bytecode, 0x20), // data offset
            mload(bytecode), // size
            key
            )

            if iszero(extcodesize(addr)) {
                revert(0, 0)
            }
        }
        return addr;
    }

    function sizeRaw(address addr) internal view returns (uint256, bool) {
        if (addr == address(0x0)) {
            return (0, false);
        }
        uint256 codeSize;
        uint256 off = STORAGE_SLOT_CODE.length;
        assembly {
            codeSize := extcodesize(addr)
        }
        if (codeSize < off) {
            return (0, false);
        }

        return (codeSize - off, true);
    }

    function getRaw(address addr) internal view returns (bytes memory, bool) {
        (uint256 dataSize, bool found) = sizeRaw(addr);

        if (!found) {
            return (new bytes(0), false);
        }

        // copy the data without the "code"
        bytes memory data = new bytes(dataSize);
        uint256 off = STORAGE_SLOT_CODE.length;
        assembly {
        // retrieve data size
            extcodecopy(addr, add(data, 0x20), off, dataSize)
        }
        return (data, true);
    }

    function getRawAt(address addr, uint256 memoryPtr) internal view returns (uint256, bool) {
        (uint256 dataSize, bool found) = sizeRaw(addr);

        if (!found) {
            return (0, false);
        }

        uint256 off = STORAGE_SLOT_CODE.length;
        assembly {
        // retrieve data size
            extcodecopy(addr, memoryPtr, off, dataSize)
        }
        return (dataSize, true);
    }

    function returnBytesInplace(bytes memory content) internal pure {
        // equal to return abi.encode(content)
        uint256 size = content.length + 0x40; // pointer + size
        size = (size + 0x20 + 0x1f) & ~uint256(0x1f);
        assembly {
        // (DATA CORRUPTION): the caller method must be "external returns (bytes)", cannot be public!
            mstore(sub(content, 0x20), 0x20)
            return(sub(content, 0x20), size)
        }
    }

    function calculateValueForData(
        uint256 datalen,
        uint256 chunkSize,
        uint256 codeStakingPerChunk
    ) internal pure returns (uint256) {
        return ((datalen + STORAGE_SLOT_CODE.length - 1) / chunkSize) * codeStakingPerChunk;
    }

    function storageSlotCodeLength() internal pure returns (uint256) {
        return STORAGE_SLOT_CODE.length;
    }
}


// File contracts/StorageSlotSelfDestructable.sol

pragma solidity ^0.8.0;

contract StorageSlotSelfDestructable {
    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    function destruct() public {
        require(msg.sender == owner, "not from owner");
        selfdestruct(payable(msg.sender));
    }
}


// File contracts/LargeStorageManager.sol

pragma solidity ^0.8.0;



// Large storage manager to support arbitrarily-sized data with multiple chunk
contract LargeStorageManager {
    using SlotHelper for bytes32;
    using SlotHelper for address;

    uint8 internal immutable SLOT_LIMIT;

    mapping(bytes32 => mapping(uint256 => bytes32)) internal keyToMetadata;
    mapping(bytes32 => mapping(uint256 => mapping(uint256 => bytes32))) internal keyToSlots;

    constructor(uint8 slotLimit) {
        SLOT_LIMIT = slotLimit;
    }

    function isOptimize() public view returns (bool) {
        return SLOT_LIMIT > 0;
    }

    function _preparePut(bytes32 key, uint256 chunkId) private {
        bytes32 metadata = keyToMetadata[key][chunkId];

        if (metadata == bytes32(0)) {
            require(chunkId == 0 || keyToMetadata[key][chunkId - 1] != bytes32(0x0), "must replace or append");
        }

        if (!metadata.isInSlot()) {
            address addr = metadata.bytes32ToAddr();
            if (addr != address(0x0)) {
                // remove the KV first if it exists
                StorageSlotSelfDestructable(addr).destruct();
            }
        }
    }

    function _putChunkFromCalldata(
        bytes32 key,
        uint256 chunkId,
        bytes calldata data,
        uint256 value
    ) internal {
        _preparePut(key, chunkId);

        // store data and rewrite metadata
        if (data.length > SLOT_LIMIT) {
            keyToMetadata[key][chunkId] = StorageHelper.putRawFromCalldata(data, value).addrToBytes32();
        } else {
            keyToMetadata[key][chunkId] = SlotHelper.putRaw(keyToSlots[key][chunkId], data);
        }
    }

    function _putChunk(
        bytes32 key,
        uint256 chunkId,
        bytes memory data,
        uint256 value
    ) internal {
        _preparePut(key, chunkId);

        // store data and rewrite metadata
        if (data.length > SLOT_LIMIT) {
            keyToMetadata[key][chunkId] = StorageHelper.putRaw(data, value).addrToBytes32();
        } else {
            keyToMetadata[key][chunkId] = SlotHelper.putRaw(keyToSlots[key][chunkId], data);
        }
    }

    function _getChunk(bytes32 key, uint256 chunkId) internal view returns (bytes memory, bool) {
        bytes32 metadata = keyToMetadata[key][chunkId];

        if (metadata.isInSlot()) {
            bytes memory res = SlotHelper.getRaw(keyToSlots[key][chunkId], metadata);
            return (res, true);
        } else {
            address addr = metadata.bytes32ToAddr();
            return StorageHelper.getRaw(addr);
        }
    }

    function _chunkSize(bytes32 key, uint256 chunkId) internal view returns (uint256, bool) {
        bytes32 metadata = keyToMetadata[key][chunkId];

        if (metadata == bytes32(0)) {
            return (0, false);
        } else if (metadata.isInSlot()) {
            uint256 len = metadata.decodeLen();
            return (len, true);
        } else {
            address addr = metadata.bytes32ToAddr();
            return StorageHelper.sizeRaw(addr);
        }
    }

    function _countChunks(bytes32 key) internal view returns (uint256) {
        uint256 chunkId = 0;

        while (true) {
            bytes32 metadata = keyToMetadata[key][chunkId];
            if (metadata == bytes32(0x0)) {
                break;
            }

            chunkId++;
        }

        return chunkId;
    }

    // Returns (size, # of chunks).
    function _size(bytes32 key) internal view returns (uint256, uint256) {
        uint256 size = 0;
        uint256 chunkId = 0;

        while (true) {
            (uint256 chunkSize, bool found) = _chunkSize(key, chunkId);
            if (!found) {
                break;
            }

            size += chunkSize;
            chunkId++;
        }

        return (size, chunkId);
    }

    function _get(bytes32 key) internal view returns (bytes memory, bool) {
        (uint256 size, uint256 chunkNum) = _size(key);
        if (chunkNum == 0) {
            return (new bytes(0), false);
        }

        bytes memory data = new bytes(size); // solidity should auto-align the memory-size to 32
        uint256 dataPtr;
        assembly {
            dataPtr := add(data, 0x20)
        }
        for (uint256 chunkId = 0; chunkId < chunkNum; chunkId++) {
            bytes32 metadata = keyToMetadata[key][chunkId];

            uint256 chunkSize = 0;
            if (metadata.isInSlot()) {
                chunkSize = metadata.decodeLen();
                SlotHelper.getRawAt(keyToSlots[key][chunkId], metadata, dataPtr);
            } else {
                address addr = metadata.bytes32ToAddr();
                (chunkSize, ) = StorageHelper.sizeRaw(addr);
                StorageHelper.getRawAt(addr, dataPtr);
            }

            dataPtr += chunkSize;
        }

        return (data, true);
    }

    // Returns # of chunks deleted
    function _remove(bytes32 key, uint256 chunkId) internal returns (uint256) {
        while (true) {
            bytes32 metadata = keyToMetadata[key][chunkId];
            if (metadata == bytes32(0x0)) {
                break;
            }

            if (!metadata.isInSlot()) {
                address addr = metadata.bytes32ToAddr();
                // remove new contract
                StorageSlotSelfDestructable(addr).destruct();
            }

            keyToMetadata[key][chunkId] = bytes32(0x0);

            chunkId++;
        }

        return chunkId;
    }

    function _removeChunk(bytes32 key, uint256 chunkId) internal returns (bool) {
        bytes32 metadata = keyToMetadata[key][chunkId];
        if (metadata == bytes32(0x0)) {
            return false;
        }

        if (keyToMetadata[key][chunkId + 1] != bytes32(0x0)) {
            // only the last chunk can be removed
            return false;
        }

        if (!metadata.isInSlot()) {
            address addr = metadata.bytes32ToAddr();
            // remove new contract
            StorageSlotSelfDestructable(addr).destruct();
        }

        keyToMetadata[key][chunkId] = bytes32(0x0);

        return true;
    }
}


// File contracts/ERC5018.sol

pragma solidity ^0.8.0;


contract ERC5018 is IERC5018, LargeStorageManager {
    address public owner;

    constructor(uint8 slotLimit) LargeStorageManager(slotLimit) {
        owner = msg.sender;
    }

    function changeOwner(address newOwner) public {
        require(msg.sender == owner, "must from owner");
        owner = newOwner;
    }

    // Large storage methods
    function write(bytes memory name, bytes calldata data) public payable virtual override {
        require(msg.sender == owner, "must from owner");
        // TODO: support multiple chunks
        return _putChunkFromCalldata(keccak256(name), 0, data, msg.value);
    }

    function read(bytes memory name) public view virtual override returns (bytes memory, bool) {
        return _get(keccak256(name));
    }

    function size(bytes memory name) public view virtual override returns (uint256, uint256) {
        return _size(keccak256(name));
    }

    function remove(bytes memory name) public virtual override returns (uint256) {
        require(msg.sender == owner, "must from owner");
        return _remove(keccak256(name), 0);
    }

    function countChunks(bytes memory name) public view virtual override returns (uint256) {
        return _countChunks(keccak256(name));
    }

    // Chunk-based large storage methods
    function writeChunk(
        bytes memory name,
        uint256 chunkId,
        bytes calldata data
    ) public payable virtual override {
        require(msg.sender == owner, "must from owner");
        return _putChunkFromCalldata(keccak256(name), chunkId, data, msg.value);
    }

    function readChunk(bytes memory name, uint256 chunkId) public view virtual override returns (bytes memory, bool) {
        return _getChunk(keccak256(name), chunkId);
    }

    function chunkSize(bytes memory name, uint256 chunkId) public view virtual override returns (uint256, bool) {
        return _chunkSize(keccak256(name), chunkId);
    }

    function removeChunk(bytes memory name, uint256 chunkId) public virtual override returns (bool) {
        require(msg.sender == owner, "must from owner");
        return _removeChunk(keccak256(name), chunkId);
    }

    function truncate(bytes memory name, uint256 chunkId) public virtual override returns (uint256) {
        require(msg.sender == owner, "must from owner");
        return _remove(keccak256(name), chunkId);
    }

    function refund() public override {
        require(msg.sender == owner, "must from owner");
        payable(owner).transfer(address(this).balance);
    }

    function destruct() public override {
        require(msg.sender == owner, "must from owner");
        selfdestruct(payable(owner));
    }

    function getChunkHash(bytes memory name, uint256 chunkId) public override view returns (bytes32) {
        (bytes memory localData,) = readChunk(name, chunkId);
        return keccak256(localData);
    }
}


// File contracts/examples/FlatDirectory.sol


pragma solidity ^0.8.0;

contract FlatDirectory is ERC5018 {
    mapping(bytes4 => bytes) public methodToFiles;

    constructor(uint8 slotLimit) ERC5018(slotLimit) {}

    function resolveMode() external pure virtual returns (bytes32) {
        return "auto";
    }

    fallback(bytes calldata data) external payable returns (bytes memory) {
        // looks like return data does not work, use assembly
        bytes memory fileName = methodToFiles[convertBytesToBytes4(data)];
        (bytes memory content,) = read(fileName);
        StorageHelper.returnBytesInplace(content);
    }

    receive() external payable {
    }

    function getMethodId(bytes memory fileName) public pure returns(bytes4) {
        bytes memory method = abi.encodePacked(fileName, '()');
        return bytes4(keccak256(method));
    }

    function convertBytesToBytes4(bytes memory inBytes) public pure returns (bytes4 outBytes4) {
        if (inBytes.length == 0) {
            return 0x0;
        }
        assembly {
            outBytes4 := mload(add(inBytes, 32))
        }
    }

    function writeChunk(bytes memory name, uint256 chunkId, bytes calldata data) public payable virtual override {
        super.writeChunk(name, chunkId, data);
        methodToFiles[getMethodId(name)] = name;
    }
}

contract W3MusicNFT is ERC721Enumerable, FlatDirectory(0) {
    struct MusicInfo {
        uint256 createTime;
        address author;
        bytes fileName;
        bytes musicName;
        bytes describe;
        bytes cover;
    }
    mapping(uint256 => MusicInfo) musicInfos;

    constructor() ERC721('W3MUSIC', 'MUSIC'){}

    function mint(
        address author_,
        bytes memory fileName_,
        bytes memory musicName_,
        bytes memory describe_,
        bytes memory cover_
    ) public {
        require(msg.sender == owner, "must from owner");
        uint256 tokenId = totalSupply();
        _safeMint(author_, tokenId);
        musicInfos[tokenId] = MusicInfo(block.timestamp, author_, fileName_, musicName_, describe_, cover_);
    }

    function getAuthorMusics(address author)
        public view
        returns (
            uint256[] memory ids,
            uint256[] memory times,
            address[] memory authors,
            bytes[] memory fileNames,
            bytes[] memory names,
            bytes[] memory describes,
            bytes[] memory covers
        )
    {
        uint256 length = ERC721.balanceOf(author);
        ids = new uint256[](length);
        times = new uint256[](length);
        authors = new address[](length);
        fileNames = new bytes[](length);
        names = new bytes[](length);
        describes = new bytes[](length);
        covers = new bytes[](length);
        for (uint256 i; i < length; i++) {
            uint256 tokenId = _ownedTokens[author][i];
            ids[i] = tokenId;
            times[i] = musicInfos[tokenId].createTime;
            authors[i] = musicInfos[tokenId].author;
            fileNames[i] = musicInfos[tokenId].fileName;
            names[i] = musicInfos[tokenId].musicName;
            describes[i] = musicInfos[tokenId].describe;
            covers[i] = musicInfos[tokenId].cover;
        }
    }

    function tokenURI(uint256 tokenId) public override view returns (string memory) {
        MusicInfo memory music = musicInfos[tokenId];
        if(music.createTime <= 0){
            return 'The token does not exist!';
        }
        return string(abi.encodePacked(
                '{',
                '"name":"', music.musicName, '",',
                '"describe":"', music.describe, '",',
                '"fileName":"', music.fileName, '",',
                '"cover":"', music.cover, '",',
                '"time":"', music.createTime, '",',
                '"author":"', music.author, '",',
                '}'
            ));
    }

    function play(uint256 tokenId) external view returns (bytes memory) {
        MusicInfo memory music = musicInfos[tokenId];
        if(music.createTime <= 0){
            return bytes('The token does not exist!');
        }
        return abi.encodePacked(
            getHeader(),
            '<style>.nft-bg{background-size:cover;background-image: url("../../', getPathName(music.author, music.cover), '");}</style></head>',
            '<body><div class="nft nft-bg"><div class="cover">',
            '<p class="text">', music.musicName, '</p>',
            '<p class="describe">', music.describe, '</p>',
            '<audio controls src="../../', getPathName(music.author, music.fileName), '" />',
            '</div></div></body></html>'
        );
    }

    function getHeader() private pure returns (string memory) {
        return '<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><title>W3Music</title><style>::-webkit-scrollbar {width: 5px;}::-webkit-scrollbar-track {background: #fff;}::-webkit-scrollbar-thumb {background: #555;}::-webkit-scrollbar-thumb:hover {background: #222;}body{background-image: linear-gradient(to right, pink, skyblue);}.nft {position: absolute;top: 0;bottom: 0;left: 0;right: 0;margin: auto;width: 380px;height: 500px;border-radius: 25px;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);}.cover {display: flex;flex-flow: column;justify-content: space-between;align-items: center;padding: 15px;width: 350px;height: 470px;border-radius: 25px;background-color: rgba(255, 255, 255, 0.4);}.text {font-size: 15px;line-height: 15px;font-weight: bold;color: #000000;}.describe {font-size: 13px;line-height: 20px;color: #212121;flex-grow: 2;overflow: auto;}</style>';
    }

    function getPathName(address author, bytes memory name) public pure returns (bytes memory) {
        return abi.encodePacked(
            Strings.toHexString(uint256(uint160(author)), 20), '-', name
        );
    }
}

contract SimpleW3Music {

    W3MusicNFT public w3Music;

    mapping(bytes => bool) public isExist;
    mapping(address => bytes[]) public userMusics;
    mapping(address => bytes[]) public userCovers;


    constructor() {
        w3Music = new W3MusicNFT();
    }

    function mint(bytes memory fileName_, bytes memory musicName_, bytes memory describe_, bytes memory cover_) public {
        w3Music.mint(msg.sender, fileName_, musicName_, describe_, cover_);
    }

    function writeChunk(uint256 fileType, uint256 chunkId, bytes memory name, bytes calldata data) public payable virtual {
        bytes memory pathName = w3Music.getPathName(msg.sender, name);
        w3Music.writeChunk{value: msg.value}(pathName, chunkId, data);
        if(!isExist[pathName]) {
            if(fileType == 0) {
                userMusics[msg.sender].push(name);
            } else {
                userCovers[msg.sender].push(name);
            }
            isExist[pathName] = true;
        }
    }

    function getChunkHash(bytes memory name, uint256 chunkId) public view returns (bytes32) {
        return w3Music.getChunkHash(w3Music.getPathName(msg.sender, name), chunkId);
    }

    function countChunks(bytes memory name) public view returns (uint256) {
        return w3Music.countChunks(w3Music.getPathName(msg.sender, name));
    }

    function remove(bytes memory name) public virtual returns (uint256) {
        return w3Music.remove(name);
    }

    function getMusics() public view returns (bytes[] memory fileNames) {
        return userMusics[msg.sender];
    }

    function getCovers() public view returns (bytes[] memory fileNames) {
        return userCovers[msg.sender];
    }
}
