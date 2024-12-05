<template>
    <div class="home">
      <div class="headings">
                
                <router-link class="button button1" v-bind:to="{ name: 'plantSearch' }">Grow Your Favorite Produce</router-link>
                    <div class="fake-link"> <a href="">Register to create your own virtual garden</a></div>
               

        </div>
    <div class="top-description">
        
        <img class="top-image" src="https://res-console.cloudinary.com/dpm5evsuo/thumbnails/v1/image/upload/v1733422625/d2F0ZXJpbmdjYXJlX3RiYXowNA==/drilldown" />
        <h2 class="part1">Find your favorite garden plant to grow on our search page.</h2>
        <p>Explore our vast selection of delicious veggies, fruits, and hardy herbs - find the perfect addition to your green space, tailored to your local climate and gardening style</p>
    </div>
    <div class="middle-description">
        
        <h3 class="part2">set reminders for plant watering</h3>
        <img class="middle-image" src="https://res-console.cloudinary.com/dpm5evsuo/thumbnails/v1/image/upload/v1733422625/d2F0ZXJpbmdjYXJlX3RiYXowNA==/drilldown" />
    </div>
    <div class="bottom-description">
        
        <img class="bottom-image" src="https://res-console.cloudinary.com/dpm5evsuo/thumbnails/v1/image/upload/v1733422625/d2F0ZXJpbmdjYXJlX3RiYXowNA==/drilldown" />
        <h4 class="part3">ask ai anything about plant care</h4>
        <p>Gone are the days of sifting through pages of internet searches to find answers to your questions like: “Why did my strawberry plants not produce fruit?” With SPROUTAI, you can ask the chat your question, and it will provide you with an answer in a matter of seconds.</p>
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
        margin: 10px;

        opacity: 80%

    }


    .button1 {
        font-size: 35px;
        margin: 10px;
    }

    .top-image {
        border-radius: 100px;
        margin-left: 50px;
        margin-top: 40px;
        margin-right: 50px;
        width: 500px;
        height: 500px;
    }
    .middle-image {
        
        border-radius: 100px;
        margin-left: 50px;
        margin-top: 40px;
        margin-right: 50px;
        width: 500px;
        height: 500px;
    
    }
    a {
        font-weight: bold;
        color: antiquewhite;
    }

    a:hover {
        
        color: green;
    }

    .bottom-image {
        
        border-radius: 100px;
        margin-left: 50px;
        margin-top: 40px;
        margin-right: 50px;
        width: 500px;
        height: 500px;
        margin-bottom: 50px;
    
    }
    .top-description {
        display: flex;
        flex-direction: row;
        align-items: center;
    }
    .middle-description {
        display: flex;
        justify-content: right;
        flex-direction: row;
        align-items: center;
    }

    .bottom-description {
        display: flex;
        flex-direction: row;
        align-items: center;
    
    }
    
  </style>