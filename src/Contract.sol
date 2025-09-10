// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract StakingContract {
    mapping(address => uint256) public stakes;
    uint256 public totalStaked;

    constructor() {
    }

    function stake(uint256 _amount) payable public {
        require(_amount > 0, "Cannot stake negative amount");
        require(_amount == msg.value, "Amount sent does not match amount staked");
        stakes[msg.sender] += _amount;
        totalStaked += _amount;
    }

    function unstake(uint256 _amount) public {
        require(stakes[msg.sender] >= _amount, "Insufficient staked amount");
        payable(msg.sender).transfer(_amount);
        totalStaked -= _amount;
        stakes[msg.sender] -= _amount;
    }
}
