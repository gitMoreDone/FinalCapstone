<template>
  <div id="capstone-app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'plantSearch' }">Search</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <site-header />
    <router-view />
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
