<template>
    <div class="container">
        <div class="searchBar-container">
            <input name="search-filter" class="searchBar" type="text" v-model="searchFilter"
                placeholder="Search Plants" />
        </div>
        <div class="row" id="search-row">
            <div class="col-12 col-md-2 card shadow p-3 mb-5 bg-white rounded" 
                v-on:mouseover="showButton(index)" v-on:mouseleave="hideButton(index)" 
                v-for="(plant,index) in filteredPlants" v-bind:key="index"
            >
                <div class="button-container">
                    <transition name="fade">
                        <button class="add-plant-button" 
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
                    <router-link class="plant-name"
                        v-bind:to="{ name: 'plantDetails', params: { id: plant.plantId } }">{{ plant.plantName
                        }}</router-link>
                    <h4 class="plant-type">{{ plant.plantType }}</h4>
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
            hoveredCard: null

        }
    },

    methods: {
        savePlant(plant) {
            PlantService.addPlant(plant);
        },
        showButton(index) {
            this.hoveredCard = index;
        },
        hideButton() {
            this.hoveredCard = null;
        },
    },

    computed: {
        filteredPlants() {
            const selectPlants = this.plants;

            return selectPlants.filter((plant) => {
                return this.searchFilter == '' ? true : plant.plantName.toLowerCase().includes(this.searchFilter.toLowerCase());
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
}

.searchBar-container {
    display: flex;
    justify-content: center;
    width: 100%;
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
    border-color: #33752a;
    /* Optional: Adds focus effect */
    outline: none;
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
    display: flex;
    flex-direction: column;
    justify-content:center;
    align-items: center;
}

.plant-name {
    font-size: large;
    text-decoration: none;
    color: black;
    font-weight: bold;
}

.plant-type {
    font-size: small;
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
    background-color: green;
    color: white;
    border-radius: 5px 5px 5px 5px;
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

.custom-divs>.p-2 {
    width: 30%;
    /* Adjust to set the number of divs per row */
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