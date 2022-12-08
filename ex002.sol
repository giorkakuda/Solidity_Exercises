pragma solidity ^0.8.0;

contract HelloWorld {
    string public name;
    uint public numeroEscolhido; //so aceita numeros inteiros


    function setName(string memory _qualquerNome) public {//se nao por publico, ninguem interage com SC
        name = _qualquerNome;//^ vou aprender mais tarde
    }
    function setNumeroEscolhido(uint _numero) public {// numeros não precisa de 'memory'
        numeroEscolhido = _numero;
    }
}
/* TEORIA
qdo o arquivo é compilado, é gerado o arquivo json. 
O bytecode é tudo o que meu computador gerou...
"(é como se eu tivesse escrito de forma simplificada)"

 esse arquivo precisa ser enviado para um 'nó', para distribuir para outro 'nós'
 e ele vai ser inserido em todas as maquinas virtuais da eth na blockchain
 
 ABI => serve para interagir com os contratos atraves da Dapp, 
 vc precisa do endereço do contrato e da ABI do contrato*/ 

 