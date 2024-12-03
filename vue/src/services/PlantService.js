import axios from 'axios';

const service = axios.create({
  baseURL: import.meta.env.VITE_REMOTE_API
});


export default {
    getPlantById(id){
        console.log(id)
        return service.get(`/plants/${id}`)
    },
    getPlants(){
        const plants = service.get('/plants');
        return plants
    }


}