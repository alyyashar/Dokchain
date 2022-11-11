// Deploy A, then deploy B, passing in A's newly deployed address
// deployer.deploy(A).then(function() {
//   return deployer.deploy(B, A.address);
// });

var CertiVerify = artifacts.require("./CertiVerify.sol");

module.exports = function(deployer, network, accounts) {
  deployer.deploy(CertiVerify);
};
