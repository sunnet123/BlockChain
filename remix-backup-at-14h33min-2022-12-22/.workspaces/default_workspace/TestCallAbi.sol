pragma solidity >=0.7.0 < 0.9.0;

contract C {
    event EventFallback(string _str);
    event EventReceive(string _str);
    function add1(uint256 _num1, uint256 _num2) public pure returns(uint256){
        return _num1 + _num2;
    }
    fallback() external {
        emit EventFallback("EventFallback is called");
    }

    receive() external payable{
        emit EventReceive("EventReceive is called");
    }
}

contract B{
    event EventCall1(bool _success, bytes _output);

    //1.송금만
    function transfer1(address payable _to) public payable{
        (bool success,) = _to.call{value:msg.value}("");
        require(success, "failed to transfer ether");
    }

    //2. 외부 스마트 컨트랙 함수 호출
    function call1(address _contractAddr, uint256 _num1, uint256 _num2) public {
        (bool success, bytes memory outputFromCalledFunction) = _contractAddr.call(
            abi.encodeWithSignature("add1(uint256,uint256",_num1,_num2)

        );
        require(success, "failed to transfer ether");
        emit EventCall1(success,outputFromCalledFunction);
    }
}