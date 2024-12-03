<template>
    <div class="container">
        <div class="card plant" v-for="plant in savedPlants" v-bind:key="plant.id">
            <div>
                <div>{{ plant.plantName }}</div>
                <div>{{ plant.scientificName }}</div>
                <div>{{ plant.plantType }}</div>
            </div>  
            <div>
                <img class="plant-image" v-bind:src=plant.plantImage1 v-bind:alt=plant.plantName />
            </div>  
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
.container {
    display:flex;
    flex-direction:column;
    justify-content: center;

}
.plant {
    display:flex;
    flex-direction: row;
    justify-content: space-around;
    width: 90%;
    margin: 3px;
    
}
.plant-image {
    width: 20%;
    
}
</style>