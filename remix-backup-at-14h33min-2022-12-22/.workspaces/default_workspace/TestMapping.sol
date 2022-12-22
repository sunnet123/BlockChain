pragma solidity ^0.8.7;

contract TestMapping
{
    bool a1 = false;
    bool a2 = false;
    bool a3 = false;

    mapping (uint => bool) public m1;

    mapping (address => bool) public m2;

    function setValueM1(uint _key) public
    {
        m1[_key] = true;
    }

    function setA1ToTrue() public
    {
        a1 = true;
    }

    function setM2ToTrue() public
    {
        m2[msg.sender] = true;
    }
}