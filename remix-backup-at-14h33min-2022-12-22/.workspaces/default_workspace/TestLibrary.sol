pragma solidity 0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol"
contract Allowance is Ownable{
    function isOwner() internal view returns(bool) {
        return owner() == msg.sender;
    }

    event AllowanceChanged(address indexed _forWho, address indexed _byWhom, uint _oldAmount, uint _newAmount);

    mapping(address => uint) public allowance;

    function setAllowance(address _who, uint _amount) public onlyOwner 
    {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], _amount);
        allowance[_who] = _amount;
    }

    modifier ownerOrAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed");
        _;
    }

    function reduceAllowance(address _who, uint _amount) internal ownerOrAllowed(_amount)
    {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], allowance[_who] - _amount);
        allowance[_who] -= _amount;
    }
}
//    modifier onlyOwner() {
//        require(msg.sender == owner, "You are not allowed");
//        _;
//    }
contract ShareWallet us Allowance {
    event MoneySent(address indexed _beneficiary, uint _amount)
    event MoneyReceived(address indexed _from, uint _amount)
    function withdrawMoney(address payable _to, uint256 _amount) public ownerOrAllowed(_amount) 
    {
        require(_amount <= address(this).balance, "Contract doesn't own enough money");
        if(!isOwner()) {
            reduceAllowance(msg.sender, _amount);
        }
        emit MoneySent(_to, _amount)
        _to.transfer(_amount);
    }
    
    function renounceOwnership() public override onlyOwner {
        revert("can't renounceOwnership here")  // not possible with this smart contract
    }
    receive() external payable 
    {
        emit MoneyReceived(msg.sender, msg.value)
    }
}