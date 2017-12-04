//Template from https://medium.com/@mvmurthy/full-stack-hello-world-voting-ethereum-dapp-tutorial-part-1-40d2d0d807c2

Web3 = require('web3');
// solc = require('solc');

web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
abi = JSON.parse(
  '[{"constant":false,"inputs":[{"name":"lecture","type":"bytes32"}],"name":"validlecture","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"lecture","type":"bytes32"}],"name":"totalVotesFor","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"lecture","type":"bytes32"}],"name":"voteFor","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"","type":"bytes32"}],"name":"votesReceived","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"uploaders","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"lectureList","outputs":[{"name":"","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"lectureNames","type":"bytes32[]"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]'
  )

// code = fs.readFileSync('./Voter.sol').toString();
// compiledCode = solc.compile(code);
// abi = JSON.parse(compiledCode.contracts[':Voter'].interface);
VotingContract = web3.eth.contract(abi);
// byteCode = compiledCode.contracts[':Voter'].bytecode;

// deployedContract = VotingContract.new({data: byteCode, from: web3.eth.accounts[0], gas: 4700000});
// In your nodejs console, execute contractInstance.address to get the address at which the contract is deployed and change the line below to use your deployed address
contractInstance = VotingContract.at('0xd84c677e0bedc81679b9d7b3b41fd05bc6d3ae3c');
// contractInstance = VotingContract.at(deployedContract.address);
lectures = {"Lecture 1": "lec-1", "Lecture 2": "lec-2", "Lecture 3": "lec-3"}

function voteFor() {
  lectureTitle = $("#lec").val();
  contractInstance.voteFor(lectureTitle, {from: web3.eth.accounts[0]}, function() {
    let div_id = lectures[lectureTitle];
    $("#" + div_id).html(contractInstance.totalVotesFor.call(lectureTitle).toString());
  });
}

$(document).ready(function() {
  allLectures = Object.keys(lectures);
  for (var i = 0; i < allLectures.length; i++) {
    let name = allLectures[i];
    let val = contractInstance.totalVotesFor.call(name).toString()
    $("#" + lectures[name]).html(val);
  }
});
