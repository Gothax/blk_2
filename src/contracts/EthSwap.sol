pragma solidity ^0.5.0;      //where we buy and sell tokens in this project
import "./Token.sol";

contract EthSwap{
    string public name = "EthSwap Instant Exchange";
    Token public token;
    uint public rate = 100;

    event TokensPurchased(
        address account,
        address token,
        uint amount,
        uint rate
    );

     event TokensSold(
        address account,
        address token,
        uint amount,
        uint rate
    );

    constructor(Token _token) public {
        token = _token;
    }

    function buyTokens() public payable {
        //redemption rate = amount of tokens they recieve for 1 ether (rate)
        //amount of ethereum * redemption rate
        //calculate the number of tokens to buy
        uint tokenAmount = msg.value * rate;

        //require enough tokens
        require(token.balanceOf(address(this)) >= tokenAmount);  //similar with (break+if) if it fits the requirement, keep execute. if not, stop

        token.transfer(msg.sender, tokenAmount);  //sender = the address who's calling this function

        //Emit an event
        emit TokensPurchased(msg.sender, address(token), tokenAmount, rate);
    }

    function sellTokens(uint _amount) public {
        //user can't sell more tokens than they have
        require(token.balanceOf(msg.sender) >= _amount);

        //calculate the amount of Etehr of redeem
        uint etherAmount = _amount / rate;

        //require that EthSwap has enough Ether
        require(address(this).balance >= etherAmount);  //similar with (break+if) if it fits the requirement, keep execute. if not, stop

        //Perform Sale
        token.transferFrom(msg.sender, address(this), _amount); //from ,to, amount using special function to spend my tokens
        msg.sender.transfer(etherAmount); //tranfer for ether. For native crypto currency. tranfer for Tokens(DApp Token) is at Token.sol

        //Emit an event
        emit TokensSold(msg.sender, address(token), _amount, rate);
    }
}