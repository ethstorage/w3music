import {ethers} from "ethers";

const FILE_ADDRESS = '0x80BFB57Ff7820AccB9fCFA2c9633fFAaeEf60f62'.toLowerCase();

const FileAbi = [
    "function getMusics() public view returns (bytes[] memory fileNames)",
    "function getCovers() public view returns (bytes[] memory fileNames)",
    "function mint(bytes memory fileName_, bytes memory musicName_, bytes memory describe_, bytes memory cover_) public"
];

function hexToString(s) {
    return ethers.utils.toUtf8String(s);
}
const stringToHex = (s) => ethers.utils.hexlify(ethers.utils.toUtf8Bytes(s));

function FileContract(address) {
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const contract = new ethers.Contract(address, FileAbi, provider);
    return contract.connect(provider.getSigner());
}

export async function getBlogList() {
    const contract = FileContract();
    const result = await contract.getBlogList();
    const uuids = result[0];
    const titles = result[1];
    const descriptions = result[2];
    const users = result[3];
    const publishTimes = result[4];
    const covers = result[5];
    const blogList = [];
    const imageGateway = "https://" + FILE_ADDRESS + ".w3q-g.w3link.io/";
    for (let i = uuids.length - 1; i >= 0; i--) {
        const item = {
            id: uuids[i],
            title: hexToString(titles[i]),
            description: hexToString(descriptions[i]),
            user: hexToString(users[i]),
            publishTime: hexToString(publishTimes[i]),
            cover: imageGateway + hexToString(covers[i]),
        }
        blogList.push(item);
    }
    return blogList;
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
