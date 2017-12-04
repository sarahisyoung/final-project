'use strict';

/* Add the dependencies you're testing */
const Uploader= artifacts.require("./Uploader.sol");
const Voter= artifacts.require("./Voter.sol");
// YOUR CODE HERE

contract('voterTest', function(accounts) {
	/* Define your constant variables and instantiate constantly changing 
	 * ones
	 */
	const args = {lecture1: 'foo', lecture2: 'bar'};
	let voter;
	/* Do something before every `describe` method */
	beforeEach(async function() {

		voter = await Voter.new();
	});

	/* Group test cases together 
	 * Make sure to provide descriptive strings for method arguements and
	 * assert statements
	 */
	describe('Voter tests', function() {
		it("Instantiate a new voter.", async function() {
			let size = await voter.getNumLectures.call().valueOf();
			assert.equal(0, size, "number of lectures should be 0 at initialization.");
		});

		it("Add a new lecture.", async function() {
			await voter.addNewLecture(args.lecture1);
			let size = await voter.getNumLectures.call().valueOf();
			assert.equal(1, size, "numLectures didn't change after adding a lecture.");
		
		});

		// it("Check votes for a newly added lecture.", async function() {
		// 	await voter.addNewLecture(args.lecture1);
		// 	await voter.voteFor(args.lecture1);
		// 	let numVotes = await voter.totalVotesFor(args.lecture1);//.valueOf();
		// 	assert.equal(0, numVotes, "votes should be 0 for a newly added lecture.");
		// });

	});


});
