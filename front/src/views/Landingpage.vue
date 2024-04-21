<template>
  <div class="container">
    <header class="navbar">
      <div class="logo">
        <img src="/img/PCGA.png" alt="Philippine Coast Guard Auxiliary Logo" class="coast-guard-logo" />
      </div>

      <nav class="nav-links">
        <router-link to="/" class="nav-link" exact>Home</router-link>
        <router-link to="/about" class="nav-link">About</router-link>
        <router-link to="/logincomponent" class="nav-link">Login</router-link>
      </nav>
    </header>

    <main>
      <section class="hero">
        <div class="hero-image">
          <img src="/img/download.jpg" alt="Philippine Coast Guard Auxiliary Hero Image" />
        </div>

        <div class="hero-text">
          <h1>Welcome to the Philippine Coast Guard Auxiliary</h1>
          <p>We are dedicated to supporting the Philippine Coast Guard in safeguarding our seas and maritime interests.</p>
          <p>Join us in our mission to ensure the safety and security of our waters.</p><br>
          <router-link to="/about" class="hero-btn">Learn More</router-link>
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
export default {
  data() {
    return {
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
