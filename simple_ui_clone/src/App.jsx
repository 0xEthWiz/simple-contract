import React, { useState } from "react";
import { connect } from "get-starknet";

function App() {
  const contractAddress =
    "0x058ca703111e5d8e19bf93fbb203b2c26051e25c53b7ad1069395a5800b5f0f3";
  const handleConnectWallet = async () => {
    const starknet = await connect();
    console.log(starknet);
    console.log(starknet.account);
    const result = await starknet.account.execute({
      contractAddress: contractAddress,
      entrypoint: "add_one",
      calldata: [],
    });
  };
  return (
    <>
      <button onClick={handleConnectWallet}>Connect wallet</button>
    </>
  );
}

export default App;
