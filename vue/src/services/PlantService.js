import axios from 'axios';

const service = axios.create({
    baseURL: import.meta.env.VITE_REMOTE_API
}
);


export default {
    getPlantById(id) {

        return service.get(`/plants/${id}`);
    },
    getPlants() {
        const plants = service.get('/plants');
        return plants;
    },
    getSavedPlants(userId, token) {


        const plants = service.get(`/garden/${userId}`, { headers: { Authorization: `Bearer ${token}` } });
        return plants;
    },
    addPlant(plant) {
        
        return service.post('/garden', plant);
    }

}