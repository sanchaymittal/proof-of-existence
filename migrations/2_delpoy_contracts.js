var ProofOfExistence1 = artifacts.require('./ProofOfExistence1.sol');

module.exports = function(deployer){
    deployer.deploy(ProofOfExistence1);
};

// This script tells truffle to get the contract information from ProofOfExistence1.sol and deploy it to the specified network.