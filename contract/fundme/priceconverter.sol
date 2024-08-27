// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/contracts@1.2.0/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice() internal view returns (uint256) {
        AggregatorV3Interface pricefeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        (, int256 price, , , ) = pricefeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function convertPrice(uint256 ethamount) internal view returns (uint256) {
        uint256 ethprice = getPrice();
        uint256 ethamountInusd = (ethprice * ethamount) / 1e18;
        return ethamountInusd;
    }
}
