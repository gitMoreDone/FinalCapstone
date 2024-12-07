<template>
  <div class="login-container">
  <div id="login">
    <form v-on:submit.prevent="login">
      <h1 >Please Sign In</h1>
      <div role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <div class="form-input-group">
        <label for="username">Username</label>
        <input type="text" id="username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password</label>
        <input type="password" id="password" v-model="user.password" required />
      </div>
      <button class="submit" type="submit">Sign in</button>
      <p>
      <router-link class="link" v-bind:to="{ name: 'register' }">Need an account? Sign up.</router-link></p>
    </form>
  </div>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/garden");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>


.form-input-group {
  margin-bottom: 1rem;
  font-size: 50;
    
}
label {
  margin-right: 0.5rem;
}

.login-container {
  background-position: center;
  background-repeat: no-repeat;
  height: 82.7vh;
  opacity: 70%;
  background-color:white;
  background-position: center;
  backdrop-filter: blur(5px);
  box-shadow: inset 0px 0px 10px #000;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
  
}
#login{
  display: inline-flex;
      flex-direction: column;
      padding: 40px 60px;
      border: 2px solid #333;  
      border-radius: 15px;      
      align-items: center;     
      gap: 10px;               
      background-color: rgba(244, 244, 244, 0.5); 
}

.submit{
  margin-top: 50px;
    width: 100%;
    background-color: #ffffff;
    color: #080710;
    padding: 15px 0;
    font-size: 18px;
    font-weight: 600;
    border-radius: 5px;
    cursor: pointer;
}
.link:hover{
  color: green;
  text-decoration: underline;
}
.link{
  color: black;
}
#username.form-input-group{
 
    margin-left: .5rem;
    margin-top: 1rem;
}
</style>