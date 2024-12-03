<template>
    <div id="cardContainer">
        <!-- for each plant, v-for for a card -->
        <div class="plantCard" v-for="plant in filteredPlants" v-bind:key="plant.plantId">
            <div id="plant-image-container">
                <img class ="plant-image" v-bind:src=plant.plantImage v-bind:alt=plant.plantName>
            </div>
            <div>
                <router-link class="plant-name" v-bind:to="{name: 'plantDetails', params: {id:plant.plantId}}">{{plant.plantName}}</router-link>
                <h4>{{ plant.plantType }}</h4>
            </div>

        </div>
    </div>
</template>

<script>


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
    computed: {
        filteredPlants() {
            const selectPlants = this.plants;

            return selectPlants.filter((plant) => {
                return this.searchFilter == '' ? true : plant.name.toLowerCase().includes(this.searchFilter.toLowerCase());
            });
        }
    },
    created() {
        //Call service to get plants
    }
}

</script>



<style scoped>
#cardContainer {
    display:flex;
    flex-direction: row;
    width: 100vw;
    justify-content: space-evenly;

}

.plantCard {
    display: flex;
    flex-direction: column;
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
    justify-content: center;
}

.plant-image {
    display: flex;
    width: 80%;
    
}
</style>