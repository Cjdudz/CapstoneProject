<template>
  <div class="app-container">
    <!-- Navigation bar -->
    <nav class="navbar">
      <div class="navbar-container">
        <router-link to="/Home" class="navbar-logo">
          <img src="/img/PCGA-removebg-preview.png" alt="Philippine Coast Guard Auxiliary Logo" class="navbar-logo-image" />
          <div class="navbar-logo-text">
            <span class="navbar-logo-title">PCGA</span>
            <span class="navbar-logo-subtitle">Philippine Coast Guard Auxiliary</span>
          </div>
        </router-link>
        <div class="navbar-links" :class="{ 'active': mobileMenuOpen }">
          <router-link to="/Transparency" class="navbar-link">Transparency Seal</router-link>
          <router-link to="/Disctricts" class="navbar-link">Coast Guard Districts</router-link>
          <router-link to="/LandingApp" class="navbar-link">Apply Online</router-link>
          <router-link to="/Userstatus" class="navbar-link">User Status</router-link>
          <button @click="loginOrLogout" class="navbar-button">
            {{ isLoggedIn ? 'Logout' : 'Login' }}
          </button>
        </div>
        <button class="mobile-menu-toggle" @click="toggleMobileMenu">
          <span></span>
          <span></span>
          <span></span>
        </button>
      </div>
    </nav>

    <!-- Main content -->
    <main class="main-content">
      <HelloWorld />

      <section class="hero">
        <div class="hero-content">
          <div class="hero-text">
            <h1 class="hero-title">Safeguarding Philippine Waters</h1>
            <p class="hero-description">Join the Philippine Coast Guard Auxiliary in our mission to protect our maritime interests and ensure the safety of our seas.</p>
            <div class="hero-cta">
              <router-link to="/apply" class="cta-button primary">Apply to Join PCGA</router-link>
              <router-link to="/learn-more" class="cta-button secondary">Learn More</router-link>
            </div>
          </div>
          <div class="hero-image">
            <img src="/img/pcg-ranks.webp" alt="Philippine Coast Guard Auxiliary Officers" />
          </div>
        </div>
      </section>

      <section class="announcements">
        <h2 class="section-title">Important Announcements</h2>
        <div class="announcement-container">
          <div v-for="announcement in announcements" :key="announcement.id" class="announcement">
            <h3 class="announcement-title">{{ announcement.title }}</h3>
            <p class="announcement-text">{{ announcement.content }}</p>
            <a :href="announcement.link" class="announcement-link">Read More</a>
          </div>
        </div>
      </section>

      <section class="services">
        <h2 class="section-title">Our Core Functions</h2>
        <div class="services-grid">
          <div v-for="service in services" :key="service.id" class="service-card">
            <i :class="service.icon" class="service-icon"></i>
            <h3 class="service-title">{{ service.title }}</h3>
            <p class="service-description">{{ service.description }}</p>
          </div>
        </div>
      </section>

      <section class="projects">
        <h2 class="section-title">Recent Projects and Activities</h2>
        <div class="projects-grid">
          <div v-for="project in projects" :key="project.id" class="project-card">
            <img :src="`/img/${project.image}`" :alt="project.title" class="project-image" />
            <div class="project-overlay">
              <h3 class="project-title">{{ project.title }}</h3>
              <p class="project-description">{{ project.description }}</p>
            </div>
          </div>
        </div>
      </section>
    </main>

    <footer class="footer">
      <div class="footer-content">
        <div class="footer-section">
          <h3 class="footer-title">Contact Us</h3>
          <p class="footer-text">Philippine Coast Guard Auxiliary</p>
          <p class="footer-text">139 25th Street, Port Area, Manila</p>
          <p class="footer-text">Phone: (02) 8527-8481 to 89</p>
          <p class="footer-text">Email: pcgacommandant@coastguard.gov.ph</p>
        </div>
        <div class="footer-section">
          <h3 class="footer-title">Quick Links</h3>
          <router-link to="/about" class="footer-link">About PCGA</router-link>
          <router-link to="/careers" class="footer-link">Careers</router-link>
          <router-link to="/news" class="footer-link">News and Updates</router-link>
          <router-link to="/faq" class="footer-link">FAQs</router-link>
        </div>
        <div class="footer-section">
          <h3 class="footer-title">Follow Us</h3>
          <div class="social-links">
            <a href="https://www.facebook.com/PCGHQ" target="_blank" rel="noopener noreferrer" class="social-link"><i class="fab fa-facebook-f"></i></a>
            <a href="https://twitter.com/PhilCoastGuard1" target="_blank" rel="noopener noreferrer" class="social-link"><i class="fab fa-twitter"></i></a>
            <a href="https://www.instagram.com/philippinecoastguard" target="_blank" rel="noopener noreferrer" class="social-link"><i class="fab fa-instagram"></i></a>
            <a href="https://www.youtube.com/c/PhilippineCoastGuardOfficial" target="_blank" rel="noopener noreferrer" class="social-link"><i class="fab fa-youtube"></i></a>
          </div>
        </div>
      </div>
      <div class="footer-bottom">
        <p>&copy; {{ currentYear }} Philippine Coast Guard Auxiliary. All rights reserved.</p>
        <div class="footer-bottom-links">
          <router-link to="/privacy" class="footer-link">Privacy Policy</router-link>
          <router-link to="/terms" class="footer-link">Terms of Service</router-link>
          <router-link to="/accessibility" class="footer-link">Accessibility</router-link>
        </div>
      </div>
    </footer>
  </div>
