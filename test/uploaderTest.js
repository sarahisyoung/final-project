'use strict';

/* Add the dependencies you're testing */
const Uploader= artifacts.require("./Uploader.sol");
const Voter= artifacts.require("./Voter.sol");

// YOUR CODE HERE

contract('uploaderTest', function(accounts) {
	/* Define your constant variables and instantiate constantly changing 
	 * ones
	 */
	const args = {lecture1: 'foo', lecture2: 'bar', user1: accounts[1], user2: accounts[2]};
	let uploader, voter;

	/* Do something before every `describe` method */
	beforeEach(async function() {
		uploader= await Uploader.new();
		voter = Voter.at(await uploader.voter());
	});

	/* Group test cases together 
	 * Make sure to provide descriptive strings for method arguements and
	 * assert statements
	 */
	describe('Upload lecture tests.', function() {
		it("instantiate an Uploader object.", async function() {
			let size = await voter.getNumLectures.call();
			assert.equal(0, size.valueOf(), "number of lectures should be 0 at initialization.");
		});
		it("Upload a lecture.", async function() {
			await uploader.upload(args.lecture1);
			let size = await voter.getNumLectures.call();
			assert.equal(1, size.valueOf(), "number of lectures is wrong after a lecture is added.");
		});

	});


});
