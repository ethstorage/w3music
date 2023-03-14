import {ethers} from "ethers";

const FileAbi = [
    "function getMusics() public view returns (bytes[] memory fileNames)",
    "function getCovers() public view returns (bytes[] memory fileNames)",
    "function mint(bytes memory fileName_, bytes memory musicName_, bytes memory describe_, bytes memory cover_) public"
];

const MusicNftAbi = [
    "function getAuthorMusics(address author) public view returns (uint256[] memory ids,uint256[] memory times,address[] memory authors,bytes[] memory fileNames,bytes[] memory names,bytes[] memory describes,bytes[] memory covers)"
];

function hexToString(s) {
    return ethers.utils.toUtf8String(s);
}

const stringToHex = (s) => ethers.utils.hexlify(ethers.utils.toUtf8Bytes(s));

function getContract(address, abi) {
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const contract = new ethers.Contract(address, abi, provider);
    return contract.connect(provider.getSigner());
}

function FileContract(address) {
    return getContract(address, FileAbi);
}

function MusicContract(address) {
    return getContract(address, MusicNftAbi);
}

export async function getCovers(address) {
    const contract = FileContract(address);
    const result = await contract.getCovers();
    console.log(result)
    const covers = [];
    for (let i = result.length - 1; i >= 0; i--) {
        covers.push(hexToString(result[i]));
    }
    return covers;
}

export async function getMusics(address) {
    const contract = FileContract(address);
    const result = await contract.getMusics();
    const musics = [];
    for (let i = result.length - 1; i >= 0; i--) {
        musics.push(hexToString(result[i]));
    }
    return musics;
}

export async function mint(address, fileName, musicName, describe, cover) {
    fileName = stringToHex(fileName);
    musicName = stringToHex(musicName);
    describe = stringToHex(describe);
    cover = stringToHex(cover);
    const fileContract = FileContract(address);
    const tx = await fileContract.mint(fileName, musicName, describe, cover);
    const receipt = await tx.wait();
    return receipt.status;
}


// contract
export const getAuthorMusicsByAddress = async (controller, address) => {
    const fileContract = MusicContract(controller);
    const result = await fileContract.getAuthorMusics(address);
    const nftList = [];
    const ids = result[0];
    const times = result[1];
    const authors = result[2];
    const fileNames = result[3];
    const names = result[4];
    const describes = result[5];
    const covers = result[6];
    for (let i = ids.length - 1; i >= 0; i--) {
        const cover = covers[i] === '0x' ? '' : "https://" + controller + ".w3q-g.w3link.io/" + authors[i].toLowerCase() + "-" +hexToString(covers[i]);
        const music = {
            id: ids[i],
            time: new Date(parseInt(times[i], 10) * 1000),
            author: authors[i],
            name: hexToString(names[i]),
            describe: hexToString(describes[i]),
            fileName: hexToString(fileNames[i]),
            cover: cover,
            play: "https://" + controller + ".w3q-g.w3link.io/play/" + ids[i],
        };
        nftList.push(music);
    }
    return nftList;
}
