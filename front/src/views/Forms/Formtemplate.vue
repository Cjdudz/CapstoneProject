<template>
  <!-- Navigation bar -->
  <nav class="navbar">
    <!-- Nav Left -->
    <div class="nav-left">
      <router-link to="/Home" class="logo-link">
        <img src="img/PCGA-removebg-preview.png" alt="Coast Guard Logo" class="coast-guard-logo" />
        <span class="app-title">PCGA</span>
      </router-link>
    </div>
    <!-- Nav Right -->
    <div class="nav-right">
      <router-link to="/Navbar" class="header-button">Home</router-link>
      <router-link to="/Transparency" class="header-button">Transparency Seal</router-link>
      <router-link to="/Disctricts" class="header-button">Coast Guard Districts</router-link>
      <router-link to="/LandingApp" class="header-button">Apply Online</router-link>
      <router-link to="/Userstatus" class="header-button">User Status</router-link>
      <v-btn text @click="loginOrLogout" class="logout-btn">{{ isLoggedIn ? 'Logout' : 'Logout' }}</v-btn>
    </div>
  </nav>
  <div class="spacer"></div>
  <div class="form-container" style="background-image: url('C:\laragon\www\CapstoneProject\front\public\img\bg.png');">
    <h2 class="form-heading">Welcome to Your Application Form</h2>
    <div class="form-steps">
      <!-- Display the appropriate form component based on the current step -->
      <component :is="currentStepComponent" @next="nextStep" @prev="prevStep" />
    </div>

    <!-- Navigation buttons -->
    <div class="pagination-buttons">
  <button @click.prevent="prevStep" :disabled="step === 1" class="pagination-button prev" style="margin-right: 10px;">Previous</button>
  <button @click.prevent="nextStep" :disabled="isNextButtonDisabled" class="pagination-button next" style="margin-left: 512px;">Next</button>
</div>
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

export default {
  name: 'MainFormContainer',
  components: {
    IdentificationCard,
    PersonalInfo,
    Additional,
    EducationalBackground,
    Employment,
    Emergency,
    Readiness
  },
  data() {
    return {
      step: 1, // Track the current step of the form
      isEmergencyValid: false // Flag to track if emergency form is valid, assuming it's valid initially
    };
  },
  computed: {
    currentStepComponent() {
      // Map step number to corresponding component
      const stepComponents = {
        1: IdentificationCard,
        2: PersonalInfo,
        3: Additional,
        4: EducationalBackground,
        5: Employment,
        6: Emergency,
        7: Readiness
      };
      return stepComponents[this.step];
    },
    isNextButtonDisabled() {
      // Disable next button based on current step and validation status
      return this.step === 7 || (this.step === 7 && !this.isEmergencyValid);
    }
  },
  methods: {
    // Method to proceed to the next step
    nextStep() {
      // If the current step is 6 (Emergency), validate the form before proceeding
      if (this.step === 6) {
        this.isEmergencyValid = true; // Placeholder for actual form validation logic
        if (!this.isEmergencyValid) {
          return; // Don't proceed if the emergency form is not valid
        }
      }
      this.step++; // Move to the next step
    },
    // Method to go back to the previous step
    prevStep() {
      this.step--; // Move to the previous step
    }
  }
}
</script>

<style scoped>
/* General Styles */
.form-container {
  max-width: 800px;
  margin: 30px auto;
  padding: 40px; /* Increased padding for more space */
  background-color: #f9f9f9; /* Lighter background color */
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Added box-shadow for depth */
}

.form-heading {
  font-size: 24px;
  margin-bottom: 30px; /* Increased margin for separation */
  text-align: center;
  color: #333333;
}

/* Rest of the styles remain the same */

/* Pagination Buttons */
.pagination-buttons {
  margin-top: 30px; /* Increased top margin */
}
/* Button Styles */
.pagination-button {
  padding: 10px 20px;
  font-size: 16px;
  font-weight: bold;
  color: #ffffff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s, transform 0.2s;
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
.spacer{
  height:100px;
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
</style>
