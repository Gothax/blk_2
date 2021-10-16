pragma solidity ^0.5.0;      //where we buy and sell tokens in this project
import "./Token.sol";

contract EthSwap{
    string public name = "EthSwap Instant Exchange";
    Token public token;
    uint public rate = 100;

    constructor(Token _token) public {
        token = _token;
    }

    function buyTokens() public payable {
        //redemption rate = amount of tokens they recieve for 1 ether (rate)
        //amount of ethereum * redemption rate
        //calculate the number of tokens to buy
        uint tokenAmount = msg.value * rate;
        token.transfer(msg.sender, tokenAmount);  //sender = the address who's calling this function
    }
}