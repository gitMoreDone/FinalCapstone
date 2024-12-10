<template>
    <div class="container">
        <div class="wizard-box">
            <div v-show="showQuiz" class="quiz">
                <div class="question current">
                    <h2>{{ questionsArray[currentQuestion].question }}</h2>
                </div>
                <div class="answers">
                    <span v-for="(answer, index) in questionsArray[currentQuestion].answers" :key="index"
                        :class="['answer-block', { selected: questionsArray[currentQuestion].selected === index }]"
                        v-on:click="selectAnswer(index)">
                        {{ answer.choice }}
                    </span>
                </div>
                <div class="buttons">
                    <button class="next-btn" :disabled="questionsArray[currentQuestion].selected === null"
                        v-on:click="goToNextQuestion">
                        Next
                    </button>
                    <button class="reset-btn" v-on:click="resetQuiz">
                        Reset
                    </button>
                </div>
            </div>
            <div v-if="showRecommendations" class="recommendations">
                <div class="card-container">
                    <div 
                        class="card col-12 col-md-2 shadow p-3 mb-5 bg-white rounded"
                        v-for="(plant, index) in filteredPlants" 
                        :key="index" v-on:click="sendToDetails(plant)">
                        <h3>{{ plant.plantName }}</h3>
                        <img :src="plant.plantImage1" alt="Plant image" class="plant-image" />
                    </div>
                </div>
                <button class="retake" v-on:click="resetQuiz">Retake Quiz</button>
            </div>
        </div>
    </div>
</template>

<script>
import PlantService from '../services/PlantService';

export default {
    data() {
        return {
            showRecommendations: false,
            showQuiz: true,
            plants: [],
            currentQuestion: 0,
            selectedPlantType: null,
            questionsArray: [
                {
                    question: 'What best describes your gardening ability right now?',
                    answers: [
                        { choice: 'I can\'t keep a cactus alive', id: 1, plants: [1, 3, 5, 6, 9, 12, 14, 16, 18, 21, 22, 24, 25] },
                        { choice: 'I\'m getting the hang of this gardening thing.', id: 2, plants: [1, 2, 3, 4, 5, 6, 9, 11, 12, 13, 14, 16, 18, 21, 22, 23, 24, 25, 26] },
                        { choice: 'Call me the plant whisperer. I can grow anything!', id: 3, plants: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27] }
                    ],
                    selected: null
                },
                {
                    question: 'What are you interested in planting? (Select all that apply)',
                    answers: [
                        { choice: 'Vegetable', id: 1, plants: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] },
                        { choice: 'Fruit', id: 2, plants: [21, 22, 23, 24, 25, 26, 27] },
                        { choice: 'Herbs', id: 3, plants: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20] }
                    ],
                    selected: null
                },
                {
                    question: 'How much sunlight will the planted area get?',
                    answers: [
                        { choice: 'Mostly Shaded.', id: 1, plants: [4, 8, 9, 14, 15, 18, 19, 20] },
                        { choice: 'Some sunlight.', id: 2, plants: [5, 6, 12, 13, 16, 17, 26] },
                        { choice: 'Sunny all day.', id: 3, plants: [1, 2, 3, 7, 10, 11, 21, 22, 23, 24, 25, 27] }
                    ],
                    selected: null
                },
                {
                    question: 'What climate will it be planted in?',
                    answers: [
                        { choice: 'Cold', id: 1, plants: [5, 9, 15, 16, 17, 18, 19] },
                        { choice: 'Warm', id: 2, plants: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27] },
                        { choice: 'Hot', id: 3, plants: [7, 10, 12, 21, 26] }
                    ],
                    selected: null
                },
                {
                    question: 'How much space do you have to garden?',
                    answers: [
                        { choice: 'Little: 100 - 200 square feet', id: 1, plants: [1, 2, 9, 11] },
                        { choice: 'Enough: 200 - 400 square feet', id: 2, plants: [15, 23] },
                        { choice: 'Large: 400 - 800 square feet', id: 3, plants: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27] }
                    ],
                    selected: null
                }
            ]
        };
    },
    methods: {
        selectAnswer(index) {
            this.questionsArray[this.currentQuestion].selected = index;

            if (this.currentQuestion === 1) {
                this.selectedPlantType = this.questionsArray[1].answers[index].choice;
                console.log(this.selectedPlantType);
            }

            this.questionsArray[this.currentQuestion].answers[index].plants.forEach((p => {
                let matchId = p
                let currentPlant = this.plantCounts.find((e) => {
                    return e.plantId === matchId;
                });
                currentPlant.count++;
            }));        
        },
        goToNextQuestion() {
            if (this.currentQuestion < this.questionsArray.length - 1) {
                this.currentQuestion++;
            } else {
                this.showQuiz = false;
                this.showRecommendations = true;
            }
        },
        resetQuiz() {
            this.questionsArray.forEach(question => {
                question.selected = null;
            });
            this.currentQuestion = 0;
            this.showQuiz = true;
            this.showRecommendations = false;
        },
        getPlantList() {
            PlantService.getPlants().then((response) => {
                this.plants = response.data;
            }).catch((error) => {
                console.error("Error Fetching Saved Plants", error);
            });
        },
        sendToDetails(plant){
            this.$router.push({ name: 'plantDetails', params: { id: plant.plantId } })
        }
    },
    computed: {
        plantCounts(){
            const plantCounts = [];

            this.plants.forEach(plant => {
                plantCounts.push({
                    plantId: plant.plantId,
                    count: 0
                });
            });

            return plantCounts;
        },
        filteredPlants() {
            const topPlantIds = this.plantCounts;
            const sortedPlants = topPlantIds.sort((a, b) => b.count - a.count).map(plant => plant.plantId);

            console.log(sortedPlants.plants);
            return this.plants.filter(plant => sortedPlants.includes(plant.plantId) && plant.plantType === this.selectedPlantType);
        }
    },
    created() {
        this.getPlantList();
    }
};
</script>

