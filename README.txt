2 Factor Authentication Test

Business rules:

1. Owner set 2 encrypted passwords, a timeline into the future (in blocks), and a withdrawer address when deploying the contract.
2. The passwords are encrypted in the contract.  
3. Owner funds the contract with X ether.
4. Outside of the contract, owner sends the unencrypted passwords to 2 parties, one password each.
5. 2 parties will have to communicate in real to know both passwords.
6. ANYONE can now enter the 2 unencrypted passwords in the contract. If the passwords matches, the contract funds is transferred to the withdrawer address and contract terminated.
7. Withdrawal has to be done within the timeline specified after the contract is deployed.
8. Once the timeline has reached and the funds not withdrawn, any attempt to withdraw will terminate the contract and funds returned to the owner.  

 
