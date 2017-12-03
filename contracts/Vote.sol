pragma solidity ^0.4.18;

/** @title Vote */
contract Vote {
	address[] public uploaders;
	mapping (bytes32 => uint8) public votes;
	bytes32[] public lectureList;


	modifier OtherUsersOnly() {
		bool valid = true;
		for (uint i = 0; i < uploaders.length; i++) {
			if (msg.sender == uploaders[i]) {
				valid = false;
			}
		}
	    require(valid == true);
	    _;
	}


	function Voting(bytes32[] _lectureList) public {
		
    	lectureList = _lectureList;

  	}	

	// votes for a lecture. a user can't vote for their own lecture.

	function voteForLecture(bytes32 lecture) public {
		require(validLecture(lecture));
		votes[lecture] += 1;
	}

	// returns the top n lectures, sorted by votes.
	function getTopNLectures(uint n) public {
		//stillneed to somehow sort by votes...

	}

	// check the lecture to see if it's even valid
	function validLecture(bytes32 lecture) view public returns (bool) {
    	for (uint i = 0; i < lectureList.length; i++) {
      		if (sha3(lectureList[i]) == sha3(lecture)) {
        		return true;
      		}
    	}
    	return false;
  	}

  	// total votes for a lecture
  	function totalVotes(bytes32 lecture) view public returns (uint8) {
    	require(validLecture(lecture));
    	return votes[sha3(lecture)];
  	}



	/* Fallback function
	function() payable {
		revert();
	}*/
}
