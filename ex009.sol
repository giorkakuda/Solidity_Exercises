// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract SimpleCoin {
    // name, symbol, decimals, totalSupply
    // transfer, transferFrom, approve, allowance

    event Transfer(address indexed _from, address indexed _to, uint256 _value);//copiado
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);//copiado
    
    uint256 public totalSupply;
    mapping(address => uint256) public balanceof;
    address public owner;

 /*   modifier onlyowner { => MODIFIER diz execute essa linha e depois o resto da função [linha21] é bom se tiver que executar varias funções com 'require', entao não precisa ficar repetindo codigo, é só atribuir o modifier na função
        require(msg.sender ==owner);
        _;
    }
*/
    constructor() {// é a função executada qdo o contrato é posto na blockchain. 1-define inicial supply,

    owner = msg.sender; //o owner é a pessoa que vai mandar o contrato para blockchain
    totalSupply = 1_000_000_000;
    balanceof[owner] = totalSupply; // mostra que o initial supply vai para o owner
    }
    function ChangeOwner(address _newowner) public {//onlyowner
        require(msg.sender == owner);
        owner = _newowner;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {//copiado
        require (balanceof[msg.sender] >= _value);//requer o saldo de quem enviou, deve ser maior ou igual o valor
        require (_to != address (0));//o endereço é diferente o '0'. o endereço '0' é onde inicia um novo smart contract
        balanceof[msg.sender] -= _value;
        balanceof[_to] += _value; 

        emit Transfer(msg.sender, _to, _value);
        return true;


    }
} 
//EVENTO - é um Log. O log fica gravado em um lugar de facil acesso e é mais barato... ex: no banco o |Gerente pega o livro e anota sua transferencia. qdo o cliente volta o caixa te da as informações sem consultar o gerente(lightenning network and main) diferente da variaveis de estado que fica no storage, logs ficam em outro lugar