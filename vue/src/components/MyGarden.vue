<template>
    <div class="container">
        <div v-if="savedPlants != 0" class="left-container">
            <div 
                class="plant" 
                v-for="plant in savedPlants" 
                :key="plant.id"
                v-on:click="selectPlant(plant)"
                :class="{ selected: selectedPlant && selectedPlant.plantId === plant.plantId }">
                <div>
                    <img class="plant-image" :src="plant.plantImage1" :alt="plant.plantName" />
                </div>
                <div class="plant-name">{{ plant.plantName }}</div>
            </div>
        </div>

        <div v-if="selectedPlant" class="middle-container">
            <div class="detail-image">
                <img :src="selectedPlant.plantImage1" :alt="selectedPlant.plantName" class="plant-detail-image" />
            </div>
            <div class="detail-container">
                <div class="detail-name">
                    <p><strong>{{ selectedPlant.plantName }} Details</strong></p>
                </div>
                <div class="science-name">
                    <p><strong>Scientific Name:</strong> {{ selectedPlant.scientificName }}</p>
                </div>
                <div class="detail-type">
                    <p><strong>Plant Type:</strong> {{ selectedPlant.plantType }}</p>
                </div>
                <div class="detail-description">
                    <p>{{ selectedPlant.plantDescription }}</p>
                </div>
            </div>  
            <div class="empty-box empty-box-left">
                <button v-on:click="removePlant(selectedPlant.plantId)" class="remove-button">Remove</button>
            </div>
            <div class="empty-box empty-box-right">

            </div>
                
        </div>

        <div v-if="savedPlants.length === 0" class="empty-garden">
            <p>Placeholder</p>
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
            savedPlants: [],
            selectedPlant: null 
        };
    },
    methods: {
        getSavedPlants() {
            PlantService.getSavedPlants(this.$store.state.user.id).then(response => {
                const plantArray = response.data;
                this.savedPlants = plantArray;
                if (this.savedPlants.length > 0) {
                    this.selectedPlant = this.savedPlants[0];
                }
            });
        },
        selectPlant(plant) {
            this.selectedPlant = plant;
        },
        removePlant(id) {
            PlantService.removePlant(id);
            this.savedPlants = this.savedPlants.filter(plant => plant.plantId !== id);
            if (this.selectedPlant && this.selectedPlant.plantId === id) {
                this.selectedPlant = null;
            }
        }
    },
    mounted() {
        this.getSavedPlants();
    },
    components: {
        GeminiAI
    }
};
</script>
<style scoped>
.container {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    width: auto;
    min-height: 84.8vh;
    gap: 40px;
    padding-top: 10px;
    padding-bottom: 10px;
}

.empty-garden{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: #f0f0f0;  
    width: 100%; 
    height: 100%; 
    flex: 1;
}

.plant {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    text-align: center;
    align-items: center;
    width: 100%;
    height: 100px;
    margin: 3px;
    border: solid;
    border-color: green;
    border-radius: 5px;
    cursor: pointer; 
    transition: background-color 0.3s;
}

.plant-name{
    margin-right: auto;
    margin-left: auto;
    font-weight: 400;
}

.plant:hover {
    background-color: #f0f0f0; 
}

.selected {
    background-color: #e0e0e0; 
}

.plant-image {
    justify-content: flex-start;
    width: 95px;
}

.left-container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: antiquewhite;
    padding: 20px;
    border-radius: 15px;
}

.right-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    width: auto;
    margin-bottom: auto;
    margin-top: auto;
}

.left-container,
.right-container{
    flex: 1;
}

.middle-container {
    display: grid;
    grid-template-columns: 1fr 1fr; 
    grid-template-rows: 1fr 1fr;   
    gap: 10px;
    width: 60%; 
    max-width: 1000px; 
    background-color: #f9f9f9;
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.detail-container {
    grid-column: 2 / 3; 
    grid-row: 1 / 2;
    display: flex;
    flex-direction: column;
    justify-content: start;
    align-items: flex-start;
    padding: 10px;

}

.empty-box {
    background-color: #e0e0e0;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.empty-box-left {
    grid-column: 1 / 2; 
    grid-row: 2 / 3;
}

.empty-box-right {
    grid-column: 2 / 3;
    grid-row: 2 / 3;
}

.detail-image {
    grid-column: 1 / 2; 
    grid-row: 1 / 2;
    display: flex;
    justify-content: start;
    align-items: start;
}

.detail-name{
    display: flex;

}

.science-name{
    display: flex;

}

.detail-type{
    display: flex;

}

.plant-detail-image {
    max-width: 100%;
    max-height: 75%;
    margin: auto;
}

.remove-button {
    padding: 10px;
    background-color: red;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 5px;
}

.remove-button:hover {
    background-color: darkred;
}
</style>
