<template>

  <div class="home">
    <h1>{{ websiteName }}</h1>
    <h4>Our Mission</h4>
    <p>
      The Philippine Coast Guard Auxiliary (PCGA) shall assist the Philippine Coast Guard (PCG) in the promotion of safety of life and property at sea, in the preservation of the marine environment and its resources, the conduct of maritime search and rescue, the maintenance of aids to navigation, and such other activities that enhance maritime community relations which include civic action, participation under the National Service Training Program (NSTP), youth development, recreational safety and other related activities.
    </p>
    

    <!-- Embedded Google Map -->
    <div class="map-container">
      <iframe
        width="100%"
        height="400"
        frameborder="0"
        scrolling="no"
        marginheight="0"
        marginwidth="0"
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3891.4102699842443!2d121.17596381435795!3d13.409431999999985!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33a5ec7df9b02cc1%3A0x1d9a73a37e35a2c!2sSan%20Antonio%2C%20Calapan%20City%2C%20Oriental%20Mindoro!5e0!3m2!1sen!2sph!4v1644310194042!5m2!1sen!2sph"
        allowfullscreen
      ></iframe>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      websiteName: 'Online Application System with Appointment Interview for 505th Squadron Philippine Coastguard Auxiliary (PCGA)'
    };
  }
};
</script>

<style scoped>
.home {
  top: 30px;
  text-align: center;
  padding: 20px;
  max-width: 700px;
  margin: auto;
  background-color: #fff;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
}
.background{
  background-color: black;
}

h1 {
  color: #333;
}

p {
  text-align: center;
  color: #555;
  line-height: 1.6;
  margin-bottom: 20px;
}

img {
  max-width: 100%;
  height: auto;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  margin-top: 20px;
}

.map-container {
  margin-top: 20px;
}
</style>
