<template>  

    <plant-details v-bind:currentPlant="currentPlant" />
</template>

<script>
import PlantDetails from '../components/PlantDetails.vue';

export default {

    data(){
        return {
            currentPlant: {}
        }
    },

    methods: {
        
    },
    components: {
        PlantDetails
    }

}
</script>