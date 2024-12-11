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
          <router-link class="login-create-account-text"  v-bind:to="{ name: 'login' }">Login</router-link>
          <!-- <span> or</span> -->
          <a class="login-create-account-text" href="" v-if="$store.state.token == ''">Create Account</a></div>
      </div>
    </div>
    </div>

    <div class="under-heading">
      <div class="top-description">

        <img class="top-image"
          src="https://res.cloudinary.com/dpm5evsuo/image/upload/c_crop,w_500,h_500,x_0,y_0/v1733935679/AI_screenshot_nnmcoc.png" />
        <div class="description1">
          <h2 class="part1">Gardening Artificial Intelligence Assistant</h2>
          <p class="text-description">With GAIA, you will spend more time digging in your garden and less time at the computer digging for answers.</p>
        </div>
      </div>
      <div class="middle-description">
        <div class="description2">
          <h2 class="part2">Find the right plants for your garden</h2>
          <p class="text-description">We want to simplify your time and give you the best recommendations based off your plant preferences. Take our two minute quiz to get recommendations!</p>
        </div>
        <img class="middle-image" src="https://res.cloudinary.com/dpm5evsuo/image/upload/c_crop,w_500,h_500,x_57,y_21/v1733938026/Screenshot_2024-12-11_122630_ddor0s.png" />
    </div>
    <div class="bottom-description">
        
        <img class="bottom-image" src="https://res.cloudinary.com/dpm5evsuo/image/upload/c_crop,w_500,h_500,x_60,y_81/v1733950785/Screenshot_2024-12-11_155831_zoxufo.png" />
        <div class="description3">
          <h2 class="part3">Track Your Progress</h2>
          <p class="text-description">Keep garden notes where you record important details about your plants, including planting dates, watering schedules, observations on growth, pest issues, harvest dates, and any adjustments you make to your gardening practices.</p>
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
  width: 96%;
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
  margin-top: 10px;
  /* border: 2px solid #333; */
  padding: 12px;
  border-radius: 10px;
  /* background-color: #e7d6b9e1; */
  /* background-color: white; */
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
  border: 1px gray solid;
  
}

.middle-image {

  border-radius: 30px;
  margin-left: 50px;
  margin-top: 40px;
  margin-right: 50px;
  width: 500px;
  height: 500px;
  border: 1px gray solid;

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
  border: 1px gray solid;
    
}
a {
  font-weight: bold;
  /* color: rgb(0, 83, 0); */
  color: #679436;
}

a:hover {
  color: green;
}

.login-create-account-text {
  color: white;
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
