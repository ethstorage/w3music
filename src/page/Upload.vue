<template>
  <div class="upload">
    <div class="upload-title">Upload your music files.</div>
    <w3q-deployer accept="audio/*" :controlContract="contract" :fileContract="fileContract" style="width: 600px"/>
  </div>
</template>

<script>
import W3qDeployer from '@/components/w3q-deployer.vue';

export default {
  name: 'Home',
  components: {W3qDeployer},
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
    }
  },
  methods: {
    goUpload() {
      this.$router.push({path: "/upload"});
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

.upload-title {
  font-size: 30px;
  color: black;
  margin: 80px 0 60px;
  line-height: 30px;
  font-family: AlibabaPuHuiTiM;
}
</style>
