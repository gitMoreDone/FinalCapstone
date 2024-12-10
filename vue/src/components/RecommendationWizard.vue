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
            <div v-show="showRecommendations" class="recommendations">
                <h1>Here are your recommendations: </h1>
                <div class="card col-12 col-md-2 shadow p-3 mb-5 bg-white rounded" 
                v-for="(plant,index) in recommendedPlants" v-bind:key="index"
                v-on:mouseover="showButton(index)" v-on:mouseleave="hideButton(index)" 
            ></div>
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
            savedPlants: [],
            //savedAnswers: [],
            //recommendedPlants: [],
            currentQuestion: 0,
            questionsArray: [
                {
                    question: 'What best describes your gardening ability right now?',
                    answers: [
                        {
                            choice: 'I can\'t keep a cactus alive',
                            id: 1,
                            plants: [1, 3, 5, 6, 9, 12, 14, 16, 18, 21, 22, 24, 25]
                        },
                        {
                            choice: 'I\'m getting the hang of this gardening thing.',
                            id: 2,
                            plants: [1, 2, 3, 4, 5, 6, 9, 11, 12, 13, 14, 16, 18, 21, 22, 23, 24, 25, 26]
                        },
                        {
                            choice: 'Call me the plant whisperer. I can grow anything!',
                            id: 3,
                            plants: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27]
                        }
                    ],
                    selected: null
                },
                {
                    question: 'What are you interested in planting? (Select all that apply)',
                    answers: [
                        {
                            choice: 'Vegetable',
                            id: 1,
                            plants: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                        },
                        {
                            choice: 'Fruit',
                            id: 2,
                            plants: [21, 22, 23, 24, 25, 26, 27]
                        },
                        {
                            choice: 'Herbs',
                            id: 3,
                            plants: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
                        }
                    ],
                    selected: null
                },
                {
                    question: 'How much sunlight will the planted area get?',
                    answers: [
                        {
                            choice: 'Mostly Shaded.',
                            id: 1,
                            plants: [4, 8, 9, 14, 15, 18, 19, 20]
                        },
                        {
                            choice: 'Some sunlight.',
                            id: 2,
                            plants: [5, 6, 12, 13, 16, 17, 26]
                        },
                        {
                            choice: 'Sunny all day.',
                            id: 3,
                            plants: [1, 2, 3, 7, 10, 11, 21, 22, 23, 24, 25, 27]
                        }
                    ],
                    selected: null
                },
                {
                    question: 'What climate will it be planted in?',
                    answers: [
                        {
                            choice: 'Cold',
                            id: 1,
                            plants: [5, 9, 15, 16, 17, 18, 19]
                        },
                        {
                            choice: 'Warm',
                            id: 2,
                            plants: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27]
                        },
                        {
                            choice: 'Hot',
                            id: 3,
                            plants: [7, 10, 12, 21, 26]
                        }
                    ],
                    selected: null
                },
                {
                    question: 'How much space do you have to garden?',
                    answers: [
                        {
                            choice: 'Little: 100 - 200 square feet',
                            id: 1,
                            plants: [1, 2, 9, 11]
                        },
                        {
                            choice: 'Enough: 200 - 400 square feet',
                            id: 2,
                            plants: [15, 23]
                        },
                        {
                            choice: 'Large: 400 - 800 square feet',
                            id: 3,
                            plants: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27]
                        }
                    ],
                    selected: null
                }
            ],
        };
    },
    methods: {
        getSavedPlants() {
            PlantService.getSavedPlants(this.$store.state.user.id).then((response) => {
                this.savedPlants = response.data;
            }).catch((error) => {
                console.error("Error Fetching Saved Plants", error);
                this.$router.push({ name: 'notFound' });
            });
        },
        filterByAnswers() {
            const selectPlants = this.plants;
            return selectPlants
        },
        selectAnswer(index) {
            this.questionsArray[this.currentQuestion].selected = index;
        
        },
        goToNextQuestion() {
            if (this.currentQuestion < this.questionsArray.length - 1) {
                this.currentQuestion++;
            }
            else{
                this.showQuiz = false;
                this.showRecommendations = true;
                //this.savedAnswers=this.filterByAnswers();
            }
        },
        resetQuiz() {
            this.questionsArray.forEach(question => {
                question.selected = null;
            });
            this.currentQuestion = 0;
        }
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
</style>
