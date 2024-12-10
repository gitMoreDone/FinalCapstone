<template>
    <div class="container">
        <img src="https://res.cloudinary.com/dbryvvjtl/image/upload/v1733789391/c72cfe456e639daa5f0beb93e5d207977718db9d55314f62b5102fac15d12f21_ro4duq.png" />
    </div>
    <router-view></router-view>
</template>


<script>
export default{

}

</script>


<style scoped>
.container {
    display: flex;
    justify-content: center;
    width: 100%;
    height: auto;
    object-fit: cover;

}

h1 {
    text-decoration: underline;
}
</style>