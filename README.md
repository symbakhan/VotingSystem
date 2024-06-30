# VotingSystem
This smart contract allows for a decentralized voting system where users can vote for candidates in an election. The contract administrator can add candidates, and registered voters can cast their votes. The current standings of the election can be viewed by anyone.

## Tools we use in this smart contract
- MetaMask
- Ganache
- Remix IDE

## MetaMask 
MetaMask is a browser extension wallet that allows you to interact with Ethereum-based applications.

1. **Install MetaMask:**
   - Go to the metamask.io and install the extension for your browser.

2. **Create a MetaMask Account:**
   - Follow the instructions to create a new wallet or import an existing one.
     
3. **Connect MetaMask to a Local Blockchain:**
   - Click on the network dropdown (usually shows "Ethereum Mainnet") at the top of the MetaMask extension.
   - Select "Custom RPC" and enter the following details to connect to Ganache:
     - **Network Name:** Ganache
     - **New RPC URL:** `http://127.0.0.1:7545`
     - **Chain ID:** `1337` (default for Ganache)
   - Save and switch to the Ganache network.

## Ganache Setup

1. **Install Ganache:**
   - Download and install Ganache from the https://www.trufflesuite.com/ganache.

2. **Start Ganache:**
   - Open Ganache and click on "Quickstart Ethereum".

3. **Add Accounts to MetaMask:**
   - In Ganache, you'll see a list of generated accounts with private keys.
   - In MetaMask, click on your account icon, select "Import Account", and enter the private key of one of the accounts from Ganache.

## Deploying the Smart Contract Using Remix

1. **Open Remix:**
   - Go to Remix IDE.

2. **Create a New File:**
   - In the File Explorer, click the "+" button to create a new file.
   - Name it `VotingSystem.sol`.
   - Write smart contract.


4. **Compile the Smart Contract:**
   - Click on the "Solidity Compiler" tab on the left sidebar.
   - Ensure the compiler version is set to `0.8.0` or later.
   - Click the "Compile VotingSystem.sol" button.

5. **Deploy the Smart Contract:**
   - Click on the "Deploy & Run Transactions" tab on the left sidebar.
   - Select `Injected provider-METAMASK` as the environment to deploy using MetaMask.
   - Ensure your MetaMask is connected to the Ganache network.
   - Click the "Deploy" button.

6. **Interact with the Smart Contract:**
   - Once deployed, the contract will appear under "Deployed Contracts" in Remix.

   - **Add Candidates:**
     - Use the `addNewCandidate` function to add a candidate. Enter the candidate's name and click "transact".

   - **Cast Votes:**
     - Use the `castVote` function to cast a vote. Enter the candidate's ID and click "transact". Ensure you are using a different address than the administrator to vote.

   - **View Candidate Details:**
     - Use the `getCandidateDetails` function. Enter the candidate's ID to view their details.

   - **View All Candidates:**
     - Use the `getAllCandidatesDetails` function to view details of all candidates.

## Contract Functions

### Administrator Management

- **onlyAdministrator:** Restricts certain functions to be callable only by the contract administrator.

### Candidate Management

- **addNewCandidate:** Allows the administrator to add new candidates to the election.
- 
### Voting Mechanism

**castVote:** Allows users to vote for a candidate by specifying the candidate's ID. Each voter can only vote once.

### Result Viewing

- **getCandidateDetails:** Allows anyone to view the details of a specific candidate, including their ID, name, and vote count.

- **getAllCandidatesDetails:** Retrieves details of all candidates.
