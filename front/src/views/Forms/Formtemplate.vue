<template>
  <!-- Navigation bar (unchanged) -->
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

  <div class="page-container">
    <div class="form-container">
      <h2 class="form-heading">Welcome to Your Application Form</h2>
      
      <!-- Progress bar -->
      <div class="progress-bar">
        <div class="progress" :style="{ width: `${(step / 8) * 100}%` }"></div>
      </div>
      
      <div class="form-steps">
        <!-- Display the appropriate form component based on the current step -->
        <component :is="currentStepComponent" @next="nextStep" @prev="prevStep" />
      </div>

      <!-- Navigation buttons -->
      <div class="pagination-buttons">
        <button
          class="pagination-button prev"
          @click="prevStep"
          :disabled="step === 1"
        >
          <span class="button-icon">&#8592;</span> Previous
        </button>

        <button
          class="pagination-button next"
          @click="nextStep"
          :disabled="isNextButtonDisabled"
        >
          {{ step === 8 ? 'Submit' : 'Next' }} <span class="button-icon">&#8594;</span>
        </button>
      </div>
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
      step: 1,
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
      return this.step === 8 || (this.step === 6 && !this.isEmergencyValid);
    }
  },
  methods: {
    nextStep() {
      if (this.step === 6) {
        this.isEmergencyValid = true; // Implement actual validation logic here
        if (!this.isEmergencyValid) {
          return;
        }
      }
      if (this.step < 8) {
        this.step++;
      }
    },
    prevStep() {
      if (this.step > 1) {
        this.step--;
      }
    },
    logout() {
      localStorage.removeItem('token');
      this.$router.push('/');
    }
  }
};
</script>

<style scoped>
/* General Styles */
.page-container {
  min-height: calc(100vh - 70px);
  background-color: #f0f4f8;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 20px;
}

.form-container {
  max-width: 800px;
  width: 100%;
  margin: 30px auto;
  padding: 40px;
  background-color: #ffffff;
  border-radius: 15px;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.form-container:hover {
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
}

.form-heading {
  font-size: 28px;
  margin-bottom: 30px;
  text-align: center;
  color: #2c3e50;
  font-weight: bold;
}

/* Progress Bar */
.progress-bar {
  width: 100%;
  height: 8px;
  background-color: #e0e0e0;
  border-radius: 4px;
  margin-bottom: 30px;
  overflow: hidden;
}

.progress {
  height: 100%;
  background-color: #3498db;
  transition: width 0.3s ease;
}

/* Pagination Buttons */
.pagination-buttons {
  margin-top: 30px;
  display: flex;
  justify-content: space-between;
}

/* Button Styles */
.pagination-button {
  padding: 12px 24px;
  font-size: 16px;
  font-weight: bold;
  color: #ffffff;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  justify-content: center;
}

.prev {
  background-color: #3498db;
}

.next {
  background-color: #2ecc71;
}

.pagination-button:disabled {
  background-color: #bdc3c7;
  cursor: not-allowed;
  opacity: 0.7;
}

.pagination-button:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.button-icon {
  font-size: 20px;
  margin: 0 8px;
}

/* Navbar Styles (unchanged) */
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
  color: #fff;
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
  height: 70px;
}

/* Responsive Design */
@media (max-width: 768px) {
  .form-container {
    padding: 20px;
  }

  .form-heading {
    font-size: 24px;
  }

  .pagination-button {
    padding: 10px 20px;
    font-size: 14px;
  }
}
</style>