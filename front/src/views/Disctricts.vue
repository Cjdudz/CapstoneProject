<template>
  <!-- Navigation bar -->
  <nav class="navbar">
    <!-- Nav Left -->
    <div class="nav-left">
      <router-link to="/Home" class="logo-link">
        <img src="img/PCGA-removebg-preview.png " alt="Coast Guard Logo" class="coast-guard-logo" />
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
  <div class="main-content">
    <!-- Modal for district details -->
    <div v-if="selectedDistrict" class="modal">
      <div class="modal-content">
        <span class="close" @click="closeModal">&times;</span>
        <h2>{{ selectedDistrict.name }}</h2>
        <p>{{ selectedDistrict.description }}</p>
        <!-- Add more details here as needed -->
      </div>
    </div>

    <!-- Display districts -->
<div v-if="loading" class="loading-message">
  <div class="spinner"></div>
</div>
<div v-else-if="districts.length === 0" class="no-districts-message">
  <img src="img/DISTRICTS FOUND.png" alt="No districts found" class="no-districts-img" />
  <p>We couldn't find any districts at the moment.</p>
  <p>Perhaps try again later or <router-link to="/navbar" class="home-link">return to the homepage</router-link>.</p>
</div>
<div v-else class="districts-container">
  <h2>Districts</h2>
  <div class="card-grid">
    <!-- Mapping to display districts -->
    <div v-for="district in districts" :key="district.id" class="district-card" @click="showDistrictDetails(district)">
      <div class="district-info">
        <span class="district-name">{{ district.name }}</span><br>
        <span class="district-description">{{ district.description }}</span>
        <!-- Simple mapping to display the districts they hold -->
        <div v-if="district.hold">
          <span class="district-hold">Hold: {{ district.hold }}</span>
        </div>
      </div>
    </div>
  </div>
</div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      drawer: false,
      isLoggedIn: false,
      loading: false,
      districts: [],
      selectedDistrict: null // New property to store selected district
    };
  },
  mounted() {
    this.fetchDistricts();
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
    // Method to handle click on district card
    showDistrictDetails(district) {
      this.selectedDistrict = district;
    },
    // Method to close the modal
    closeModal() {
      this.selectedDistrict = null;
    },
    fetchDistricts() {
      this.loading = true;
      axios.get("http://localhost:8080/api/ShowDistricts")
        .then(response => {
          this.districts = response.data;
          this.loading = false;
        })
        .catch(error => {
          console.error("Error fetching districts:", error);
          this.loading = false;
        });
    },
  }
};
</script>



<style scoped>
/* Global styles */
body {
  font-family: 'Roboto', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f4f4f4;
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

/* Main content styles */
.main-content {
  padding: 20px;
}
/* Districts container styles */
.districts-container {
  margin-top: 20px;
}
.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  grid-gap: 20px;
}
.district-card {
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}
.district-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
.district-info {
  display: flex;
  flex-direction: column;
}
.district-name {
  font-weight: bold;
  margin-bottom: 5px;
}
.district-description {
  color: #666;
}
/* Loading and no districts message styles */
.loading-message,
.no-districts-message {
  text-align: center;
  margin-top: 20px;
}
.spinner {
  border: 4px solid rgba(0, 0, 0, 0.1);
  border-top: 4px solid #3498db;
  border-radius: 50%;
  width: 40px;
  height: 40px;
  animation: spin 1s linear infinite;
}
@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
.no-districts-img {
  width: 200px;
  margin-bottom: 20px;
}
/* Modal styles */
.modal {
  display: block;
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  overflow: auto;
}
.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
  max-width: 600px;
  border-radius: 5px;
}
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}
.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
</style>
