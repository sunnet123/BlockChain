pragma solidity 0.8.17;

contract SmartWallet {

    address payable owner;

    mapping(address => uint) public allowance;
    mapping(address => bool) public isAllowedToSend;

    mapping(address => bool) public guardian;
    address payable nextOwner;
    uint guardiansResetCount;
    uint public constant confirmationsFromGuardiansForReset =3;

    constructor() {
        owner = payable(msg.sender)
    }

    function proposeNewOwner(address payable newOwner) public {
        require(guardian)
    }
}