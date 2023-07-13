// SPDX-License-Identifier: GPL-3.0
/*
    Copyright 2021 0KIMS association.

    This file is generated with [snarkJS](https://github.com/iden3/snarkjs).

    snarkJS is a free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    snarkJS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with snarkJS. If not, see <https://www.gnu.org/licenses/>.
*/

// deployed in https://goerli.etherscan.io/address/0x8b8a42f27e0c605dee826de4bd9d6aa664031dcb#code
// verifyProof(["0x293348ea4a461897f3395e8765a29a26f2fe0e8813c75b6d426f99cc46f1d069", "0x0bdb10b057da97606240c40f9546dae767372fe071f9a9127ed47fc9623b8619"],[["0x224aabd54eef038ac9ef4bece4c79a0b2bc991be39df62c30c61ff65831ff642", "0x10b86096cce2033d7edd13532b77341aa8f3385731a36263aea38e9f0bf200eb"],["0x288bb73381e5b4d94bcaf6f415c32b58b8fec51455afd1d8dd6165f011ef8cbb", "0x0ab0bbcb0c1333c878ed3f83af52619c0df44a26d20574440f615249ae1f6a59"]],["0x0347e6d432188db64356af439bb0f6d4ece7d866a23cf25b54fbe4258ed1f0ae", "0x2d94962221dc12d5cef8091f5ddaf9fa337cc86de33aea10608403068d021e7e"],["0x0000000000000000000000000000000000000000000000000000000000000021"])
// true

pragma solidity >=0.7.0 <0.9.0;

contract Groth16Verifier {
    // Scalar field size
    uint256 constant r    = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
    // Base field size
    uint256 constant q   = 21888242871839275222246405745257275088696311157297823662689037894645226208583;

    // Verification Key data
    uint256 constant alphax  = 9908779071414897596299706099370853821893362632391294160672008768358560709884;
    uint256 constant alphay  = 7095285286640560305109368545337433352833597352041640296916514220784582130256;
    uint256 constant betax1  = 18534412469674617018487402926205335754022528324816234549679439428831086019087;
    uint256 constant betax2  = 20176375038003605896774348996022472579207546460860526006460273023871403545139;
    uint256 constant betay1  = 18351178660031177894383912659843558091331332372645258970251725439417447627840;
    uint256 constant betay2  = 4265761642292345537897204573696913206997269538245425242212579774774028051474;
    uint256 constant gammax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant gammax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant gammay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant gammay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;
    uint256 constant deltax1 = 12872676482606664809975302168428206532796929609607510703898003811823758966242;
    uint256 constant deltax2 = 7325147632908921063767514662132612645150994623044727005368211160445419682806;
    uint256 constant deltay1 = 9949223158779271559173539597545538425934146924384185342709513241281471278599;
    uint256 constant deltay2 = 15162411962396539826082571079578322898626386885010997341206456876502709660867;

    
    uint256 constant IC0x = 10629911209916893051567528042465276597298678803937146793359482657169693773533;
    uint256 constant IC0y = 19651012408828535763881566403181644677436204953010091235453137420202914548530;
    
    uint256 constant IC1x = 12214524315674576741046171428676399403121341078908832534590713735265439263756;
    uint256 constant IC1y = 1626836784459899034876982971777858178542410074729950419177289126401048788028;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[1] calldata _pubSignals) public view returns (bool) {
        assembly {
            function checkField(v) {
                if iszero(lt(v, q)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }
            
            // G1 function to multiply a G1 value(x,y) to value in an address
            function g1_mulAccC(pR, x, y, s) {
                let success
                let mIn := mload(0x40)
                mstore(mIn, x)
                mstore(add(mIn, 32), y)
                mstore(add(mIn, 64), s)

                success := staticcall(sub(gas(), 2000), 7, mIn, 96, mIn, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }

                mstore(add(mIn, 64), mload(pR))
                mstore(add(mIn, 96), mload(add(pR, 32)))

                success := staticcall(sub(gas(), 2000), 6, mIn, 128, pR, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            function checkPairing(pA, pB, pC, pubSignals, pMem) -> isOk {
                let _pPairing := add(pMem, pPairing)
                let _pVk := add(pMem, pVk)

                mstore(_pVk, IC0x)
                mstore(add(_pVk, 32), IC0y)

                // Compute the linear combination vk_x
                
                g1_mulAccC(_pVk, IC1x, IC1y, calldataload(add(pubSignals, 0)))
                

                // -A
                mstore(_pPairing, calldataload(pA))
                mstore(add(_pPairing, 32), mod(sub(q, calldataload(add(pA, 32))), q))

                // B
                mstore(add(_pPairing, 64), calldataload(pB))
                mstore(add(_pPairing, 96), calldataload(add(pB, 32)))
                mstore(add(_pPairing, 128), calldataload(add(pB, 64)))
                mstore(add(_pPairing, 160), calldataload(add(pB, 96)))

                // alpha1
                mstore(add(_pPairing, 192), alphax)
                mstore(add(_pPairing, 224), alphay)

                // beta2
                mstore(add(_pPairing, 256), betax1)
                mstore(add(_pPairing, 288), betax2)
                mstore(add(_pPairing, 320), betay1)
                mstore(add(_pPairing, 352), betay2)

                // vk_x
                mstore(add(_pPairing, 384), mload(add(pMem, pVk)))
                mstore(add(_pPairing, 416), mload(add(pMem, add(pVk, 32))))


                // gamma2
                mstore(add(_pPairing, 448), gammax1)
                mstore(add(_pPairing, 480), gammax2)
                mstore(add(_pPairing, 512), gammay1)
                mstore(add(_pPairing, 544), gammay2)

                // C
                mstore(add(_pPairing, 576), calldataload(pC))
                mstore(add(_pPairing, 608), calldataload(add(pC, 32)))

                // delta2
                mstore(add(_pPairing, 640), deltax1)
                mstore(add(_pPairing, 672), deltax2)
                mstore(add(_pPairing, 704), deltay1)
                mstore(add(_pPairing, 736), deltay2)


                let success := staticcall(sub(gas(), 2000), 8, _pPairing, 768, _pPairing, 0x20)

                isOk := and(success, mload(_pPairing))
            }

            let pMem := mload(0x40)
            mstore(0x40, add(pMem, pLastMem))

            // Validate that all evaluations ∈ F
            
            checkField(calldataload(add(_pubSignals, 0)))
            
            checkField(calldataload(add(_pubSignals, 32)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
