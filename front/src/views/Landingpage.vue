<template>
  <div>
    <nav class="navbar">
      <div class="logo">
        <img src="/img/PCGA.png" alt="Philippine Coast Guard Auxiliary Logo" class="coast-guard-logo" />
      </div>
      <div class="search-bar">
        <input type="text" v-model="searchQuery" class="search-input" placeholder="Search Services">
        <button class="search-btn" @click="search">Search</button>
      </div>

      <div class="nav-links">
        <router-link to="/" class="nav-link" exact>Home</router-link> 
        <router-link to="/Home" class="nav-link">About</router-link>
        <router-link to="/contacts" class="nav-link">Contact</router-link>
        <router-link to="/logincomponent" class="nav-link">Login</router-link>
      </div>
    </nav>
    
    <div class="landing-page">
      <header class="hero">
        <div class="hero-image">
          <img src="img/download.jpg" alt="Philippine Coast Guard Auxiliary Hero Image" /> 
        </div>
        <div class="hero-text">
          <h1>Welcome to the Philippine Coast Guard Auxiliary</h1>
          <p>We are dedicated to supporting the Philippine Coast Guard in safeguarding our seas and maritime interests.</p>
          <router-link to="/Home" class="hero-btn">Learn More</router-link>
        </div>
      </header>

      <section class="services">
        <h2>Our Services</h2>
        <div class="service-grid"> 
          <div v-for="service in filteredServices" :key="service.id" class="service-card">
            <i :class="service.icon"></i> 
            <h3>{{ service.title }}</h3>
            <p>{{ service.description }}</p>
          </div>
        </div>
        <div v-if="filteredServices.length === 0" class="no-results">No results found.</div>
      </section>

      <section class="contact">
        <h2>Contact Us</h2>
        <p>
          In case of emergency, please call 911. For non-emergency inquiries and information, you can reach us at:
        </p>
        <address>
          <p>Philippine Coast Guard Headquarters</p>
          <p>123 Seafront Avenue</p>
          <p>City, Country</p>
          <p>Email: info@coastguard.gov</p>
          <p>Phone: (123) 456-7890</p>
        </address>
      </section>
    </div>

    <!-- Feedback Section -->
    <footer class="feedback">
      <div class="social-links">
        <!-- Social media icons and links -->
        <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
        <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
        <!-- Add more social media icons as needed -->

        <!-- Links for PCA -->
        <router-link to="/terms" class="footer-link">Terms of Service</router-link>
        <router-link to="/privacy" class="footer-link">Privacy Policy</router-link>
        <!-- Add more links related to PCA -->
      </div>
      <div class="feedback-text">
        <p>Have feedback? Let us know!</p>
        <button class="feedback-btn">Leave Feedback</button>
      </div>
    </footer>
  </div>
</template>

<script>
export default {
  name: 'LandingPage',
  data() {
    return {
      searchQuery: '',
      services: [
        { id: 1, title: 'Search and Rescue', description: 'The Philippine Coast Guard is always ready to respond to emergencies at sea.', icon: 'fas fa-life-ring' },
        { id: 2, title: 'Maritime Law Enforcement', description: 'Ensuring safety and security on our waterways.', icon: 'fas fa-ship' },
        { id: 3, title: 'Environmental Protection', description: 'Protecting our oceans and coasts for future generations.', icon: 'fas fa-leaf' },
        { id: 4, title: 'Port Security', description: 'Keeping our ports safe and secure.', icon: 'fas fa-anchor' }
      ]
    };
  },
  computed: {
    filteredServices() {
      if (!this.searchQuery.trim()) {
        return this.services;
      }
      return this.services.filter(service =>
        service.title.toLowerCase().includes(this.searchQuery.toLowerCase())
      );
    }
  },
  methods: {
    search() {
      // Perform search functionality if needed
    }
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

.search-bar {
  display: flex;
  align-items: center;
  margin-right: 20px;
}

.search-input {
  padding: 5px 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
}

.search-btn {
  background-color: #3498db; /* Light blue color */
  color: #fff;
  border: none;
  padding: 5px 10px;
  border-radius: 5px;
  cursor: pointer;
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

.nav-link.active {
  color: #3498db; /* Light blue color for active link */
}

.landing-page {
  padding: 20px;
  font-family: 'Raleway', sans-serif; /* Google Font: Raleway */
  background-image: url('C:\laragon\www\CapstoneProject\front\public\img\385484006_730465255796324_334538059090882611_n.png'); /* Path to your background image */
  background-size: cover; /* Cover the entire container with the background image */
  background-position: center;
  background-repeat: no-repeat;
  border-radius: 10px; /* Add border radius for rounded corners */
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  align-items: center; /* Center the items horizontally */
  gap: 20px;
}

/* Hero Section Styles */
.hero {
  display: flex;
  background-color: #2c3e50;
  color: #fff;
  padding: 20px;
  border-radius: 10px 10px 0 0; /* Rounded top corners */
}

.hero-image {
  flex: 1; /* Image takes up half the space */
}

.hero-image img {
  width: 100%; /* Responsive image */
  border-radius: 5px; /* Rounded image corners */
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
  background-color: #2c3e50; /* Dark blue color */
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  margin-top: 15px;
}

.services {
  background-color: #f9f9f9; /* Light grey background */
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  margin-bottom: 40px; /* Add more space after services */
}

.service-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); /* Responsive grid layout */
  grid-gap: 20px; /* Gap between service cards */
}

.service-card {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  cursor: pointer; /* Simulate hover effect for cards */
  transition: all 0.3s ease;
  background-color: #fff; /* Light background for cards */
}

.service-card:hover {
  transform: translateY(-5px); /* Add a slight lift effect on hover */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.service-card i {
  font-size: 2em; /* Increase icon size */
  margin-bottom: 15px; /* Space between icon and title */
  color: #3498db; /* Blue color for icons */
}

.service-card h3 {
  font-size: 1.2em; /* Increase title font size */
  margin-bottom: 10px;
  color: #333; /* Dark color for titles */
}

.service-card p {
  font-size: 1em; /* Description font size */
  text-align: center; /* Center-align description */
}

/* Contact Section Styles */
.contact {
  background-color: rgba(249, 249, 249, 0.9); /* Light grey background with reduced opacity */
  padding: 10px; /* Reduced padding */
  border-radius: 10px;
  box-shadow: none; /* Removed box shadow */
  margin-bottom: 20px; /* Reduced margin bottom */
}

.contact h2 {
  font-size: 1.5em; /* Reduced title font size */
  margin-bottom: 15px; /* Reduced space between title and content */
}

.contact p {
  font-size: 0.9em; /* Reduced content font size */
  line-height: 1.4; /* Reduced line height */
  margin-bottom: 8px; /* Reduced space between paragraphs */
}

/* Address Styles */
.address {
  margin-top: 10px; /* Reduced space above address */
}

.address p {
  font-size: 0.9em; /* Reduced address font size */
  margin-bottom: 3px; /* Reduced space between address lines */
}

/* Feedback Section Styles */
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

.feedback-text {
  text-align: right;
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
