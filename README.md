
# zkSync Era Smart Contract Deployment with Foundry  

This project demonstrates the deployment of a Solidity smart contract on zkSync Era using Foundry. The contract simulates genomic data encryption and rollup.  

## Prerequisites  
Before proceeding, ensure you have the following installed:  
- [Foundry](https://book.getfoundry.sh/getting-started/installation)  
- zksync dependencies
- zkSync Era Testnet RPC URL  
- A funded wallet with Sepolia ETH for gas fees  

## Installation  
1. **Clone the repository:**  
   ```sh
   git clone https://github.com/zacksfF/Catherine-test.git
   cd Catherine-test
   ```  
2. **Install Foundry:**  
   ```sh
   curl -L https://foundry.paradigm.xyz | bash
   foundryup
   ```  
3. **Install dependencies:**  
   ```sh
   forge install  
   ```  

## Configuration  
1. **Set up environment variables:**  
   ```sh
   export ZKSYNC_RPC="https://testnet.era.zksync.dev"
   export PRIVATE_KEY="your_private_key_here"
   ```  
2. **Verify environment setup:**  
   ```sh
   echo $ZKSYNC_RPC  
   echo $PRIVATE_KEY  
   ```  

## Compilation  
Compile the smart contract to ensure there are no errors:  
```sh
forge build  
```  

## Testing  
Run the unit tests to verify contract functionality:  
```sh
forge test  
```  

## Deployment  
Deploy the contract to zkSync Era Testnet:  
```sh
forge script script/Deploy.s.sol --rpc-url $ZKSYNC_RPC --broadcast --private-key $PRIVATE_KEY  
```  

##  Output  
 
```
Deployed contract at: 0x...
Transaction hash: 0x....
```  
