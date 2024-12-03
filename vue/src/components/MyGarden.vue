<template>
    <div>
        <div class="card" v-for="plant in savedPlants" v-bind:key="plant.id">
            
        </div>
    </div>
</template>


<script>
export default {
    props: {
        savedPlants: {
            type: Array,
            required: true
        }
    }
}
</script>


<style scoped>

</style>