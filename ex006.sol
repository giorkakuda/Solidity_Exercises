// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract heranca {
    //variaveis de estado
    mapping (string => uint) public valorReceber;
    address public owner = msg.sender; 
    string nome = 'nao sei';
    uint inteiro; // primeiro os nós recebem as variaveis de estado para alocar um espaço para elas. TODAS AS VARIAVEIS CRIADAS DENTRO DAS FUNÇOES DEVEM SER DO TIPO MEMORY
    // valor, referencia:
    //uint256 => ja tem o valor estabelecido de bytes / adress => tamanho de 20 bytes+-[tamanho fixo: min e max.]
    //referencia: string [nao tem tamanho]/ mapping; arrays; struct... 

    function escrevaValor(string memory _nome, uint valor) public {
        /*require(msg.sender == owner);  => requer que a pessoa q faça uma transação no futuro seja o owner, 
        se não for o owner vai dar erro
        valorReceber[_nome] = valor;*/
        if (msg.sender == owner) { // => outra forma de fazer, porem se outra pessoa tenta fazer a transação, a transação é feita sem  apontar ERRO e aparece valor 0 no call... por isso deve-se usar o require
            valorReceber[_nome] = valor;
        }
        
    }
    function pegaValor (string memory _nome) public view returns(uint) {
        return valorReceber[_nome];
    }
}
/* exitem 3 lugares para armazenamento: 1-stack ; 2-memory ; 3-storage.
o storage é um lugar onde fica persistente, precisa de alguem para mudar.
a memory é volatil, tudo que é executado, logo é apagado.
o storage que é o tamanho do contrato, é definido qdo escrito. fica fora das funções [ver variaveis de estado^^linha 5]*/
