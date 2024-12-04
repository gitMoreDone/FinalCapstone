<template>
<nav class="navbar navbar-expand-lg navbar-dark bg-success bg-gradient">
  <div class="container-fluid">

    <a class="navbar-brand" href="https://localhost:5173" id="brand">
        <img src="https://res.cloudinary.com/dwdijh29x/image/upload/v1733247354/plantlogo_ztqbz9.webp" width="60" height="60" class="d-inline-block align-text-center"/>
        sprout</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
    </div>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div id="navbar-nav">
                <router-link class="routelink" v-bind:to="{ name: 'plantSearch' }">Search</router-link>
                <router-link class="routelink" v-bind:to="{ name: 'garden', params: { userId: this.$store.state.user.id} }" v-if="$store.state.token != ''">MyGarden</router-link>
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
    margin: 5px;
}

#brand{
    margin-left: 20px;
}

#navbar-nav{
    margin-right: 40px;
}

</style>