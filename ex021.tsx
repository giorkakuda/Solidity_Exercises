import './styles.css';
import { useState } from 'react';
import { ethers } from 'ethers';
import { Contract } from 'ethers';

export default function Metamask() {
  const [address, setAddress] = useState("0xf1E2aaC1c0c7EbF2242C6C9609e944D49Df241eC");
  const [balance, setBalance] = useState('');
  const [toAddress, setToAddress] = useState("0xd5E07e578945e4ebC3dc02FE279015a1735977f8");
  const [quantity, setQuantity] = useState("");
  const [message, setMessage] = useState('');
  const [contract, setContract] = useState('BNB');

  async function checkBalance() {
    let balance: string;
  
    if (contract === 'BNB') {
      balance = await getBnbBalance(address);
    } else {
      balance = await getTokenBalance(address, contract);
    }
  
    setBalance(balance);
    setMessage('');
  }
  

  async function transfer() {
    let result: string;
  
    if (contract === 'BNB') {
        await transferBnb(toAddress, quantity);
    } else {
      result = await transferToken(toAddress, contract, quantity);
    }
  
    setMessage(JSON.stringify);
  }
  
  async function getMetamask() {
    if (!window.ethereum) throw new Error('no metamask');

    await window.ethereum.send('eth_requestAccounts');

    const provider = new ethers.BrowserProvider(window.ethereum);
    provider.on('network', (newNetwork, oldNetwork) => {
      if (oldNetwork) window.location.reload();
    });

    return provider;
  }

  async function getBnbBalance(address: string) {
    const provider = await getMetamask();
    const balance = await provider.getBalance(address);
    return ethers.formatEther(balance);
  }

  async function getTokenBalance(address: string, contractAddress:string, decimals:number=18) {
    const provider = await getMetamask();
    const contract = new ethers.Contract(contractAddress, ['function balanceOf(address) view returns (uint)'],provider)
    const balance = await contract.balanceOf(address);
    return ethers.formatUnits(balance, decimals);
    
  }

  async function transferBnb(toAddress: string, quantity: string) {
    const provider = await getMetamask();
    const signer = await provider.getSigner();
  
    ethers.getAddress(toAddress);
  
    const tx = await signer.sendTransaction({
      to: toAddress,
      value: ethers.parseEther(quantity)
    });
  
    return tx;
  }

  

async function transferToken(toAddress: string, contractAddress: string, quantity: string, decimals: number = 18) {
  const provider = await getMetamask();
  const signer = await provider.getSigner();

  const abi = ['function transfer(address to, uint256 amount)'];
  const contract = new Contract(contractAddress, abi, signer);

  const tx = await contract.transfer(toAddress, ethers.parseUnits(quantity, decimals));
  return tx;
}

  
  

  return (
    <div>
      <p>
        My address: <input type="text" onChange={evt => setAddress(evt.target.value)} value={address} />
      </p>
      <p>
        <select onChange={evt => setContract(evt.target.value)}>
          <option value='BNB'>BNB</option>
          <option value='0xDF2aDf0c8f74aF01f632d8bf8a867d6596CD2D0C'>Giortoken</option>

        </select>
      </p>
      <p>
        <input type="button" value="See Balance" onClick={evt => checkBalance()} />
      </p>
      <p>
        Balance: {balance}
      </p>
      <p>
        To address: <input type="text" onChange={evt => setToAddress(evt.target.value)} value={toAddress} />
      </p>
      <p>
        Qty: <input type="text" onChange={evt => setQuantity(evt.target.value)} value={quantity} />
      </p>
      <p>
        <input type="button" value="Transfer" onClick={evt => transfer()} />
      </p>
      <p>{message}</p>
      <hr />
    </div>
  );
}
