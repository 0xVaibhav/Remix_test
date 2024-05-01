// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage{

uint256 myFavouriteNumber;

struct Person{
    uint256 number;
    string name;
}

Person[] public listOfPeople;

mapping (string => uint256) public nameToFavouriteNumber;

function store(uint _FavouriteNumber) public{
myFavouriteNumber= _FavouriteNumber;
}

function retrieve()public view returns(uint256){
    return myFavouriteNumber;
}
function addPerson (uint256 _number, string memory _name)public {
    listOfPeople.push(Person(_number,_name));
    nameToFavouriteNumber[_name]=_number;
}

}