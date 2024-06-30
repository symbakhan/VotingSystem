// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    // State variables
    address public administrator; // Address of the contract administrator
    uint public totalCandidates; // Total number of candidates

    // Struct to represent a candidate
    struct Candidate {
        uint candidateId; // Unique ID for the candidate
        string candidateName; // Name of the candidate
        uint candidateVotes; // Number of votes received by the candidate
    }

    // Mapping to store candidates by their ID
    mapping(uint => Candidate) public candidateList;

    // Mapping to track if an address has voted
    mapping(address => bool) public hasVoted;

    // Event to be emitted when a new candidate is added
    event CandidateAdded(uint candidateId, string candidateName);
    
    // Event to be emitted when a vote is cast
    event VoteCasted(address voter, uint candidateId);

    // Modifier to restrict functions to only the administrator
    modifier onlyAdministrator() {
        require(msg.sender == administrator, "Only the administrator can perform this action");
        _;
    }

    // Constructor to set the contract administrator at the time of deployment
    constructor() {
        administrator = msg.sender; // Set the administrator to the address that deploys the contract
    }

    // Function to add a new candidate, only callable by the administrator
    function addNewCandidate(string memory _name) public onlyAdministrator {
        totalCandidates++; // Increment the total number of candidates
        candidateList[totalCandidates] = Candidate(totalCandidates, _name, 0); // Add a new candidate with the given name and zero votes
        emit CandidateAdded(totalCandidates, _name); // Emit the CandidateAdded event
    }

    // Function to cast a vote
    function castVote(uint _candidateId) public {
        require(!hasVoted[msg.sender], "You have already voted"); // Ensure the voter hasn't voted before
        require(_candidateId > 0 && _candidateId <= totalCandidates, "Invalid candidate ID"); // Ensure the candidate ID is valid

        hasVoted[msg.sender] = true; // Mark the caller's address as having voted
        candidateList[_candidateId].candidateVotes++; // Increment the vote count for the selected candidate
        emit VoteCasted(msg.sender, _candidateId); // Emit the VoteCasted event
    }

    // Function to get details of a specific candidate by ID
    function getCandidateDetails(uint _candidateId) public view returns (uint, string memory, uint) {
        require(_candidateId > 0 && _candidateId <= totalCandidates, "Invalid candidate ID"); // Ensure the candidate ID is valid

        Candidate memory candidate = candidateList[_candidateId]; // Retrieve the candidate details
        return (candidate.candidateId, candidate.candidateName, candidate.candidateVotes); // Return the candidate's ID, name, and vote count
    }

    // Function to get details of all candidates
    function getAllCandidatesDetails() public view returns (Candidate[] memory) {
        Candidate[] memory candidatesArray = new Candidate[](totalCandidates); // Create an array to hold all candidates
        for (uint i = 1; i <= totalCandidates; i++) {
            candidatesArray[i - 1] = candidateList[i]; // Populate the array with candidates
        }
        return candidatesArray; // Return the array of candidates
    }
}
