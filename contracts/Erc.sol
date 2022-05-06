pragma solidity >= 0.7.0 < 0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title ERC20 custom token with total supply of 100 Million 
/// @notice Initial Value at $0.01 (Pre-sale Quantity: 30 Million)
/// @notice 2nd Sale Value at $0.02 (Seed Sale Quantity: 50 Million)
/// @notice Final Sale for Remaining Tokens should be dynamically allocated.     
/// @author Jeet Patel

contract Erc is ERC20 {
    // /**
    //  * @title mints 100 million tokens and assigns it to the deployed address
    //  */
    constructor() ERC20('ERCTask', 'ERT') {
        // ownerAdd = msg.sender;
        _mint(address(this), 100000000 * 1e18);
    }
}

contract ICOfunding is Erc {    
    uint256 public tokenAlloted;
    // /**
    //  * @title transfer function
    //  * @notice transfers token to the address that calls this function
    //  */
    function saleEvent() public payable {
        uint _tokenAmt = 0;
        require(msg.value != 0, 
        "value cannot be empty");
        if (tokenAlloted <= 30000000 * 1e18) {
            // _tokenAmt = (msg.value * 25 * 1e18)/(10 ** 14);
            _tokenAmt = (msg.value * 25 * 10 ** 4);
            tokenAlloted += _tokenAmt;
            _transfer(address(this), msg.sender, _tokenAmt);
        } else if (tokenAlloted <= 80000000 * 1e18) {
            // _tokenAmt = (msg.value * 625 * 1e18)/(10 ** 16);
            _tokenAmt = (msg.value * 625 * 10 ** 2);
            tokenAlloted += _tokenAmt;
            _transfer(address(this), msg.sender, _tokenAmt);
        } else if (tokenAlloted <= 100000000 * 1e18) {
            // _tokenAmt = (msg.value * 25 * 1e18)/(10 ** 16) ;
            _tokenAmt = (msg.value * 25 * 10 ** 2);
            tokenAlloted += _tokenAmt;
            _transfer(address(this), msg.sender, _tokenAmt);
        }
    }
}