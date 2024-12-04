<!-- <template>
    <div class="container">
        <div class="plant-gallery">
            <div class="main-image-container">
                <img class="main-image" v-bind:src="currentPlant.plantImage1" /> 
            </div>
            <div class="thumbnail-images">
                <div>
                    <img class="sub-image" v-bind:src="currentPlant.plantImage2"/>
                </div>
                <div>
                    <img class="sub-image" v-bind:src="currentPlant.plantImage3"/>
                </div>
                <div>
                    <img class="sub-image" src="https://res.cloudinary.com/dwdijh29x/image/upload/v1733324616/2023_vv17fy.webp"/>
                </div>
            </div>
        </div>
        <div class="plant-info">
            <div class="plant-details">
                <h3>{{ currentPlant.plantName }}</h3>
                <p> {{ currentPlant.plantDescription }}</p>
            </div>
            <div class="plant-care">  
                <div>Details About {{ currentPlant.plantName }}'s</div>
                <ul>
                    <li>Scientific Name: {{ currentPlant.scientificName }}</li>
                    <li>Plant Type: {{ currentPlant.plantType }}</li>
                    <li>Weekly Water intake: {{ currentPlant.waterLevel }}</li>
                    <li>Daily Sunglight Needs: {{ currentPlant.lightLevel }}</li>
                    <li>Plant Care: {{ currentPlant.plantCareSteps }}</li>
                </ul>
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
    text-align: center;
    align-items: center;
    margin-right:auto;
    margin-bottom: auto;
}

.plant-care {
    font-size: larger;
    display: flex;
    flex-direction: column;    
    align-items: center;
    margin-left: 20px;
    width: 50%;
    background-color: brown;
}

.sub-image{
    margin-top: 15px;
    width: 30px;
    height: 30px;
}
</style> -->
<template>
    <div class="container">
        <div class="left-container">
            <div class="main-image">
                <img id="mainImage" v-bind:src="currentPlant.plantImage1" alt="Main Image">
            </div>
            <div class="thumbnails">
                <img v-bind:src="currentPlant.plantImage2" alt="Thumbnail 1" class="thumbnail">
                <img v-bind:src="currentPlant.plantImage3" alt="Thumbnail 2" class="thumbnail">
                <img v-bind:src="zoneMap" alt="Thumnail 3" class="thumbnail">
            </div>
        </div>
        <div class="right-container">
            <div class="tabs">
                <button class="tab-button">Details</button>
                <button class="tab-button">Care</button>
            </div>

            <div class="tab-content details-content" id="details">
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

            <div class="tab-content care-content active" id="care">
                <div class="plant-details">
                    <h3>Care Details</h3>
                    <div class="plant-care">
                        <p>{{ currentPlant.plantCareSteps }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
  data() {
    return {
      mainImage: '', 
      zoneMap: 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733324616/2023_vv17fy.webp',
      thumbnails: [
        this.currentPlant.plantImage1,
        this.currentPlant.plantImage2,
        this.currentPlant.plantImage3,
      ],
      activeTab: 'care'  
    };
  },
  props: {
    currentPlant: {type: Object, required: true }
  },
  methods: {
    changeImage(image) {
      this.mainImage = image;
    },
    changeTab(tabName) {
      this.activeTab = tabName;
    }
  }
};

</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
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
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
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
    border-bottom: 2px solid #007bff;
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