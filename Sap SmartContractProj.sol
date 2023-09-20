// SPDX-License-Identifier: GPL 3.0
pragma solidity >= 0.8.0;

contract Election {
    struct Candidate {
        string name;
        uint voteCount;
    }

    mapping(string => uint) public candidates;

    constructor() {
        candidates["John"] = 0;
        candidates["Paul"] = 0;
    }

    modifier onlyValidCandidate(string memory _name) {
        require(candidates[_name] != 0, "You are not allowed to vote");
        _;
    }

    function vote(string memory _name) public onlyValidCandidate(_name) {
        candidates[_name] += 1;
    }

    function getCandidateVoteCount(string memory _name) public view returns (Candidate memory) {
        return Candidate(_name, candidates[_name]);
    }

    function donate() public payable {
        emit DonationReceived(msg.sender, msg.value);
    }

    event DonationReceived(address indexed _sender, uint _amount);
}