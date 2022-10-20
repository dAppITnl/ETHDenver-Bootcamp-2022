# Homework lesson 03

Date: 20.oct.2022

## Question 1:

Add a variable to hold the address of the deployer of the contract

```
  address contractDeployer;
```

## Question 2:

Update that variable with the deployer's address when the contract is deployed.

```
  constructor() {
    contractDeployer = msg.sender;
  }
```

## Questi0on 3:

Write an external function to return
  1. Address 0x000000000000000000000000000000000000dEaD if called by the
deployer
  2. The deployer's address otherwise

```
  function getDeployerAddress() public view returns (address) {
    if (msg.sender == contractDeployer) {
      return 0x000000000000000000000000000000000000dEaD;
    } else {
      return contractDeployer;
    }
  }
```

Results:

1. Deployed from address: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
  and clicked "getDeployerAddress"
  returns: 0: address: 0x000000000000000000000000000000000000dEaD
2. Changed account to address: 0x617F2E2fD72FD9D5503197092aC168c91465E7f2
  and clicked "getDeployerAddress"
  returns: 0: address: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

