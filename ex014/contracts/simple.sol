// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Simple {

    string public name;

    function mudarNome (string memory _name) public {
        name = _name;


    }
}
//TERMINAL => truffle compile; vai compilar o contrato
//TERMINAL => truffle migrate; vai fazer o deploy
//TERMINAL => truffle console; interage com o contrato
//TERMINAL => instance = await "nome".deployed()... depois é so chamar instance
//truffle-config => habilitar 'development'; port:7545 [numero do rpc-server do ganache]


/* FAZER UMA TRANSAÇÃO
TRUFFLE CONSOLE => let name = await instance.name()
undefined
truffle(development)> name
''
truffle(development)> await instance.mudarNome("Giordanni") - retorna a transação

CHAMAR A TRANSAÇÃO
truffle(development)> name = await instance.name()
undefined
truffle(development)> name
'Giordanni'
truffle(development)>

web3
npm init -y [vai criar o package.json]
npm install --sabe webjs [vai instalar o web3 no projeto 5000 arquivos]*/