// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Agreement {
    address payable seller;
    address payable buyer;

    bool buyerConfirmation = false;
    bool sellerConfirmation = false;

    constructor(address payable _buyer, address payable _seller) payable {
        buyer = _buyer;
        seller = _seller;
    }

    function buyerConfirm() public {
        require(!buyerConfirmation);
        require(msg.sender == buyer);
        buyerConfirmation = true;
    }

    function sellerConfirm() public {
        require(!sellerConfirmation);
        require(msg.sender == seller);
        sellerConfirmation = true;
    }

    function withdraw() public {
        require(buyerConfirmation && sellerConfirmation);
        require(msg.sender == seller);
        seller.transfer(address(this).balance);
    }
}