<style scoped>
.container {
    min-height: 82.4vh;
    min-width: 80vw;
    align-content: center;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
}

.wizard-box {
    width: 60%;
    min-height: 50%;
    position: relative;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.25);
    overflow: hidden;
}

.question h2 {
    font-weight: 300;
    padding: 10px 0;
    margin: 0 0 20px;
    border-radius: 3px;
    font-size: 1.8em;
}

.answers {
    display: flex;
    flex-direction: column;
    gap: 10px;
    align-items: center;
    margin-top: 20px;
}

.answer-block {
    display: block;
    width: 100%;
    max-width: 300px;
    padding: 10px 20px;
    background-color: #CADABF;
    font-size: 1.2em;
    text-align: center;
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.answer-block.selected {
    background-color: #9ead94;
    font-weight: bold;
}

.answer-block:hover {
    background-color: #9ead94;
    transform: scale(1.05);
}

.answer-block:active {
    background-color: #bfd0b4;
}

.buttons {
    margin-top: 20px;
    display: flex;
    gap: 10px;
    justify-content: center;
}

.next-btn,
.reset-btn {
    background-color: #bfd0b4;
    border: solid;
    padding: 5px 20px;
    margin-top: 5px;
    border-radius: 3px;
    font-size: 1.2em;
    cursor: pointer;
    transition: all 0.3s ease;
}

.next-btn:hover,
.reset-btn:hover {
    background-color: #9ead94;
}

.next-btn:focus,
.reset-btn:focus {
    outline: none;
}

.next-btn[disabled] {
    opacity: 0.6;
    cursor: not-allowed;
}

.recommendations {
    text-align: center;
    margin-top: 20px;
}

.card-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);  /* Creates 3 columns */
    gap: 20px;  /* Adds space between cards */
    justify-items: center;
}

.card {
    width: 100%;
    max-width: 250px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    transition: transform 0.2s;
}

.card:hover {
    transform: scale(1.05);
    cursor: pointer;
}

.plant-image {
    width: 100%;
    height: auto;
    border-radius: 10px;
    margin-top: 10px;
}

.retake {
    margin-top: 20px;
    background-color: #bfd0b4;
    border: solid;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 1.2em;
    cursor: pointer;
    transition: all 0.3s ease;
    text-align: center;
    display: block;
    width: 100%;
    max-width: 200px;
    margin-left: auto;
    margin-right: auto;
}

.retake:hover {
    background-color: #9ead94;
}

.retake:focus {
    outline: none;
}
</style>
