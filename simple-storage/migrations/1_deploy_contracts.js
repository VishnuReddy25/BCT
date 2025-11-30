const SimpleStorage = artifacts.require("SimpleStorage");
const Arraylength = artifacts.require("Arraylength");
const Variables = artifacts.require("Variables");

module.exports = function (deployer) {
  deployer.deploy(SimpleStorage);
  deployer.deploy(Arraylength);
  deployer.deploy(Variables);
};