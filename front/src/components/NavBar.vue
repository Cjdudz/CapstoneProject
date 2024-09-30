<template>
  <div>
    <!-- Navigation bar -->
    <!-- Update the Navigation Bar -->
<nav class="navbar">
  <div class="nav-left">
    <router-link to="/Home" class="logo-link">
        <img src="img/PCGA-removebg-preview.png " alt="Coast Guard Logo" class="coast-guard-logo" />
      <span class="app-title">PCGA</span>
    </router-link>
  </div>
  <div class="nav-right">
    <router-link to="/Transparency" class="header-button">Transparency Seal</router-link>
    <router-link to="/Disctricts" class="header-button">Coast Guard Districts</router-link>
    <router-link to="/LandingApp" class="header-button">Apply Online</router-link>
    <v-btn text @click="loginOrLogout" class="logout-btn">{{ isLoggedIn ? 'Logout' : 'Logout' }}</v-btn>
  </div>
</nav>


    <!-- Main content -->
    <HelloWorld />

    <main>
      <section class="hero">
        <div class="hero-image">
          <img src="/img/pcg-ranks.webp" alt="Philippine Coast Guard Auxiliary Hero Image" />
        </div>

        <div class="hero-text">
          <h1>Welcome to the Philippine Coast Guard Auxiliary</h1>
          <p>We are dedicated to supporting the Philippine Coast Guard in safeguarding our seas and maritime interests.</p>
          <p>Join us in our mission to ensure the safety and security of our waters.</p><br>
          <p>We are honored to have you explore our online portal, where you can learn more about the dedicated volunteer arm of the Philippine Coast Guard. As part of our mission to support maritime safety, environmental protection, and disaster response, the PCGA stands ready to serve the nation and its communities.
            Whether you are here to learn about our ongoing initiatives, seek volunteer opportunities, or stay updated on the latest news, we hope this website serves as a helpful and informative resource. We invite you to join us in making a positive impact on our seas and coastal communities. Together, we can ensure safer waters and a resilient maritime environment for all Filipinos.</p>
        </div>
      </section>

      <section class="projects-container">
        <h2>Projects/Activities for 2015 and Beyond</h2>
        <div class="additional-images">
          <div class="project" v-for="project in projects" :key="project.id">
            <img :src="`/img/${project.image}`" alt="" class="project-image" />
            <p>{{ project.title }}</p>
          </div>
        </div>
      </section>

      <section class="services">
        <h2>Our Core Functions</h2>
        <div class="service-grid">
          <div v-for="service in services" :key="service.id" class="service-card">
            <i :class="service.icon"></i>
            <h3>{{ service.title }}</h3>
            <p>{{ service.description }}</p>
          </div>
        </div>
      </section>
    </main>

    <footer class="footer">
      <div class="social-links">
        <a href="#" class="social-icon">
          <i class="fab fa-facebook-f"></i>
        </a>
        <a href="#" class="social-icon">
          <i class="fab fa-twitter"></i>
        </a>
        <a href="#" class="social-icon">
          <i class="fab fa-instagram"></i>
        </a>
      </div>

      <div class="footer-links">
        <router-link to="/terms" class="footer-link">Terms of Service</router-link>
        <router-link to="/privacy" class="footer-link">Privacy Policy</router-link>
      </div>

      <div class="contact-info">
        <p class="organization">Philippine Coast Guard Auxiliary</p>
        <p class="contact-person">Contact Person: Noemi Joy F. Alfante</p>
        <p class="phone">Phone: 0975 563 3517</p>
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
  components:{
HelloWorld
  },
  data() {
    return {
      isLoggedIn: false, // Add isLoggedIn here if it's not defined elsewhere
      services: [
        { id: 1, title: 'MARSAF (Maritime Safety)', description: 'Encompasses safety protocols, regulations, and practices within the maritime industry.', icon: 'fas fa-shield-alt' },
        { id: 2, title: 'MAREP (Maritime Environment Protection)', description: 'Involves efforts to protect marine ecosystems, prevent pollution, and promote sustainable practices.', icon: 'fas fa-leaf' },
        { id: 3, title: 'MARSAR (Maritime Search and Rescue)', description: 'Deals with emergency response, coordination, and rescue operations at sea.', icon: 'fas fa-life-ring' },
        { id: 4, title: 'MCOMREL (Maritime Community Relations)', description: 'Fosters positive relationships between maritime stakeholders, communities, and organizations.', icon: 'fas fa-users' },
      ],
      projects: [
        { id: 1, title: 'Blood Donation', image: '434202946_10163443568453852_665190660552754798_n.jpg' },
        { id: 2, title: 'Medical Assistance', image: 'DxU5FxxUwAAqnLf.jfif' },
        { id: 3, title: 'Dental Assistance', image: '405965871_798994005599287_7807612907306473337_n (1).jpg'},
        { id: 4, title: 'Tree planting', image: '439218177_1488834228705483_9021847312691142682_n.jpg'},
      ],
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
    },
  },
};
</script>
<style scoped>
/* General Styles */
body {
  font-family: sans-serif;
  margin: 0;
  padding: 0;
}

.container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  background-color: #f5f5f5;
}

.navbar {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #2c3e50;
  color: #fff;
  z-index: 1000; /* Ensure it's above other elements */
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
  gap: 20px; /* Add some space between buttons */
}

.logo img {
  height: 50px;
}

.nav-links {
  display: flex;
  list-style: none;
  padding: 0;
  margin: 0;
}

.nav-link {
  color: #fff;
  margin-left: 1.5rem;
  text-decoration: none;
  font-weight: bold;
  transition: all 0.3s ease;
}

