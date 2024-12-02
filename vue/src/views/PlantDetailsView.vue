<template>  

    <plant-details v-bind:currentPlant="getPlant" />
</template>

<script>
import PlantDetails from '../components/PlantDetails.vue';

export default {

    components: {
        PlantDetails
    },
    computed: {
        getPlant(){
            const plantId = this.$route.params.id;
            console.log(plantId);
            let plant = this.$store.state.plants.find((plant) => plant.id=plantId);
            console.log(plant.name);
            
            return plant;
        }
    }

}
</script>