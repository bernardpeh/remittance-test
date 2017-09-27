pragma solidity 0.4.17;

contract Remittance {
  
  address public owner;
  address public withdrawer;
  bytes32 private password1;
  bytes32 private password2;
  uint public dueBlocks;
  
  // hash the passwords on http://emn178.github.io/online-tools/keccak_256.html
  function Remittance(bytes32 _password1, bytes32 _password2, uint _due, address _withdrawer) public {
      owner = msg.sender;
      withdrawer = _withdrawer;
      dueBlocks = block.number + _due;
      password1 = _password1;
      password2 = _password2;
  }
  
  function fund() public payable returns (bool) {
      require(msg.sender == owner);
      require(msg.value > 0);
      return true;
  }
  
  function getContractBalance() public view returns (uint) {
      return this.balance;
  }
  
  function getCurrentBlock() public view returns (uint) {
    return block.number;    
  }
  
  function withdraw(bytes32 _password1, bytes32 _password2) public returns (bool) {
      require(msg.sender == withdrawer || msg.sender == owner);
      // if still within time limit
      if (block.number >= dueBlocks) {
        if (password1 == keccak256(_password1) && password2 == keccak256(_password2)) {
          kill(withdrawer);
        }
      }
      else {
          kill(owner);
      }
      return true;
  }
  
  function kill(address _withdrawer) internal {
    selfdestruct(_withdrawer);
  }
}