</template>

<script>
import { ref, onMounted, computed } from 'vue';
import axios from 'axios';
import HelloWorld from './HelloWorld.vue';

export default {
  components: {
    HelloWorld
  },
  setup() {
    const isLoggedIn = ref(false);
    const mobileMenuOpen = ref(false);
    const currentYear = computed(() => new Date().getFullYear());
    const announcements = ref([]);

    const services = ref([
      { id: 1, title: 'MARSAF (Maritime Safety)', description: 'Ensuring safety protocols and regulations within the maritime industry.', icon: 'fas fa-shield-alt' },
      { id: 2, title: 'MAREP (Maritime Environment Protection)', description: 'Protecting marine ecosystems and promoting sustainable practices.', icon: 'fas fa-leaf' },
      { id: 3, title: 'MARSAR (Maritime Search and Rescue)', description: 'Coordinating emergency response and rescue operations at sea.', icon: 'fas fa-life-ring' },
      { id: 4, title: 'MCOMREL (Maritime Community Relations)', description: 'Fostering positive relationships with maritime stakeholders and communities.', icon: 'fas fa-users' },
    ]);

    const projects = ref([
      { id: 1, title: 'Blood Donation Drive', image: '434202946_10163443568453852_665190660552754798_n.jpg', description: 'Annual blood donation campaign to support local hospitals.' },
      { id: 2, title: 'Medical Mission', image: 'DxU5FxxUwAAqnLf.jfif', description: 'Providing free medical services to coastal communities.' },
      { id: 3, title: 'Dental Health Program', image: '405965871_798994005599287_7807612907306473337_n (1).jpg', description: 'Offering dental check-ups and treatments to underserved areas.' },
      { id: 4, title: 'Coastal Reforestation', image: '439218177_1488834228705483_9021847312691142682_n.jpg', description: 'Planting mangroves to protect coastlines and marine habitats.' },
    ]);

    const fetchAnnouncements = async () => {
      try {
        const response = await axios.get('https://pcga505th.online/api/announcements');
        announcements.value = response.data;
      } catch (error) {
        console.error('Error fetching announcements:', error);
      }
    };

    onMounted(() => {
      fetchAnnouncements();
    });

    const loginOrLogout = () => {
      if (isLoggedIn.value) {
        logout();
      } else {
        redirectTo('/');
      }
    };

    const logout = () => {
      console.log("Logout clicked");
      isLoggedIn.value = false;
    };

    const redirectTo = (path) => {
      // Implement router push logic here
      console.log(`Redirecting to ${path}`);
    };

    const toggleMobileMenu = () => {
      mobileMenuOpen.value = !mobileMenuOpen.value;
    };

    return {
      isLoggedIn,
      mobileMenuOpen,
      currentYear,
      announcements,
      services,
      projects,
      loginOrLogout,
      toggleMobileMenu
    };
  }
};
</script>

<style scoped>
/* Global Styles */
:root {
  --primary-color: #003366;
  --secondary-color: #0066cc;
  --accent-color: #ffd700;
  --text-color: #333333;
  --background-color: #f0f0f0;
  --white: #ffffff;
}

body {
  font-family: 'Roboto', 'Arial', sans-serif;
  margin: 0;
  padding: 0;
  background-color: var(--background-color);
  color: var(--text-color);
  line-height: 1.6;
}

.app-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

/* Navbar Styles */
.navbar {
  background-color: var(--primary-color);
  padding: 0.5rem 2rem;
  position: fixed;
  width: 100%;
  top: 0;
  left: 0;
  z-index: 1000;
}

.navbar-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  max-width: 1200px;
  margin: 0 auto;
}

.navbar-logo {
  display: flex;
  align-items: center;
  text-decoration: none;
  color: var(--white);
}

.navbar-logo-image {
  height: 50px;
  margin-right: 1rem;
}

.navbar-logo-text {
  display: flex;
  flex-direction: column;
}

.navbar-logo-title {
  font-size: 1.5rem;
  font-weight: bold;
}

.navbar-logo-subtitle {
  font-size: 0.8rem;
  opacity: 0.8;
}

.navbar-links {
  display: flex;
  align-items: center;
}

.navbar-link {
  color: var(--white);
  text-decoration: none;
  margin-left: 1.5rem;
  font-weight: 500;
}

.navbar-button {
  background-color: var(--accent-color);
  color: var(--primary-color);
  border: none;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  cursor: pointer;
  margin-left: 1.5rem;
  font-weight: bold;
}

.mobile-menu-toggle {
  display: none;
}

/* Main Content Styles */
.main-content {
  margin-top: 80px;
  padding: 2rem;
  max-width: 1200px;
  margin-left: auto;
  margin-right: auto;
}

