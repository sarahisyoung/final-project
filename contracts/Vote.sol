pragma solidity ^0.4.15;

/** @title Vote */
contract Vote {
	public address[] uploaders;
	public mapping(String => uint256) votes;

	modifier OtherUsersOnly() {
		bool valid = True;
		for (int i = 0; i < uploaders.length; i++) {
			if (msg.sender.equals(uploaders[i])) {
				valid = False;
			}
		}
	    require(valid == True);
	    _;
	}

	// votes for a lecture. a user can't vote for their own lecture.
	function voteForLecture(string lectureUrl) OtherUsersOnly {
		votes[lectureUrl] += 1;
	}

	// returns the top n lectures, sorted by votes.
	function getTopNLectures(uint n) {
		//still need to somehow sort by votes...
	}


	/* Fallback function */
	function() payable {
		revert();
	}
}
