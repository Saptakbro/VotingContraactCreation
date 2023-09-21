// SPDX-License-Identifier: GPL-MlT
pragma solidity >=0.8.0;
contract Voting {
    enum CandidateStatus { Pending, Approved, Disqualified }
    struct Candidate {
        string name;
        uint256 votes;
        CandidateStatus status;
    }
    mapping(address => Candidate) public candidates;
    address public owner;
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }
    function addCandidate(address _candidateAddress, string memory _name) public onlyOwner {
        require(candidates[_candidateAddress].status == CandidateStatus.Pending, "Candidate is already registered.");
        candidates[_candidateAddress] = Candidate(_name, 0, CandidateStatus.Pending);
    }
    function removeCandidate(address _candidateAddress) public onlyOwner {
        require(candidates[_candidateAddress].status != CandidateStatus.Disqualified, "Candidate is already disqualified.");
        candidates[_candidateAddress].status = CandidateStatus.Disqualified;
    }
    function vote(address _candidateAddress) public {
        require(candidates[_candidateAddress].status == CandidateStatus.Approved, "Candidate is not approved.");
        candidates[_candidateAddress].votes++;
    }
    function getTotalVotesForCandidate(address _candidateAddress) public view returns (uint256) {
        return candidates[_candidateAddress].votes;
    }
    function getCandidateStatus(address _candidateAddress) public view returns (CandidateStatus) {
        return candidates[_candidateAddress].status;
    }
    function approveCandidate(address _candidateAddress) public onlyOwner {
        require(candidates[_candidateAddress].status == CandidateStatus.Pending, "Candidate is already approved or disqualified.");
        candidates[_candidateAddress].status = CandidateStatus.Approved;
    }
}