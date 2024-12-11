<template>
    <footer class="footer lexend-header-font">
      <div class="container">
        <div class="addresscr">
        <p class="copyright">Copyright &copy; {{ new Date().getFullYear() }} Sprout</p>
        <p class="address">1275 Kinnear Rd #121, Columbus, OH 43212</p>
        <p class="bi bi-envelope"> Contact us</p>
        </div>
        <img class="logo" src="https://res.cloudinary.com/dwdijh29x/image/upload/v1733323940/sprout-icon-light_wvq61u.png" />
      <div class="abouticons">
        <a class="aboutlink">About</a>
        <div class="icons">
          <p>Follow Us</p>
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

.bi-facebook:hover {
  color: darkgreen;
  transform: scale(1.5);
  transition: all 0.3s ease;
        }
  .bi-twitter-x:hover:hover {
  color: darkgreen;
  transform: scale(1.5);
  transition: all 0.3s ease;
        }

.bi-instagram:hover {
color: darkgreen;
transform: scale(1.5);
transition: all 0.3s ease;
        }
.bi-envelope:hover {
color: darkgreen;

        }

.instagram{
  width: 50%;
  height: 50%;
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
  font-size: 19px;
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