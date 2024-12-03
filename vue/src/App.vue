<template>
  <div id="capstone-app">
    <site-header class="header"/>
    <router-view class="body"/>
    <site-footer />
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
.header{
  position: sticky;
  top: 0;
  z-index: 1000;
}

.body{
  padding-top: 30px;
}
</style>
