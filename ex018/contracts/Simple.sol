// SPDX-License-Identifier: MIT
pragma solidity^0.8.7;

contract Simple {
    string public nome = "Giordanni";

    function mudaNome (string memory _novoNome) public {
        nome = _novoNome;
    }  
}