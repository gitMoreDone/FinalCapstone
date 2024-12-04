import axios from 'axios';


export default {
    getPlantById(id) {

        return axios.get(`/plants/${id}`);
    },
    getPlants() {
        const plants = axios.get('/plants');
        return plants;
    },
    getSavedPlants(userId) {


        const plants = axios.get(`/garden/${userId}`);
        return plants;
    },
    addPlant(plant) {


        return axios.post('/garden', plant);
    },
    removePlant(plantId){
        return axios.delete(`/garden/${plantId}`)
    }

}