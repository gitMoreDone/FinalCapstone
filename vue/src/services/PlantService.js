import axios from 'axios';

const service = axios.create({
  baseURL: import.meta.env.VITE_REMOTE_API
});


export default {
    getPlantById(id){
        return service.get(`/plants/${id}`)
    },
    getPlants(){
        return service.get('/plants');
    }


}