<template>
  <div class="container">
    <div class="back-button-container">
            <i class="back-button bi bi-arrow-left-square-fill" 
                style="font-size: 3rem; color: #679436;" 
                v-on:click="goBack()"
                ></i>
    </div>
    <div class="main-container">

      <div v-show="savedPlants != 0" class="plant-tabs">
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
        <div class="dropdown-container">
          <button class="dropdown-button" v-on:click="toggleDropdown">...</button>
            <div v-if="dropdownVisible" class="dropdown-menu" @mouseleave.prevent="toggleDropdown">
          <button class="dropdown-option" v-on:click="removePlant(selectedPlant.plantId)">Delete</button>
          <button class="dropdown-option" v-on:click="addNote">Add Note</button>
        </div>
      </div>

        <div class="detail-content">
          <div class="detail-image">
            <img :src="selectedPlant.plantImage1" :alt="selectedPlant.plantName" class="plant-detail-image" />
          </div>
          <div class="detail-info">
            <h3 class="lexend">{{ selectedPlant.plantName }}</h3>
            <p><strong>Scientific Name:</strong> {{ selectedPlant.scientificName }}</p>
            <p><strong>Plant Type:</strong> {{ selectedPlant.plantType }}</p>
            <p>{{ selectedPlant.plantDescription }}</p>
            <a v-on:click="pushToDetailPage">Plant Details</a>
          </div>
        </div>
      </div>

      <div v-else class="details-container empty-garden">
        <p>Select a plant to view its details.</p>
        <button class="search-plants" v-if="savedPlants.length === 0" v-on:click="pushToSearch">Find a Plant</button>
      </div>
    </div>
 
    <div class="right-container">
      <GeminiAI class="chat-bot" v-bind:plant="selectedPlant"/>
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
      propPlant: {'plantName': 'plants'},
      dropdownVisible: false
    };
  },
  methods: {
    getSavedPlants() {
      PlantService.getSavedPlants(this.$store.state.user.id).then((response) => {
        const plantArray = response.data;
        this.savedPlants = plantArray;
        if (this.savedPlants.length > 0) {
          this.selectedPlant = this.savedPlants[0];
          this.propPlant=this.selectedPlant;
        }
      })
      .catch ((error) => {
                console.error("Error Fetching Saved Plants", error);
                this.$router.push({ name: 'notFound' });
            } )
    },
    selectPlant(plant) {
      this.selectedPlant = plant;
      this.propPlant=this.selectedPlant;
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
    },
    toggleDropdown() {
      const closeListerner = (e) => {
      if ( this.catchOutsideClick(e, this.$refs.menu ) )
        window.removeEventListener('click', closeListerner) , this.isOpen = false
      }
      window.addEventListener('click', closeListerner)
      this.dropdownVisible = !this.dropdownVisible;
    },
    goBack(){
        this.$router.go(-1);
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

.lexend {
  font-family: "Lexend", sans-serif;
  font-optical-sizing: auto;
  font-weight: 600;
  font-style: normal;
}

.container {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  max-width: 90vw;
  min-height: 82.4vh;
  padding: 10px;
  gap: 20px;
  font-family: "Lexend", sans-serif;
}

.main-container {
  display: flex;
  flex: 3;
  max-width: 80%;
  height:80vh;
  background-color: #CADABF;
  border: 1px solid #ccc;
  border-radius: 8px;
  overflow: hidden;
}

.plant-tabs {
  display: flex;
  flex-direction: column;
  width: 30%;
  background-color: #bfd0b4;
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
  text-align: center;
}

.search-plants{
  border-radius: 5px;
  color: #EDEEC9;
  background-color: #679436;
  width: 140px;
  height: 80px;
}

.search-plants:hover{
  background-color: #54792c;
}

.dropdown-container {
  position: absolute;
  top: 10px;
  right: 10px;
  z-index: 10;
}

.dropdown-button {
  background: none;
  border: none;
  font-size: 20px;
  font-weight: bold;
  color: #333;
  cursor: pointer;
  transition: color 0.3s;
}

.dropdown-button:hover {
  color: #555;
}

.dropdown-menu {
  position: absolute;
  top: 30px;
  right: 0;
  background: white;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  z-index: 10;
  display: flex;
  flex-direction: column;
  padding-left: 30px;
  padding-right: 30px;
}

.dropdown-option {
  background: none;
  border: none;
  color: green;
  cursor: pointer;
  padding: 5px 10px;
  text-align: left;
  width: 100%;
}
.dropdown-option:hover {
  text-decoration: underline;
}
.back-button-container {
    position:static;
    display: flex;
    
    justify-content:end;
    align-items: flex-start;
    line-height: 0;
}
.back-button {
    vertical-align: middle;
    display: inline-block;
    cursor:pointer;
    margin-top: 3px;
    margin-right: 3px;
}
</style>
