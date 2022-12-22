pragma solidity 0.8.7;

contract TestException6 {
    function func1() public pure {
        require(false, "Error message");
    }
}

contract ErrorHadling {
    event ErrorLogging(string reason);
    function catchError() public {
        TestException6 error1 = new TestException6();
        try.error1.func1() {
            //here we could do something uf ut works
        } catch Error(string memory reason) {
            emit ErrorLogging(reason);
        }
    }
}