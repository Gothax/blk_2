require('babel-register'); //main entry point of this folder
require('babel-polyfill');

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
  },
  compilers: {
    solc: {
      version: "0.4.24" //(Default: Truffle's installed    solc)
    }
   },
  contracts_directory: './src/contracts/',  //where smartcontract is
  contracts_build_directory: './src/abis/',
  compilers: {
    solc: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
};