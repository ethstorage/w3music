<template>
  <div class="upload">
    <el-radio-group v-model="acceptIndex" class="accept-type">
      <el-radio-button label="Music"></el-radio-button>
      <el-radio-button label="Image"></el-radio-button>
    </el-radio-group>
    <div class="upload-title">{{ this.acceptText }}</div>
    <w3q-deployer :accept="accept" :account="this.account"
                  :controlContract="contract" :fileContract="fileContract"
                  class="drop" :onSuccess="onSuccess"/>
  </div>
</template>

<script>
import W3qDeployer from '@/components/w3q-deployer.vue';
import {mapActions} from "vuex";

export default {
  name: 'Upload',
  components: {W3qDeployer},
  data: () => {
    return {
      acceptIndex: 'Music',
    };
  },
  computed: {
    account() {
      return this.$store.state.account;
    },
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
    isShowDialog() {
      return this.$store.state.showDialog;
    },
    acceptType() {
      return this.$route.params.type;
    },
    acceptText() {
      return this.acceptIndex === 'Music' ? 'Upload your music files' : 'Upload your image files';
    },
    accept() {
      return this.acceptIndex === 'Music' ? "audio/*" : 'image/*';
    }
  },
  methods: {
    ...mapActions(["setShowDialog"]),
    goProfile() {
      this.$router.push({path: "/address/" + this.currentAccount});
    },
    onSuccess() {
      if(this.acceptType) {
        this.$destroy();
        this.$router.back();
        this.$message({
          message: 'Upload File Success',
          type: 'success'
        });
      }
    }
  },
  created() {
    if (this.acceptType && this.acceptType === 'img') {
      this.acceptIndex = 'Image';
    }
    if (!this.isShowDialog && window.ethereum && window.ethereum.isMetaMask) {
      this.setShowDialog(true);
      this.$msgbox({
        title: 'WARNING',
        message: '<div style="text-align: left; font-size: 14px">' +
            'Due to the caching of user transaction history by Metamask and its limit on the cache size, it is easy to exceed the limit when uploading large files by constructing multiple data upload transactions, which may cause Metamask to fail to start.<br/>' +
            'Therefore, we recommend that you do not upload files larger than <span style="color: red">3MB</span> and manually clear the cache after uploading to avoid any potential issues with your Metamask.' +
            '</div>',
        dangerouslyUseHTMLString: true,
        confirmButtonText: 'OK',
        type: 'warning',
        center: true,
        closeOnClickModal: false,
        closeOnPressEscape: false,
      });
    }
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.upload {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.accept-type {
  align-self: end;
  margin: 60px 0 80px;
}

.upload-title {
  font-size: 30px;
  color: black;
  line-height: 30px;
  margin-bottom: 60px;
  font-family: AlibabaPuHuiTiM;
}

.drop {
  width: 600px;
}

@media screen and (max-width: 500px) {
  .accept-type {
    align-self: end;
    margin: 30px 0 50px;
  }

  .upload-title {
    font-size: 20px;
    line-height: 30px;
    margin-bottom: 30px;
  }
  .drop {
    width: 80%;
  }
}
</style>
