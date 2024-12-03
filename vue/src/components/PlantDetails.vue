<template>
    <div class="container">
        <div class="plant-gallery">
            <div class="main-image-container">
                <img class="main-image" v-bind:src="currentPlant.plantImage" /> 
            </div>
            <div class="thumbnail-images">
                <div>PlaceHolder  </div>
                <div>PlaceHolder  </div>
                <div>PlaceHolder  </div>
            </div>
            
        </div>
        <div class="plant-info">
            <div class="plant-details">
                <h3>{{ currentPlant.plantName }}</h3>
                <h4>{{ currentPlant.scientificName }}</h4>
                <h4>{{ currentPlant.plantType }}</h4>
                add any additional details here
            </div>
            <div class="plant-care">  
                <div>PLACEHOLDER</div>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
                    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco 
                    laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in 
                    voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
                    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            </div>
                
        
        </div>
            
    </div>
</template>


<script>   
export default {
    props: {
        currentPlant: {type: Object, required: true }
        // enableAdd: {
        //     type: Boolean,
        //     default: false
        // }
        // ['currentPlant']
}
}

</script>


<style scoped>
.container {
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
    align-items: center;
    width: 100vw;
    background-color: aqua;
}
.main-image-container {
    display:flex;
    justify-content: center;
}
.main-image {
    width: 80%;
}

.plant-gallery {
    display: flex;
    flex-direction: column;
    justify-content: center;
    border: solid rgb(151, 103, 15) 5px;
    padding: 10px;
    margin-right: 50px;
    background-color: blue;
}
.thumbnail-images {
    display:flex;
    justify-content: space-evenly;
    padding: 3px;
}

.plant-info {
    display: flex;
    align-items: center;
    background-color: blueviolet;
    justify-content: space-evenly;

}

.plant-details {
    display: flex;
    flex-direction: column;
    background-color: bisque;
    align-items: center;
}

.plant-care {
    display: flex;
    flex-direction: column;    
    align-items: center;
    margin-left: 20px;
    width: 24%;
    background-color: brown;
}
</style>