<template>
    <div class="container">
        <div class="searchBar-container">
            <input name="search-filter" class="searchBar lexend-header-font" type="text" v-model="searchFilter"
                placeholder="Search Plants" 
            />
            <div 
                v-for="(icon,index) in icons" 
                v-bind:key="index" 
                class="filter-icon"
                v-bind:class="{ active: selectedIcon === icon.type }"
                v-on:click="filterIcon(icon.type)"
                v-on:mouseover="showIconAlt(icon.type)"
                v-on:mouseleave="hideIconAlt"
            >
                <img v-bind:src="icon.src" v-bind:alt="icon.type" />
            
                <div 
                    v-if="iconAlt === index && showIconAlt" 
                    class="iconAlt"
                > 
                    {{ getIconAlt(icon.type) }} 
                </div>
        
        
            </div>
        </div>
        <transition name="fade">
                        <div v-if="showAddedPopup" class="popup-message lexend-header-font">
                            Garden Updated
                        </div>
                    </transition>
        <div class="row" id="search-row">
            <div class="col-12 col-md-2 card shadow p-3 mb-5 bg-white rounded" 
                v-on:mouseover="showButton(index)" v-on:mouseleave="hideButton(index)" 
                v-for="(plant,index) in filteredTypes" v-bind:key="index"
            >
                <div class="button-container">
                    <transition name="fade">
                        <button class="add-plant-button lexend-header-font" 
                            v-if="hoveredCard === index" 
                            v-show="$store.state.token != ''"
                            v-on:click.prevent="savePlant(plant)">Add to Garden
                        </button>
                    </transition>
                </div>

                <div id="plant-image-container">
                    <img class="plant-image" v-bind:src=plant.plantImage1 v-bind:alt=plant.plantName>
                </div>
                <div class="card-text">
                    <router-link class="plant-name lexend-header-font"
                        v-bind:to="{ name: 'plantDetails', params: { id: plant.plantId } }">{{ plant.plantName
                        }}</router-link>
                    <img class="plant-type-icon" v-bind:src="getPlantTypeIcon(plant.plantType)" />                
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import PlantService from '../services/PlantService';

export default {
    props: {
        plants: {
            type: Array,
            required: true
        }
    },
    data() {
        return {
            searchFilter: '',
            hoveredCard: null,
            showAddedPopup: false,
            selectedIcon: null,
            icons: [
                { type: "Vegetable", src: "/public/vegetable_icon.png" },
                { type: "Fruit", src: "/public/fruit_icon.png" },
                { type: "Herb", src: "/public/herb_icon.png" },
                ],
            iconAlt: null,
            showIconAlt: false,
            iconAltTimer:null
        }
    },
    methods: {
        savePlant(plant) {
            PlantService.addPlant(plant);
            this.showPopupMessage();
        },
        showPopupMessage() {
            this.showAddedPopup = true;
            setTimeout(() => {
            this.showAddedPopup = false;
            }, 1500);
        },
        showButton(index) {
            this.hoveredCard = index;
        },
        hideButton() {
            this.hoveredCard = null;
        },
        getPlantTypeIcon(plantType){
            let icon='';
            if(plantType==='Vegetable'){
                icon="/vegetable_icon.png"
            }else if(plantType==='Fruit'){
                icon="/fruit_icon.png"
            }else if(plantType==='Herb'){
                icon="/herb_icon.png"
            }
            return icon;
        },
        filterIcon(type) {
            this.selectedIcon = this.selectedIcon === type ? null : type;
        },
        getIconAlt(type) {
            if(type === "Vegetable") return "Filter by Vegetables";
            if(type === "Fruit") return "Filter by Fruit";
            if(type === "Herbs") return "Filter by Herbs";
        },
        // eslint-disable-next-line vue/no-dupe-keys
        showIconAlt(index){
            this.iconAltTimer = setTimeout(() => {
                this.iconAlt = index;
                this.showIconAlt = true;
            },1000);
        },
        hideIconAlt(){
            clearTimeout(this.iconAltTimer);
            this.showIconAlt=false;
            this.iconAlt = null;
        }
    },
    computed: {
        filteredPlants() {
            const selectPlants = this.plants;
            return selectPlants.filter((plant) => {
                return this.searchFilter == '' ? true : plant.plantName.toLowerCase().includes(this.searchFilter.toLowerCase());
            });
            
        },
        filteredTypes(){
            const selectPlants=this.filteredPlants;
            return selectPlants.sort((a,b) => a.plantName.localeCompare(b.plantName)).filter((plant) => {
                return this.selectedIcon === null ? true : this.selectedIcon === plant.plantType;
            });
        }
        

    }
}
</script>

