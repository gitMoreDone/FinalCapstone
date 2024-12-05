<template>
    <div class="container">
        <div class="left-container">
                <div class="card plant" v-for="plant in savedPlants" v-bind:key="plant.id">
                    <div>
                        <img class="plant-image" v-bind:src=plant.plantImage1 v-bind:alt=plant.plantName />
                    </div>
                    <div>{{ plant.plantName }}</div>
                    <div>{{ plant.scientificName }}</div>
                    <div>{{ plant.plantType }}</div>
                    <button v-on:click="removePlant(plant.plantId)"></button>
                <div>
                </div>
            </div>
        </div>

        <div class="right-container">
            <GeminiAI class="chat-bot"/>
        </div>
    </div>
</template>

<script>
import PlantService from '../services/PlantService';
import GeminiAI from '../components/GeminiAI.vue';

export default {
    data() {
        return {
            savedPlants: []
        }
    },
    methods: {
        getSavedPlants() {

            PlantService.getSavedPlants(this.$store.state.user.id).then(response => {
                const plantArray = response.data;
                this.savedPlants = plantArray;
            });
        },
        removePlant(id) {
            PlantService.removePlant(id);
            this.savedPlants=this.savedPlants.filter( (plant) => plant.plantId !== id)
        },
        
    },
    mounted() {
        this.getSavedPlants();
    },
    components: {
        GeminiAI
    }
}
</script>


<style scoped>
.container {
    display: flex;
    flex-direction: row;
    justify-content: center;
    width: 100vw;
    height: 100vh;
}

.plant {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    width: 90%;
    margin: 3px;

}

.plant-image {
    width: 20%;
}

.left-container{
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    width: 40%;
    background-color: blue;
}

.right-container{
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    width: auto;
    padding: 20px;
    background-color: red;
}

.chat-bot{
    display: flex;
    flex-direction: column;
    justify-content: center;
    background-color: #d3da95;
    border-radius: 8px;
    box-shadow: 0px 4px 8px rgb(44, 160, 54);
}
</style>