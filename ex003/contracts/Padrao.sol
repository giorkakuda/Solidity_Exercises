// SPDX-License-Identifier: MIT
pragma solidity^0.8.7;

contract Padrao {
    string public nome;

    function mudaNome(string memory _nome) public {
        nome = _nome;

    }
}
// truffle console: let instance = await Padrao.deployed()
// nome = await instance.nome() - mostrou vazio
// await instance.mudaNome('Giordanni') - transação para mudar o nome

// let instanceCriador = await Criador.deployed()
// await instanceCriador.criaPadrao()
//let endereco = await instanceCriador.endereco()

//let instance2 = await Padrao.at('0xA1a66663EF1722bFA4fD726d4C43b43af34D72aA')
//await instance2.mudaNome('Nair')
// nome2 = await instance2.nome()

/// await instanceCriador.criaPadrao()
// endereco2 = await instanceCriador.endereco()