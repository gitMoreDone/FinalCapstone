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
      <p class="register-link">
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

.login-container {
  height: 81vh;
  opacity: 70%;
  background-color:white;
  backdrop-filter: blur(5px);
  box-shadow: inset 0px 0px 10px #000;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
}

.form-input-group {
  margin-bottom: 1rem;
  font-size: 20px;
  width: 100%; 
}

input {
  width: 100%; 
  padding: 10px;
  font-size: large;
  box-sizing: border-box; 
}

label {
  margin-right: 0.5rem;
}

.submit {
  margin-top: 5px;
  width: 50%;
  background-color: #ffffff;
  color: #080710;
  padding: 10px 0;
  font-size: 15px;
  font-weight: 600;
  border-radius: 5px;
  cursor: pointer;
}

.submit:hover{
  background-color: #9ead94;
}

.register-link {
  margin-top: 10px;
}

.link:hover {
  color: #9ead94;
  text-decoration: underline;
}

.link {
  color: black;
}

</style>