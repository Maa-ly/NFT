// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {BasicNFT} from "src/BasicNFT.sol";
import {DeployBasicNFT} from "script/DeployBasicNFT.s.sol";

contract BasicNFtTest is Test {
    DeployBasicNFT public deployer;
    BasicNFT public basicNft;
    address public USER = makeAddr("user");
    string public constant PUB =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBasicNFT();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = basicNft.name();
        abi.encodePacked(expectedName);

        //Assert
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        basicNft.mintNFT(PUB);

        assert(basicNft.balanceOf(USER) == 1);

        assert(
            keccak256(abi.encodePacked(PUB)) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }
}
