pragma solidity ^0.4.24;

import "./ERC20.sol";
import "../../math/SafeMath.sol";

contract StandardToken is ERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private balances;

    mapping (address => mapping (address => uint256)) private allowed;

    uint256 private totalSupply_;

    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    function balanceOf(address tokenOwner) public view returns (uint256) {
        return balances[tokenOwner];
    }

    function allowance(address tokenOwner, address tokenSpender) public view returns (uint256)
    {
        return allowed[tokenOwner][tokenSpender];
    }


    function transfer(address tokenOwner, uint256 tokens) public returns (bool success) {
        require(tokens <= balances[msg.sender]);
        require(tokenOwner != 0x0);

        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[toOwner] = balances[tokenOwner].add(tokens);
        emit Transfer(msg.sender, tokenOwner, tokens);
        success = true;
    }

    function approve(address tokenSpender, uint256 tokens) public returns (bool success) {
        allowed[msg.sender][tokenSpender] = tokens;
        emit Approval(msg.sender, tokenSpender, tokens);
        success = true;
    }

    function transferFrom(address from, address to, uint256 tokens) public returns (bool success){
        require(tokens <= balances[from]);
        require(tokens <= allowed[from][msg.sender]);
        require(to != 0x0);

        balances[from] = balances[from].sub(tokens);
        balances[to] = balances[to].add(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        emit Transfer(from, to, tokens);
        success = true;
    }


    function _mint(address _account, uint256 _amount) internal {
        require(_account != 0);
        totalSupply_ = totalSupply_.add(_amount);
        balances[_account] = balances[_account].add(_amount);
        emit Transfer(address(0), _account, _amount);
    }

    function _burn(address _account, uint256 _amount) internal {
        require(_account != 0);
        require(_amount <= balances[_account]);

        totalSupply_ = totalSupply_.sub(_amount);
        balances[_account] = balances[_account].sub(_amount);
        emit Transfer(_account, address(0), _amount);
    }


    function _burnFrom(address _account, uint256 _amount) internal {
        require(_amount <= allowed[_account][msg.sender]);

        // Should https://github.com/OpenZeppelin/zeppelin-solidity/issues/707 be accepted,
        // this function needs to emit an event with the updated approval.
        allowed[_account][msg.sender] = allowed[_account][msg.sender].sub(_amount);
        _burn(_account, _amount);
    }
}
