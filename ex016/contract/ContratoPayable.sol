// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract ContratoPayable {
    address public enderecoInterior;
    

    
    constructor() {
        enderecoInterior = msg.sender;

    }

    function receberDinheiro() public payable {
        payable(enderecoInterior).transfer(msg.value);
        enderecoInterior = msg.sender;
    }
}/// a transação feita neste contrato de 10eth ficarao presas para sempre, pq nao foi feita a função de retirar eth do contrato
