<template>
  <div class="container">
    <header class="navbar">
      <div class="logo">
        <img src="/img/PCGA.png" alt="Philippine Coast Guard Auxiliary Logo" class="coast-guard-logo" />
      </div>
      <nav class="nav-links">
        <router-link to="/" class="nav-link" exact>Home</router-link>
        <router-link to="/Home" class="nav-link">About</router-link>
        <router-link to="/Logincomponent" class="nav-link">Login</router-link>
      </nav>
    </header>

    <main>
      <section class="hero">
        <div class="hero-image">
          <img src="/img/pcg-ranks.webp" alt="Philippine Coast Guard Auxiliary Hero Image" />
        </div>
        <div class="hero-text">
          <div class="welcome-card">
            <h2>Welcome to PCGAWebApp!</h2>
            <p>
              We're thrilled to have you here! The Philippine Coast Guard Auxiliary (PCGA) is a service-oriented, uniformed volunteer organization established in 1972 by the Philippine Coast Guard. As an applicant, you're about to embark on a journey towards becoming a part of a community dedicated to maritime safety, marine environmental protection, and community service.
            </p>
            <p>
              Through this web application, you'll be able to apply and track your application status, learn more about our projects and services, and stay updated with the latest news and events. Let's safeguard our seas together!
            </p>
            <button class="apply-btn" @click="startApplication">Start Application</button>
          </div>
        </div>
      </section>

      <section class="projects-container">
        <h2>Projects/Activities for 2015 and Beyond</h2>
        <div class="additional-images">
          <div class="project" v-for="project in projects" :key="project.id">
            <img :src="`/img/${project.image}`" :alt="project.title" class="project-image" />
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
        <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
        <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
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
        <button class="feedback-btn" @click="openFeedbackModal">Leave Feedback</button>
      </div>
    </footer>

    <!-- Feedback Modal -->
    <div v-if="showFeedbackModal" class="modal">
      <div class="modal-content">
        <span class="close" @click="closeFeedbackModal">&times;</span>
        <h2>Leave Your Feedback</h2>
        <form @submit.prevent="submitFeedback">
          <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" v-model="feedbackForm.name" required />
          </div>
          <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" v-model="feedbackForm.email" required />
          </div>
          <div class="form-group">
            <label for="message">Feedback:</label>
            <textarea id="message" v-model="feedbackForm.message" required></textarea>
          </div>
          <button type="submit" :disabled="isSubmitting">
            {{ isSubmitting ? 'Submitting...' : 'Submit Feedback' }}
          </button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      showFeedbackModal: false,
      isSubmitting: false,
      feedbackForm: {
        name: '',
        email: '',
        message: ''
      },
      services: [
        { id: 1, title: 'MARSAF (Maritime Safety)', description: 'Safety protocols, regulations, and practices in the maritime industry.', icon: 'fas fa-shield-alt' },
        { id: 2, title: 'MAREP (Maritime Environment Protection)', description: 'Efforts to protect marine ecosystems, prevent pollution, and promote sustainable practices.', icon: 'fas fa-leaf' },
        { id: 3, title: 'MARSAR (Maritime Search and Rescue)', description: 'Emergency response, coordination, and rescue operations at sea.', icon: 'fas fa-life-ring' },
        { id: 4, title: 'MCOMREL (Maritime Community Relations)', description: 'Fosters positive relationships between maritime stakeholders and communities.', icon: 'fas fa-users' }
      ],
      projects: [
        { id: 1, title: 'Blood Donation', image: '434202946_10163443568453852_665190660552754798_n.jpg' },
        { id: 2, title: 'Medical Assistance', image: 'DxU5FxxUwAAqnLf.jfif' },
        { id: 3, title: 'Dental Assistance', image: '405965871_798994005599287_7807612907306473337_n (1).jpg' },
        { id: 4, title: 'Tree Planting', image: '439218177_1488834228705483_9021847312691142682_n.jpg' }
      ]
    };
  },
  methods: {
  startApplication() {
    const confirmLogin = confirm('You need to log in before starting the application. Do you want to log in now?');
    if (confirmLogin) {
      this.$router.push('/Logincomponent');
    }
  },
  openFeedbackModal() {
    this.showFeedbackModal = true;
  },
  closeFeedbackModal() {
    this.showFeedbackModal = false;
    this.resetFeedbackForm();
  },
  resetFeedbackForm() {
    this.feedbackForm = {
      name: '',
      email: '',
      message: ''
    };
  },
  async submitFeedback() {
    if (this.feedbackForm.name.trim() === '' || this.feedbackForm.email.trim() === '' || this.feedbackForm.message.trim() === '') {
      alert('Please fill out all fields.');
      return;
    }

    this.isSubmitting = true; // Start the submission process
    try {
      // Replace '/api/submit' with your actual API endpoint
      await axios.post('/api/submitFeedback', this.feedbackForm);
      
      // Notify the user of successful submission
      alert('Feedback submitted successfully! Thank you!');
      this.resetFeedbackForm(); // Clear input fields after submission
    } catch (error) {
      console.error('Error submitting Feedback:', error);
      alert('There was an error submitting your feedback. Please try again later.');
    } finally {
      this.isSubmitting = false; // Reset submission state
    }
  }
}
};
</script>

<style scoped>
/* General Styles */
body {
  font-family: 'Roboto', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f5f5f5;
}

.container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  background-color: #fff;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.05);
}

/* Header Styles */
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem 2rem;
  background-color: #2c3e50;
  color: #fff;
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

.welcome-card {
  background-color: #f8f9fa;
  border-radius: 10px;
  padding: 2rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.welcome-card h2 {
  color: #2c3e50;
  margin-bottom: 1rem;
}

.welcome-card p {
  color: #34495e;
  margin-bottom: 1rem;
}

.apply-btn {
  background-color: #3498db;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.apply-btn:hover {
  background-color: #2980b9;
}

/* Projects Container Styles */
.projects-container {
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  padding: 2rem;
  margin-bottom: 2rem;
}

.projects-container h2 {
  text-align: center;
  margin-bottom: 1rem;
  color: #333;
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
  color: #333;
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
  color:  #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.feedback-btn:hover {
  background-color: #2980b9;
}

/* Modal Styles */
.modal {
  display: flex;
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0,0,0,0.4);
  align-items: center;
  justify-content: center;
}

.modal-content {
  background-color: #fefefe;
  padding: 2rem;
  border-radius: 10px;
  width: 90%;
  max-width: 500px;
  position: relative;
}

.close {
  color: #aaa;
  position: absolute;
  top: 10px;
  right: 20px;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
}

.form-group {
  margin-bottom: 1rem;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
}

.form-group input,
.form-group textarea {
  width: 100%;
  padding: 0.5rem;
  border: 1px solid #ddd;
  border-radius: 4px;
}

.form-group textarea {
  height: 100px;
}

button[type="submit"] {
  background-color: #3498db;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
  background-color: #2980b9;
}

button[type="submit"]:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}

/* Responsive Styles */
@media (max-width: 768px) {
  .hero {
    flex-direction: column;
  }

  .hero-image,
  .hero-text {
    width: 100%;
  }

  .project {
    flex: 1 1 calc(50% - 1rem);
  }

  .footer {
    flex-direction: column;
    align-items: center;
  }

  .social-links,
  .footer-links,
  .contact-info,
  .feedback-text {
    width: 100%;
    text-align: center;
    margin-bottom: 1rem;
  }
}
</style>