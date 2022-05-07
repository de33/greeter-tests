const { expect } = require("chai");
const hre = require("hardhat");

describe("GreeterTest", function () {
  it("Should change and return the new string", async function () {
    // const accounts = await hre.ethers.getSigners();
    const Greeter = await ethers.getContractFactory("Greeter");
    const greeter = await Greeter.deploy("Hello");
    await greeter.deployed();

    const greeterAddress = greeter.address

    const CallGreeterSolidity = await ethers.getContractFactory("CallGreeterSolidity");
    const callGreeterSolidity = await CallGreeterSolidity.deploy(greeterAddress);
    await callGreeterSolidity.deployed();

    const CallGreeterVyper = await ethers.getContractFactory("CallGreeterVyper");
    const callGreeterVyper = await CallGreeterVyper.deploy(greeterAddress);
    await callGreeterVyper.deployed();

    await callGreeterSolidity.setAndCallGreeter("Goodbye")
    await callGreeterVyper.setAndCallGreeter("Goodbye")

  });
});
