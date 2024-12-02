<template>  

    <plant-details v-bind:currentPlant="getPlant" />
</template>

<script>
import PlantDetails from '../components/PlantDetails.vue';
import PlantService from '../services/PlantService';

export default {

    data(){
        return {
            currentPlant: {}
        }
    },

    method: {
        getPlant(id){
            PlantService.getPlantById(id).then( response => {
                this.plant=response.data
            })
        }
    },
    components: {
        PlantDetails
    },
    created(){
        this.getPlant(this.$route.params.id)
    }
    // computed: {
    //     getPlant(){
    //         const plantId = this.$route.params.id;
    //         console.log(plantId);
            
    //         let plant = this.$store.state.plants.find((plant) => plant.id=plantId);
            
            
    //         return plant;
    //     }
    // }

}
</script>