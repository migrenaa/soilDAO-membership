pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Allowlist is Ownable {
    mapping(address => bool) public allowlist;

    constructor() Ownable(msg.sender) {}
    /**
     * @notice Add to allowlist
     */
    function addToallowlist(
        address[] calldata toAddAddresses
    ) external onlyOwner {
        for (uint i = 0; i < toAddAddresses.length; i++) {
            allowlist[toAddAddresses[i]] = true;
        }
    }

    /**
     * @notice Remove from allowlist
     */
    function removeFromallowlist(
        address[] calldata toRemoveAddresses
    ) external onlyOwner {
        for (uint i = 0; i < toRemoveAddresses.length; i++) {
            delete allowlist[toRemoveAddresses[i]];
        }
    }

    /**
     * @notice Function with allowlist
     */
    function isAllowlisted(address who) public view returns (bool) {
        return allowlist[who];
    }
}
