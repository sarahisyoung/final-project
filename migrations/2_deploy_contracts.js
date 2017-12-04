var Voter = artifacts.require("./Voter.sol");
var Uploader= artifacts.require("./Uploader.sol");

module.exports = function(deployer) {
	deployer.deploy(Voter);
	deployer.deploy(Uploader);

};
