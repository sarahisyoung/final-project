web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
abi = JSON.parse(
  '[{"constant":false,"inputs":[{"name":"lecture","type":"bytes32"}],"name":"validlecture","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"lecture","type":"bytes32"}],"name":"totalVotesFor","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"lecture","type":"bytes32"}],"name":"voteFor","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"","type":"bytes32"}],"name":"votesReceived","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"uploaders","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"lectureList","outputs":[{"name":"","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"lectureNames","type":"bytes32[]"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]'
  )

VotingContract = web3.eth.contract(abi);
// In your nodejs console, execute contractInstance.address to get the address at which the contract is deployed and change the line below to use your deployed address
contractInstance = VotingContract.at('0x63a0c771b65141c71a86eb1ea223eaaa42672665');

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
