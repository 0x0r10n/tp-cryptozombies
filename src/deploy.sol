// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "./zombieownership.sol";

contract Deploy is Script {
    function run() external {
        uint256 deployerAddress = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerAddress);

        // Déploiement du contrat ZombieOwnership
        ZombieOwnership zombieOwnership = new ZombieOwnership();

        // Transfert de l'ownership du contrat à une autre adresse
        address newOwner = 0x7cD1EC796dbD20b53481cb779E25445A84CCbb21;
	zombieOwnership.transferOwnership(newOwner);

        vm.stopBroadcast();
    }
}

