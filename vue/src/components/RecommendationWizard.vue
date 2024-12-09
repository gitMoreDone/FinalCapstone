<template>
    <div class="container">
        <div class="wizard-box">
            <div class="question current">
                <h2>{{ questionsArray[currentQuestion].question }}</h2>
            </div>
            <div class="answers">
                <span v-for="(answer, index) in questionsArray[currentQuestion].answers" :key="index"
                    :class="['answer-block', { selected: questionsArray[currentQuestion].selected === index }]"
                    v-on:click="selectAnswer(index)">
                    {{ answer }}
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
    </div>
</template>

<script>
import PlantService from '../services/PlantService';

export default {
    data() {
        return {
            savedPlants: [],
            currentQuestion: 0,
            questionsArray: [
                {
                    question: 'What best describes your gardening ability right now?',
                    answers: [
                        'I can\'t even keep a cactus alive.',
                        'I think I can handle something easy!',
                        'I\'m getting the hang of this gardening thing.',
                        'My green thumb is ready for something challenging!',
                        'Call me the plant whisperer. I can grow anything.'
                    ],
                    selected: null
                },
                {
                    question: 'What are you interested in planting? (Select all that apply)',
                    answers: [
                        'Vegetable',
                        'Fruit',
                        'Herb'
                    ],
                    selected: null
                },
                {
                    question: 'How much sunlight will the planted area get?',
                    answers: [
                        'Little',
                        'Some',
                        'Plenty'
                    ],
                    selected: null
                },
                {
                    question: 'Take a look at this Hardiness map. What zone will you plant be in?',
                    answers: [
                        'Super Cold',
                        'Cold',
                        'Warm',
                        'Hot'
                    ],
                    selected: null
                },
                {
                    question: 'How frequently can you care for your plant?',
                    answers: [
                        'Once or twice a week',
                        'Every other day',
                        'Daily'
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
        filterByQuiz() {

        },
        selectAnswer(index) {
            this.questionsArray[this.currentQuestion].selected = index;
        },
        goToNextQuestion() {
            if (this.currentQuestion < this.questionsArray.length - 1) {
                this.currentQuestion++;
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
