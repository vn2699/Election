pragma solidity ^0.5.8;

contract Election{

struct Candidate{
    uint id;
    string name;
    uint voteCount;
}
//store accounts that have voted
mapping(address=>bool) public voters;
//store Candidate
//Fetch Candidate
mapping(uint=>Candidate) public candidates;
//store Candidate Count
uint public candidatesCount;
event votedEvent(uint indexed _candidateId);
constructor () public{
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
}
function addCandidate (string memory _name) private{
    candidatesCount ++;
    candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
}
function vote(uint _candidateId) public {
    //require that they haven't voted before
    require(!voters[msg.sender]);
    //require a valid candidate
    require(_candidateId> 0 && _candidateId <= candidatesCount);
    //record the voter has voted
    voters[msg.sender]=true;
    //Update Candidate vote Count
    candidates[_candidateId].voteCount ++;

    emit votedEvent(_candidateId);
}
}