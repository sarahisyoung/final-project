pragma solidity ^0.4.15;

import './Voter.sol';

/** @title Uploader */
contract Uploader{

	uint requiredVotes; // required number of votes for payout
	Voter public voter;


	function Uploader(uint _requiredVotes) {
		requiredVotes = _requiredVotes;

		voter = new Voter();
	}

	// this uploads a lecture to the app. returns true if successful, 
	function upload(bytes32 lecture) returns (bool) {
		if (!voter.lectureExists(lecture)) {
			voter.voteFor(lecture);
			return true;
		}
		return false;
	}

	// tells user whether or not they can receive a payout for a certain lecture right now.
	// returns true if they can, false if they can't.
	function payout(bytes32 lecture) returns (bool){
		if (voter.lectureExists(lecture)) {
			if (voter.totalVotesFor(lecture) >= requiredVotes) {
				return true;
			}
		}
		return false;
	}

	/* Fallback function */
	function() payable {
		revert();
	}

}
