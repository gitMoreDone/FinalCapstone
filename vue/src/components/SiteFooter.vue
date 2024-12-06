<template>
    <footer class="footer ">
      <div class="container">
        <p class="copyright">Copyright &copy; {{ new Date().getFullYear() }} Sprout</p>
        <img class="logo" src="https://res.cloudinary.com/dwdijh29x/image/upload/v1733323940/sprout-icon-light_wvq61u.png" />
        <a class="aboutlink">About us</a>
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

.logo{
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50px;
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

</style>