// SPDX-License-Identifier: GPL-3.0 
// linha 1 = é a licença, agora o compilador não reclama 
pragma solidity ^0.8.0;

contract Soma {

    uint x; // se não declarar ela é 'private'
    uint public y;

    function setxy(uint _x, uint _y) public { // => coloca 'public' para as pessoas acessarem
        x = _x;
        y = _y;
    }// na blockchain 'setxy' teria que pagar pq eu estaria gravando na blockchain
// ja o call 'y' não precisaria pq eu estaria só lendo
    
    function soma() public view returns (uint) { // => qdo coloca 'view', vc diz que não vai mexer na blockchain, 
    //vai apenas receber uma 'call'
        return x+y;
    }
}

/*DEPLOY
ABI - vai ser a interface entre o programa da maquina e o meu codigo
(toda vez que precisar em entrar em contato com o programa que esta na blockchain, eu vou precisar da ABI)
Bytecode - vou precisar só 1 vez qdo for enviar (binario)

1-passo: escreve o contrato (linguagem humana, pragma, contract...)
2-passo: faz a compilação (linguagem da maquina, resultado em Bytecode)
3-passo: manda pra blockchain atraves de um nó (provider, que recebe meu contrato, 
implementar e espalhar para os outros criando copias do meu contrato)
4-passo: interagir com o programa atraves da ABI

A intermediação mtas vezes é feita pela MetaMask que utiliza um provedor 
(infura [que é um nó] para fazer contato com a blockchain)
*/