// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PriceConverter} from "./priceconverter.sol";

contract Fundme {
    using PriceConverter for uint256;
    uint256 constant public miniUSD = 5e18;
    address[] public funders;
    mapping(address => uint256) public addtofunded;

    address constant owner = 0x27cE496D9C4F570e38B85489f55e548923b60848;

    function fund() public payable {
        require(msg.value.convertPrice() >= miniUSD, "didn't send enough ETH"); // 1e18 = 1ETH
        funders.push(msg.sender);
        addtofunded[msg.sender] = addtofunded[msg.sender] + msg.value;
    }

    function withdraw() public {
        
        require(msg.sender == owner , "your not a owner!");

        for (uint256 i = 0; i < funders.length; i++) {
            addtofunded[funders[i]] = 0;
        }
        funders = new address[](0);
        (bool issucess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(issucess, "transection is failed");
    }

    // transfer send call
}

// v,r,s component of tx signature
