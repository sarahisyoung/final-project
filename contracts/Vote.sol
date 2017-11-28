pragma solidity ^0.4.15;

/** @title Vote */
contract Vote {
	address[] public uploaders;
	mapping(bytes32 => uint256) public votes;
	string[] public lectureList;

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

	function Voting() public {//string[] _lectureList) public {
		//does this work???
    	// lectureList = _lectureList;
  	}	
	// votes for a lecture. a user can't vote for their own lecture.
	function voteForLecture(string lectureUrl) OtherUsersOnly {
		require(validLecture(lectureUrl));
		votes[sha3(lectureUrl)] += 1;
	}

	// returns the top n lectures, sorted by votes.
	function getTopNLectures(uint n) {
		//still need to somehow sort by votes...

	}

	function validLecture(string lecture) public returns (bool) {
    	for (uint i = 0; i < lectureList.length; i++) {
      		if (sha3(lectureList[i]) == sha3(lecture)) {
        		return true;
      		}
    	}
    	return false;
  	}

  	function totalVotes(string lecture) public returns (uint256) {
    	require(validLecture(lecture));
    	return votes[sha3(lecture)];
  	}


	/* Fallback function */
	function() payable {
		revert();
	}
}
