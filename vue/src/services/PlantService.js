import axios from 'axios';


export default {
    getPlantById(id) {

        return axios.get(`/plants/${id}`);
    },
    getPlants() {
        const plants = axios.get('/plants');
        return plants;
    },
    getGardenPlants() {
        const gardenPlants = axios.get('/garden');
        return gardenPlants;
    },
    addPlant(plant) {
        return axios.post('/garden', plant);
    },
    removePlant(plantId){
        return axios.delete(`/garden/${plantId}`)
    },
    updatePlant(gardenPlant){
        return axios.put('/garden', gardenPlant)
    }
    

}