<template>
    <div class="container">
      <h1 class="header">Ask me how to care for your garden!</h1>
      <form class="form" @submit.prevent="fetchAnswer">
        <textarea
          class="textarea"
          name="question"
          id="question"
          v-model="question"
          placeholder="Type your gardening question here..."
        ></textarea>
        <button class="button" type="submit" :disabled="!question">
          {{ `${isLoading ? 'Asking gemini...' : 'Ask'}` }}
        </button>
      </form>
  
      <div class="answer-box">
        <AIAnswer :answer="answer" />
      </div>
    </div>
  </template>

  <script setup>
  import { ref } from 'vue';
  import { useGetGenerativeModelGP } from '../composables/userGetGenerativeModelGP';
  import AIAnswer from '../components/AIAnswer.vue';
  
  const question = ref('');
  const answer = ref('');
  const isLoading = ref(false);
  
  const fetchAnswer = async () => {
    if (!question.value) return; 
    answer.value = '';
    isLoading.value = true;
  
    try {
      answer.value = await useGetGenerativeModelGP(question.value);
    } catch (error) {
      console.error('Error fetching answer:', error);
      answer.value = 'Something went wrong. Please try again.';
    } finally {
      isLoading.value = false;
    }
  };
  </script>

  <style lang="scss" scoped>
.container {
  display: flex;
  flex-direction: column;
  height: 100vh;
  padding: 20px;
}

.header {
  text-align: center;
  margin-bottom: 20px;
}

.form {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.textarea {
  flex: 1;
  width: 100%;
  resize: none;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-bottom: 10px;
}

.button {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.button:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}

.answer-box {
  flex: 1;
  margin-top: 20px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  background-color: #f9f9f9;
  overflow-y: auto;
}

.answer-box::-webkit-scrollbar {
  width: 8px;
}

.answer-box::-webkit-scrollbar-thumb {
  background-color: #cccccc;
  border-radius: 4px;
}

.answer-box::-webkit-scrollbar-thumb:hover {
  background-color: #999999;
}
</style>

  

  