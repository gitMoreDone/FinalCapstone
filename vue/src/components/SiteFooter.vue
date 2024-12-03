<template>
    <footer class="footer bg-success bg-gradient">
      <div class="container">
        <p class="copyright">Copyright &copy; {{ new Date().getFullYear() }} Sprout</p>
        <img class="logo" src="https://res.cloudinary.com/dwdijh29x/image/upload/v1733247354/plantlogo_ztqbz9.webp" />
        <a class="aboutlink">About us</a>
      </div>
    </footer>
</template>


<script>

</script>


<style scoped>
.container {
  display: flex;
  padding: 20px;
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

</style>