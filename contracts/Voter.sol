pragma solidity ^0.4.15;
// We have to specify what version of compiler this code will compile with

contract Voter {
  
  mapping (bytes32 => uint) public votesReceived;
  address[] public uploaders;
  bytes32[] public lectureList;
  uint numLectures;
  //The constructor
  function Voter(bytes32[] lectureNames) public {
    lectureList = lectureNames;
    numLectures = lectureList.length;
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

  function getNumLectures() public returns (uint) {
    return numLectures;
  }
  // returns if lecture exists or not
  function lectureExists(bytes32 lecture) public returns (bool) {
    bool exists = false;
    for (uint i = 0; i < lectureList.length; i++) {
      if (lectureList[i] == lecture) {
        exists = true;
      }
    }
    return exists;
  }

  // Returns the total number of votes for 
  function totalVotesFor(bytes32 lecture) public returns (uint) {
    require(validlecture(lecture));
    return votesReceived[lecture];
  }

  // This function increments the vote count for the specified lecture. This
  // is equivalent to casting a vote
  function voteFor(bytes32 lecture) public {
    require(validlecture(lecture));
    votesReceived[lecture] += 1;
  }

  // adds a new lecture
  function addNewLecture(bytes32 lecture) public {
    lectureList.push(lecture);
    votesReceived[lecture] = 0;
    uploaders.push(msg.sender);
    numLectures += 1;
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