pragma solidity ^0.4.15;

/** @title Vote */
contract Vote {
	address[] public uploaders;
	mapping(String => uint256) public votes;
	String[] public lectureList;

	modifier OtherUsersOnly() {
		bool valid = True;
		for (uint i = 0; i < uploaders.length; i++) {
			if (msg.sender.equals(uploaders[i])) {
				valid = false;
			}
		}
	    require(valid == true);
	    _;
	}

	function Voting(String[] _lectureList) public {
		//does this work???
    	lectureList = _lectureList;
  	}	
	// votes for a lecture. a user can't vote for their own lecture.
	function voteForLecture(string lectureUrl) OtherUsersOnly {
		require(validLecture(lecture));
		votes[lectureUrl] += 1;
	}

	// returns the top n lectures, sorted by votes.
	function getTopNLectures(uint n) {
		//still need to somehow sort by votes...

	}

	function validLecture(String lecture) public returns (bool) {
    	for (uint i = 0; i < lectureList.length; i++) {
      		if (lectureList[i] == lecture) {
        		return true;
      		}
    	}
    	return false;
  	}

  	function totalVotes(String lecture) view public returns (uint256) {
    	require(validLecture(lecture));
    	return votes[lecture];
  	}


	/* Fallback function */
	function() payable {
		revert();
	}
}
