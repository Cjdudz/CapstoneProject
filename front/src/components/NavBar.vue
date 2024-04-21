<template>
  <div>
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
        <router-link to="/PcgaapplicationForm" class="header-button">Apply Online</router-link>
        <router-link to="/IdentificationCard" class="header-button">Identification</router-link>
        <router-link to="/Userstatus" class="header-button">User Status</router-link>
        <v-btn text @click="loginOrLogout" class="logout-btn">{{ isLoggedIn ? 'Logout' : 'Logout' }}</v-btn>
      </div>
    </nav>

    <!-- Main content -->
    <HelloWorld />

    <!-- Landing page -->
    <div class="landing-page">
      <!-- Hero section -->
      <header class="hero">
        <div class="hero-image">
          <img src="img/download.jpg" alt="Philippine Coast Guard Auxiliary Hero Image" /> 
        </div>
        <div class="hero-text">
         
          <p>
            The PCGA fulfills its mission by:
          </p> The PCGA operates under the guidance of the Philippine Coast Guard and is organized into flotillas and squadrons located across the country. It is led by volunteer officers who are appointed based on their experience and dedication to the organization's mission. Members of the PCGA come from diverse backgrounds, including maritime professionals, students, and concerned citizens, who share a commitment to serving their communities and protecting the marine environment.
          <h2>Functions</h2>
            <p>Participating in maritime patrols and law enforcement operations</p>
            <p>Conducting training programs on maritime safety and security</p>
            <p>Assisting in search and rescue missions during emergencies</p>
            <p>Providing support during disaster response and humanitarian assistance operations</p>
            <p>Engaging in environmental protection and conservation initiatives</p>
        
        </div>
      </header>

      <!-- Services section -->
      <section class="services">
        <h2>Our Services</h2>
        <div class="service-grid"> 
          <div v-for="service in services" :key="service.id" class="service-card">
            <i :class="service.icon"></i> 
            <h3>{{ service.title }}</h3>
            <p>{{ service.description }}</p>
          </div>
        </div>
      </section>
    </div>

    <!-- Footer -->
    <footer class="feedback">
      <div class="social-links">
        <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
        <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
      </div>
      <div class="footer-links">
        <router-link to="/terms" class="footer-link">Terms of Service</router-link>
        <router-link to="/privacy" class="footer-link">Privacy Policy</router-link>
      </div>
      <div class="feedback-text">
        <p>Have feedback? Let us know!</p>
        <button class="feedback-btn">Leave Feedback</button>
      </div>
    </footer>
  </div>
</template>

<script>
import HelloWorld from './HelloWorld.vue';

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
      ]
    };
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
    }
  },
  components: { HelloWorld },
};
</script>

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
<style scoped>
/* Global styles */
body {
  font-family: 'Roboto', sans-serif;
  margin: 0;
  padding: 0;
}
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

.nav-center {
  flex-grow: 1;
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
  height: 40px; /* Adjust as needed */
  margin-right: 10px;
}

.app-title {
  font-size: 1.5em;
  font-weight: bold;
}

.search-bar {
  display: flex;
  align-items: center;
}

.search-input {
  padding: 8px 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 16px;
}

.search-btn {
  background-color: #3498db;
  color: #fff;
  border: none;
  padding: 8px 12px;
  border-radius: 4px;
  cursor: pointer;
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

.social-icon {
  color: #fff;
  margin-right: 10px;
  font-size: 20px;
}

.footer-link {
  color: #fff;
  margin-right: 20px;
  text-decoration: none;
}
.footer {
  position: fixed;
}
.feedback-btn {
  background-color: #3498db;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}
</style>
