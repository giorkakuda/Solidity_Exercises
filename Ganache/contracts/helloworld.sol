// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract HelloWorld {

    uint public numero = 0;

    function setInt (uint _novoNumero) public {
        numero = _novoNumero;
    }

}