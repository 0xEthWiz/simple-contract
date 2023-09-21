import React, { useState } from "react";
import Wallet from "./components/Wallet";
import GetNumber from "./components/contract/GetNumber";
import SetNumber from "./components/contract/SetNumber";

function App() {
  const [starknet, setStarknet] = useState(null);

  return (
    <>
      <Wallet onConnect={setStarknet} />
      <br />
      <GetNumber starknet={starknet} />
      {starknet && <SetNumber starknet={starknet} />}
    </>
  );
}

export default App;
