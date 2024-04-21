<template>
  <div>
    <!-- Navigation Bar -->
    <nav class="navbar">
      <div class="logo">
        <img src="/img/PCGA.png" alt="Coast Guard Logo" class="coast-guard-logo" />
      </div>
      
      <div class="nav-links">
        <!-- Navigation Links using Vue Router -->
        <router-link to="/" class="nav-link" exact>Home</router-link> 
        <router-link to="/about" class="nav-link">About</router-link>
        <router-link to="/login" class="nav-link">Login</router-link>
      </div>
    </nav>

    <!-- Main Content -->
    <div class="about">
      <!-- Main Heading -->
      <h1>About Philippine Coast Guard Auxiliary (PCGA)</h1>
      
      <!-- Introduction -->
      <p>
        The Philippine Coast Guard Auxiliary (PCGA) is a volunteer organization established to support the Philippine Coast Guard (PCG) in its various maritime operations and community service activities. Formed in [year of establishment], the PCGA has played a crucial role in promoting maritime safety, environmental protection, and national security.
      </p>

      <!-- History -->
      <h2>History</h2>
      <p>
        The PCGA was founded in [year] as a non-governmental organization to assist the Philippine Coast Guard in its duties. Since then, it has grown into a nationwide network of volunteers dedicated to maritime safety and security.
      </p>

      <!-- Mission and Objectives -->
      <h2>Mission and Objectives</h2>
      <p>
        The pcga shall assist the pcg in the promotion of safety of life and property at sea. the preservation of the marine  environment and resources the conduct of maritime seach and rescue. the maintenance  of aids to navigaton and such other activities that enhance maritime community  relations which include civic action, participation under the national service training program youth development recreational safety and other related activities    </p>

      <!-- Functions -->
      <h2>Functions</h2>
      <p>
        The PCGA fulfills its mission by:
      </p>
      <ul>
        <li>Participating in maritime patrols and law enforcement operations</li>
        <li>Conducting training programs on maritime safety and security</li>
        <li>Assisting in search and rescue missions during emergencies</li>
        <li>Providing support during disaster response and humanitarian assistance operations</li>
        <li>Engaging in environmental protection and conservation initiatives</li>
      </ul>

      <!-- Structure and Organization -->
      <h2>Structure and Organization</h2>
      <p>
        The PCGA operates under the guidance of the Philippine Coast Guard and is organized into flotillas and squadrons located across the country. It is led by volunteer officers who are appointed based on their experience and dedication to the organization's mission. Members of the PCGA come from diverse backgrounds, including maritime professionals, students, and concerned citizens, who share a commitment to serving their communities and protecting the marine environment.
      </p>

      <div class="map-container">
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
    </div>
  </div>
</template>


<script>
export default {
  name: 'AboutPage',
  data() {
    return {
      websiteName: 'Online Application System with Appointment Interview for 505th Squadron Philippine Coastguard Auxiliary (PCGA)',
      googleMapUrl: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3891.4102699842443!2d121.17596381435795!3d13.409431999999985!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33a5ec7df9b02cc1%3A0x1d9a73a37e35a2c!2sSan%20Antonio%2C%20Calapan%20City%2C%20Oriental%20Mindoro!5e0!3m2!1sen!2sph!4v1644310194042!5m2!1sen!2sph'
    };
  }
};
</script>


<style scoped>
/* Navigation Bar Styles */
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #2c3e50; /* Dark blue background */
  color: #fff;
}

.logo img {
  height: 50px; /* Adjust logo image height */
}

.nav-links {
  display: flex;
  list-style: none; /* Remove default bullet points */
  padding: 0; /* Remove default padding */
  margin: 0; /* Remove default margin */
}

.nav-link {
  color: #fff;
  margin-left: 20px;
  text-decoration: none;
  font-weight: bold;
  transition: all 0.3s ease;
  text-transform: uppercase; /* Make navigation text uppercase */
}

.nav-link:hover {
  text-decoration: underline;
}

/* About Section Styles */
.about {
  padding: 20px;
  font-family: 'Arial', sans-serif; /* Change font if desired */
  margin-bottom: 20px; /* Add some space after about section */
}

.about h1 {
  font-size: 2em;
  margin-bottom: 15px;
}

.about p {
  line-height: 1.5; /* Adjust line spacing for better readability */
  margin-bottom: 15px;
}

.about h2 {
  font-size: 1.5em;
  margin-bottom: 10px;
}

.about ul {
  list-style: disc; /* Display bullets */
  padding-left: 20px; /* Indent list items */
  margin-bottom: 15px;
}

.about li {
  margin-bottom: 5px;
}

.map-container {
  width: 100%; /* Ensure map fills container */
  margin-top: 20px; /* Add space above the map */
}
</style>
