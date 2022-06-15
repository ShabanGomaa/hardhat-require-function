// an example of a smart contract

//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract CustomerContract {
    // The Global public variables (make getters with "public")
    address public owner = msg.sender;
    uint256 public publicNumber;

    // Private variables
    uint256 private currentNumber;
    string private message;

    // A function to change the current number by any uint256 value. The stored number and the new number
    // should not be the same, If it is, it will fail with message "Identical numbers"
    // If the person who ask to change the number is not the contract owner, require function will fails
    // With returning error message "Only the owner who can update"
    function changeNumber(uint256 number) public {
        require(currentNumber != number, "Identical numbers");
        require(msg.sender != owner, "Only the owner who can update");

        currentNumber = number;
    }

    // This is how to return the current number.
    function getCurrentNumber() public view returns (uint256) {
        return currentNumber;
    }
}
