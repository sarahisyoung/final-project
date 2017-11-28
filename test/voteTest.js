'use strict';

/* Add the dependencies you're testing */
const Vote = artifacts.require("./Vote.sol");
// YOUR CODE HERE

contract('voteTest', function(accounts) {
	/* Define your constant variables and instantiate constantly changing 
	 * ones
	 */
	const args = {};

	/* Do something before every `describe` method */
	beforeEach(async function() {
	});

	/* Group test cases together 
	 * Make sure to provide descriptive strings for method arguements and
	 * assert statements
	 */
	describe('Vote tests', function() {
		it("Instantiate a new vote.", async function() {
		});

		it("Cast a vote for a lecture.", async function() {
		});
	});


});
