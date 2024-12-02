<template>
    <div id="cardContainer">
        <!-- for each plant, v-for for a card -->
        <div class="plantCard" v-for="plant in filteredPlants" v-bind:key="plant.id">
            <div>
                <img v-bind:src=plant.image v-bind:alt=plant.name>
            </div>
            <div>
                <router-link class="plant-name" v-bind:to="{name: 'plantDetails', params: {id:plant.id}}">{{plant.name}}</router-link>
                <h4>{{ plant.type }}</h4>
            </div>

        </div>
    </div>
</template>

<script>


export default {
    data() {
        return {
            searchFilter: '',
            plants: [
            {
            "id": 1,
            "name": "Rose",
            "type": "Flowering Plant"
        },
        {
            "id": 2,
            "name": "Lavender",
            "type": "Herb"
        },
        {
            "id": 3,
            "name": "Tomato",
            "type": "Vegetable"
        },
        {
            "id": 4,
            "name": "Tulip",
            "type": "Flowering Plant"
        },
        {
            "id": 5,
            "name": "Basil",
            "type": "Herb"
        }
            ]
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
</style>