// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract piggy{
    event deposit(uint amount);
    event withdraw (uint amount);

    address public owner = msg.sender;

    receive() external payable {
        emit deposit(msg.value);
    }
    function withdrawal() external{
        require(msg.sender == owner, "You are not the owner");
        emit withdraw (address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}