<template>
  <div class="upload">
    <img class="home-logo" src="../assets/home.png"/>
    <w3q-deployer multiple :fileContract="contract" style="width: 500px"/>
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
        const {FileBoxController} = this.$store.state.chainConfig;
        return FileBoxController;
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
.home-logo {
  margin-top: 35px;
  width: 230px;
}

.title {
  font-size: 30px;
  color: #333333;
  margin-bottom: 55px;
  margin-top: 30px;
  line-height: 50px;
}

.profile-btn {
  background-color: #52DEFF;
  margin-top: 15px;
  font-size: 23px;
  width: 190px;
  height: 50px;
  border: 1px solid transparent;
  border-radius: 35px !important;
}
.profile-btn:focus,
.profile-btn:hover {
  border: 1px solid transparent;
  background-color: #52DEFFBB;
}
</style>
