pragma solidity ^0.4.15;

/** @title UploadLecture */
contract UploadLecture {

	// mapping from sender's address to list of lecture material urls
	mapping(address => string[]) userToLectures;
	address[] users; // list of users who have uploaded lectures
	string[] lectures; // list of lectures
	mapping(string => uint) lectureToVotes;
	uint requiredVotes; // required number of votes for payout

	function UploadLecture(uint threshold) {
		requiredVotes = threshold;
	}

	// this uploads a lecture to the app. returns true if successful, 
	function upload(string lectureUrl) returns (bool) {
		bool lectureExists = false;
		for (uint i = 0; i < lectures.length; i++) {
			// hacky way of comparing strings
			if (sha3(lectures[i]) == sha3(lectureUrl)) {
				lectureExists = true;
			}
		}
		if (!lectureExists) {
			userToLectures[msg.sender].push(lectureUrl);
			users.push(msg.sender);
			return true;
		}
		return false;

	}

	// tells user whether or not they can receive a payout for a certain lecture right now.
	// returns true if they can, false if they can't.
	function payout(string lectureUrl) {
	}

	/* Fallback function */
	function() payable {
		revert();
	}

}
