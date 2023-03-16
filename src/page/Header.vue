<template>
  <b-navbar class="nav-container">
    <template #brand>
      <b-navbar-item tag="router-link" :to="{ path: '/' }">
        <img class="logo" src="../assets/logo.png">
      </b-navbar-item>
    </template>
    <template #end>
      <b-navbar-item tag="router-link" to="/mint">Mint</b-navbar-item>
      <b-navbar-item tag="router-link" to="/upload">Upload</b-navbar-item>
      <b-navbar-item class="connection" tag="div">
        <Wallet/>
      </b-navbar-item>
    </template>
  </b-navbar>
</template>

<script>
import Wallet from "@/components/Wallet";

export default {
  name: 'Header',
  components: {
    Wallet
  }
}
</script>

<style lang="scss">
// Import Bulma's core
@import "~bulma/sass/utilities/_all";

$family-sans-serif: KGBrokenVesselsSketch;
// Import Bulma and Buefy styless
@import "~bulma";
@import "~buefy/src/scss/buefy";

.nav-container {
  background: transparent;
}
.nav-container a {
  color: #221F33;
  font-size: 18px;
  font-family: AlibabaPuHuiTiM;
}
.navbar-item {
  padding: 0.8rem 1.5rem;
}
a.navbar-item:focus-within,
a.navbar-item:hover,
a.navbar-item.is-active,
.router-link-exact-active,
.navbar-item:focus,
.navbar-link:focus,
.navbar-link:focus-within,
.navbar-link:hover,
.navbar-link.is-active {
  color: #AC2D30!important;
  background-color:transparent!important;
}
:focus {
  outline: -webkit-focus-ring-color auto 0px;
}
.navbar {
  background-color: transparent!important;
}

.logo {
  min-height: 36px;
  max-height: 36px;
}

.connection {
  cursor: default !important;
}
.connection:hover {
  background-color: transparent !important;
}

@media screen and (max-width: 500px) {
  .logo {
    min-height: 25px;
  }
  .navbar-menu {
    background: #F9F8FD;
    border-radius: 10px;
  }
  .navbar-brand .navbar-item {
    justify-content: center;
  }
  .nav {
    padding-bottom: 0;
  }
}
</style>
