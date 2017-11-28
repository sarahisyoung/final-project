pragma solidity ^0.4.15;

/** @title Vote */
contract Vote {
	

	// votes for a lecture. a user can't vote for their own lecture.
	function voteForLecture(string lectureUrl){

	}

	// returns the top n lectures, sorted by votes.
	function getTopNLectures(uint n) {

	}


	/* Fallback function */
	function() payable {
		revert();
	}
}
