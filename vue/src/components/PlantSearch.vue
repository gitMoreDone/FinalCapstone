<template>
    <div class="container">
        <div class="searchBar-container">
            <input name="search-filter" class="searchBar" type="text" v-model="searchFilter" placeholder="Search Plants" /> 
        </div>
        <div class="row">

            <!-- for each plant, v-for for a card -->
            <div class="col-12 col-md-2 card" v-for="plant in filteredPlants" v-bind:key="plant.plantId">

                <div id="plant-image-container">
                    <img class="plant-image" v-bind:src=plant.plantImage1 v-bind:alt=plant.plantName>
                </div>
                <div>
                    <button class="button_plus" v-on:click="savePlant(plant)">
                        <i class="bi bi-plus-square"></i>
                    </button>
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


        }
    },
    methods: {
        savePlant(plant){
            PlantService.addPlant(plant);
            console.log('hi');
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
.searchBar-container{
    display: flex;
    justify-content: center;
}
/* .searchBar {

} */


.card {
    margin:15px;
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
    display: flex;
    flex-direction: column;
    justify-content: center;
}
.card-text {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
.bi-plus-square {
    color:green;
}
.bi {
    color:green;
}

.plant-name {
    font-size: large;
    text-decoration: none;
    color:black;
    font-weight:bold;
}
.plant-type {
    font-size: small;
}

.plant-image {
    display: flex;
    margin-left: auto;
    margin-right: auto;
    padding-top: 5px;
    width: 60%;

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