<template>
  <!-- Navigation bar -->
  <nav class="navbar">
    <!-- Nav Left -->
    <div class="nav-left">
      <router-link to="/" class="logo-link">
        <img src="img/PCGA-removebg-preview.png" alt="Coast Guard Logo" class="coast-guard-logo" />
        <span class="app-title">PCGA</span>
      </router-link>
    </div>
    <!-- Nav Right -->
    <div class="nav-right">
      <router-link to="/" class="header-button">Home</router-link>
      <router-link to="/Transparency" class="header-button">Transparency Seal</router-link>
      <router-link to="/Disctricts" class="header-button">Coast Guard Districts</router-link>
      <router-link to="/LandingApp" class="header-button">Apply Online</router-link>
      <button @click="logout" class="header-button logout-btn">Logout</button>
    </div>
  </nav>
  <div class="spacer"></div>
  <div class="form-container">
    <h2 class="form-heading">Welcome to Your Application Form</h2>
    <div class="form-steps">
      <!-- Display the appropriate form component based on the current step -->
      <component :is="currentStepComponent" @next="nextStep" @prev="prevStep" />
    </div>

    <!-- Navigation buttons -->
  </div>
</template>

<script>
import IdentificationCard from '@/views/Forms/IdentificationCard.vue';
import PersonalInfo from '@/views/Forms/PersonalInfo.vue';
import Additional from '@/views/Forms/Additional.vue';
import EducationalBackground from '@/views/Forms/EducationalBackground.vue';
import Employment from '@/views/Forms/Employment.vue';
import Emergency from '@/views/Forms/Emergency.vue';
import Readiness from '@/views/Forms/Readiness.vue';
import Upload from '@/views/Forms/Upload.vue';

export default {
  name: 'App',
  components: {
    IdentificationCard,
    PersonalInfo,
    Additional,
    EducationalBackground,
    Employment,
    Emergency,
    Readiness,
    Upload
  },
  data() {
    return {
      step: 8,
      isEmergencyValid: false
    };
  },
  computed: {
    currentStepComponent() {
      const stepComponents = {
        1: IdentificationCard,
        2: PersonalInfo,
        3: Additional,
        4: EducationalBackground,
        5: Employment,
        6: Emergency,
        7: Readiness,
        8: Upload
      };
      return stepComponents[this.step];
    },
    isNextButtonDisabled() {
      return this.step === 8 || (this.step === 8 && !this.isEmergencyValid);
    }
  },
  methods: {
    nextStep() {
      if (this.step === 8) {
        this.isEmergencyValid = true;
        if (!this.isEmergencyValid) {
          return;
        }
      }
      this.step++;
    },
    prevStep() {
      this.step--;
    },
    logout() {
      // Remove authentication token or user data from local storage or cookies
      localStorage.removeItem('token');
      // Redirect to login page or a designated logout page
      this.$router.push('/');
    }
  }};
</script>

    <style scoped>
    /* General Styles */
    .form-container {
      max-width: 800px;
      margin: 30px auto;
      padding: 40px;
      background-color: #ffffff;
      border-radius: 10px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    }

    .form-heading {
      font-size: 24px;
      margin-bottom: 30px;
      text-align: center;
      color: #333333;
    }

    /* Pagination Buttons */
    .pagination-buttons {
      margin-top: 30px;
      text-align: center;
    }

    /* Button Styles */
    .pagination-button {
      padding: 12px 24px;
      font-size: 16px;
      font-weight: bold;
      color: #ffffff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s, transform 0.2s;
      margin: 0 12px; /* Increased spacing */
    }

    .prev {
      background-color: #4a90e2;
    }

    .next {
      background-color: #50c878;
    }

    .pagination-button:disabled {
      background-color: #bdc3c7;
      cursor: not-allowed;
    }

    .pagination-button:hover:not(:disabled) {
      transform: translateY(-2px);
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
      z-index: 1000;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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
      gap: 20px;
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
      color: #f39c12;
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
      color: #f39c12;
    }

    .spacer {
      height: 50px;
    }
    </style>
