<template>
<nav class="navbar navbar-expand-lg navbar-dark bg-success bg-gradient">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
        <img src="https://res.cloudinary.com/dwdijh29x/image/upload/v1733247354/plantlogo_ztqbz9.webp" width="60" height="60" class="d-inline-block align-text-center"/>
        Sprout</a>
        <div class="navbuttons">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <router-link v-bind:to="{ name: 'garden'}">MyGarden</router-link>
                    <a class="nav-link active" aria-current="page" href="#">MyGarden</a>
                </div>
            </div>
        </div>
    </div>
</nav>
</template>


<script>

</script>


<style scoped>
.navbuttons{
    display: flex;
    align-content: center;
}

</style>