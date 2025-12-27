// SPDX-License-Identifier: MIT
pragma solidity 0.8.20; // Do not change

import "hardhat/console.sol";
import "./ExampleExternalContract.sol";

contract Staker {
    ExampleExternalContract public exampleExternalContract;

    // State
    mapping(address => uint256) public balances;
    uint256 public constant threshold = 1 ether;
    uint256 public deadline = block.timestamp + 72 hours;

    bool public openForWithdraw;
    bool public executed;

    // Events
    event Stake(address indexed staker, uint256 amount);

    constructor(address exampleExternalContractAddress) {
        exampleExternalContract = ExampleExternalContract(exampleExternalContractAddress);
    }

    // Modifiers
    modifier notCompleted() {
        require(!exampleExternalContract.completed(), "Already completed");
        _;
    }

    // Stake
    function stake() public payable notCompleted {
        require(block.timestamp < deadline, "Deadline passed");
        require(msg.value > 0, "No ETH sent");

        balances[msg.sender] += msg.value;
        emit Stake(msg.sender, msg.value);
    }

    // Execute
    function execute() public notCompleted {
        require(block.timestamp >= deadline, "Deadline not reached");
        require(!executed, "Already executed");

        executed = true;

        if (address(this).balance >= threshold) {
            exampleExternalContract.complete{value: address(this).balance}();
        } else {
            openForWithdraw = true;
        }
    }

    //Withdraw 
    function withdraw() public notCompleted {
        require(openForWithdraw, "Withdrawals not open");

        uint256 amount = balances[msg.sender];
        require(amount > 0, "Nothing to withdraw");

        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }

    // Time Left
    function timeLeft() public view returns (uint256) {
        if (block.timestamp >= deadline) {
            return 0;
        }
        return deadline - block.timestamp;
    }

     function getStake(address staker) external view returns (address, uint256) {
        return (staker, balances[staker]);
    }

    //Receive ETH
    receive() external payable {
        stake();
    }
}
