pragma solidity >= 0.7.0 < 0.9.0;

/// @title ERC20 custom token with total supply of 100 Million 
/// @notice Initial Value at $0.01 (Pre-sale Quantity: 30 Million)
/// @notice 2nd Sale Value at $0.02 (Seed Sale Quantity: 50 Million)
/// @notice Final Sale for Remaining Tokens should be dynamically allocated.     
/// @author Jeet Patel
contract Erc {
    mapping(address => uint256) private balances;
    uint256 private totalSupply;
    uint256 private tokenAlloted;
    string private name;
    string private symbol;

    constructor() {
        name = "ERC20Task";
        symbol = "ERCT";
        totalSupply += 100000000;
        balances[msg.sender] += 100000000;
    }

    /// @dev Returns the name of the token.
    function returnName() public view returns (string memory) {
        return name;
    }

    /// @dev Returns the symbol of the token, usually a shorter version of the name
    function returnSymbol() public view returns (string memory) {
        return symbol;
    }

    /// @dev Returns the name of the token.
    function TotalTokenSupply() public view returns (uint256) {
        return totalSupply;
    }
    
    /// @dev returns the amount of tokens allocated out of 100 million    
    function TokensAlloted() public view returns (uint256) {
        return tokenAlloted;
    }

    /**
     * @title checks balance of the given address
     * @dev returns the token amount of the address
     */
    function checkBalanceOf(address _account) public view returns (uint256) {
        return balances[_account];
    }

    /**
     * @titile transfer function
     * @notice transfers token to the address that calls this function
     */
    function saleEvent() public payable returns(uint256) {
        uint _tokenAmt = 0;
        if (tokenAlloted <= 30000000) {
            require(msg.value != 0, 
            "value cannot be empty");
            _tokenAmt = (msg.value * 25)/(10 ** 15);
            tokenAlloted += _tokenAmt;
            balances[msg.sender] += _tokenAmt;
        } else if (tokenAlloted <= 80000000) {
            require(msg.value != 0, 
            "value cannot be empty 2");
            _tokenAmt = (msg.value * 625)/(10 ** 17);
            tokenAlloted += _tokenAmt;
            balances[msg.sender] += _tokenAmt;
        } else if (tokenAlloted <= 100000000) {
            require(msg.value != 0,
            "value cannot be empty 3");
            _tokenAmt = (msg.value * 25)/(10 ** 17) ;
            tokenAlloted += _tokenAmt;
            balances[msg.sender] += _tokenAmt;
        }
    }
}