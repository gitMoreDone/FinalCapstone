<template>
    <div class="container">
        <div class="back-button-container">
            <i class="back-button bi bi-arrow-left-square-fill" 
                style="font-size: 3rem; color: #679436;" 
                v-on:click="goBack()"
                ></i>
        </div>
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
            <transition name="fade">
                <div v-if="showAddedPopup" class="popup-message lexend-header-font">
                    Garden Updated
                </div>
            </transition>
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
                <div class="plant-properties-container">
                    <div class="plant-property">
                        <img src="/public/Water_Level.png" alt="water level" />
                        <div class="plant-property-description">
                            <strong>Water Needed </strong>
                            <span>{{ currentPlant.waterLevel }} inches/week</span>
                        </div>
                    </div>
                    <div class="plant-property">
                        <img src="/public/Light_Level.png" alt="Light Level" />
                        <div class="plant-property-description">
                            <strong>Light Level </strong>
                            <span>{{ lightLevel }}</span>
                        </div>
                    </div>
                    <div class="plant-property">
                        <img src="/public/Difficulty_Level.png" alt="difficulty level" />
                        <div class="plant-property-description">
                            <strong>Difficulty </strong>
                            <span>{{ difficultyLevel }}</span>
                        </div>
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
                <div class="hardiness-zone">
                    <strong>{{ currentPlant.plantName }}: {{ currentPlant.plantZone }}</strong>
                </div>
                <div class="zone-map-container">
                    <img class="map-image" v-bind:src="zoneMap">
                </div>
            </div>
        </div>
        <div class="add-button-container">
            <i class="add-button bi bi-plus-square-fill" 
                v-if="$store.state.token != ''" 
                style="font-size: 3rem; color: #679436;" 
                v-on:click="savePlant(currentPlant)"
                ></i>
            <i class="bi bi-printer-fill" style="font-size: 3rem; color: #679436;" @click="printPage"></i>
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
            zoneMap: 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733505704/zone_map_lswoek_c_pad_ar_1_1_b7mu4a.webp',
            thumbnails: [],
            activeTab: 'details',
            gardenPlants: [],
            showAddedPopup: false
        };
    },
    methods: {
        printPage() {
            window.print();
        },
        changeImage(image, index) {
            this.thumbnails[index] = this.mainImage;
            this.mainImage = image;
        },
        changeTab(tabName) {
            this.activeTab = tabName;
        },
        getPlant(id) {
            PlantService.getPlantById(id).then(response => {
                this.currentPlant = response.data;
                this.mainImage = this.currentPlant.plantImage1;
                this.thumbnails[0] = this.currentPlant.plantImage2;
                this.thumbnails[1] = this.currentPlant.plantImage3;
            }).catch(() => {
                this.$router.push({ name: 'notFound' });
            });
        },
        savePlant(plant) {
            const existingPlant = this.gardenPlants.find((gardenPlant) => gardenPlant.plant.plantId === plant.plantId);
            if (existingPlant) {
                existingPlant.quantity += 1;
                PlantService.updatePlant(existingPlant);
            } else {
                PlantService.addPlant(plant);
            }
            this.showPopupMessage();
        },
        goBack() {
            this.$router.go(-1);
        },
        getPlantsInGarden() {
            PlantService.getGardenPlants().then((response) => {
                const gardenPlantArray = response.data;
                this.gardenPlants = gardenPlantArray;
            }).catch((error) => {
                console.error("Error Fetching Saved Plants", error);
                this.$router.push({ name: 'notFound' });
            });
        },
        showPopupMessage() {
            this.showAddedPopup = true;
            setTimeout(() => {
                this.showAddedPopup = false;
            }, 1500);
        }
    },
    computed: {
        lightLevel() {
            if (this.currentPlant.lightLevel == 1) {
                return "Low";
            } else if (this.currentPlant.lightLevel == 2) {
                return "Moderate";
            } else if (this.currentPlant.lightLevel == 3) {
                return "High";
            } else return "N/A";
        },
        difficultyLevel() {
            if (this.currentPlant.difficultyLevel <= 2) {
                return "Low";
            } else if (this.currentPlant.difficultyLevel === 3) {
                return "Moderate";
            } else if (this.currentPlant.difficultyLevel < 3) {
                return "High";
            } else return "N/A";
        }
    },
    created() {
        this.getPlant(this.$route.params.id);
        if(this.$store.state.token != ''){
        this.getPlantsInGarden();
        }
    },
};
</script>

