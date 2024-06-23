// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ReyMaster {
    
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }

    struct Voter{
        bool authorized;
        uint vote;
        bool voted;
    }

    address public owner;
    string public electionName;

    mapping(address => Voter) public voters;
    Candidate[] public candidates;
    uint public totalVotes;

    modifier OnlyOwner {
        require(msg.sender == owner,"Call is not Owner!");
        _;
    }

    event Winner(string name, uint voteCount);

    constructor(string memory _electionName){
        electionName = _electionName;
        owner = msg.sender;
    }

    function addCandidate(string memory _name) public OnlyOwner{
        candidates.push(Candidate(candidates.length,_name,0));
    }

    function authorized(address _voter) public OnlyOwner{
        voters[_voter].authorized = true;
    }

    function vote(uint _candidateID) public{
        require(!voters[msg.sender].voted,"You have already voted.");
        require(voters[msg.sender].authorized,"You are not authorized to vote.");
        
        voters[msg.sender].voted = true;
        voters[msg.sender].vote = _candidateID;
        totalVotes += 1;

        candidates[_candidateID].voteCount += 1;
    }

    function electionResult() public OnlyOwner view returns(Candidate memory){

        Candidate memory winingCandidate = candidates[0];

        for(uint i = 1; i < candidates.length; i++){
            if(candidates[i].voteCount > winingCandidate.voteCount){
                winingCandidate = candidates[i];
            }
        }
        // emit Winner(winingCandidate.name,winingCandidate.voteCount);
        return winingCandidate;

    }

}