pragma solidity 0.6.12;

contract TestException3 {

    mapping(address => uint8) public balanceReceived;

    function receiveMoney() public payable{
        balanceReceived[msg.sender] += uint8.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public
    {
        require(_amount <= balanceReceived[msg.sender], "Not Enough Money, aborting");

        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
        
    }
}