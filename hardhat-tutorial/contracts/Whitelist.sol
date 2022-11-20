//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    uint256 public maxWhitelistedAddressess;
    
    mapping(address => bool) public whitelistedAddressess;

    uint256 public numAddressessWhitelisted;

    constructor(uint256 _maxWhitelistedAddressess){
        maxWhitelistedAddressess = _maxWhitelistedAddressess;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAddressess[msg.sender], "Sender has already been whitelisted");
        require(numAddressessWhitelisted < maxWhitelistedAddressess, "More addressess can't be added, limit reached!");
        //adding the address which called this function to whitelist
        whitelistedAddressess[msg.sender] = true;
        //increasing the whitelist count to keep track
        numAddressessWhitelisted += 1;
    }
}