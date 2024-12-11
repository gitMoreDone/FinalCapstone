<template>
    <footer class="footer lexend-header-font">
      <div class="container">
        <div class="addresscr">
        <p class="copyright">Copyright &copy; {{ new Date().getFullYear() }} Sprout</p>
        <p class="address">1275 Kinnear Rd #121, Columbus, OH 43212</p>
        </div>
        <img class="logo" src="https://res.cloudinary.com/dwdijh29x/image/upload/v1733323940/sprout-icon-light_wvq61u.png" />
      <div class="abouticons">
        <a class="aboutlink">About us</a>
        <div class="icons">
          <i class="bi bi-facebook"></i>
          <i class="bi bi-instagram"></i>
          <i class="bi bi-twitter-x"></i>
      </div>
      </div>
      </div>
    </footer>
</template>


<script>

</script>


<style scoped>
.container {
  display: flex;
  color: aliceblue;

 
}
.icons{
display: flex;
justify-content: space-evenly;
width: 130%;

}
.facebook{
  width: 20%;
  height: 20%;
  
  
}
.instagram{
  width: 20%;
  height: 20%;
}
.twitter{
  width: 20%;
  height: 20%;
}


.logo{
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 70px;
}

.aboutlink{
  color: white;
  text-decoration: none;
  justify-content: end;
  font-size: large;
}
.footer {
  padding: 10px;
  background-color: #679436;
}
.lexend-header-font {
  font-family: "Lexend", sans-serif;
  font-optical-sizing: auto;
  font-weight: 300;
  font-style: normal;
}
.addresscr{
  display: flex;
  flex-direction: column;
  
}

</style>