# Smart Contract Voting App

This project implements a decentralized voting application using Ethereum smart contracts. It allows users to add candidates, cast votes, and view election results on the Ethereum blockchain.

## Features

1. **Owner Management:**
   - **State Variable for Owner:** Store the address of the contract owner.
   - **Modifier for Owner-Only Functions:** Restrict certain functions to be callable only by the contract owner.

2. **Candidate Management:**
   - **State Variable for Candidates:** Define candidate properties (ID, name, vote count) using a struct.
   - **Mapping for Candidates:** Map candidate IDs to their respective Candidate struct.
   - **Function to Add Candidates:** Allow the owner to add new candidates to the election.

3. **Voting Mechanism:**
   - **State Variable for Voters:** Track whether an address has voted using a mapping.
   - **Function to Cast Votes:** Allow users to vote for a candidate by specifying the candidate's ID. Ensure each voter can only vote once and that the candidate ID is valid.

4. **Result Viewing:**
   - **Function to Get Candidate Details:** Allow anyone to view the details of a specific candidate, including their ID, name, and vote count.
   - **Function to Get All Candidates:** Optionally, provide a function to retrieve details of all candidates.

## Prerequisites

Before running the application, make sure you have the following installed:

- Node.js (version 12 or higher)
- Truffle (v5.11.5)
- Ganache (local blockchain for testing)
- MetaMask extension (for interacting with the application)

## Installation

1. Clone the repository:

git clone https://github.com/danyaljbarkhail/Smart-Contract-Voting-App
```

2. Install dependencies:

```
npm install
```

3. Compile the smart contract:

```
truffle compile
```

## Usage

1. Start Ganache and ensure it is running on `http://127.0.0.1:7545`.
2. Migrate the smart contract to the local blockchain:

```
truffle migrate
```

3. Interact with the smart contract:

```
truffle console
```

## Interacting with the Smart Contract

After launching the Truffle console, you can interact with the smart contract using the provided JavaScript commands. Here are some examples:

// Retrieve the contract instance
let instance = await Voting.deployed();

// Add candidates
await instance.addCandidate("Danyal", { from: accounts[0] });
await instance.addCandidate("Aqib", { from: accounts[0] });

// Cast votes
await instance.vote(1, { from: accounts[1] });
await instance.vote(2, { from: accounts[2] });

// Get winner
let winner = await instance.getWinner();
console.log("Winner:", winner);

// View candidate details
let candidate1 = await instance.getCandidate(1);
console.log("Candidate 1:", candidate1);


## License

This project is licensed under the [MIT License](LICENSE).
```