<template>
        <plant-search v-bind:plants="plants"/>
</template>


<script>
import PlantSearch from '../components/PlantSearch.vue';
import PlantService from '../services/PlantService';

export default {
    components: {
        PlantSearch
    },
    data(){
        return {
            plants: [],
        }
    },
    methods: {
        getPlants(){
            
            PlantService.getPlants().then( response => {
                const plantArray=response.data;
                this.plants=plantArray;
                
            })
            .catch (() => {
                this.$router.push({ name: 'notFound' });
            } )

        }
    },

    created(){
        this.getPlants();
    }
    
    
}

</script>


<style scoped>

</style>