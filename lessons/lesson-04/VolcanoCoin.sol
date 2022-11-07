//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0; /*2*/

contract VolcanoCoin { /*4*/
    uint256 totalSupply = 10000; /*5*/

    address owner; /*8*/

    mapping(address => uint256) public /*14 (1)*/ balances; /*13*/

    /*18*/
    struct Payment {
        address recipient;
        uint256 amount;
    }

    mapping(address => Payment[]) public userPayments; /*19a*/

    /*9*/
    modifier onlyOwner() {
        if (msg.sender == owner) {
            _;
        }
    }

    event logSupply(uint256); /*12a*/
    event logTransfer(address, uint256); /*17*/

    /*11*/
    constructor() {
        owner = msg.sender;
        balances[owner] = totalSupply; /*15*/
    }

    /*6*/
    function getTotalSupply() public view returns(uint256) {
        return totalSupply;
    }

    /*7*/
    function increaseSupply() public onlyOwner /*10*/ {
        totalSupply += 1000;
        emit logSupply(totalSupply); /*12b*/
    }

    /*14 (2)*/
    function getBalance(address _user) public view returns(uint256){
        require(_user != address(0), "Invalid address!");
        return balances[_user];
    }

    /*16*/
    function transfer(address _recipient, uint256 _amount) public payable {
        // if senders address (msg.sender) was a parameter, it could be any address
        require(_recipient != address(0), "Invalid address");
        require(_amount > 0, "Invalid amount!");
        require(balances[msg.sender] >= _amount, "User has not enough supply!");

        balances[_recipient] += _amount;
        balances[msg.sender] -= _amount;

        userPayments[msg.sender].push(Payment({recipient:_recipient, amount:_amount})); /*19b*/

        emit logTransfer(_recipient, _amount);
    }

    /*19 extra*/
    function getUserPayments(address _user) public view returns(Payment[] memory) {
        require(_user != address(0), "Invalid address!");
        return userPayments[_user];
    }
}