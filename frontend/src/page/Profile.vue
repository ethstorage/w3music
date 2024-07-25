<template>
  <div>
    <div v-if="!this.result" class="profile-loading" v-loading="true"/>
    <el-card v-else class="profile-card">
      <div class="profile-title">
        Music NFT
      </div>
      <div class="divider"/>

      <!--   empty   -->
      <div v-if="!this.result || this.result.length<=0" class="profile-empty">
        <div class="profile-text">
          You haven't minted any music NFT
        </div>
        <el-button type="warning" round class="profile-btn" @click="goMint">Mint your first NFT</el-button>
      </div>

      <!--   data   -->
      <div v-else class="profile-date">
        <el-card v-for="item in this.result" :key="item.id" class="card-item"
                 :style="{backgroundImage: 'url(' + item.cover + ')'}">
          <div class="music-card" @click.stop="goPlay(item.play)">
            <div class="card-item-li">
              <span class="card-item-title">No.</span>
              <span class="card-item-text">{{ item.id }}</span>
            </div>
            <div class="card-item-li">
              <span class="card-item-title">Author: </span>
              <span class="card-item-text">{{ renderAccountShort(item.author) }}</span>
            </div>
            <div class="card-item-li">
              <span class="card-item-title">Name: </span>
              <span class="card-item-text">{{ item.name }}</span>
            </div>
            <div class="card-item-text card-item-describe">
              <span>{{ item.describe }}</span>
            </div>
            <span class="card-item-time">
              {{ renderTimestamp(item.time) }}
            </span>
          </div>
        </el-card>
      </div>
    </el-card>
  </div>
</template>

<script>
import {getAuthorMusicsByAddress} from "@/utils/web3";

export default {
  name: 'Profile',
  data: () => {
    return {
      result: null,
    };
  },
  computed: {
    chainConfig() {
      return this.$store.state.chainConfig;
    },
  },
  watch: {
    chainConfig: function () {
      if (this.$store.state.chainConfig && this.$store.state.chainConfig.chainID) {
        this.onSearch();
      }
    }
  },
  created () {
    this.onSearch();
  },
  methods: {
    renderTimestamp(ts) {
      if (!ts) {
        return "";
      }
      return ts.toLocaleDateString(undefined, {
        day: "numeric",
        month: "short",
        year: "numeric",
      });
    },
    renderAccountShort(account) {
      return (
          account.substring(0, 6) +
          "..." +
          account.substring(account.length - 4, account.length)
      );
    },
    goMint() {
      this.$router.push({path: "/mint"});
    },
    goPlay(url) {
      window.open(url, '_target');
    },
    onSearch() {
      const {W3Music} = this.$store.state.chainConfig;
      if (!W3Music) {
        return;
      }
      getAuthorMusicsByAddress(W3Music, this.$route.params.address)
          .then(value => {
            this.result = value;
          })
          .catch(() => {
            this.result = [];
          });
    },
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
@import "../assets/styles/mixins.scss";
@import "../assets/styles/vars.scss";

.profile-loading {
  min-width: 40vw;
  min-height: 50vh;
}

.profile-loading >>> .el-loading-mask {
  background: transparent !important;
}

.profile-card {
  background: #FFFFFF;
  border-radius: 16px;
  margin-top: 35px;
  padding: 15px;
}

.profile-title {
  font-size: 20px;
  color: #221F33;
  text-align: left;
}

.divider {
  background-color: #E8E6F2;
  height: 1px;
  padding: 0;
  width: 100%;
  margin: 20px 0;
}

.profile-empty {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 240px;
}

.profile-text {
  font-size: 18px;
  color: #221F33;
}

.profile-btn {
  background-color: #AC2D30;
  margin-top: 15px;
  font-size: 18px;
  border: 0;
}

.profile-btn:focus,
.profile-btn:hover {
  background-color: #AC2D30BB;
}

.profile-date {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}

.card-item {
  border-radius: 16px;
  margin: 15px;
  width: 320px;
  background-size: cover;
}
.card-item >>> .el-card__body {
  padding: 0 !important;
}

.music-card {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  cursor: pointer;
  padding: 10px 20px 20px;
  background-color: rgba(255, 255, 255, 0.4);
}

.card-item-li {
  padding: 10px 0;
  width: 100%;
  text-align: left;
  border-bottom: 1px solid #000000;
}

.card-item-title {
  font-size: 13px;
  color: #000000;
  line-height: 13px;
  font-family: AlibabaPuHuiTiM;
}

.card-item-text {
  font-size: 13px;
  color: #000000;
  line-height: 13px;
  font-family: AlibabaPuHuiTiR;
}

.card-item-describe {
  padding: 12px 0 0;
  line-height: 20px;
  height: 200px;
  overflow: hidden;
  font-size: 13px;
  color: #000000;
  font-family: AlibabaPuHuiTiM;
}
.card-item-time {
  margin-top: 5px;
  font-size: 10px;
  color: rgba(0, 0, 0, 0.9);
  line-height: 10px;
  align-self: end;
  font-family: AlibabaPuHuiTiR;
}

@keyframes rotating {
  0% {
    transform: rotate(0deg)
  }
  to {
    transform: rotate(1turn)
  }
}

@media screen and (max-width: 500px) {
  .profile-card {
    padding: 0;
    margin-top: 5px;
  }

  .profile-date {
    justify-content: center;
  }

  .card-item {
   margin: 10px auto;
  }
}
</style>
