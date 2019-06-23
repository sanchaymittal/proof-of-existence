pragma solidity ^0.5.0;


contract ProofOfExistence3 {
  //state variable
  mapping(bytes32 => bool) private proofs;

  //store a proof of existence in the contract state
  function storeProof(bytes32 proof) internal{
    proofs[proof] = true;
  }

  //calculate and store the proof of a document
  function notarize(string calldata document) external{
    bytes32 proof = proofFor(document);
    storeProof(proof);
  }

  //helper function to get a document's sha256
  function proofFor(string memory document) public pure returns(bytes32){
    return keccak256(bytes(document));
  }

  //check if the document is notarized
  function checkDocument(string memory document) public view returns (bool){
    bytes32 proof = proofFor(document);
    return hasProof(proof);
  }

  //return true if proof is stored
  function hasProof(bytes32 proof) internal view returns (bool){
    return proofs[proof];
  }
}