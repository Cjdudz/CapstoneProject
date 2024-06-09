<template>
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
        <router-link to="/Userstatus" class="header-button">User Status</router-link>
        <v-btn text @click="loginOrLogout" class="logout-btn">{{ isLoggedIn ? 'Logout' : 'Logout' }}</v-btn>
      </div>
    </nav>
    <div class="spacer"></div>
    <div class="container">
      <div class="card">
        <h1 class="title">Welcome to PCGA Application Requirements</h1>
        <div class="requirements">
          <h2 class="subtitle">Application Requirements</h2>
          <p class="description">Before applying to PCGA, please ensure you meet the following requirements:</p>
          <transition-group name="list" tag="ul" class="requirement-list">
            <li v-for="requirement in requirements" :key="requirement.id" class="requirement-item">
              <span class="requirement-text">{{ requirement.text }}</span>
            </li>
          </transition-group>
          <button class="proceed-button" @click="goToApplicationForm">Proceed to Application Form</button>
        </div>
      </div>
      <div class="steps">
        <h2 class="step-title">Application Process</h2>
        <div class="step" v-for="step in steps" :key="step.id">
          <h3 class="step-subtitle">{{ step.title }}</h3>
          <p class="step-description">{{ step.description }}</p>
          <img :src="step.image" alt="Step guide" class="step-image">
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        requirements: [
          
        { id: 1, text: 'Valid ID(if Not Valid Passport).' },
          { id: 2, text: 'Valid NBI Clearance(Original and Copy).' },
          { id: 3, text: 'Police Clearance and Barangay Clearance(Original Copy)' },
          { id: 4, text: 'Duly Accomplished Member Aplication Form(4 Copies)' },
          { id: 5, text: 'Four(4) Copies of 2x2 ID Picture with Red Background Officers - Green Background(Auxiliarists).' },
          { id: 6, text: 'Additional Requirements: Letters of Recommendation/ Endorsement From Operation/ Support/ Technical Service/ Special Service Commands.' }
        ],

        steps: [
          { id: 1, title: 'Step 1: Fill Up Identification Card', description: 'Fill up your identification card with the necessary details.', image: 'img/step1.png' },
          { id: 2, title: 'Step 2: Complete Membership Form', description: 'Complete the membership form to proceed with the application.', image: 'img/step2.png' },
          { id: 3, title: 'Step 3: Upload Requirements', description: 'Upload the necessary documents and requirements for the application.', image: 'img/step3.png' }
        ]
      };
    },
    methods: {
      goToApplicationForm() {
        this.$router.push('/Formtemplate');
      }
    }
  };
  </script>
  
  <style scoped>
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
    height: 120px;
  }
  
  .container {
    max-width: 90%;
    margin: 0 auto;
    padding: 20px;
    font-family: 'Helvetica Neue', Arial, sans-serif;
    color: #333;
  }
  
  .card {
    background-color: #f5f5f5;
    border-radius: 5px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
    padding: 20px;
  }
  
  .title {
    font-size: 2.5em;
    color: #2c3e50;
    margin-bottom: 20px;
    text-align: center;
  }
  
  .subtitle {
    font-size: 1.8em;
    color: #34495e;
    margin-bottom: 10px;
    text-align: center;
  }
  
  .description {
    font-size: 1.2em;
    margin-bottom: 15px;
    text-align: justify;
  }
  
  .requirement-list {
    list-style-type: none;
    padding-left: 0;
  }
  
  .requirement-item {
    font-size: 1.1em;
    line-height: 1.6;
    border-left: 5px solid #3498db;
    padding-left: 15px;
    margin-bottom: 15px;
    background-color: #ecf0f1;
    border-radius: 5px;
    transition: all 0.3s ease;
  }
  
  .requirement-item:hover {
    transform: translateX(10px);
  }
  
  .proceed-button {
    display: block;
    width: 100%;
    padding: 10px;
    margin-top: 20px;
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
  
  .steps {
    margin-top: 40px;
    background-color: #ecf0f1;
    padding: 20px;
    border-radius: 5px;
  }
  
  .step-title {
    font-size: 2em;
    color: #2c3e50;
    margin-bottom: 20px;
    text-align: center;
  }
  
  .step {
    margin-bottom: 20px;
  }
  
  .step-subtitle {
    font-size: 1.5em;
    color: #34495e;
    margin-bottom: 10px;
  }
  
  .step-description {
    font-size: 1.2em;
    margin-bottom: 15px;
    text-align: justify;
  }
  
  .step-image {
    width: 100%;
    height: auto;
    margin-top: 10px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
  }
  
  .step-image:hover {
    transform: scale(1.05);
  }
  </style>
  