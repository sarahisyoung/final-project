'use strict';

/* Add the dependencies you're testing */
const Uploader= artifacts.require("./Uploader.sol");
// YOUR CODE HERE

contract('uploaderTest', function(accounts) {
	/* Define your constant variables and instantiate constantly changing 
	 * ones
	 */
	const args = {};
	let uploader;

	/* Do something before every `describe` method */
	beforeEach(async function() {
		uploader= await Uploader.new(10);
	});

	/* Group test cases together 
	 * Make sure to provide descriptive strings for method arguements and
	 * assert statements
	 */
	describe('Upload lecture tests.', function() {
		it("instantiate an Uploader object.", async function() {
		});
		it("Upload a lecture.", async function() {
		});
	});


});
