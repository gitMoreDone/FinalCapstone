<template>
  <h1 class="mb-4">
    <span>G</span><span style="color: #679436">AI</span><span>A</span>
  </h1>

  <form class="mb-5 question-form" @submit.prevent="fetchAnswer" @keydown.enter.prevent="fetchAnswer">
    <div class="question-box">
      <textarea 
         v-bind:placeholder="plantNamePlaceholder"
        name="question" 
        id="question" 
        cols="30" 
        rows="10" 
        v-model="question">
      </textarea>
    </div>
    <button type="submit" :disabled="!question" class="submit-button">
      {{ `${isLoading ? 'thinking...' : 'Ask'}` }}
    </button>
  </form>

  <div class="answer-box" v-show="isLoading || displayAnswer != ''">
    <p v-html="displayAnswer"></p> 
  </div>
</template>


<script setup>
import { ref } from 'vue'
import { useGetGenerativeModelGP } from '../composables/userGetGenerativeModelGP'


const plantNamePlaceholder = "Ask me about your plant!" ;
const question = ref("");
const fullAnswer = ref(''); 
const displayAnswer = ref(''); 
const isLoading = ref(false);
const questionPreface = 
`Please respond to the name GAIA. You will be asked a question. Answer it only if it is related to plants. No other subject matter. If it doesn't please respond appropriately to their question.
   Return the response to the question in HTML format using the following template, using none or any amount of list items:
  <h4>Example Title</h4>
  <span>Example Introduction</span>
  <span>Example Explanation</span>
  <strong>Topic Heading</strong>
  <ul>
    <li>Example 1</li>
    <li>Example 2</li>
    <li>Example 3</li>
  </ul>
  <span>Conclusion</span>
  Question: 
`

const typeAnswer = (text) => {
  displayAnswer.value = '' 
  let index = 0

  const interval = setInterval(() => {
    if (index < text.length) {
      displayAnswer.value += text[index] 
      index++
    } else {
      clearInterval(interval) 
    }
  }, 10) 
}

const fetchAnswer = async () => {
  displayAnswer.value = ''
  isLoading.value = true

  try {
    fullAnswer.value = await useGetGenerativeModelGP(questionPreface + question.value)
    typeAnswer(fullAnswer.value)
  } catch (error) {
    console.log({ error })
  } finally {
    isLoading.value = false
    question.value = ''
  }
}
</script>


<style lang="scss" scoped>

h1 {
  font-size: xx-large;
}


.question-form {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
}

.question-box {
  display: flex;
  align-content: center;
  width: 100%;
  max-width: 600px;
  max-height: 100px;
  margin-bottom: 10px;
}

textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
  line-height: 1.5;
  min-height: 50px;
  max-height: 100px;
}

.submit-button {
  padding: 10px 20px;
  border: none;
  background-color: #679436;
  color: white;
  font-size: 16px;
  border-radius: 5px;
  cursor: pointer;
  width: 100%;
  max-width: 600px;
  margin-top: 10px;
}

.submit-button:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}

.answer-box {
  width: 100%;
  max-width: 600px;
  height: 300px;
  padding: 15px;
  border: 1px solid #ccc;
  border-radius: 5px;
  overflow-y: auto;
  margin-bottom: 20px;
}

.answer-box p {
  margin: 0;
  font-size: 14px;
  line-height: 1.6;
}
</style>
