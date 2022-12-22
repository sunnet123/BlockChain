pragma solidity ^0.8.7;

contract TestStruct
{
    struct Transaction{
        uint amount;
        uint timestamps;
    }

    struct Balance{
        uint totalBalance;

        uint numDeposits;
        mapping(uint => Transaction) deposits;
        
        uint numWithdrawals;
        mapping(uint => Transaction) withdrawals;
    }

    //mapping (address => uint) public balanceReceived;
    mapping (address => Balance) public balanceReceived;

    function getBalance() public view returns(uint)
    {
        return address(this).balance;
    }

    function getBalanceAtAddress(address _addr) public view returns(uint) {
        return balanceReceived[_addr].totalBalance;
    }

/*    function sendMoney() public payable
    {
        // balanceReceived[msg.sender] += msg.value;
        balanceReceived[msg.sender].totalBalance += msg.value;

        //Payment memory payment = Payment(msg.value, now)
        Payment memory payment = Payment(msg.value, block.timestamp);

        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;
        balanceReceived[msg.sender].numPayments++;
    }*/

    function depsoitMoney() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value;

        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        
        balanceReceived[msg.sender].deposits[balanceReceived[msg.sender].numDeposits] = deposit;
        balanceReceived[msg.sender].numDeposits++;
    }

        function withdrawMoney(address payable _to, uint _amount) public payable
    {
        //require(balanceReceived[msg.sender] >= _amount, "not enough money");
        require(balanceReceived[msg.sender].totalBalance >= _amount, "not enough money");
        
        //balanceReceived[msg.sender] -= _amount;
        balanceReceived[msg.sender].totalBalance -= _amount;

        Transaction memory withdrawal = Transaction(uint _amount, block.timestamp);
        balanceReceived[msg.sender].withdrawals[balanceReceived[msg.sender].numWithdrawals] = withdrawal;
        balanceReceived[msg.sender].numWithdrawals++;

        _to.transfer(_amount);
    }

    function withdrawAllMoney(address payable _to) public
    {
        //uint balanceToSend = balanceReceived[msg.sender];
        uint balanceToSend = balanceReceived[msg.sender].totalBalance;

        //balanceReceived[msg.sender] = 0;
        balanceReceived[msg.sender].totalBalance = 0;

        _to.transfer(balanceToSend);
    }
}