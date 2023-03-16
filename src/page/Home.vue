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
      this.$router.push({path: "/mint"});
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
  font-size: 26px;
  color: #221F33;
  line-height: 41px;
  margin-bottom: 35px;
  margin-top: 50px;
  font-family: AlibabaPuHuiTiB;
}

.profile-btn {
  background: #AC2D30;
  font-size: 15px;
  width: 120px;
  height: 42px;
  border: 1px solid transparent;
  border-radius: 20px !important;
  font-family: AlibabaPuHuiTiM;
}
.profile-btn:focus,
.profile-btn:hover {
  border: 1px solid transparent;
  background-color: #AC2D30BB;
}

@media screen and (max-width: 500px) {
  .home-logo {
    margin-top: 35px;
    width: 50%;
  }

  .title {
    font-size: 18px;
    line-height: 30px;
    margin-bottom: 40px;
    margin-top: 40px;
  }
}
</style>
