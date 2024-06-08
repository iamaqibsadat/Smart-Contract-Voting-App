// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contract to conduct a decentralized voting process
contract Voting {
    // State variable to store the address of the contract owner
    address public owner;

    // Struct to represent a candidate
    struct Candidate {
        uint id; // Candidate ID
        string name; // Candidate name
        uint voteCount; // Number of votes the candidate has received
    }

    // Mapping to store candidates with their ID as the key
    mapping(uint => Candidate) public candidates;
    // Variable to keep track of the number of candidates
    uint public candidatesCount;

    // Mapping to track whether an address has voted or not
    mapping(address => bool) public voters;

    // Modifier to restrict function access to the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    // Constructor to set the owner of the contract to the address that deploys it
    constructor() {
        owner = msg.sender;
    }

    // Function to add a new candidate (only callable by the owner)
    function addCandidate(string memory _name) public onlyOwner {
        candidatesCount++; // Increment the candidate count
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0); // Add a new candidate
    }

    // Function to vote for a candidate
    function vote(uint _candidateId) public {
        require(!voters[msg.sender], "You have already voted"); // Ensure the voter hasn't voted before
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate"); // Ensure the candidate ID is valid

        voters[msg.sender] = true; // Mark the voter as having voted
        candidates[_candidateId].voteCount++; // Increment the vote count for the chosen candidate
    }

    // Function to get the details of a candidate by their ID
    function getCandidate(uint _candidateId) public view returns (uint, string memory, uint) {
        Candidate memory candidate = candidates[_candidateId]; // Fetch the candidate from the mapping
        return (candidate.id, candidate.name, candidate.voteCount); // Return the candidate's details
    }

    // Function to get details of all candidates
    function getAllCandidates() public view returns (Candidate[] memory) {
        Candidate[] memory allCandidates = new Candidate[](candidatesCount); // Initialize an array to hold all candidates
        // Loop through all candidates and add them to the array
        for (uint i = 1; i <= candidatesCount; i++) {
            allCandidates[i - 1] = candidates[i];
        }
        return allCandidates; // Return the array of all candidates
    }

    // Function to determine the winner of the election
    function getWinner() public view returns (string memory winnerName) {
        uint maxVotes = 0; // Variable to track the highest number of votes
        uint winnerId = 0; // Variable to track the ID of the winning candidate

        // Loop through all candidates to find the one with the most votes
        for (uint i = 1; i <= candidatesCount; i++) {
            if (candidates[i].voteCount > maxVotes) {
                maxVotes = candidates[i].voteCount; // Update the highest vote count
                winnerId = i; // Update the winner ID
            }
        }

        // Return the name of the candidate with the most votes
        winnerName = candidates[winnerId].name;
    }
}
