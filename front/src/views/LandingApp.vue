<template>
  <div class="landing-app">
    <nav class="navbar">
      <div class="nav-left">
        <router-link to="/Home" class="logo-link">
          <img src="img/PCGA-removebg-preview.png" alt="Coast Guard Logo" class="coast-guard-logo" />
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

    <div class="spacer"></div>

    <main class="main-content">
      <div class="container">
        <header class="hero">
          <h1 class="hero-title">Welcome to PCGA Application</h1>
          <p class="hero-subtitle">Join the Philippine Coast Guard Auxiliary</p>
        </header>

        <div class="content-grid">
          <section class="requirements-section">
            <h2 class="section-title">Application Requirements</h2>
            <p class="section-description">Before applying to PCGA, please ensure you meet the following requirements:</p>
            <transition-group name="list" tag="ul" class="requirement-list">
              <li v-for="requirement in requirements" :key="requirement.id" class="requirement-item">
                <span class="requirement-text">{{ requirement.text }}</span>
              </li>
            </transition-group>
            <button class="proceed-button" @click="goToApplicationForm">
              Proceed to Application Form
              <span class="button-icon">→</span>
            </button>
          </section>

          <section class="steps-section">
            <h2 class="section-title">Application Process</h2>
            <div class="steps-grid">
              <div v-for="step in steps" :key="step.id" class="step-card">
                <div class="step-image-container">
                  <img :src="step.image" :alt="step.title" class="step-image">
                </div>
                <h3 class="step-title">{{ step.title }}</h3>
                <p class="step-description">{{ step.description }}</p>
              </div>
            </div>
          </section>
        </div>
      </div>
    </main>

    <footer class="footer">
      <p>&copy; {{ currentYear }} Philippine Coast Guard Auxiliary. All rights reserved.</p>
    </footer>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isLoggedIn: false,
      requirements: [
        { id: 1, text: 'a. DAS Endoresment Letter' },
        { id: 2, text: 'b. Certificate of Squadron Orientation' },
        { id: 3, text: 'c. Duly Accomplished PCGA Application Form' },
        { id: 4, text: 'd. Notarized Personal History Statement (PHS)' },
        { id: 5, text: 'e. NBI Clearance (Original and one photocopy)' },
        { id: 6, text: 'f. National Police Clearance (original)' },
        { id: 7, text: 'g. Barangay Clearance at place of residence (original)'},
        { id: 8, text: 'h. Community Tax Certificate (original)'},
        { id: 9, text: 'i. Drug Test Certificate'},
        { id: 10, text: 'j. Physical Exam Result with X-Ray'},
        { id: 11, text: 'k. Professional License, when appropriate (original for verification and one (1) photocopy)'},
        { id: 12, text: 'l. Four (4) copies of 2x2 colored IP Picture with white background'},
        { id: 13, text: 'm. Foreign applicants shall submit the following additional requirements: Copy of Passport, Visa, Alien Certificate of Registration (ACR) issued by the BI, Authenticated birth certificate, National Security Clearance from NSC, Marriage contract to a Filipino citizen'},
      ],
      steps: [
        { id: 1, title: 'Step 1: Fill Up Identification Card', description: 'Fill up your identification card with the necessary details.' },
        { id: 2, title: 'Step 2: Complete Membership Form', description: 'Complete the membership form to proceed with the application.' },
        { id: 3, title: 'Step 3: Upload Requirements', description: 'Upload the necessary documents and requirements for the application.' }
      ]
    };
  },
  computed: {
    currentYear() {
      return new Date().getFullYear();
    }
  },
  methods: {
    goToApplicationForm() {
      this.$router.push('/Formtemplate');
    },
    loginOrLogout() {
      this.isLoggedIn = !this.isLoggedIn;
      // Implement actual login/logout logic here
    }
  }
};
</script>

<style scoped>
.landing-app {
  font-family: 'Helvetica Neue', Arial, sans-serif;
  color: #333;
  line-height: 1.6;
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
  background-color: #34495e;
  color: #fff;
  z-index: 1000;
}

