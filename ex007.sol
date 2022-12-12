// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract ContratoMonstros {
    struct monstro {
        string nome;
        uint forca;
    }
    monstro [] monstros; // => colocar public para vizualizar no Remix
    

    function CriaMonstro(string memory _nome, uint _forca) external {// ou public, neste caso da na mesma
        monstro memory novomonstro; //criou na memory
        novomonstro.nome = _nome;
        novomonstro.forca = _forca;
        monstros.push(novomonstro); // => para inserir na array monstros
    }
    function PegaMonstro (uint id) external view returns (string memory, uint){
        monstro storage monstro = monstros[id]; //to pegando a informação do storage e jogando para o monstro que esta na memory. pegando do storage sao menos operaçoes logicas, gastando menos
        return (monstro.nome, monstro.forca);
    }
    function AlterarForca (uint id, uint _novaforca) external{
        monstro storage monstro = monstros[id];
        monstro.forca = _novaforca;
    }

}