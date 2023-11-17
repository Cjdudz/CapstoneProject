<!-- Home.vue -->
<template>
  <div class="home">
    <h1>{{ websiteName }}</h1>
    <p>
      Coast Guard Auxiliary District National Capital Region - Central Luzon (CGADNCR-CL) is one of the 12 Auxiliary Districts
	<br> of the Philippine Coast Guard Auxiliary (PCGA). CGADNCR-CL assists the Philippine Coast Guard and subordinate units of the<br>
	 Coast Guard District - National Capital Region-Central Luzon in promoting safety of life and property at sea, safeguarding the marine environment, 
	 <br>maritime search and rescue and such other humanitarian activities.
    </p>
    <img src="@/assets/home-image.jpg" alt="Home Image" />
  </div>
</template>

<script>
export default {
  data() {
    return {
      websiteName: 'Online Application System with Appointment Interview for 505th Squadron Philippine Coastguard Auxilliary(PCGA)'
    };
  }
};
</script>

<style scoped>
.home {
  text-align: center;
  padding: 20px;
}

h2 {
  color: #333;
}

p {
  align: center;
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
</style>
