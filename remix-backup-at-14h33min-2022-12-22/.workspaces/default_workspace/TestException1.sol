pragma solidity ^0.8.7;

contract ExceptionReequireExample {

    mapping(address => uint) public balanceReceived;

    function receiveMoney() public payable{
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public
    {
        if(_amount <= balanceReceived[msg.sender]){
            balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
        }
    }
}