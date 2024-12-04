<template>
    <div>
        <my-garden />
    </div>
</template>


<script>
import MyGarden from '../components/MyGarden.vue';
import PlantService from '../services/PlantService';

export default {
    components: {
        MyGarden
    }
}
</script>


<style scoped></style>