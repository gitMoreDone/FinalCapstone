<template>
    <div class="container">

      <div class="main-container">

        <div class="plant-tabs">
          <div
            class="plant-tab"
            v-for="plant in savedPlants"
            :key="plant.id"
            v-on:click="selectPlant(plant)"
            :class="{ selected: selectedPlant && selectedPlant.plantId === plant.plantId }"
          >
            <img class="plant-tab-image" :src="plant.plantImage1" :alt="plant.plantName" />
            <div class="plant-tab-name">{{ plant.plantName }}</div>
          </div>
        </div>

        <div v-if="selectedPlant" class="details-container">
          <button class="close-button" v-on:click="removePlant(selectedPlant.plantId)">×</button>

          <div class="detail-content">
            <div class="detail-image">
              <img :src="selectedPlant.plantImage1" :alt="selectedPlant.plantName" class="plant-detail-image" />
            </div>
            <div class="detail-info">
              <h3>{{ selectedPlant.plantName }}</h3>
              <p><strong>Scientific Name:</strong> {{ selectedPlant.scientificName }}</p>
              <p><strong>Plant Type:</strong> {{ selectedPlant.plantType }}</p>
              <p>{{ selectedPlant.plantDescription }}</p>
              <a href="#" v-on:click="pushToDetailPage">Plant Details</a>
            </div>
          </div>
        </div>
  

        <div v-else class="details-container empty-details">
          <p>Select a plant to view its details.</p>
          <button v-if="savedPlants.length === 0" v-on:click="pushToSearch">Find a Plant</button>
        </div>
      </div>
  
      
      <div class="right-container">
        <GeminiAI class="chat-bot" />
      </div>
    </div>
  </template>
  
  <script>
  import PlantService from "../services/PlantService";
  import GeminiAI from "../components/GeminiAI.vue";
  
  export default {
    data() {
      return {
        savedPlants: [],
        selectedPlant: null,
      };
    },
    methods: {
      getSavedPlants() {
        PlantService.getSavedPlants(this.$store.state.user.id).then((response) => {
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
        this.savedPlants = this.savedPlants.filter((plant) => plant.plantId !== id);
        if (this.selectedPlant && this.selectedPlant.plantId === id) {
          this.selectedPlant = null;
        }
      },
      pushToSearch(){
        this.$router.push({name: 'plantSearch'})
      },
      pushToDetailPage(){
        this.$router.push({ name: 'plantDetails', params: { id: this.selectedPlant.plantId } })
      }
    },
    mounted() {
      this.getSavedPlants();
    },
    components: {
      GeminiAI,
    },
  };
  </script>
  
  <style scoped>
  .container {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    width: 100vw;
    min-height: 84.8vh;
    padding: 10px;
    gap: 20px;
  }
  
  .main-container {
    display: flex;
    flex: 3;
    max-width: 70%;
    background-color: #f9f9f9;
    border: 1px solid #ccc;
    border-radius: 8px;
    overflow: hidden;
  }
  
  .plant-tabs {
    display: flex;
    flex-direction: column;
    width: 25%;
    background-color: #f0f0f0;
    border-right: 1px solid #ccc;
    padding: 10px;
  }
  
  .plant-tab {
    display: flex;
    align-items: center;
    padding: 10px;
    cursor: pointer;
    border-bottom: 1px solid #ddd;
    transition: background-color 0.3s;
  }
  
  .plant-tab:hover {
    background-color: #e0e0e0;
  }
  
  .plant-tab.selected {
    background-color: #d0d0d0;
  }
  
  .plant-tab-image {
    width: 40px;
    height: 40px;
    object-fit: cover;
    border-radius: 4px;
    margin-right: 10px;
  }
  
  .plant-tab-name {
    font-size: 14px;
    font-weight: 500;
  }
  
  .details-container {
    flex: 1;
    position: relative;
    padding: 20px;
    display: flex;
    flex-direction: column;
  }
  
  .details-container.empty-details {
    justify-content: center;
    align-items: center;
    color: #888;
  }
  
  .close-button {
    position: absolute;
    top: 10px;
    right: 10px;
    background: none;
    border: none;
    font-size: 20px;
    font-weight: bold;
    color: #333;
    cursor: pointer;
    transition: color 0.3s;
  }
  
  .close-button:hover {
    color: red;
  }
  
  .detail-content {
    display: flex;
    gap: 20px;
  }
  
  .detail-image {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  
  .plant-detail-image {
    max-width: 100%;
    max-height: 300px;
    object-fit: cover;
    border-radius: 8px;
  }
  
  .detail-info {
    flex: 2;
  }
  
  .detail-info h3 {
    margin-bottom: 10px;
    font-size: 24px;
  }
  
  .detail-info p {
    margin: 5px 0;
  }
  
  .right-container {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
    background-color: #ffffff;
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 20px;
    height: 100%;
  }
  
  .empty-garden {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
    background-color: #f0f0f0;
    text-align: center;
  }
  </style>
  