/* Hero Section Styles */
.hero {
  background-color: var(--white);
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  margin-bottom: 2rem;
}

.hero-content {
  display: flex;
  align-items: center;
}

.hero-text {
  flex: 1;
  padding: 2rem;
}

.hero-title {
  font-size: 2.5rem;
  margin-bottom: 1rem;
  color: var(--primary-color);
}

.hero-description {
  font-size: 1.1rem;
  margin-bottom: 1.5rem;
}

.hero-cta {
  display: flex;
  gap: 1rem;
}

.cta-button {
  padding: 0.75rem 1.5rem;
  border-radius: 4px;
  text-decoration: none;
  font-weight: bold;
}

.cta-button.primary {
  background-color: var(--secondary-color);
  color: var(--white);
}

.cta-button.secondary {
  background-color: var(--white);
  color: var(--secondary-color);
  border: 2px solid var(--secondary-color);
}

.hero-image {
  flex: 1;
}

.hero-image img {
  width: 100%;
  height: auto;
  object-fit: cover;
}

/* Announcements Section Styles */
.announcements {
  background-color: var(--white);
  border-radius: 8px;
  padding: 2rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  margin-bottom: 2rem;
}

.announcement-container {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
}

.announcement {
  flex: 1 1 300px;
  background-color: #f9f9f9;
  padding: 1.5rem;
  border-radius: 8px;
  border-left: 4px solid var(--secondary-color);
}

.announcement-title {
  font-size: 1.2rem;
  color: var(--primary-color);
  margin-bottom: 0.5rem;
}

.announcement-text {
  margin-bottom: 1rem;
}

.announcement-link {
  color: var(--secondary-color);
  text-decoration: none;
  font-weight: bold;
}

/* Services Section Styles */
.services {
  background-color: var(--white);
  border-radius: 8px;
  padding: 2rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  margin-bottom: 2rem;
}

.section-title {
  font-size: 2rem;
  margin-bottom: 1.5rem;
  color: var(--primary-color);
  text-align: center;
}

.services-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1.5rem;
}

.service-card {
  background-color: #f9f9f9;
  border-radius: 8px;
  padding: 1.5rem;
  text-align: center;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.service-icon {
  font-size: 2.5rem;
  color: var(--secondary-color);
  margin-bottom: 1rem;
}

.service-title {
  font-size: 1.2rem;
  margin-bottom: 0.5rem;
  color: var(--primary-color);
}

.service-description {
  font-size: 0.9rem;
}

/* Projects Section Styles */
.projects {
  background-color: var(--white);
  border-radius: 8px;
  padding: 2rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  margin-bottom: 2rem;
}

.projects-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1.5rem;
}

.project-card {
  position: relative;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.project-image {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.project-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: rgba(0, 0, 0, 0.7);
  color: var(--white);
  padding: 1rem;
}

.project-title {
  font-size: 1.1rem;
  margin-bottom: 0.5rem;
}

.project-description {
  font-size: 0.9rem;
}

/* Footer Styles */
.footer {
  background-color: var(--primary-color);
  color: var(--white);
  padding: 2rem;
}

.footer-content {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  max-width: 1200px;
  margin: 0 auto;
}

.footer-section {
  flex: 1;
  min-width: 200px;
  margin-bottom: 1rem;
}

.footer-title {
  font-size: 1.2rem;
  margin-bottom: 1rem;
  color: var(--accent-color);
}

.footer-text {
  margin-bottom: 0.5rem;
}

.social-links {
  display: flex;
  gap: 1rem;
}

.social-link {
  color: var(--white);
  font-size: 1.5rem;
}

.footer-link {
  display: block;
  color: var(--white);
  text-decoration: none;
  margin-bottom: 0.5rem;
}

.footer-bottom {
  max-width: 1200px;
  margin: 2rem auto 0;
  padding-top: 1rem;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
}

.footer-bottom p {
  margin: 0;
}

.footer-bottom-links {
  display: flex;
  gap: 1rem;
}

/* Responsive Design */
@media (max-width: 768px) {
  .navbar-container {
    flex-direction: column;
    align-items: flex-start;
  }

  .navbar-links {
    display: none;
    flex-direction: column;
    width: 100%;
    padding-top: 1rem;
  }

  .navbar-links.active {
    display: flex;
  }

  .navbar-link, .navbar-button {
    margin: 0.5rem 0;
  }

  .mobile-menu-toggle {
    display: block;
    background: none;
    border: none;
    cursor: pointer;
    padding: 0.5rem;
  }

  .mobile-menu-toggle span {
    display: block;
    width: 25px;
    height: 3px;
    background-color: var(--white);
    margin: 5px 0;
  }

  .hero-content {
    flex-direction: column;
  }

  .hero-image {
    order: -1;
  }

  .hero-cta {
    flex-direction: column;
  }

  .footer-content {
    flex-direction: column;
  }

  .footer-section {
    margin-bottom: 2rem;
  }

  .footer-bottom {
    flex-direction: column;
    text-align: center;
  }

  .footer-bottom-links {
    margin-top: 1rem;
    justify-content: center;
  }
}
</style>