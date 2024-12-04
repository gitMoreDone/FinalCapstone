<template>
    <div class="container">
        <div class="left-container">
            <div class="main-image">
                <img id="mainImage" v-bind:src="mainImage" alt="Main Image">
            </div>
            <div class="thumbnails">
                <img v-bind:src="thumbnails[0]" v-on:click="changeImage(thumbnails[0], 0)" alt="Thumbnail 1" class="thumbnail">
                <img v-bind:src="thumbnails[1]" v-on:click="changeImage(thumbnails[1], 1)" alt="Thumbnail 2" class="thumbnail">
            </div>
        </div>
        <div class="right-container">
            <div class="tabs">
                <button class="tab-button" :class="{active: activeTab === 'details'}" v-on:click="changeTab('details')">Details</button>
                <button class="tab-button" :class="{active: activeTab === 'care'}" v-on:click="changeTab('care')">Care</button>
                <button class="tab-button" :class="{active: activeTab === 'zone'}" v-on:click="changeTab('zone')">Zone Map</button>
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
export default {
  data() {
    return {
      mainImage: this.currentPlant.plantImage1, 
      zoneMap: 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733324616/2023_vv17fy.webp',
      thumbnails: [
        this.currentPlant.plantImage2,
        this.currentPlant.plantImage3,
      ],
      activeTab: 'details'  
    };
  },
  props: {
    currentPlant: {type: Object, required: true }
  },
  methods: {

    changeImage(image, index) {
      this.thumbnails[index] = this.mainImage;
      this.mainImage = image;
    },
    changeTab(tabName) {
      this.activeTab = tabName;
    },
  },
};
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.zone-map-container{
    display: flex;
    justify-content: center;
    margin-top: 80px;
}

.map-image{
    width: 75%;
}

.plant-care{
    display: flex;
    justify-content: center;
    text-align: center;
    margin-top: 20px;
}

.plant-details{
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.fact-container{
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin-top: 5px;
    text-align: center;
    align-items: center;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
}

.container {
    display: flex;
    justify-content: space-between;
    padding: 20px;
    
}

.left-container {
    width: 60%;
}

.main-image img {
    width: 100%;
    max-height: 400px;
    object-fit: cover;
}

.thumbnails {
    display: flex;
    justify-content: center;
    padding: 10px;
    margin-top: 10px;
    gap: 10px;
}

.thumbnail {
    width: 70px;
    height: 70px;
    object-fit: cover;
    cursor: pointer;
    transition: opacity 0.3s;
}

.thumbnail:hover {
    opacity: 0.7;
}

.right-container {
    width: 35%;
    height:60vh;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    background-color: white;
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
    display: none;
}

.tab-content.active {
    display: block;
}

.details-content,
.care-content {
    padding: 10px;
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