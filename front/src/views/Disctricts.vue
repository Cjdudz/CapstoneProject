<template>
  <!-- Navigation bar -->
  <nav class="navbar">
    <div class="nav-left">
      <router-link to="/Home" class="logo-link">
        <img src="/img/PCGA.png" alt="Coast Guard Logo" class="coast-guard-logo" />
        <span class="app-title">PCGA</span>
      </router-link>
    </div>
    <div class="nav-right">
      <router-link to="/Transparency" class="header-button">Transparency Seal</router-link>
      <router-link to="/Disctricts" class="header-button">Coast Guard Districts</router-link>
      <router-link to="/PcgaapplicationForm" class="header-button">Apply Online</router-link>
      <router-link to="/IdentificationCard" class="header-button">Identification</router-link>
      <router-link to="/Userstatus" class="header-button">User Status</router-link>
      <v-btn text @click="loginOrLogout" class="logout-btn">{{ isLoggedIn ? 'Logout' : 'Logout' }}</v-btn>
    </div>
  </nav>

  <!-- Main content -->
  <div class="main-content">
    <!-- Display districts -->
    <div v-if="loading" class="loading-message">Loading...</div>
    <div v-else-if="districts.length === 0" class="no-districts-message">No districts found.</div>
    <div v-else class="districts-container">
      <h2>Districts</h2>
      <ul>
        <li v-for="district in districts" :key="district.id" class="district-item">
          <span>{{ district.name }}</span><br>
          <span>{{ district.description }}</span>
          <!-- Add more properties as needed -->
        </li>
      </ul>
    </div>
  </div>


</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      drawer: false,
      isLoggedIn: false,
      services: [
        { id: 1, title: 'Search and Rescue', description: 'The Philippine Coast Guard is always ready to respond to emergencies at sea.', icon: 'fas fa-life-ring' },
        { id: 2, title: 'Maritime Law Enforcement', description: 'Ensuring safety and security on our waterways.', icon: 'fas fa-ship' },
        { id: 3, title: 'Environmental Protection', description: 'Protecting our oceans and coasts for future generations.', icon: 'fas fa-leaf' },
        { id: 4, title: 'Port Security', description: 'Keeping our ports safe and secure.', icon: 'fas fa-anchor' }
      ],
      loading: false,
      districts: []
    };
  },
  mounted() {
    this.fetchDistricts();
  },
  methods: {
    loginOrLogout() {
      if (this.isLoggedIn) {
        this.logout();
      } else {
        this.redirectTo('/');
      }
    },
    logout() {
      console.log("Logout clicked");
      this.isLoggedIn = false;
    },
    redirectTo(path) {
      this.$router.push(path);
      this.drawer = false;
    },
    fetchDistricts() {
  this.loading = true;
  axios.get("http://localhost:8080/api/ShowDistricts")
    .then(response => {
      this.districts = response.data;
      this.loading = false;
    })
    .catch(error => {
      console.error("Error fetching districts:", error);
      this.loading = false;
    });
},
  }
};
</script>

<style scoped>
/* Global styles */
body {
  font-family: 'Roboto', sans-serif;
  margin: 0;
  padding: 0;
}

/* Navigation bar styles */
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #2c3e50;
  color: #fff;
}

.nav-left {
  display: flex;
  align-items: center;
}

.nav-right {
  display: flex;
  align-items: center;
}

.logo-link {
  text-decoration: none;
  color: #fff;
}

.coast-guard-logo {
  height: 40px;
  margin-right: 10px;
}

.app-title {
  font-size: 1.5em;
  font-weight: bold;
}

.header-button {
  color: #fff;
  margin-left: 20px;
  text-decoration: none;
  font-weight: bold;
  transition: all 0.3s ease;
}

.logout-btn {
  color: #0e0d0d;
  margin-left: 20px;
}

.logout-btn:hover {
  text-decoration: underline;
}

.header-button:hover {
  text-decoration: underline;
}

/* Landing Page Styles */
.landing-page {
  padding: 20px;
  background-color: #f9f9f9;
}

/* Hero Section Styles */
.hero {
  display: flex;
  background-color: #2c3e50;
  color: #fff;
  padding: 20px;
  border-radius: 10px 10px 0 0;
}

.hero-image img {
  width: 100%;
  border-radius: 5px;
}

.hero-text {
  flex: 1;
  text-align: center;
}

.hero-text h1 {
  font-size: 2.5em;
  margin-bottom: 10px;
}

.hero-btn {
  background-color: #3498db;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  margin-top: 15px;
}

/* Services Section Styles */
.services {
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  margin-bottom: 40px;
}

.service-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  grid-gap: 20px;
}

.service-card {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  transition: all 0.3s ease;
  background-color: #fff;
}

.service-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.service-card i {
  font-size: 2em;
  margin-bottom: 15px;
  color: #3498db;
}

.service-card h3 {
  font-size: 1.2em;
  margin-bottom: 10px;
  color: #333;
}

.service-card p {
  font-size: 1em;
  text-align: center;
}

.no-results {
  color: #ff0000;
  text-align: center;
  margin-top: 10px;
}

/* Footer Styles */
.feedback {
  background-color: #2c3e50;
  color: #fff;
  padding: 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.social-links {
  display: flex;
}

.social-icon {
  color: #fff;
  margin-right: 10px;
  font-size: 20px;
}

.footer-links {
  display: flex;
}

.footer-link {
  color: #fff;
  margin-right: 20px;
  text-decoration: none;
}

.feedback-btn {
  background-color: #3498db;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}.main-content {
  padding: 20px;
}

/* Districts container styles */
.districts-container {
  margin-top: 20px;
}

.district-item {
  margin-bottom: 10px;
  background-color: #f9f9f9;
  padding: 10px;
  border-radius: 5px;
}

.district-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.district-name {
  font-weight: bold;
}

.district-location {
  color: #666;
}

/* Loading and no districts message styles */
.loading-message,
.no-districts-message {
  text-align: center;
  margin-top: 20px;
}

.loading-message {
  font-style: italic;
}

.no-districts-message {
  color: #ff0000;
}
</style>