<style scoped>
#cardContainer {
    display: flex;
    flex-direction: row;
    width: 100vw;
    justify-content: space-evenly;

}
.container {
    width: 100vw;
    min-height: 84.9vh;
}
.searchBar-container {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 6vh;
    margin-top: 10px;
    padding: 0 20px;
    box-sizing: border-box;

}
.searchBar {
    width: 50%;
    padding: 10px;
    font-size: 16px;
    border: 2px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    transition: border-color 0.3s ease;
}
.searchBar:focus {
    border-color: #679436;
    /* Optional: Adds focus effect */
    outline: none;
}
.filter-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width:50px;
    height:50px;
    border-radius: 50%;
    margin-left:1vw;
    background-color: transparent;
    transition: background-color 0.3s ease;
    cursor: pointer;
}
.filter-icon.active {
    background-color: #553E4E;
}
.tooltip {
    position: absolute;
    top: 100%; /* Adjust based on design */
    left: 50%;
    transform: translateX(-50%);
    background-color: #333;
    color: #fff;
    padding: 5px 10px;
    border-radius: 5px;
    font-size: 14px;
    white-space: nowrap;
    z-index: 200;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}
.searchBar-container img {
    width: 35px;
}
.p-3 {
    padding:0 !important;
}
.card {
    margin: 15px;
    display: flex;
    flex-direction: column;
    justify-content: center;  
    transition: transform 0.3s ease, box-shadow 0.3s ease; 
}
.card-text {
    color: #0D1C0F;
    display: flex;
    flex-direction: row;
    justify-content:space-between;
    align-items: center;
}
.plant-name {
    padding: 5px;
    font-size: large;
    text-decoration: none;
    color: #0D1C0F;
    font-weight: bold;
}
.plant-type-icon {
    padding-right: 6px;
    width:30px;
}
.plant-image {
    position: relative;
    display:block;
    padding-top: 0px;
    width: 100%;
    height:auto;
    
}
.card:hover {
    transform: scale(1.05); /* Slightly grows the card */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Adds a shadow for depth */
}
.card:hover .add-plant-button {
    opacity: 1;
}
.button-container {
    display:flex;
    justify-content: center;  
}
.add-plant-button {
    position: absolute;
    top: 35%;
    background-color: white;
    color: #0D1C0F;
    border-radius: 5px 5px 5px 5px;
    border-width: 0 !important;
    width: 150px;
    height: 30px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    font-size: 1rem;
    z-index: 10;
    opacity: 0;
    transition: opacity 0.3s ease, transform 0.3s ease;
    
}
.popup-message {
    position: fixed;
    top: 10%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #f08A4B;
    color: white;
    padding: 10px 20px;
    border-radius: 8px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    z-index: 300;
    font-size: 16px;
    text-align: center;
    opacity: 0.9;
}
fade-enter-active, .fade-leave-active {
    transition: opacity 0.5s;
}
.fade-enter, .fade-leave-to {
    opacity: 0;
}
.custom-divs>.p-2 {
    width: 30%;
    /* Adjust to set the number of divs per row */
}

.lexend-header-font {
  font-family: "Lexend", sans-serif;
  font-optical-sizing: auto;
  font-weight: 300;
  font-style: normal;
}
@media (max-width: 768px) {
    .custom-divs>.p-2 {
        width: 48%;
        /* Two per row on smaller screens */
    }
}
@media (max-width: 480px) {
    .custom-divs>.p-2 {
        width: 100%;
        /* One per row on very small screens */
    }
}
</style>