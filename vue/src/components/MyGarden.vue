<template>
  <div class="container">
    <div class="back-button-container">
      <i class="back-button bi bi-arrow-left-square-fill" style="font-size: 3rem; color: #679436;"
        v-on:click="goBack()"></i>
    </div>
    <div class="main-container">

      <div v-show="gardenPlants != 0" class="plant-tabs">
        <div class="plant-tab" v-for="gardenPlant in gardenPlants" :key="gardenPlant.id"
          v-on:click="selectPlant(gardenPlant)"
          :class="{ selected: selectedPlant.plant && selectedPlant.plant.plantId === gardenPlant.plant.plantId }">
          <img class="plant-tab-image" :src="gardenPlant.plant.plantImage1" :alt="gardenPlant.plant.plantName" />
          <div class="plant-tab-name">{{ gardenPlant.plant.plantName }}</div>
        </div>
      </div>

      <div v-if="selectedPlant" class="details-container">
        <div class="dropdown-container">
          <button class="dropdown-button" v-on:click="toggleDropdown">...</button>
          <div v-if="dropdownVisible" class="dropdown-menu" @mouseleave.prevent="toggleDropdown">
            <button class="dropdown-option" v-on:click="removePlant(selectedPlant.plant.plantId)">Delete</button>
            <button class="dropdown-option" v-on:click="addNote">Add Note</button>
          </div>
        </div>
        <div class="content-and-notes">
          <div class="detail-content">
            <div class="detail-image">
              <img :src="selectedPlant.plant.plantImage1" :alt="selectedPlant.plant.plantName"
                class="plant-detail-image" />
            </div>
            <div class="detail-info">
              <h3 class="lexend">{{ selectedPlant.plant.plantName }}</h3>
              <p><strong>Scientific Name:</strong> {{ selectedPlant.plant.scientificName }}</p>
              <p><strong>Plant Type:</strong> {{ selectedPlant.plant.plantType }}</p>
              <p>{{ selectedPlant.plant.plantDescription }}</p>
              <a v-on:click="pushToDetailPage" class="plant-details-link">Plant Details</a>
            </div>

          </div>
          <div class="notes-container">
            
              <button class="btn btn-light" v-if="isEditingNotes" v-on:click="saveNote">Save Notes</button>
              <button class="btn btn-light" v-if="!isEditingNotes" v-on:click="openNotes">Edit Notes</button>
              <textarea v-if="isEditingNotes"  name="notes" id="notes"  cols="30" 
              rows="10" v-model="selectedPlant.notes"></textarea>
              <p class="notes" v-if="!isEditingNotes">{{ selectedPlant.notes }}</p>
            
          </div>
        </div>
      </div>

      <div v-else class="details-container empty-garden">
        <p>Select a plant to view its details.</p>
        <button class="search-plants" v-if="gardenPlants.length === 0" v-on:click="pushToSearch">Find a Plant</button>
      </div>
    </div>

    <div class="right-container">
      <GeminiAI class="chat-bot" v-bind:plant="selectedPlant" />
    </div>
  </div>
</template>

<script>
import PlantService from "../services/PlantService";
import GeminiAI from "../components/GeminiAI.vue";

export default {
  data() {
    return {
      gardenPlants: [],
      selectedPlant: null,
      propPlant: { 'plantName': 'plants' },
      dropdownVisible: false,
      isEditingNotes:false
    };
  },
  methods: {
    getPlantsInGarden() {
      PlantService.getGardenPlants().then((response) => {
        const gardenPlantArray = response.data;
        this.gardenPlants = gardenPlantArray;
        if (this.gardenPlants.length > 0) {
          this.selectedPlant = this.gardenPlants[0];
          this.propPlant = this.selectedPlant.plant;
        }
      }).catch((error) => {
        console.error("Error Fetching Saved Plants", error);
        this.$router.push({ name: 'notFound' });
      })
    },
    selectPlant(gardenPlant) {
      this.selectedPlant = gardenPlant;
      this.propPlant = this.selectedPlant.plant;
    },
    removePlant(id) {
      PlantService.removePlant(id);
      this.gardenPlants = this.gardenPlants.filter((gardenPlant) => gardenPlant.plant.plantId !== id);
      if (this.selectedPlant && this.selectedPlant.plantId === id) {
        this.selectedPlant = null;
      }
      this.dropdownVisible = false;
    },
    pushToSearch() {
      this.$router.push({ name: 'plantSearch' })
    },
    pushToDetailPage() {
      this.$router.push({ name: 'plantDetails', params: { id: this.selectedPlant.plant.plantId } })
    },
    toggleDropdown() {
      this.dropdownVisible = !this.dropdownVisible;
    },
    openNotes(){
      this.isEditingNotes=true;
    },
    saveNote() {
      PlantService.updatePlant(this.selectedPlant);
      this.isEditingNotes=false;
    },
    goBack() {
      this.$router.go(-1);
    }
  },

  mounted() {
    this.getPlantsInGarden();
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
  height: 80vh;
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
.content-and-notes{
  display: flex;
  flex-direction: column;
  height:100%;
}

.detail-content {
  display: flex;
  gap: 20px;
}

.detail-image {
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: start;
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

.plant-details-link {
  text-decoration: underline;
  color: #679436;
  cursor: pointer;
}

.notes-container {
  margin-top:20px;
  gap:5px;
  width: 50%;
  height:100%;
  display:flex;
  flex-direction: column;
  
}
.notes {
  width:100%;
  height: 240px;
  overflow-y: auto;
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

.search-plants {
  border-radius: 5px;
  color: #EDEEC9;
  background-color: #679436;
  width: 140px;
  height: 80px;
}

.search-plants:hover {
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
  position: static;
  display: flex;

  justify-content: end;
  align-items: flex-start;
  line-height: 0;
}

.back-button {
  vertical-align: middle;
  display: inline-block;
  cursor: pointer;
  margin-top: 3px;
  margin-right: 3px;
}
</style>
