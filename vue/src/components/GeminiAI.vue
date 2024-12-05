<template>
    <h1 class="mb-5">Ask me how to care for your garden!</h1>
  
    <form class="mb-5" @submit.prevent="fetchAnswer">
      <div>
        <textarea name="question" id="question" cols="30" rows="10" v-model="question"></textarea>
      </div>
      <button type="submit" :disabled="!question">
        {{ `${isLoading ? 'asking gemini...' : 'Ask'}` }}
      </button>
    </form>
  
    <div class="mb-10">
      <AIAnswer :answer="answer" />
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  import { useGetGenerativeModelGP } from '../composables/userGetGenerativeModelGP'
  import AIAnswer from '../components/AIAnswer.vue'
  
  const question = ref('')
  const answer = ref('')
  const isLoading = ref(false)
  
  const fetchAnswer = async () => {
    answer.value = ''
    isLoading.value = true
  
    try {
      answer.value = await useGetGenerativeModelGP(question.value)
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