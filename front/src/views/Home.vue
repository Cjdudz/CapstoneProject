<template>
  <!-- Navigation Bar -->
  <nav class="navbar">
    <div class="logo">
      <img src="/img/PCGA.png" alt="Coast Guard Logo" class="coast-guard-logo" />
    </div>
    <div class="nav-links">
      <router-link to="/" class="nav-link" exact>Home</router-link>
      <router-link to="/Home" class="nav-link">About</router-link>
      <router-link to="/Logincomponent" class="nav-link">Login</router-link>
    </div>
  </nav>

  <!-- Main Content -->
  <div class="content">
    <section class="hero">
      <h1>About Philippine Coast Guard Auxiliary (PCGA) 505th District</h1>
    </section>

    <section class="content-section">
      <div class="section-item">
        <h2>History</h2>
        <p>The PCGA was founded in [year] as a non-governmental organization to assist the Philippine Coast Guard in its duties. Since then, it has grown into a nationwide network of volunteers dedicated to maritime safety and security.</p>
      </div>

      <div class="section-item">
        <h2>Mission and Objectives</h2>
        <p>The PCGA shall assist the PCG in the promotion of safety of life and property at sea, the preservation of the marine environment and resources, the conduct of maritime search and rescue, the maintenance of aids to navigation, and other related activities.</p>
      </div>

      <div class="section-item">
        <h2>Functions</h2>
        <ul class="function-list">
          <li>Participating in maritime patrols and law enforcement operations</li>
          <li>Conducting training programs on maritime safety and security</li>
          <li>Assisting in search and rescue missions during emergencies</li>
          <li>Providing support during disaster response and humanitarian assistance operations</li>
          <li>Engaging in environmental protection and conservation initiatives</li>
        </ul>
      </div>

      <div class="section-item">
        <h2>Structure and Organization</h2>
        <p>The PCGA operates under the guidance of the Philippine Coast Guard and is organized into flotillas and squadrons located across the country. It is led by volunteer officers who are appointed based on their experience and dedication to the organization's mission.</p>
      </div>

      <div class="section-item map-container">
        <h2>Location</h2>
        <iframe
          width="100%"
          height="400"
          frameborder="0"
          scrolling="no"
          marginheight="0"
          marginwidth="0"
          :src="googleMapUrl"
          allowfullscreen
        ></iframe>
      </div>
    </section>
  </div>
</template>

<script>
export default {
name: 'AboutPage',
data() {
  return {
    googleMapUrl: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3891.4102699842443!2d121.17596381435795!3d13.409431999999985!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33a5ec7df9b02cc1%3A0x1d9a73a37e35a2c!2sSan%20Antonio%2C%20Calapan%20City%2C%20Oriental%20Mindoro!5e0!3m2!1sen!2sph!4v1644310194042!5m2!1sen!2sph'
  };
}
};
</script>

<style scoped>
/* Global Styles */
body {
font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
margin: 0;
padding: 0;
background-color: #f4f4f4;
}

.about-page {
max-width: 1200px;
margin: 0 auto;
padding: 20px;
}

/* Navigation Bar Styles */
.navbar {
display: flex;
justify-content: space-between;
align-items: center;
background-color: #2c3e50;
color: #fff;
padding: 10px 20px;
}

.logo img {
height: 40px;
}

.nav-links {
display: flex;
}

.nav-link {
color: #fff;
text-decoration: none;
margin-left: 20px;
transition: color 0.3s;
}

.nav-link:hover {
color: #ffd700;
}

/* Main Content Styles */
.content {
background-color: #fff;
padding: 20px;
border-radius: 8px;
box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
}

.hero {
    margin-bottom: 40px;
    background: #294054;
    color: #fff;
    padding: 60px 0;
    text-align: center;
    position: relative;
    
}

.hero h1 {
font-size: 2.5em;
margin-bottom: 15px;
}

.hero .intro {
font-size: 1.1em;
margin-bottom: 20px;
}

.section-item {
margin-bottom: 30px;
}

.section-item h2 {
font-size: 1.8em;
color: #333;
margin-bottom: 15px;
}

.section-item p {
font-size: 1.1em;
color: #666;
}

.function-list {
padding-left: 20px;
}

.map-container {
width: 100%;
}

@media (max-width: 768px) {
.nav-links {
  flex-direction: column;
  align-items: flex-start;
}

.nav-link {
  margin: 10px 0;
}

.hero h1 {
  font-size: 2em;
}

.hero .intro {
  font-size: 1em;
}

.section-item h2 {
  font-size: 1.5em;
}

.section-item p {
  font-size: 1em;
}
}
</style>
