// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyERC721 is ERC721URIStorage, ERC721Enumerable{
    constructor () ERC721("TestNFT", "\u03C8") {}

    function  _increaseBalance(address account, uint128 value) internal override(ERC721,ERC721Enumerable) {
        super._increaseBalance(account, value);
    }
    function _update(address to, uint256 tokenId, address auth) internal override(ERC721,ERC721Enumerable) returns(address) {
        return super._update(to, tokenId, auth);
    }
    function supportsInterface (bytes4 interfaceId) public view override(ERC721Enumerable,ERC721URIStorage) returns(bool) {
        return super.supportsInterface(interfaceId);
    }
    function tokenURI (uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns(string memory) {
        return super.tokenURI(tokenId);
    }
}