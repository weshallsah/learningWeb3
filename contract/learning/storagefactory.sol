// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {SimpleStorage} from "./simpelstorage.sol";

contract StorageFactory {
    SimpleStorage[] public simplestorage;

    function createSimpelStorage() public {
        simplestorage.push(new SimpleStorage()); 
    }
    function sfstore(uint256 _ssidx,uint256 _newssnumber) public {
        // ABI = application binary interface
        SimpleStorage mysimplestorage = simplestorage[_ssidx];
        mysimplestorage.store(_newssnumber);
    }
    function sfget(uint256 _ssidx) public view returns(uint256){
        SimpleStorage mysimplestorage = simplestorage[_ssidx];
        return mysimplestorage.retrieve();
    } 
}
