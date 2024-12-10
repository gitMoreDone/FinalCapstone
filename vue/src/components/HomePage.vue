<template>

  <head>

  </head>


  <div class="home ">
    <div class="headings">
      <div id="box-content">
      <div class="box-container">
        <h3 id="welcome">Welcome To Your Own Virtual Garden </h3>
        <p id="need-recommendations" v-if="$store.state.token == ''">Need some recommendations?</p>
        <h2 id="wizard-link">
          <router-link class="button button1" v-bind:to="{ name: 'wizard' }" v-if="$store.state.token == ''"> Take Our Quiz </router-link>
        </h2>
        <!-- <span v-if="$store.state.token == ''">or</span> -->
        <router-link class="button button1" v-bind:to="{ name: 'garden' }" v-if="$store.state.token != ''">Visit My
          Garden</router-link>
        <div class="login-fake-link" v-if="$store.state.token == ''"> 
          <router-link  v-bind:to="{ name: 'login' }">Login</router-link>
          <!-- <span> or</span> -->
          <a href="" v-if="$store.state.token == ''">Create Account</a></div>
      </div>
    </div>
    </div>

    <div class="under-heading">
      <div class="top-description">

        <img class="top-image"
          src="https://res.cloudinary.com/dbryvvjtl/image/upload/v1733431907/mustache-guy-holding-basket_1_vc7mno.jpg" />
        <div class="description1">
          <h2 class="part1">Cultivate Confidence</h2>
          <p class="text-description">Sprout tills the complex world of gardening into simple, manageable steps.</p>
        </div>
      </div>
      <div class="middle-description">
        <div class="description2">
          <h2 class="part2">Find the right plants for your garden</h2>
          <p class="text-description">Take our two minute quiz to get recommendations curated for you!</p>
        </div>
        <img class="middle-image" src="https://res.cloudinary.com/dbryvvjtl/image/upload/v1733615783/fa27404f7e8297718b55b5251845ee97e0c9940bea57fc4829ba1d1755942a5d_fspgvp.png" />
    </div>
    <div class="bottom-description">
        
        <img class="bottom-image" src="https://res.cloudinary.com/dbryvvjtl/image/upload/v1733432328/Screenshot_2024-12-05_155647_scidvc.png" />
        <div class="description3">
          <h2 class="part3">Track Your Progress</h2>
          <p class="text-description">See days since you've last watered, save notes, and ask our virtual Assistant GAIA when you need help!</p>
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
.home {
  font-family: "Lexend", sans-serif;
  font-optical-sizing: auto;
  font-weight: 600;
  font-style: normal;
}

.lexend {
  font-family: "Lexend", sans-serif;
  font-optical-sizing: auto;
  font-weight: 600;
  font-style: normal;
}

#box-content {
  display: flex;
  width: 100%;
  justify-content: left;
  margin-left: 70px;
  margin-bottom: 60px;
}

.headings {
  background-image: url('https://res.cloudinary.com/dbryvvjtl/image/upload/v1733865903/homepage_main_image_1_usy7lj.png');
  /* filter:brightness(80%); */
  /* background-image: url('https://res.cloudinary.com/dbryvvjtl/image/upload/v1733429936/person-holding-basket_kluodn.jpg'); */
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
  /* border: 2px solid #333; */
  border-radius: 15px;
  align-items: center;
  gap: 10px;
  /* background-color: rgba(244, 244, 244, 0.877); */
   /* background-color: #e7d6b9e1; */
}

#need-recommendations {
  font-family: "Archivo", sans-serif;
  /* font-optical-sizing: auto; */
  font-weight: 200;
  font-size: 25px;
  margin-bottom: 30px;
  /* color: #e7d6b9e1; */
  color: white;
}

#welcome {
  font-family: "Archivo", sans-serif;
  /* font-optical-sizing: auto; */
  font-weight: 900;
  font-size: 55px;
  

  /* font-variation-settings:
    "wdth" 100; */
  /* font-family: "Lexend", sans-serif;
  font-optical-sizing: auto;
  font-weight: 600;
  font-size: 55px;
  font-style: normal; */
  /* color: rgb(102, 75, 1); */
  /* color: #e7d6b9e1 */
  color: white
  
}

.login-fake-link {
  display: flex;
  flex-direction: row;
  width:30%;
  justify-content: space-around;
  margin-top: 30px;
  border: 2px solid #333;
  padding: 12px;
  border-radius: 10px;
  /* background-color: #e7d6b9e1; */
  background-color: white;
}

.button1 {
  font-size: 35px;
  /* margin: 10px; */
  text-decoration: none;
  border: 2px solid #333;
  padding: 22px;
  border-radius: 10px;
  /* background-color: #e7d6b9e1; */
  background-color: white;
  
  /* margin-top: 70px;
  margin-bottom: 60px; */
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

.top-image {
  border-radius: 30px;
  margin-left: 50px;
  margin-top: 40px;
  margin-right: 50px;
  width: 500px;
  height: 500px;
        
}
.bottom-image {
        
  border-radius: 30px;
  margin-left: 50px;
  margin-top: 40px;
  margin-right: 50px;
  width: 500px;
  height: 500px;
  margin-bottom: 40px;
    
}
a {
  font-weight: bold;
  /* color: rgb(0, 83, 0); */
  color: #679436;
}

a:hover {
  color: green;
}

.text-description {
  text-align: left;
  font-size: 20px;
  font-weight: 300;
  
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