.nav-link:hover {
  color: #3498db;
}

/* Main Content Styles */
main {
  flex: 1;
  padding: 2rem;
}

/* Hero Section Styles */
.hero {
  display: flex;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  margin-bottom: 2rem;
}

.hero-image {
  flex: 1;
}

.hero-image img {
  width: 100%;
  border-radius: 10px 0 0 10px;
  object-fit: cover;
}

.hero-text {
  flex: 1;
  padding: 1rem;
}

.hero-text h1 {
  font-size: 2rem;
  margin-bottom: 1rem;
}

.hero-btn {
  background-color: #3498db;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.hero-btn:hover {
  background-color: #2980b9;
}

/* Projects Container Styles */
.projects-container {
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  padding: 2rem;
}

.projects-container h2 {
  text-align: center;
  margin-bottom: 1rem;
}

.additional-images {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  gap: 1rem;
}

.project {
  flex: 1 1 calc(25% - 1rem);
  text-align: center;
  padding: 1rem;
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.project:hover {
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.project-image {
  width: 100%;
  border-radius: 5px;
  object-fit: cover;
}

.project p {
  margin-top: 0.5rem;
}

/* Services Section Styles */
.services {
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  padding: 2rem;
  margin-bottom: 2rem;
}

.services h2 {
  text-align: center;
  margin-bottom: 1rem;
}

.service-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  grid-gap: 1rem;
}

.service-card {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 1rem;
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  transition: all 0.3s ease;
}


.service-card:hover {
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.service-card i {
  font-size: 2em;
  margin-bottom: 1rem;
  color: #3498db;
}

.service-card h3 {
  font-size: 1.2em;
  margin-bottom: 0.5rem;
  color: #333;
}

.service-card p {
  font-size: 1em;
  text-align: center;
}

/* Footer Styles */
.footer {
  background-color: #2c3e50;
  color: #fff;
  padding: 1rem 2rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.social-links {
  display: flex;
}
.social-icon {
  color: #fff;
  margin-right: 1rem;
  transition: all 0.3s ease;
}

.social-icon:hover {
  color: #3498db;
}

.footer-links {
  display: flex;
  flex-direction: column;
  margin-left: 2rem;
}

.footer-link {
  color: #fff;
  text-decoration: none;
  margin-bottom: 0.5rem;
  transition: all 0.3s ease;
}

.footer-link:hover {
  color: #3498db;
}

.contact-info {
  flex: 1;
}

.contact-info p {
  margin-bottom: 0.5rem;
  font-size: 0.8em;
}

.feedback-text {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
}

.feedback-text p {
  font-size: 0.8em;
  margin-bottom: 0.5rem;
}

.feedback-btn {
  background-color: #3498db;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.feedback-btn:hover {
  background-color: #2980b9;
}
</style>

<style scoped>
/* Global styles */
body {
  font-family: 'Roboto', sans-serif;
  margin: 0;
  padding: 0;
}


/* Navbar styles */
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #2c3e50;
  color: #fff;
  z-index: 1000; /* Ensure it's above other elements */
}

/* Nav Left styles */
.nav-left {
  display: flex;
  align-items: center;
}

/* Nav Right styles */
.nav-right {
  display: flex;
  align-items: center;
  gap: 20px; /* Add some space between buttons */
}

/* Logo link styles */
.logo-link {
  text-decoration: none;
  color: #fff;
}

/* Coast Guard Logo styles */
.coast-guard-logo {
  height: 50px;
  margin-right: 10px;
}

/* App Title styles */
.app-title {
  font-size: 1.8em;
  font-weight: bold;
}

/* Header button styles */
.header-button {
  color: #fff;
  text-decoration: none;
  font-weight: bold;  
  transition: color 0.3s ease;
}

.header-button:hover {
  color: #f39c12; /* Change color on hover */
}

/* Logout button styles */
.logout-btn {
  color: #fff;
  background-color: transparent;
  border: none;
  cursor: pointer;
  font-weight: bold;
  transition: color 0.3s ease;
}

.logout-btn:hover {
  color: #f39c12; /* Change color on hover */
}

.spacer {
  height: 100px; /* Adjust the height for desired spacing */
}

/* Additional CSS for responsiveness */
@media only screen and (max-width: 768px) {
  .nav-right {
    display: none; /* Hide right-side navigation links on small screens */
  }

  .nav-left {
    margin-right: auto; /* Push logo to the left on small screens */
  }

  .navbar {
    padding: 10px; /* Adjust padding for smaller screens */
  }

  .nav-left .app-title {
    font-size: 1.4em; /* Decrease font size for smaller screens */
  }

  .nav-left .coast-guard-logo {
    height: 40px; /* Decrease logo size for smaller screens */
  }

  .spacer {
    height: 60px; /* Adjust spacing for smaller screens */
  }

  .form-container {
    width: 90%; /* Make form container width 90% on small screens */
    margin: 20px auto; /* Adjust margin for smaller screens */
  }

  .step-container {
    margin-bottom: 20px; /* Adjust margin for smaller screens */
  }

  .step-title {
    font-size: 16px; /* Decrease font size for smaller screens */
  }

  .form-input {
    padding: 8px; /* Adjust padding for smaller screens */
  }

  .button-container {
    flex-direction: column; /* Stack buttons vertically on smaller screens */
  }

  button {
    width: 100%; /* Make buttons full width on smaller screens */
  }
}

.header-button {
  color: #fff;
  text-decoration: none;
  font-weight: bold;  
  transition: color 0.3s ease;
}

.header-button:hover {
  color: #f39c12; /* Change color on hover */
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