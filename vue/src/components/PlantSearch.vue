<template>
    <div class="container">
        <div class="searchBar-container">
            <input name="search-filter" class="searchBar" type="text" v-model="searchFilter"
                placeholder="Search Plants" />
        </div>
        <div class="row">
            <!-- for each plant, v-for for a card -->
            <div class="col-12 col-md-2 card shadow p-3 mb-5 bg-white rounded"
            v-on:mouseover="hover=true" v-on:mouseleave="hover=false" 
            v-for="plant in filteredPlants" v-bind:key="plant.plantId">
                <button class="icon"  v-if="$store.state.token != ''" v-on:click.prevent="savePlant(plant)">+</button>
>>>>>>> 276d6d5dc74a7653d69c71466cbf8efb5da56cea
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
            hover: false

        }
    },

    methods: {
        savePlant(plant) {
            PlantService.addPlant(plant);


        }
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

.card {
    margin: 15px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.plantCard {
    display: flex;
    /* flex-direction: column; */
    width: 300px;
    height: 50vh;
    border: 2px solid green;
    background-color: rgb(201, 201, 201);
    margin: 5px;
    align-items: center;
    justify-content: center;
}

#plant-image-container {
    /* display: flex;
    flex-direction: column; */
    /* justify-content:stretch; */
}

.card-text {
    display: flex;
    flex-direction: column;
    justify-content: center;
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
    margin:0;
    /* margin-left: auto;
    margin-right: auto; */
    padding-top: 0px;
    width: 100%;
}

.icon {
    position: relative;
    top: 5px;
    left: 85%;
    background-color: green;
    color: white;
    border-radius: 20%;
    width: 30px;
    height: 30px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    font-size: 1.5rem;
}

.icon:hover {
    background-color: #155f15;
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