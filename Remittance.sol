pragma solidity 0.4.17;

contract Remittance {
  
  address owner;
  address withdrawer;
  bytes32 password1;
  bytes32 password2;
  uint dateDue;
  
  function Remittance(bytes32 _password1, bytes32 _password2, uint _dateDue, address _withdrawer) public {
      owner = msg.sender;
      withdrawer = _withdrawer;
      dateDue = block.number + _dateDue;
      password1 = keccak256(_password1);
      password2 = keccak256(_password2);
  }
  
  function fund() public payable returns (bool) {
      require(msg.sender == owner);
      return true;
  }
  
  function getContractBalance() public view returns (uint) {
      return this.balance;
  }
  
  function withdraw(bytes32 _password1, bytes32 _password2) public returns (bool) {
      kill(withdrawer);
      return true;
  }
  
  function kill(address _withdrawer) internal {
    selfdestruct(_withdrawer);
  }
}

