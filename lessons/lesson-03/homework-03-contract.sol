// SPDX-License-Identifier: None
pragma solidity 0.8.17;

contract BootcampContract {
  uint256 number;

  address contractDeployer;

  constructor() {
    contractDeployer = msg.sender;
  }

  function getDeployerAddress() public view returns (address) {
    if (msg.sender == contractDeployer) {
      return 0x000000000000000000000000000000000000dEaD;
    } else {
      return contractDeployer;
    }
  }

  function store(uint256 num) public {
    number = num;
  }

  function retrieve() public view returns (uint256){
    return number;
  }
}