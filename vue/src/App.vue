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
.parkinsans {
  font-family: "Parkinsans", sans-serif;
  font-optical-sizing: auto;
  font-weight: 300;
  font-style: normal;
}
.lexend {
  font-family: "Lexend", sans-serif;
  font-optical-sizing: auto;
  font-weight: 300;
  font-style: normal;
}

</style>



