pragma solidity 0.8.7;

contract TestException7
{
    error ThisIsACustomError(string, string);

    function aFunction()
    {
        revert ThisIsACustomError("Text 1", "text message 2");
    }
}