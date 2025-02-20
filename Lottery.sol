// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;
contract Lottery{
    address public owner;
    address payable[]public players;//  each address may receive ether that why it should be payable
    
    constructor()
   {
       owner=msg.sender;
   } 

   function getBalance() public view returns (uint) {
       return address(this).balance;

   }
   function getPlayers() public view returns (address payable [] memory)
   {
       return players;
   }
   function enter() public payable{//each address should pay ether to enter the lottery
       require(msg.value >= 1 ether);
       players.push(payable(msg.sender)); 
   }
function getRandomNumber() public view returns  (uint){
    return uint ( keccak256(abi.encodePacked(owner, block.timestamp)));
}
modifier onlyOwner(){
    require(msg.sender==owner);
    _;
}
function pickWinner() public onlyOwner{
    uint index= getRandomNumber() % players.length;
    players[index].transfer(address(this).balance);
    //reset the set of contract
    players= new address payable [](0);
}
}
