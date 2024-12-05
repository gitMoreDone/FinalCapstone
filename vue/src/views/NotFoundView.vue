<template>
    <div class="container">
        <h1>CONTENT NOT FOUND</h1>
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
    margin-top: 200px;
    width: 400px;
    height: 300px;

}

h1 {
    text-decoration: underline;
}
</style>