// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Receber {
    string public nome;

    error naoSuficiente(); //mensagem de erro dizendo que nao pagou suficiente

    receive() external payable { // com essa função pessoas de fora conseguem enviar para o contrato

    }

    function mudarNome(string memory _novoNome) public payable{//payable é uma função que permite receber dinheiro
        if (msg.value < 1 ether){// se o valor for acima de um eth, o contrato muda de nome
            revert naoSuficiente();
        }
        nome = _novoNome;
    }// ex: depois do deploy o contrato passara a ter 1 eth

    function quantoTem()external view returns (uint) {//não recebe nada e vai retornar um valor
        return address(this). balance; //vai retornar o endereço deste contrato com o valor
    }

    function retirar() public { //com essa função e permitido retirar o dinheiro que esta dentro do contrato
        address payable endereco = payable (msg.sender);
        endereco.transfer(address(this).balance);
    }
}
