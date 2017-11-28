pragma solidity ^0.4.15;

import './Vote.sol';

/** @title UploadLecture */
contract UploadLecture {

	// mapping from sender's address to list of lecture material urls
	mapping(address => string[]) public userToLectures;
	address[] public users; // list of users who have uploaded lectures
	string[] public lectures; // list of lectures. could change this to a hash set
	mapping(string => uint) public lectureToVotes;
	uint requiredVotes; // required number of votes for payout
	Vote[] votes;

	function UploadLecture(uint threshold) {
		requiredVotes = threshold;
	}




	// helper function to determine whether lecture already exists or not.
	function lectureExists(string lectureUrl) returns(bool) {
		exists = false;
		for (uint i = 0; i < lectures.length; i++) {
			// hacky way of comparing strings
			if (sha3(lectures[i]) == sha3(lectureUrl)) {
				exists = true;
			}
		}
		return exists;
	}

	function isLectureUploadedByUser(string lectureUrl, address user) {
		// check if lecture was uploaded by user.
		wasUploadedByUser = false;
		lecturesUploadedByUser = userToLectures[msg.sender];
		for (uint i = 0; i < lecturesUploadedByUser.length; i++) {
			if (sha3(lectures[i]) == sha3(lectureUrl)) {
				wasUploadedByUser = true;
			}
		}
		return wasUploadedByUser;

	}


	// this uploads a lecture to the app. returns true if successful, 
	function upload(string lectureUrl) returns (bool) {
		if (!lectureExists(lectureUrl)) {
			userToLectures[msg.sender].push(lectureUrl);
			users.push(msg.sender);
			return true;
		}
		return false;
	}


	// tells user whether or not they can receive a payout for a certain lecture right now.
	// returns true if they can, false if they can't.
	function payout(string lectureUrl) {
		if (lectureExists(lectureUrl)) {
			if (lectureToVotes[lectureUrl] >= requiredVotes) {
				return !isLectureUploadedByUser(lectureUrl, msg.sender);
			}
		}
		return false;
	}

	function castVoteForLecture(string lectureUrl) {
		if (! isLectureUploadedByUser(lectureUrl, msg.sender)) {
			lectureToVotes[lectureUrl] += 1;
			vote = new Vote(msg.sender);
			vote.castVoteForLecture(lectureUrl);
			votes.push(vote);
		}
	}

	/* Fallback function */
	function() payable {
		revert();
	}

}
