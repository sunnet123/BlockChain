pragma solidity ^0.8.7;

contract TestTransferMoney
{
    uint public smartBalance;

    addres owner;

    constructor() public {
        owner = msg.sender;
    }
    function withdawMoneyTo2(address payable _to) public
    {
        require(msg.sender == owner, "not owner");
        _to.transfer(this.getBalance());
    }

    function receiveMoney() public payable
    {
        smartBalance += msg.value;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawMoney() public
    {
        address payable _to = payable(msg.sender);
        _to.transfer(this.getBalance());
    }
    function withdawMoneyTo(address payable _to) public
    {
        _to.transfer(this.getBalance());
    }
}