// SPDX-License-Identifier: MIT
pragma solidity^0.8.7;

contract Simples {

    string public nome = "Giordanni";

    function mudaNome(string memory _novoNome) public {
        nome = _novoNome;
    }
}