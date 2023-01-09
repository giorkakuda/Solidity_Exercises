//REMIX 

// SPDX-License-Identifier: GPL-3.0
pragma solidity^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    constructor() ERC20 ("my token", "token") {

        uint totalSupply = 1_000_000 *10 **18;
        _mint(msg.sender, totalSupply);
    }

}

/*
https://testnet.bscscan.com/address/0x44e7550b2cae1a0089aba5f6a33618f9081a389a#events
CONTRACT:
0x44e7550B2cAE1a0089Aba5F6A33618F9081A389a
