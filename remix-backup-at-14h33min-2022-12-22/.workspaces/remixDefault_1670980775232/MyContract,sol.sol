pragma solidity 0.8.7;

contract MyContract {

    uint public myUint = 123;

    function setMyUint(uint newUint) public
    {
        myUint = newUint;
    }
}