<template>
    <div class="footer">
      <!-- <div class="container"> -->
        <div class="addresscontainer">
        <div class="addresscr">
        <p class="copyright">Copyright &copy; {{ new Date().getFullYear() }} Sprout</p>
        <p class="address">1275 Kinnear Rd #121, Columbus, OH 43212</p>
        
        </div>
        </div>
        <img class="logo" src="https://res.cloudinary.com/dwdijh29x/image/upload/v1733323940/sprout-icon-light_wvq61u.png" />
      <div class="abouticons">
        <div class="about-contact">
        <a class="aboutlink" href="">About Us</a>
        <a class="bi bi-envelope" href=""> Contact us</a>
      </div>
        <div class="icons">
          <p id="follow-us">Follow Us</p>
          <i class="bi bi-facebook"></i>
          <i class="bi bi-instagram"></i>
          <i class="bi bi-twitter-x"></i>
      </div>
      
      <!-- </div> -->
      </div>
    </div>
</template>


<script>

</script>


<style scoped>

#follow-us {
  margin-top: 6px;
}

.icons{
display: flex;
justify-content: space-evenly;
width: 100%;
margin-right: 60px;
margin-top: 15px;

}

.about-contact {
  display: flex;
  flex-direction: row;
  width: 200px;
  justify-content: space-evenly;
  margin-right: 60px;
}
.abouticons {

  display: flex;
  flex-direction: column;
  align-items: center;
  color: white;
  }
  .bi-facebook{
    font-size: x-large;
  }
  .bi-instagram{
    font-size: x-large;
  }
  .bi-twitter-x{
    font-size: x-large;
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


.bi-envelope {
  color: white;
  size: 19px;
  text-decoration: none;
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
  margin-right: 35%;
  width: 70px;
}

.aboutlink{
  color: white;
  text-decoration: none;
  margin-right: 25px;
}
.footer {
  display: flex;
  flex-direction: row;
  padding: 10px;
  background-color: #679436;
  width: 100%;
  color: white;
  /* justify-content: space-evenly; */
}
/* .lexend-header-font {
  font-family: "Lexend", sans-serif;
  font-optical-sizing: auto;
  font-weight: 300;
  font-style: normal;
  
} */
.addresscr{
  display: flex;
  flex-direction: column;
  
}
.addresscontainer{
  display: flex;
  justify-content: left;
/* width: 60%; */
  margin-left: 70px;
}

</style>