.nav-left {
  display: flex;
  align-items: center;
}

.nav-right {
  display: flex;
  align-items: center;
  gap: 20px;
}

.logo-link {
  text-decoration: none;
  color: #ecf0f1;
}

.coast-guard-logo {
  height: 50px;
  margin-right: 10px;
}

.app-title {
  font-size: 1.8em;
  font-weight: bold;
}

.header-button {
  color: #fff;
  text-decoration: none;
  font-weight: bold;  
  transition: color 0.3s ease;
}

.header-button:hover {
  color: #f39c12;
}

.logout-btn {
  color: #fff;
  background-color: transparent;
  border: none;
  cursor: pointer;
  font-weight: bold;
  transition: color 0.3s ease;
}

.logout-btn:hover {
  color: #f39c12;
}

.spacer {
  height: 80px;
}

.main-content {
  padding: 20px 0;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

.hero {
  background: linear-gradient(135deg, #34495e, #2c3e50);
  color: white;
  text-align: center;
  padding: 60px 20px;
  border-radius: 10px;
  margin-bottom: 40px;
}

.hero-title {
  font-size: 2.5em;
  margin-bottom: 10px;
  text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
}

.hero-subtitle {
  font-size: 1.2em;
  opacity: 0.9;
}

.content-grid {
  display: grid;
  gap: 40px;
  grid-template-columns: 1fr;
}

@media (min-width: 768px) {
  .content-grid {
    grid-template-columns: 1fr 1fr;
  }
}

.section-title {
  font-size: 2em;
  color: #34495e;
  margin-bottom: 20px;
  text-align: center;
}

.section-description {
  text-align: center;
  margin-bottom: 30px;
  font-size: 1.1em;
  color: #555;
}

.requirement-list {
  list-style-type: none;
  padding: 0;
}

.requirement-item {
  background-color: #f5f5f5;
  padding: 15px;
  margin-bottom: 10px;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  transition: all 0.3s ease;
}

.requirement-item:hover {
  transform: translateX(10px);
  box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}

.requirement-text {
  display: block;
  padding-left: 25px;
  position: relative;
}

.requirement-text::before {
  content: '✓';
  position: absolute;
  left: 0;
  color: #2ecc71;
  font-weight: bold;
}

.proceed-button {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  padding: 15px;
  margin-top: 30px;
  font-size: 1.2em;
  color: #fff;
  background-color: #2ecc71;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.proceed-button:hover {
  background-color: #27ae60;
  transform: scale(1.05);
}

.button-icon {
  margin-left: 10px;
  transition: transform 0.3s ease;
}

.proceed-button:hover .button-icon {
  transform: translateX(5px);
}

.steps-grid {
  display: grid;
  gap: 20px;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
}

.step-card {
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
  padding: 20px;
  text-align: center;
  transition: all 0.3s ease;
}

.step-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 12px rgba(0,0,0,0.15);
}

.step-image-container {
  width: 100%;
  height: 150px;
  overflow: hidden;
  border-radius: 5px;
  margin-bottom: 15px;
}

.step-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.step-card:hover .step-image {
  transform: scale(1.05);
}

.step-title {
  font-size: 1.3em;
  color: #34495e;
  margin-bottom: 10px;
}

.step-description {
  font-size: 1em;
  color: #555;
}

.footer {
  background-color: #34495e;
  color: #fff;
  text-align: center;
  padding: 20px;
  margin-top: 40px;
}

/* Animations */
.list-enter-active,
.list-leave-active {
  transition: all 0.5s ease;
}

.list-enter-from,
.list-leave-to {
  opacity: 0;
  transform: translateX(-30px);
}

@media (max-width: 768px) {
  .hero-title {
    font-size: 2em;
  }

  .hero-subtitle {
    font-size: 1em;
  }

  .section-title {
    font-size: 1.8em;
  }

  .requirement-item,
  .step-card {
    font-size: 0.9em;
  }
}
</style>