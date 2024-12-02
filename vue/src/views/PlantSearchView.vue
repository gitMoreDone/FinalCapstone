<template>
    <div>
        <plant-search v-bind:plants="plants"/>
    </div>
</template>


<script>
import PlantSearch from '../components/PlantSearch.vue';
import PlantService from '../services/PlantService';

export default {
    components: {
        PlantSearch
    },
    data(){
        return {plants: []
        }
    },
    methods: {
        getPlants(){
            PlantService.getPlants().then( response => {
                this.plants=response.data;
            
            })
        }
    },

    created(){
        this.getPlants();
    }
    
    
}

</script>


<style scoped>

</style>