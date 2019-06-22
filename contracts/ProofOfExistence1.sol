pragma solidity ^0.5.0;

contract ProofOfExistence1 {
	//state
	bytes32 public proof;

	//  constructor() public {
    //  }

	//calculate and store the proof of the document
	// *transactional function*
	function notarize( string memory document) public{
	 proof = proofFor(document);
	}

	// helper function to get a document's sha256
	// *read-only function*
	function proofFor(string memory document) public pure returns(bytes32) {
	 return sha256(abi.encodePacked(document));
	}
}
