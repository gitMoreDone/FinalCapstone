<template>
    <div>
        <my-garden v-bind:savedPlants="savedPlants" />
    </div>
</template>


<script>
import MyGarden from '../components/MyGarden.vue';
import PlantService from '../services/PlantService';

export default {
    components: {
        MyGarden
    },
    data() {
        return {
            savedPlants: []
        }
    },
    methods: {
        getSavedPlants() {
            
                PlantService.getSavedPlants(this.$store.state.user.id).then(response => {
                    const plantArray = response.data;
                    this.savedPlants = plantArray;
                }); 
        }
    },


    mounted() {
        this.getSavedPlants();
    }


}
</script>


<style scoped></style>