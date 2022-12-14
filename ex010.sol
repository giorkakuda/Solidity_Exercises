// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Math {

    function Soma(uint8 _x, uint8 _y) public pure returns (uint8) {// se tivesse uma variavel, teria que ler, entao ao inves de 'pure' teria que ser 'view'
        return _x + _y;

    }
    //uint8 = bytes 1
    //1 byte = 8 bits = 2^8 = 256 [0 - 255] portanto quando for maior dará erro
    
} 
//https://eips.ethereum.org/EIPS/eip-20