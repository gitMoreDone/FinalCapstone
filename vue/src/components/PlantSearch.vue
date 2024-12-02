<template>
    <div id="cardContainer">
        <!-- for each plant, v-for for a card -->
        <div class="plantCard" v-for="plant in filteredPlants" v-bind:key="plant.id">
            <div>
                <img v-bind:src=plant.image v-bind:alt=plant.name>
            </div>
            <div>
                <h3>{{ plant.name }}</h3>
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
                    "name": "Rose",
                    "type": "Flowering Plant"
                },
                {
                    "name": "Lavender",
                    "type": "Herb"
                },
                {
                    "name": "Tomato",
                    "type": "Vegetable"
                },
                {
                    "name": "Tulip",
                    "type": "Flowering Plant"
                },
                {
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