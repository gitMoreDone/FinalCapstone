<template>
  <head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Atma:wght@300;400;500;600;700&family=Bungee&family=Knewave&family=Slackey&display=swap" rel="stylesheet">
<!-- <link href="https://fonts.googleapis.com/css2?family=Atma:wght@300;400;500;600;700&family=Bungee&family=Fredericka+the+Great&family=Knewave&family=Slackey&display=swap" rel="stylesheet"> -->

</head>


    <div class="home">
      <div class="headings">
                <div class="box-container">
                  <h3 id="welcome">Welcome To Your Own Virtual Garden </h3>
                <router-link class="button button1" v-bind:to="{ name: 'login' }" v-if="$store.state.token == ''">Login</router-link>
                <router-link class="button button1" v-bind:to="{ name: 'garden' }" v-if="$store.state.token != ''">Take Me To My Garden</router-link>
                    <div class="fake-link"> <a href="" v-if="$store.state.token == ''">Register to create your garden </a></div>
                </div>

        </div>
    
    <div class="under-heading">
        <div class="top-description">
        
        <img class="top-image" src="https://res.cloudinary.com/dbryvvjtl/image/upload/v1733431907/mustache-guy-holding-basket_1_vc7mno.jpg" />
        <div class="description1">
          <h2 class="part1">Find Your Favorite Garden Plant To Grow On Our Search Page</h2>
          <p class="text-description">Explore our vast selection of veggies, fruits, and hardy herbs - find the perfect addition to your green space, tailored to your local climate and gardening style</p>
        </div>
    </div>
    <div class="middle-description">
        <div class="description2">
          <h2 class="part2">Designed for Every Screen, Big or Small</h2>
          <p class="text-description">Our website adapts seamlessly to any device you use. Whether you're browsing on a phone, tablet, or desktop, you'll enjoy a sleek and intuitive experience tailored just for you. Stay connected wherever life takes you!</p>
        </div>
        <img class="middle-image" src="https://res.cloudinary.com/dbryvvjtl/image/upload/v1733519031/c3b0bb74527e25a23d5007dd19e1b46de9ef22581c2a6d3a68a5666135ff7e4f_fjklln.png" />
    </div>
    <div class="bottom-description">
        
        <img class="bottom-image" src="https://res.cloudinary.com/dbryvvjtl/image/upload/v1733432328/Screenshot_2024-12-05_155647_scidvc.png" />
        <div class="description3">
          <h2 class="part3">Our AI Assistant Will Help You Care For Your Plants</h2>
          <p class="text-description">Gone are the days of sifting through pages of internet searches to find answers to your questions like: “Why did my strawberry plants not produce fruit?” With SPROUTAI, you can ask the chat your question, and it will provide you with an answer in a matter of seconds</p>
        </div>
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
      background-image: url('https://res.cloudinary.com/dbryvvjtl/image/upload/v1733429936/person-holding-basket_kluodn.jpg');
      background-size: cover;
      background-position: center;
      height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }

    .box-container {

      display: inline-flex;
      flex-direction: column;
      padding: 40px 60px;
      border: 2px solid #333;  
      border-radius: 15px;      
      align-items: center;     
      gap: 10px;               
      background-color: rgba(244, 244, 244, 0.5); 
    }

    #welcome {
      font-family: "Bungee", sans-serif;
      /* font-family: "Fredericka the Great", serif; */
      font-weight: 300;
      font-style: normal;
      font-size: 40px;
      /* color: rgb(102, 75, 1); */
      color: #0D1C0F
    }
    /* .button {
      background-color: aliceblue;
        
        border: none;
        
        color: green;
        padding: 20px;
        text-align: center;
        text-decoration: none;
        font-size: 20px;
        border-radius: 12px;
        margin: 10px;

        opacity: 70%

    } */


    .button1 {
        font-size: 35px;
        margin: 10px;
    }

    .under-heading {
      /* background-image: url(https://res.cloudinary.com/dbryvvjtl/image/upload/v1733437241/pexels-pixabay-235985_ftotys.jpg); */
      backdrop-filter: blur(5px);
      box-shadow: inset 0px 0px 10px #000;

    }


    .top-image {
        border-radius: 30px;
        margin-left: 50px;
        margin-top: 40px;
        margin-right: 50px;
        width: 500px;
        height: 500px;
        
    }
    .middle-image {
        
        border-radius: 30px;
        margin-left: 50px;
        margin-top: 40px;
        margin-right: 50px;
        width: 500px;
        height: 500px;
    
    }
    a {
        font-weight: bold;
        color: rgb(0, 83, 0);
        /* color: #679436 */
    }

    a:hover {
        
        color: green;
    }

    .bottom-image {
        
        border-radius: 30px;
        margin-left: 50px;
        margin-top: 40px;
        margin-right: 50px;
        width: 500px;
        height: 500px;
        margin-bottom: 50px;
    
    }

    .text-description {
      text-align: center;
      font-size: 25px;
      
    }
    .top-description {
        display: flex;
        flex-direction: row;
        align-items: center;
        
    }

    .description1 {
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 40px 60px;
      /* border: 2px solid #333;   */
      border-radius: 15px;      
      align-items: center;     
      gap: 10px;               
      background-color: rgba(138, 138, 138, 0.26);
      margin-right: 25px;
      backdrop-filter: blur(5px);
        box-shadow: inset 0px 0px 10px #000;
    }
    .middle-description {
        display: flex;
        justify-content: right;
        flex-direction: row;
        align-items: center;
    }
    .description2 {
      display: flex;
      flex-direction: column;
      padding: 40px 60px;
      /* border: 2px solid #333;   */
      border-radius: 15px;      
      align-items: center;     
      gap: 10px;               
      background-color: rgba(138, 138, 138, 0.26);
      margin-left: 25px;
      backdrop-filter: blur(5px);
        box-shadow: inset 0px 0px 10px #000;
    }

    .bottom-description {
        display: flex;
        flex-direction: row;
        align-items: center;
    
    }
    .description3 {
      display: flex;
      flex-direction: column;
      padding: 40px 60px;
      /* border: 2px solid #333;   */
      border-radius: 15px;      
      align-items: center;     
      gap: 10px;               
      background-color: rgba(138, 138, 138, 0.26);
      margin-right: 25px;
      backdrop-filter: blur(5px);
        box-shadow: inset 0px 0px 10px #000;
    }
    
  </style>