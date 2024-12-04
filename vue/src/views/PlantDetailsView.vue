<template>  

    <plant-details v-bind:currentPlant="currentPlant" />
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

    methods: {
        getPlant(id){
            // console.log(id + "here")
            PlantService.getPlantById(id).then( response => {
                this.currentPlant=response.data;

            })
        }
    },
    components: {
        PlantDetails
    },
    created(){
        this.getPlant(this.$route.params.id);
    }

}
</script>