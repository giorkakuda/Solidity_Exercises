// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract heranca {
    mapping (string => uint) public valorReceber; //=>dicionario, faz uma ligação, neste caso nome e um valor

    function escrevaValor(string memory _nome, uint valor) public {
        valorReceber[_nome] = valor;
    }
    //visibilidade: public, private, external, internal
    function pegaValor (string memory _nome) public view returns(uint) {
        return valorReceber[_nome];//        ^[visibilidade] ^[modifiers]

    }
}
// bscscan é uma rede de teste