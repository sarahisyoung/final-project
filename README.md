# CheckMeIn

Sarah Young and Arissa Wongpanich


## Overview

CheckMeIn is a decentralized attendance check-in platform where students' attendance at lectures is verified by their peers. Unlike Google forms or other automated attendance taking applications, CheckMeIn relies on other students to verify that a neighboring student is present at the lecture.

## Requirements for Project


### Expectations

The expectation for this project is the same as would be for a very strong hackathon project (under the time limit of 48 hours). Feel free to do a hackathon with your friends if needed! Since you are now trained in the art of DApp development we expect you to be able to pull that off in a little over two weeks with your team. We don't expect you to make something mindblowing within this short timeframe, but we want you to show off the best you can do! If you do well enough, we're more than happy to connect you with companies looking to hire interns.

## Functionality

## Smart Contracts

We will be having 2 smart contracts. 

## Frontend

## Backend???

### Ideation and Architecture

In this phase we expect for you to write a proposal in markdown showing extensive thought and planning in your DApp. In this report you must outline the majority of the functionality of your DApp and should explain why your idea is a good idea. Diagrams of how components are connected and work together, along with a breakdown of what information goes where and user interaction are all crucial components.

For example, Ether-on-a-Stick (https://github.com/phlip9/ether-on-a-stick) had a very clear cut function and use-case to back it. Remember the corporation polluting the river, and the government was not willing to do anything about it? We solve the free-rider problem here with a dominant assurance contract, and therefore we can place bounties based on crowd demand to be solved by public entities.

For the required back-end component, here are some ideas to work with:
- IPFS (Recommended)
- uPort
- Gnosis
- Quorum
- Ethermint
- Whisper
- Oraclize.it
- Lightning Network (Hard, would require Ethereum to Bitcoin interaction. More of a research project.)

Feel free to explore beyond what we have listed here, you do need get our approval by posting on Piazza or coming to office hours beforehand. Instructors can then verify it as "architecturally appropriate", and you can then get moving on your next deliverable.

**This must be written in markdown. List all your teammates (if any) and title your project with something creative!**

## Deliverable 2 (10%)

### Smart Contract and Environment

We are expecting you to have a minimum of two contracts (both of which are written by you, standard libraries don't count). We are also expecting a test suite with test coverage that ensures working code and demonstrates all the main functionality of the contract. You should also fit some edge cases and potential points of security issues within this test suite.

You should also run your code through **Oyente** as any errors/warnings given by Oyente will be seen on our end, and will result in points off. At this point a majority of your tests must pass to get full credit.

In addition to having a complex enough smart contract, we will also be checking that your environment for your additional back-end component works. That means you should be able to run the "Hello World" equivalent on any extra back-end platform you choose.

**You will need to include your full Truffle project in order for us to test.**

## Final Deliverable (15%)

In this phase we expect you to have solved any issues with your smart contract that we may have found (all tests must pass, and all promised functionality must be working), fully incorporating your JavaScript front-end or additional back-end component and being able to host your DApp at a URL. (Heroku and GitHub pages are both excellent free options, depending on your needs)

**Please include all the necessary files and instructions to run your DApp. Extra credit if you deploy to a URL and run the contracts on the mainnet (but please leave an option to use the testnet as well)!**

## Instructions

For each deliverable, we will be checking the same GitHub url. Please fork this repo and submit the link to your repo here: https://goo.gl/forms/WlQTlu4lavaX5Bgx1

## Extras

Not sure what you want to make? Here are a few ideas:
 - Decentralized crowdsourcing of lectures for class - basically have people vote on the quality of lectures and if it's good, it gets a payout in ETH. Dominant assurance applied to democratization/piracy of lectures. If it's decentralized then no one can catch you! **High key, if you are in classes that don't have webcasts and never have had webcasts, this is a way to get them!**
 - Multisig Wallet - This is more for education purposes but if you can create a simple multisig wallet that also has a web user interface, you can learn a lot about the pain Parity has been going through to get things right with their wallet!
 - RPG Game - Use IPFS to manage your save file, use Ethereum to make those state changes using serverless architecture.
