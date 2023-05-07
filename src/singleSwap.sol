// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract TokenSwap {
    address owner;
    address public CDC;
    address public BTGUSD;
    uint256 public rate;

    constructor(address _owner, address _CDC, address _BTGUSD, uint256 _rate) {
        owner = _owner;
        CDC = _CDC;
        BTGUSD = _BTGUSD;
        rate = _rate;
    }

    function swapTokens(uint256 amount) external {
        // Manda CDC do dono para quem executou o contrato
        IERC20(BTGUSD).transferFrom(owner, msg.sender, amount);
        // Define o quanto receber
        uint256 amountToReceive = amount * rate;
        // Requer BTGUSD em troca
        require(IERC20(CDC).transferFrom(msg.sender, owner, amountToReceive), "Token transfer failed");
    }
}