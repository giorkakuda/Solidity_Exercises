// SPDX-License-Identifier: MIT
pragma solidity^0.8.7;

contract Simple {
    uint public valor = 2000;
    mapping (address=>uint) public balanceof;

    constructor() {
        balanceof[msg.sender] = valor;
    }

}