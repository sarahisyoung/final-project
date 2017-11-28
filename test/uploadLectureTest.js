'use strict';

/* Add the dependencies you're testing */
const UploadLecture = artifacts.require("./UploadLecture.sol");
// YOUR CODE HERE

contract('uploadLectureTest', function(accounts) {
	/* Define your constant variables and instantiate constantly changing 
	 * ones
	 */
	const args = {};
	let uploadLecture;

	/* Do something before every `describe` method */
	beforeEach(async function() {
		uploadLecture = await UploadLecture.new(10);
	});

	/* Group test cases together 
	 * Make sure to provide descriptive strings for method arguements and
	 * assert statements
	 */
	describe('Upload lecture tests.', function() {
		it("instantiate an UploadLecture object.", async function() {
		});
		it("Upload a lecture.", async function() {
		});
	});


});
