//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

interface GreeterInterface {
    function setGreeting(string memory _greeting) external;
    function greet() external view returns (string memory);
}

contract CallGreeterSolidity {
    address private immutable greeterAddress;

    constructor(address _greeterAddress) {
        greeterAddress = _greeterAddress;
    }

    function setAndCallGreeter(string memory _string) external returns (string memory){
        GreeterInterface greeter = GreeterInterface(greeterAddress);
        greeter.setGreeting(_string);
        return greeter.greet();
    }
}