<template>
  <div class="mint">
    <div class="mint-title">
      Mint your music nft
    </div>
    <div class="mint-item">
      <span class="mint-item-label">Music Name</span>
      <el-input class="mint-item-input" v-model="name"/>
      <div class="mint-item-icon"/>
    </div>
    <div class="mint-item">
      <span class="mint-item-label">Music Describe</span>
      <el-input class="mint-item-input" v-model="describe"/>
      <div class="mint-item-icon"/>
    </div>

    <div class="mint-item">
      <span class="mint-item-label">Music File</span>
      <el-select v-model="file" class="mint-item-input" placeholder="select the uploaded music file">
        <el-option v-for="item in musics" :key="item" :label="item" :value="item"></el-option>
      </el-select>
      <img src="../assets/share.png" class="mint-item-icon"/>
    </div>
    <div class="mint-item">
      <span class="mint-item-label">Music Cover</span>
      <el-select v-model="cover" class="mint-item-input" placeholder="select the uploaded image file">
        <el-option v-for="item in covers" :key="item" :label="item" :value="item"></el-option>
      </el-select>
      <img src="../assets/share.png" class="mint-item-icon"/>
    </div>

    <el-button class="mint-button" type="primary" :disabled="isDisabled" @click="onSubmit">Mint</el-button>
  </div>
</template>

<script>
import {getCovers, getMusics, mint} from "@/utils/web3";

export default {
  name: 'Mint',
  data: () => {
    return {
      name: '',
      describe: '',
      cover: '',
      file: '',
    };
  },
  computed: {
    contract() {
      if (this.$store.state.chainConfig && this.$store.state.chainConfig.chainID) {
        const {W3MusicController} = this.$store.state.chainConfig;
        return W3MusicController;
      }
      return null;
    },
    fileContract() {
      if (this.$store.state.chainConfig && this.$store.state.chainConfig.chainID) {
        const {W3MusicNFT} = this.$store.state.chainConfig;
        return W3MusicNFT;
      }
      return null;
    },
    isDisabled() {
      return !this.name || !this.file;
    }
  },
  asyncComputed: {
    covers: {
      async get() {
        if (!this.contract) {
          return [];
        }
        return await getCovers(this.contract);
      },
      default: [],
    },
    musics: {
      async get() {
        if (!this.contract) {
          return [];
        }
        return await getMusics(this.contract);
      },
      default: [],
    }
  },
  methods: {
    async onSubmit() {
      // this.$router.push({path: "/address/" + this.currentAccount});
      const result = await mint(this.contract, this.file, this.name, this.describe, this.cover);
      if (result) {
        this.$message({
          message: 'Mint Success',
          type: 'success'
        });
        this.name = '';
        this.describe = '';
        this.cover = '';
        this.file = '';
      }
    }
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.mint {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.mint-title {
  font-size: 30px;
  color: black;
  line-height: 30px;
  margin-top: 60px;
  margin-bottom: 60px;
  font-family: AlibabaPuHuiTiM;
}

.mint-item {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  margin: 10px;
}

.mint-item-label {
  width: 120px;
  font-size: 16px;
  color: #212121;
  text-align: left;
  font-family: AlibabaPuHuiTiR;
}

.mint-item-input {
  margin-left: 15px;
  width: 330px;
}

.mint-item-icon {
  width: 40px;
  height: 40px;
  padding: 10px;
  margin-left: 5px;
}

.mint-button {
  background-color: #52DEFF;
  margin-top: 30px;
  font-size: 18px;
  width: 150px;
  height: 40px;
  border: 1px solid transparent;
  border-radius: 35px !important;
}
</style>
