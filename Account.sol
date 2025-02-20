// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Account{

    uint public balance;

    event balanceUpdated(address person, uint _amount, string _msg);

     

    function  deposit (uint _amount)public{

        balance+=_amount;

        emit balanceUpdated(msg.sender, _amount, "balance updated after deposit");

    }

    function  withdrow (uint _amount)public{

        balance-=_amount;

        emit balanceUpdated(msg.sender, _amount, "balance updated after withdrow");

    }
}
