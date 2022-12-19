// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Padrao {

    string public nome;

    function mudaNome(string memory _nome) public {
        nome = _nome;

    
    }
}
// nome = await instance.nome()
// let instanceCriador = await Criador.deployed()
// await instance.mudaNome()


// await instanceCriador.criaPadrao()
// endereco2 = await instanceCriador.endereco()
