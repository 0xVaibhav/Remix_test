// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

 error NotOwner();
contract FundMe {
   mapping (address => uint256)addressToAmountFunded;

   address [] public funders;
   address public immutable i_owner;
   uint256 public constant MINIMUM_USD = 5*10*8;

   constructor () {
    i_owner =  msg.sender ;
   }

   function Fund () public payable {
    require(msg.value <= MINIMUM_USD , "not enough eth sent ");
    addressToAmountFunded[msg.sender] += msg.value;
    funders.push(msg.sender);
   }

   function getversion () public view returns(uint256){
    AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    return pricefeed.version();
   }

   modifier OnlyOwner{
        if (msg.sender != i_owner) revert NotOwner();
        _;
   }

   function withdraw() public OnlyOwner{
    

   }

}