<template>
  <h1 class="mb-5">Ask me how to care for your garden!</h1>

  <form class="mb-5" @submit.prevent="fetchAnswer">
    <div>
      <textarea placeholder="How do I harvest my broccoli?" name="question" id="question" cols="30" rows="10" v-model="question"></textarea>
    </div>
    <button type="submit" :disabled="!question">
      {{ `${isLoading ? 'thinking...' : 'Ask'}` }}
    </button>
  </form>

  <div class="mb-10">
    <p v-html="answer"></p>
    <!-- <AIAnswer :answer="answer" /> -->
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useGetGenerativeModelGP } from '../composables/userGetGenerativeModelGP'
import AIAnswer from '../components/AIAnswer.vue'

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
                      "\n</ul>"
                      "\n<span>Conclusion</span>"
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
.mb-5 {
  margin-bottom: auto;
}
.mb-10 {
  margin-bottom: auto;
}
</style>