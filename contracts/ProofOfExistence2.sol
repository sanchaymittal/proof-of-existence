pragma solidity ^0.5.0;


contract ProofOfExistence2 {
  //state variables
  bytes32[] private proofs;

  //store a proof evidence in the contract state
  // *transaction function*

  function storeProof(bytes32 proof) public{
    proofs.push(proof);
  }

  //calculate and store the proof for a document
  //*transactional function*
  function notarize(string calldata document) external{
    bytes32 proof = proofFor(document);
    storeProof(proof);
  }

  //helper function to get a documnet's sha256
  //*readers-only function*
  function proofFor(string memory document) public pure returns(bytes32){
    return sha256(abi.encodePacked(document));
  }

  //check if document has been notarized
  //*read-only function*
  function checkDocument(string memory document) public view returns(bool){
    bytes32 proof = proofFor(document);
    return hasProof(proof);
  }

  //return true if proof is stored
  //*read - only function*

  function hasProof(bytes32 proof) internal view returns(bool){
    for(uint256 i = 0;i<proofs.length; i++){
      if (proofs[i] == proof){
        return true;
      }
    }
    return false;
  }
}
