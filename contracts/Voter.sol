pragma solidity ^0.4.15;
// We have to specify what version of compiler this code will compile with

contract Voter {
  
  mapping (bytes32 => uint8) public votesReceived;
  address[] public uploaders;
  bytes32[] public lectureList;

  //The constructor
  function Voter(bytes32[] lectureNames) public {
    lectureList = lectureNames;
  }


  // only non-owner users can vote for lecture
  modifier OtherUsersOnly() {
    bool valid = true;
    for(uint i = 0; i < uploaders.length; i++) {
      if (msg.sender == uploaders[i]) {
        valid = false;
      }
    }
    require(valid == true);
      _;
  }

  // Returns the total number of votes for 
  function votesFor(bytes32 lecture) public returns (uint8) {
    require(validlecture(lecture));
    return votesReceived[lecture];
  }

  // returns the top n lectures, sorted by votes.
  function getTopNLectures(uint n) public {
    //stillneed to somehow sort by votes...

  }


  // This function increments the vote count for the specified lecture. This
  // is equivalent to casting a vote
  function vote(bytes32 lecture) public {
    require(validlecture(lecture));
    votesReceived[lecture] += 1;
  }

  function validlecture(bytes32 lecture) public returns (bool) {
    for(uint i = 0; i < lectureList.length; i++) {
      if (lectureList[i] == lecture) {
        return true;
      }
    }
    return false;
  }
}