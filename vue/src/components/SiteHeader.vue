<template>
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid">

    <a class="navbar-brand lexend-header-font" id="brand">
        <img src="https://res.cloudinary.com/dwdijh29x/image/upload/v1733323940/sprout-icon-light_wvq61u.png" width="60" height="60" class="d-inline-block align-text-bottom"/>
        Sprout</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
    </div>
    <div class="collapse navbar-collapse lexend-header-font" id="navbarNavAltMarkup">
                <div id="navbar-nav">
                <router-link class="routelink" v-bind:to="{ name: 'home' }">Home</router-link> 
                <router-link class="routelink" v-bind:to="{ name: 'plantSearch' }">Search</router-link> 
                <router-link class="routelink" v-bind:to="{ name: 'garden'}" v-if="$store.state.token != ''">Garden</router-link><span v-if="$store.state.token != ''"></span>
                <router-link class="routelink" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link> 
                <router-link class="routelink" v-bind:to="{ name: 'login' }" v-if="$store.state.token == ''">Login</router-link>
                </div>
            </div>
</nav>
</template>


<script>

</script>


<style scoped>
.routelink{
    color: white;
    text-decoration: none;
    margin-right: 30px

    
    
}

#brand{
    margin-left: 20px;
    font-size:xx-large;
}

#navbar-nav{
    margin-right: 40px;
    white-space: nowrap;
}
.header {
  background-color: #679436;
}
.lexend-header-font {
  font-family: "Lexend", sans-serif;
  font-optical-sizing: auto;
  font-weight: 500;
  font-style: normal;
}
</style>