<template>
  <h1 class="mb-5">Sprout AI</h1>

  <!-- Question Form -->
  <form class="mb-5 question-form" @submit.prevent="fetchAnswer">
    <div class="question-box">
      <textarea 
        placeholder="How do I harvest my broccoli?" 
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

  <!-- Answer Box -->
  <div class="answer-box" v-show="isLoading || answer != ''">
    <p v-html="answer"></p>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useGetGenerativeModelGP } from '../composables/userGetGenerativeModelGP'

const question = ref('How do I care for my broccoli?')
const answer = ref('')
const isLoading = ref(false)
const questionPreface="You will be asked a question. Return the response to the question in HTML format using the following template, using none or any amount of list items: "+
                      "\n<h4>Example Title</h4>"+ 
                      "\n<span>Example Introduction</span>"+ 
                      "\n<span>Example Explanation</span>"+ 
                      "\n<ul>"+ 
                      "\n <li>Example 1</li>"+ 
                      "\n <li>Example 2</li>"+ 
                      "\n <li>Example 3</li>"+ 
                      "\n</ul>" + 
                      "\n<span>Conclusion</span>" +
                      "\nQuestion: "

const fetchAnswer = async () => {
  answer.value = ''
  isLoading.value = true

  try {
    answer.value = await useGetGenerativeModelGP(questionPreface+question.value)
  } catch (error) {
    console.log({ error })
  } finally {
    isLoading.value = false
    question.value = ''
  }
}
</script>

<style lang="scss" scoped>

.question-form {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 20px;
  width: 100%; /* Ensure the form takes up full width */
}

.question-box {
  display: flex;
  align-content: center;
  width: 100%;
  max-width: 600px;
  margin-bottom: 10px;
}

textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
  line-height: 1.5;
}

.submit-button {
  padding: 10px 20px;
  border: none;
  background-color: #4CAF50;
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
  background-color: #f9f9f9;
  margin-bottom: 20px;
}

.answer-box p {
  margin: 0;
  font-size: 14px;
  line-height: 1.6;
}
</style>
