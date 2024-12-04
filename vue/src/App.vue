<template>
  <div id="capstone-app">
    <site-header class="header"/>
    <router-view class="body"/>
    <site-footer class="footer"/>
  </div>
</template>

<script>
import SiteHeader from './components/SiteHeader.vue';
import SiteFooter from './components/SiteFooter.vue';

export default {
  components: {
    SiteHeader,
    SiteFooter
  }
}
</script>

<style scoped>
#capstone-app {
  background-image: url('../public/sprout_bg_tile.png');
  background-repeat: repeat;
  background-size: auto;
}
.header{
  position: sticky;
  top: 0;
  z-index: 1000;
}

/* .footer{
  bottom: 0;
  width: 100vw;
} */


.body{
  padding-top: 30px;
  width:100%;
  /* height: 100vh; */

}
</style>
