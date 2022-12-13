// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract SimpleCoin {
    
    uint256 public initialSupply;
    mapping(address => uint256) public balanceof;
    address public owner;

 /*   modifier onlyowner { => MODIFIER diz execute essa linha e depois o resto da função [linha21] é bom se tiver que executar varias funções com 'require', entao não precisa ficar repetindo codigo, é só atribuir o modifier na função
        require(msg.sender ==owner);
        _;
    }
*/
    constructor() {// é a função executada qdo o contrato é posto na blockchain. 1-define inicial supply,

    owner = msg.sender; //o owner é a pessoa que vai mandar o contrato para blockchain
    initialSupply = 1_000_000_000;
    balanceof[owner] = initialSupply; // mostra que o initial supply vai para o owner
    }
    function ChangeOwner(address _newowner) public {//onlyowner
        require(msg.sender == owner);
        owner = _newowner;
    }


} 