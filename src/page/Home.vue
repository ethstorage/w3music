<template>
  <div class="home">
    <img class="home-logo" src="../assets/home.png"/>
    <p class="title">
      Create an Music NFT fully on-chain.
    </p>
    <el-button type="warning" round class="profile-btn" @click="goUpload">Start</el-button>
  </div>
</template>

<script>

export default {
  name: 'Home',
  methods: {
    goUpload() {
      this.$router.push({path: "/upload"});
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.home {
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
