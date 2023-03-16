<template>
  <div class="mint">
    <div class="mint-title">
      Mint your music NFT
    </div>
    <div class="mint-item">
      <span class="mint-item-label">Name</span>
      <el-input class="mint-item-input" v-model="name"/>
      <div class="mint-item-icon"/>
    </div>
    <div class="mint-item">
      <span class="mint-item-label">Describe</span>
      <el-input class="mint-item-input" v-model="describe"/>
      <div class="mint-item-icon"/>
    </div>

    <div class="mint-item">
      <span class="mint-item-label">File</span>
      <el-select v-model="file" class="mint-item-input" placeholder="select the uploaded music file">
        <el-option v-for="item in musics" :key="item" :label="item" :value="item"></el-option>
      </el-select>
      <i class="el-icon-paperclip mint-item-icon" @click="onUploadMusic"></i>
    </div>
    <div class="mint-item">
      <span class="mint-item-label">Cover</span>
      <el-select v-model="cover" class="mint-item-input" placeholder="select the uploaded image file">
        <el-option v-for="item in covers" :key="item" :label="item" :value="item"></el-option>
      </el-select>
      <i class="el-icon-paperclip mint-item-icon" @click="onUploadCover"/>
    </div>

    <el-button class="mint-button" type="primary" :loading="loading" :disabled="isDisabled" @click="onSubmit">
      Mint
    </el-button>
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
      loading: false,
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
      this.loading = true;
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
      this.loading = false;
    },
    onUploadMusic() {
      this.$router.push({path: "/upload/music"});
    },
    onUploadCover() {
      this.$router.push({path: "/upload/img"});
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
  font-size: 26px;
  color: #221F33;
  line-height: 41px;
  margin-bottom: 50px;
  margin-top: 35px;
  font-family: AlibabaPuHuiTiB;
}

.mint-item {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  margin: 10px;
}

.mint-item-label {
  width: 80px;
  font-size: 16px;
  color: #212121;
  text-align: left;
  font-family: AlibabaPuHuiTiR;
}

.mint-item-input {
  margin-left: 15px;
  width: 320px;
}

.mint-item-icon {
  width: 40px;
  height: 40px;
  padding: 10px;
  margin-left: 5px;
  cursor: pointer;
}

.mint-button {
  background: #AC2D30;
  margin-top: 50px;
  font-size: 15px;
  width: 120px;
  height: 42px;
  border: 1px solid transparent;
  border-radius: 20px !important;
  font-family: AlibabaPuHuiTiM;
}
.mint-button:hover {
  border: 1px solid transparent;
  background-color: #AC2D30BB;
}
.mint-button:disabled {
  border: 1px solid #cccccc !important;
  background: #cccccc !important;
}


@media screen and (max-width: 500px) {
  .mint-title {
    font-size: 18px;
    line-height: 30px;
    margin-bottom: 20px;
    margin-top: 20px;
  }

  .mint-item {
    margin: 5px;
    width: 99%;
    justify-content: space-between;
  }

  .mint-item-label {
    width: 70px;
    font-size: 14px;
  }

  .mint-item-input {
    margin-left: 3px;
    width: auto;
    flex-grow: 3;
  }
  .mint-item-input >>> .el-input__inner {
    font-size: 14px;
    width: 100%;
  }

  .mint-item-icon {
    width: 30px;
    height: 30px;
    padding: 8px;
  }

  .mint-button {
    margin-top: 40px;
  }
}
</style>