<style scoped>
.plant-properties-container {
    display: flex;
    flex-direction: column;
    gap: 15px;
    margin-top: 20px;
}

.plant-property {
    display: flex;
    align-items: center;
    gap: 10px;
}

.plant-property img {
    width: 30px;
    height: 30px;
}

.plant-property-description {
    display: flex;
    flex-direction: column;
}

.container {
    display: flex;
    justify-content: space-between;
    padding: 20px;
    align-items: stretch;
    min-height: 84.8vh;
    max-width: 100vw;
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

.hardiness-zone{
    display: flex;
    justify-content: center;
}
.zone-map-container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: auto;
    height: 60vh;
    overflow: hidden;
    padding-bottom: 30px;
}
.map-image {
    max-width: 100%;
    height: auto;
    object-fit: contain;
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
    position: relative;
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
    font-size: large;
    margin-bottom: 10px;
}

.details-content p,
.care-content p {
    font-size: large;
    line-height: 1.5;
}

.back-button-container {
    display: flex;
    width: 10vw;
    justify-content: end;
    align-items: flex-start;
    line-height: 0;
}

.add-button-container {
    display: flex;
    width: 10vw;
    justify-content: left;
    align-items: flex-start;
    line-height: 0;
    flex-direction: column;
    margin-left: 10px;
}

.back-button {
    vertical-align: middle;
    display: inline-block;
    cursor: pointer;
    margin-right: 5px;
}

.add-button {
    vertical-align: middle;
    display: inline-block;
    margin-left: 5px;
    cursor: pointer;
}

.bi-printer-fill {
    bottom: 10px;
    right: 10px;
    cursor: pointer;
    margin-top: 20px;
    margin-left: 5px;
}

.popup-message {
    position: fixed;
    top: 10%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #f08A4B;
    color: white;
    padding: 10px 20px;
    border-radius: 8px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    z-index: 300;
    font-size: 16px;
    text-align: center;
    opacity: 0.9;
}

.fade-enter-active,
.fade-leave-active {
    transition: opacity 0.5s;
}

.fade-enter,
.fade-leave-to {
    opacity: 0;
}

@media print {
    * {
        margin: 0;
        padding: 0;
    }

    .bi-printer-fill {
        visibility: hidden;
    }

    .back-button {
        visibility: hidden;
    }

    .add-button {
        visibility: hidden;
    }

    .tabs {
        visibility: hidden;
    }
}

@media (max-width: 768px) {
    .container {
        flex-direction: column;
        padding: 10px;
    }

    .left-container,
    .right-container {
        width: 100%;
        margin: 0;
    }

    .main-image img {
        max-height: 200px;
    }

    .thumbnails {
        flex-wrap: wrap;
        gap: 10px;
    }

    .thumbnail {
        width: 30%;
        height: auto;
    }

    .tabs {
        flex-direction: column;
        gap: 10px;
    }

    .tab-button {
        font-size: 0.9rem;
    }

    .tab-content {
        padding: 5px;
    }

    .back-button-container,
    .add-button-container {
        justify-content: center;
        width: 100%;
    }

    .back-button,
    .add-button {
        font-size: 2rem;
    }
}

@media (max-width: 480px) {
    .tab-button {
        padding: 5px;
        font-size: 0.8rem;
    }

    .details-content p,
    .care-content p {
        font-size: 0.85rem;
    }
}
</style>
