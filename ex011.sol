// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract SimpleCoin {
// name, symbol, decimals, totalSupply
// transfer, transferFrom[casa de swap], approve, allowance
  
    uint256 public totalSupply;
    mapping(address => uint256) public balanceof;
    address public owner;

//https://eips.ethereum.org/EIPS/eip-20

    string public name = "Peso Real"; 
    string public symbol = "PSRL";
    uint8 public decimals = 8;

    mapping(address => mapping (address => uint)) public allowance; // eu permito que a uniswap mova x token da minha carteira para outra pessoa [transfer from]

    event Transfer(address indexed _from, address indexed _to, uint256 _value);//copiado
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);//copiado

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
  
    constructor() {// é a função executada qdo o contrato é posto na blockchain. 1-define inicial supply,

    owner = msg.sender; //o owner é a pessoa que vai mandar o contrato para blockchain
    totalSupply = 1_000_000_000 * 10** decimals;
    balanceof[owner] = totalSupply; // mostra que o initial supply vai para o owner
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(allowance[_from][msg.sender] >= _value);
        require(balanceof[_from] >= _value);
        require(_from != address(0));
        require(_to != address(0));

        balanceof[_from] -= _value;
        balanceof[_to] += _value;
        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        
        return true;
    }
    

    function approve(address _spender, uint256 _value) public returns (bool success){//muita atenção, vc pode aprovar que a casa de swap transfira tudo da sua conta
        //require(balanceof[msg.sender] >= _value);
        require(_spender != address(0));
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
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