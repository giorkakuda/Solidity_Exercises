// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract heranca {
    mapping (string => uint) public valorReceber;
    //address é um tipo de variavel
    address public owner = msg.sender; // =>somente o dono do contrato consegue escrever

    function escrevaValor(string memory _nome, uint valor) public {
        require(msg.sender == owner); // => requer que a pessoa q faça uma transação no futuro seja o owner, 
        //se não for o owner vai dar erro
        valorReceber[_nome] = valor;
    }
    function pegaValor (string memory _nome) public view returns(uint) {
        return valorReceber[_nome];

    }
}
