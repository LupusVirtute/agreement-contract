import { ethers } from "hardhat";

async function main() {
  const amountToPay = ethers.utils.parseEther("1");
  const buyer = "0x" // Address of the guy that is "buying"
  const seller = "0x" // Address of the guy that is "selling"
  const Agreement = await ethers.getContractFactory("Agreement");
  const agreement = await Agreement.deploy(buyer, seller, { value: amountToPay });

  await agreement.deployed();
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
