<template>
    <div class="home">
      <div class="headings">
                <button class="button button1">Grow Your Favorite Produce</button>
                <div class="loginRegister">
                    <router-link class="button button2" v-bind:to="{ name: 'login' }" v-if="$store.state.token == ''">Login</router-link>
                    <button class="button button3">Register</button>
                </div>
                
            
                

        </div>

    
    </div>
  </template>
  
  <script>
  export default {
  };
  </script>
  
  <style scoped>
  .headings {
      background-image: url('https://res.cloudinary.com/dpm5evsuo/image/upload/v1733413245/webpagepic_wtpo4b.jpg');
      background-size: cover;
      background-position: center;
      height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }
    .button {
        background-color: #04AA6D;
        border: none;
        color:wheat;
        padding: 20px;
        text-align: center;
        text-decoration: none;
        font-size: 20px;
        border-radius: 12px;

    }
    .button1 {
        font-size: 35px;
    }
  </style>