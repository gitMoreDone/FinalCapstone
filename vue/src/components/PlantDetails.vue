<template>

    <div class="container">
        <div class="left-container">
            <div class="main-image">
                <img id="mainImage" v-bind:src="mainImage" alt="Main Image">
            </div>
            <div class="thumbnails">
                <img v-bind:src="thumbnails[0]" v-on:click="changeImage(thumbnails[0], 0)" alt="Thumbnail 1"
                    class="thumbnail">
                <img v-bind:src="thumbnails[1]" v-on:click="changeImage(thumbnails[1], 1)" alt="Thumbnail 2"
                    class="thumbnail">
            </div>
        </div>
        <div class="right-container">
            <div class="tabs">
                <button class="tab-button" :class="{ active: activeTab === 'details' }"
                    v-on:click="changeTab('details')">Details</button>
                <button class="tab-button" :class="{ active: activeTab === 'care' }"
                    v-on:click="changeTab('care')">Care</button>
                <button class="tab-button" :class="{ active: activeTab === 'zone' }" v-on:click="changeTab('zone')">Zone
                    Map</button>
            </div>

            <div v-show="activeTab === 'details'" class="tab-content details-content active" id="details">
                <div class="plant-details">
                    <h3>{{ currentPlant.plantName }}</h3>
                    <p>{{ currentPlant.plantDescription }}</p>
                </div>
                <div class="fact-container">
                    <h2>Care Facts</h2>
                    <div class="detail-list">
                        <ul>
                            <li>Hardiness Zone: {{ currentPlant.plantZone }}</li>
                            <li>Watering: {{ currentPlant.waterLevel }} / weekly</li>
                            <li>Sunlight: {{ currentPlant.lightLevel }} / daily</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div v-show="activeTab === 'care'" class="tab-content care-content active" id="care">
                <div class="plant-details">
                    <h3>Care Details</h3>
                    <div class="plant-care">
                        <p>{{ currentPlant.plantCareSteps }}</p>
                    </div>
                </div>
            </div>
            <div v-show="activeTab === 'zone'" class="tab-content zone-map active" id="zone">
                <div class="zone-map-container">
                    <img class="map-image" v-bind:src="zoneMap">
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import PlantService from '../services/PlantService';


export default {
    data() {
        return {
            currentPlant: {},
            mainImage: '',
            zoneMap: 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733324616/2023_vv17fy.webp',
            thumbnails: [],
            activeTab: 'details'
        };
    },
    methods: {
        changeImage(image, index) {
            this.thumbnails[index] = this.mainImage;
            this.mainImage = image;
        },
        changeTab(tabName) {
            this.activeTab = tabName;
        },
        getPlant(id) {
            // console.log(id + "here")
            PlantService.getPlantById(id).then(response => {
                this.currentPlant = response.data;
                this.mainImage=this.currentPlant.plantImage1;
                this.thumbnails[0]=this.currentPlant.plantImage2;
                this.thumbnails[1]=this.currentPlant.plantImage3;
            })
            .catch (() => {
                this.$router.push({ name: 'notFound' });
            } )
        },
        
    },
    created(){
        this.getPlant(this.$route.params.id);  
    },
    
};
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.zone-map-container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: auto;
    height: 60vh;
    overflow: hidden;
}

.map-image {
    max-width: 100%;
    height: auto;
    object-fit: contain;

}

.plant-care {
    display: flex;
    justify-content: center;
    text-align: center;
    margin-top: 20px;
}

.plant-details {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.fact-container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin-top: 5px;
    text-align: center;
    align-items: center;
}


.container {
    display: flex;
    justify-content: space-between;
    padding: 20px;
    align-items: stretch;
    height: 82vh;

}

.left-container {
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    margin-bottom: auto;
    width: 33%;
    min-height: 65vh;
}

.main-image img {
    width: 100%;
    max-height: 300px;
    object-fit: cover;
    flex-shrink: 0;
}

.thumbnails {
    display: flex;
    justify-content: center;
    padding: 20px;
    gap: 25px;
    margin-bottom: auto;
}

.thumbnail {
    width: 50%;
    height: 50%;
    object-fit: cover;
    cursor: pointer;
    transition: opacity 0.3s;
}

.thumbnail:hover {
    opacity: 0.7;
}

.right-container {
    flex-direction: column;
    width: 66%;
    height: auto;
    min-height: 65vh;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    background-color: white;
    margin-bottom: auto;
    margin-left: 25px;
    overflow: hidden;
}

.tabs {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

.tab-button {
    background-color: #f0f0f0;
    padding: 10px;
    width: 100%;
    border: 1px solid #ddd;
    border-radius: 5px;
    text-align: center;
    cursor: pointer;
    transition: background-color 0.3s;
}

.tab-button:hover {
    background-color: #e2e2e2;
}

.tab-button.active {
    background-color: #fff;
    font-weight: bold;
    border-bottom: 2px solid rgb(27, 109, 27);
}

.tab-content {
    display: flex;
    flex-direction: column;
    flex-grow: 1;
    padding: 10px;
}

.tab-content.active {
    display: block;
}

.details-content,
.care-content {
    flex-direction: column;
    display: flex;
    flex-grow: 1;
}

.details-content h2,
.care-content h2 {
    font-size: 20px;
    margin-bottom: 10px;
}

.details-content p,
.care-content p {
    font-size: 16px;
    line-height: 1.5;
}
</style>