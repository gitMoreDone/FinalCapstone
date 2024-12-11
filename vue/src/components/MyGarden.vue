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
        <div class="plant-tab" v-on:click="pushToSearch()">
          <i class="plant-tab-image bi bi-plus-square" style="color:gray; display:flex; font-size: 2.5rem "></i> <span class="plant-tab-name" style="color:gray">Add a Plant</span>
        </div>
      </div>

      <div v-if="selectedPlant" class="details-container">
        <div class="dropdown-container">
          <button class="dropdown-button" v-on:click="toggleDropdown">...</button>
          <div v-if="dropdownVisible" class="dropdown-menu" @mouseleave.prevent="toggleDropdown">
            <button class="dropdown-option" v-on:click="removePlant(selectedPlant.plant.plantId)">Delete</button>
            <button class="dropdown-option" v-on:click="addNote">Add Note</button>
            <button class="dropdown-option" v-if="!isEditingQuantity" v-on:click="startEditingQuantity">Edit Quantity</button>
            
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
              
              <div id="quantity-form-button">
                <p id="quantity-text"><strong>In Garden: </strong></p>
              <form v-if="isEditingQuantity">
                <input type="text" id="quantity" name="quantity" size="3" v-model="selectedPlant.quantity" v-if="isEditingQuantity" v-on:keydown.enter.prevent="saveQuantity">
              </form>
              <p class="quantity" v-if="!isEditingQuantity">{{ selectedPlant.quantity }}</p>
              
            </div>
              <a v-on:click="pushToDetailPage" class="plant-details-link">Plant Details</a>
            </div>

          </div>
          <div class="plant-properties-container">
            <div class=plant-property>
              <img src="/public/Water_Level.png" alt="water level" />
              <div class="plant-property-description">
                <span> Water Needed</span>
                <span>{{ selectedPlant.plant.waterLevel }} inches/week</span>
              </div>
            </div>
            <div class=plant-property>
              <img src="/public/Light_Level.png" alt="Light Level" />
              <div class="plant-property-description">
                <span> Light Level</span>
                <span>{{ lightLevel }}</span>
              </div>
            </div>
            <div class=plant-property>
              <img src="/public/Difficulty_Level.png" alt="difficulty level"/>
              <div class="plant-property-description">
                <span> Difficulty</span>
                <span>{{ difficultyLevel }}</span>
              </div>
            </div>
          </div>
          <div class="notes-and-description">
            

            <div class="notes-container">
              
                <button class="btn btn-light" v-if="isEditingNotes" v-on:click="saveNote">Save Notes</button>
                <button class="btn btn-light" v-if="!isEditingNotes" v-on:click="openNotes">Edit Notes</button>
                <textarea v-if="isEditingNotes"  name="notes" id="notes"  cols="30" 
                rows="10" v-model="selectedPlant.notes"></textarea>
                <p class="notes" v-if="!isEditingNotes">{{ selectedPlant.notes }}</p>
            </div>

            <div class="plant-description">
              <p>{{ selectedPlant.plant.plantDescription }}</p>
            </div>
          </div>
        </div>
      </div>

      <div v-else class="details-container empty-garden">
        <p>Select a plant to view its details.</p>
        <button class="search-plants" v-if="gardenPlants.length === 0" v-on:click="pushToSearch">Find a Plant</button>
      </div>
    </div>

    <div class="right-container">
      <GeminiAI class="chat-bot"/>
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
      dropdownVisible: false,
      isEditingNotes:false,
      isEditingQuantity: false
    };
  },
  computed: {
    lightLevel(){
      if(this.selectedPlant.plant.lightLevel==1){
        return "Low";
      }else if (this.selectedPlant.plant.lightLevel==2){
        return "Moderate";
      }else if (this.selectedPlant.plant.lightLevel==3){
        return "High";
      } else return "Error";
    },
    difficultyLevel(){
      if(this.selectedPlant.plant.difficultyLevel<=2){
        return "Low";
      }else if (this.selectedPlant.plant.difficultyLevel===3){
        return "Moderate";
      }else if (this.selectedPlant.plant.difficultyLevel<3){
        return "High";
      } else return "Error";
    }
  },
  methods: {
    getPlantsInGarden() {
      PlantService.getGardenPlants().then((response) => {
        const gardenPlantArray = response.data;
        this.gardenPlants = gardenPlantArray;
        if (this.gardenPlants.length > 0) {
          this.selectedPlant = this.gardenPlants[0];
        }
      }).catch((error) => {
        console.error("Error Fetching Saved Plants", error);
        this.$router.push({ name: 'notFound' });
      })
    },
    selectPlant(gardenPlant) {
      this.selectedPlant = gardenPlant;
    },
    removePlant(id) {
      PlantService.removePlant(id);
      this.gardenPlants = this.gardenPlants.filter((gardenPlant) => gardenPlant.plant.plantId !== id);
      this.selectedPlant = '';
      this.dropdownVisible = false;
    },
    startEditingQuantity() {
      this.isEditingQuantity = true;
    },
    saveQuantity() {
      PlantService.updatePlant(this.selectedPlant);
      this.isEditingQuantity=false;
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
    },
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
  overflow: auto;
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
.plant-properties-container{
  margin-top: 10px;
  display:flex;
  flex-direction: row;
  justify-content: space-evenly;
}
.plant-properties-container img{
  width:45px;
  height:45px;
}
.plant-property {
  margin:5px;
  display:flex;
}
.plant-property-description {
  margin-left:5px;
  display:flex;
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

#quantity-text {
  margin-right: 7px;
}

#quantity-form-button {
  display: flex;
  flex-direction: row;
  
}

#quantity-button {
  border-radius: 7px;
}

#quantity {
  margin-right: 10px;
}

.plant-details-link {
  text-decoration: underline;
  color: #679436;
  cursor: pointer;
}
.notes-and-description{
  display: flex;

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
  height: 70%;
  overflow-y: auto;
}

#quantity-field {
height: 55px;
}
.plant-description {
  margin-top:56px;
  padding:6px;
  gap:5px;
  width: 50%;
  height:100%;
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
