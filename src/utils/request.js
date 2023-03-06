import { ethers } from "ethers";
const sha3 = require('js-sha3').keccak_256;

const FileContractInfo = {
  abi: [
    "function writeChunk(uint256 fileType, uint256 chunkId, bytes memory name, bytes calldata data) public payable",
    "function remove(bytes memory name) external returns (uint256)",
    "function removes(bytes[] memory names) public",
    "function countChunks(bytes memory name) external view returns (uint256)",
    "function getChunkHash(bytes memory name, uint256 chunkId) public view returns (bytes32)",
    "function getAuthorFiles(address author) public view returns (uint256[] memory times,bytes[] memory names,bytes[] memory types,string[] memory urls)"
  ],
};

const stringToHex = (s) => ethers.utils.hexlify(ethers.utils.toUtf8Bytes(s));

export const FileContract = (address) => {
  const provider = new ethers.providers.Web3Provider(window.ethereum);
  const contract = new ethers.Contract(address, FileContractInfo.abi, provider);
  return contract.connect(provider.getSigner());
};

const readFile = (file) => {
  return new Promise((resolve) => {
    const reader = new FileReader();
    reader.onload = (res) => {
      resolve(Buffer.from(res.target.result));
    };
    // reader.readAsDataURL(file);
    reader.readAsArrayBuffer(file);
  });
}

const bufferChunk = (buffer, chunkSize) => {
  let i = 0;
  let result = [];
  const len = buffer.length;
  const chunkLength = Math.ceil(len / chunkSize);
  while (i < len) {
    result.push(buffer.slice(i, i += chunkLength));
  }
  return result;
}

const clearOldFile = async (fileContract, chunkSize, hexName) => {
  try {
    const oldChunkSize = await fileContract.countChunks(hexName);
    if (oldChunkSize > chunkSize) {
      // remove
      const tx = await fileContract.remove(hexName);
      console.log(`Remove file: ${hexName}`);
      console.log(`Transaction Id: ${tx.hash}`);
      const receipt = await tx.wait();
      return receipt.status;
    }
  } catch (e) {
    return false;
  }
  return true;
}

export const request = async ({
  contractAddress,
  fileContractAddress,
  fileType,
  file,
  onSuccess,
  onError,
  onProgress
}) => {
  let account;
  try {
    account = await window.ethereum.enable();
  } catch (e) {
    onError(new Error("Can't get Account"));
    return;
  }


  const rawFile = file.raw;
  // file name
  const name = rawFile.name;
  const hexName = stringToHex(name);

  // Data need to be sliced if file > 475K
  const content = await readFile(rawFile);
  let fileSize = rawFile.size;
  let chunks = [];
  if (fileSize > 475 * 1024) {
    const chunkSize = Math.ceil(fileSize / (475 * 1024));
    chunks = bufferChunk(content, chunkSize);
    fileSize = fileSize / chunkSize;
  } else {
    chunks.push(content);
  }

  const fileContract = FileContract(contractAddress);
  const clear = await clearOldFile(fileContract, chunks.length, hexName)
  if (!clear) {
    onError(new Error("Check Old File Fail!"));
    return;
  }

  let uploadState = true;
  let notEnoughBalance = false;
  for (const index in chunks) {
    const chunk = chunks[index];
    let cost = 0;
    if (fileSize > 24 * 1024 - 626) {
      cost = Math.floor((fileSize + 626) / 1024 / 24);
    }
    const hexData = '0x' + chunk.toString('hex');
    const localHash = '0x' + sha3(chunk);
    const hash = await fileContract.getChunkHash(hexName, index);
    if (localHash === hash) {
      console.log(`File ${name} chunkId: ${index}: The data is not changed.`);
      onProgress({ percent: Number(index) + 1});
      continue;
    }

    try {
      // file is remove or change
      const balance = await fileContract.provider.getBalance(account[0]);
      if(balance.lte(ethers.utils.parseEther(cost.toString()))){
        // not enough balance
        uploadState = false;
        notEnoughBalance = true;
        break;
      }

      const tx = await fileContract.writeChunk(fileType, index, hexName, hexData, {
        value: ethers.utils.parseEther(cost.toString())
      });
      console.log(`Transaction Id: ${tx.hash}`);
      const receipt = await tx.wait();
      if (!receipt.status) {
        uploadState = false;
        break;
      }
      onProgress({ percent: Number(index) + 1});
    } catch (e) {
      console.log(e);
      uploadState = false;
      break;
    }
  }
  if (uploadState) {
    const url = "https://" + fileContractAddress + ".w3q-g.w3link.io/" + account + "-" + name;
    onSuccess({path: url});
  } else {
    if (notEnoughBalance) {
      onError(new NotEnoughBalance('Not enough balance'));
    } else {
      onError(new Error('upload request failed!'));
    }
  }
};

export class NotEnoughBalance extends Error {}
