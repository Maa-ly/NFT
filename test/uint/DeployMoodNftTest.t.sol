// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUrl() public view {
        string
            memory expectedUrl = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj48dGV4dCBmaWxsPSJibGFjayI+IGhpISB5b3UgZGVjb2RlZCB0aGlzITwvdGV4dD48L3N2Zz4=";
        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text fill="black"> hi! you decoded this!</text></svg>';
        string memory actualUri = deployer.svgToImageURI(svg);

        assert(
            keccak256(abi.encodePacked(actualUri)) ==
                keccak256(abi.encodePacked(expectedUrl))
        );
    }
}
