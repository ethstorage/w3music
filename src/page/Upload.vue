<template>
  <div class="upload">
    <el-radio-group v-model="acceptIndex" :disabled="acceptType" class="accept-type">
      <el-radio-button label="Music"></el-radio-button>
      <el-radio-button label="Image"></el-radio-button>
    </el-radio-group>
    <div class="upload-title"> {{ this.acceptText }}</div>
    <w3q-deployer :accept="accept" :controlContract="contract" :fileContract="fileContract" style="width: 600px"/>
  </div>
</template>

<script>
import W3qDeployer from '@/components/w3q-deployer.vue';

export default {
  name: 'Upload',
  components: {W3qDeployer},
  data: () => {
    return {
      acceptIndex: 'Music',
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
    acceptType() {
      return this.$route.params.type;
    },
    acceptText() {
      return this.acceptIndex === 'Music' ? 'Upload your music files.' : 'Upload your image files.';
    },
    accept() {
      return this.acceptIndex === 'Music' ? "audio/*" : 'image/*';
    }
  },
  methods: {
    goProfile() {
      this.$router.push({path: "/address/" + this.currentAccount});
    }
  },
  mounted() {
    if (this.acceptType && this.acceptType === 'img') {
      this.acceptIndex = 'Images';
    }
  }
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
</style>
