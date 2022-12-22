pragma solidity 0.8.7;

contract TestException4
{
    function aFunction() public {
        require(false, "Error message");
    }
}