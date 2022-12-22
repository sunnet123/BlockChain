pragma solidity >=0.7.0 <0.9.0;

contract TextException8{

    function func1() public pure{
        assert(false);
    }

    function fun2() public pure
    {
        revert("revert");
    }

    function fun3() public pure
    {
        require(false, "occurred");
    }

    function fun4(uint256 money) public pure returns(string memory){
        {
            if(money<=1000){
                revert("not enough money");
            }
            return "payment is succeeded"
        }
    }
}