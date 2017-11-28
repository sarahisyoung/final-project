var UploadLecture = artifacts.require("./UploadLecture.sol");
var Vote = artifacts.require("./Vote.sol");

module.exports = function(deployer) {
	deployer.deploy(UploadLecture);
	deployer.deploy(Vote);
};
