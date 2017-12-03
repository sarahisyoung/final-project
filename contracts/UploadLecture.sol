pragma solidity ^0.4.15;

/** @title UploadLecture */
contract UploadLecture {

	// mapping from sender's address to list of lecture material urls
	mapping(address => string[]) public userToLectures;
	address[] public users; // list of users who have uploaded lectures
	string[] public lectures; // list of lectures. could change this to a hash set
	mapping(bytes32 => uint) public lectureToVotes;
	uint requiredVotes; // required number of votes for payout

	function UploadLecture(uint threshold) {
		requiredVotes = threshold;
	}

	// helper function to determine whether lecture already exists or not.
	function lectureExists(string lectureUrl) returns(bool) {
		bool exists = false;
		for (uint i = 0; i < lectures.length; i++) {
			// hacky way of comparing strings
			if (sha3(lectures[i]) == sha3(lectureUrl)) {
				exists = true;
			}
		}
		return exists;
	}


	function isLectureUploadedByUser(string lectureUrl, address user) returns (bool){
		// check if lecture was uploaded by user.
		bool wasUploadedByUser = false;
		string[] lecturesUploadedByUser = userToLectures[msg.sender];
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
	function payout(string lectureUrl) returns (bool){
		if (lectureExists(lectureUrl)) {
			if (lectureToVotes[sha3(lectureUrl)] >= requiredVotes) {
				return !isLectureUploadedByUser(lectureUrl, msg.sender);
			}
		}
		return false;
	}


	// function castVoteForLecture(string lectureUrl) {
	// 	if (! isLectureUploadedByUser(lectureUrl, msg.sender)) {
	// 		lectureToVotes[sha3(lectureUrl)] += 1;
	// 		Vote vote = new Vote(msg.sender);
	// 		vote.voteForLecture(lectureUrl);
	// 		votes.push(vote);
	// 	}
	// }

	/* Fallback function */
	function() payable {
		revert();
	}

}
