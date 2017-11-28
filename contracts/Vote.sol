pragma solidity ^0.4.15;

/** @title Vote */
contract Vote {
	string lecture;
	address userCastingVote;

	function Vote(address _userCastingVote) {
		userCastingVote = userCastingVote;
	}


	// votes for a lecture. a user can't vote for their own lecture.
	function voteForLecture(string lectureUrl){
		lecture = lectureUrl;
	}


	/* Fallback function */
	function() payable {
		revert();
	}
}
