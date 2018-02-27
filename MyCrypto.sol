pragma solidity ^0.4.0;
/*
    My own cryptocurrency that can only be issued by
    its creator and can transfer to anyone.
*/
contract MyCrypto
{
    address public creator;
    mapping (address => uint) public balances;
    // Notify when a transfer has completed
    event Delivered(address from, address to, uint amount);
    
    function MyCrypto()
    {
        creator = msg.sender;
    }
    function create(address reciever, uint amount)
    {
        if(msg.sender != creator) throw;
        balance[reciever]+=amount;
    }
    function transfer(address reciever, uint amount)
    {
        if(balance[msg.sender] < amount) throw;
        balance[msg.sender] -=amount;
        balance[reciever]+=amount;
        Delivered(msg.sender,reciever, amount);
    }
}