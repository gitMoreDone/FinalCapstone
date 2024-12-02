<template>
    <div class="container">
        <div class="plant-gallery">
            <div class="main-image">
                <img v-bind:src="plant.image" /> 

            </div>
        </div>
        <div class="plant-details"></div>
    </div>
</template>


<script>   
export default {
    props: ['plant']
}

</script>


<style scoped>

</style>