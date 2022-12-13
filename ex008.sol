// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract ContratoMonstros {

    //variaveis de estado[arrays]
    //funcoes
    //structure
    //enums - cria uma lista pre-definida de valores. Ao inves de digitar com string [raro, especial, legal..poderia confundir] crio uma enum. É mais facil lembrar de um nome do que um numero[0,1,2...]

    //erros
    //modifiers
    //eventos

    enum tipoMonstro {  
        raro, 
        especial,
        legal
    }

    struct monstro {
        string nome;
        uint forca;
        tipoMonstro tipo;
    }
    monstro [] public monstros;
    

    function CriaMonstro(string memory _nome) public returns (uint) {
        monstro memory novomonstro; 
        novomonstro.nome = _nome;
        novomonstro.forca = block.timestamp % 20; //outra variavel global que vai me dar um numero RANDOM entre 0 e 19
        if (block.timestamp %4 ==0) {novomonstro.tipo = tipoMonstro.raro;}
        else if (block.timestamp %4 ==1) {novomonstro.tipo = tipoMonstro.especial;}
        else if (block.timestamp %4 ==2) {novomonstro.tipo = tipoMonstro.legal;}

        monstros.push(novomonstro);//nao esquecer de chamar array
        return (block.timestamp);
    }
}
//https://docs.soliditylang.org/en/v0.8.17/units-and-global-variables.html - solidity global variables
//block.timestamp (uint): current block timestamp as seconds since unix epoch