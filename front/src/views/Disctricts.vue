<template>
  <!-- Navigation bar (unchanged) -->
  <nav class="navbar">
    <div class="nav-left">
      <router-link to="/Home" class="logo-link">
        <img src="img/PCGA-removebg-preview.png" alt="Coast Guard Logo" class="coast-guard-logo" />
        <span class="app-title">PCGA</span>
      </router-link>
    </div>
    <div class="nav-right">
      <router-link to="/Navbar" class="header-button">Home</router-link>
      <router-link to="/Transparency" class="header-button">Transparency Seal</router-link>
      <router-link to="/Disctricts" class="header-button">Coast Guard Districts</router-link>
      <router-link to="/LandingApp" class="header-button">Apply Online</router-link>
      <v-btn text @click="loginOrLogout" class="logout-btn">{{ isLoggedIn ? 'Logout' : 'Logout' }}</v-btn>
    </div>
  </nav>
  <div class="spacer"></div>
  
  <div class="main-content">
    <!-- Hero Section -->
    <div class="hero">
      <h1 class="hero-title">Coast Guard Districts</h1>
      <p class="hero-subtitle">Explore our nationwide network of Coast Guard districts</p>
    </div>

  

    <!-- Display districts -->
    <div class="districts-container">
      <div v-if="loading" class="loading-message">
        <div class="spinner"></div>
        <p>Loading districts...</p>
      </div>
      <div v-else-if="filteredDistricts.length === 0" class="no-districts-message">
        <img src="img/DISTRICTS FOUND.png" alt="No districts found" class="no-districts-img" />
        <h2>No Districts Found</h2>
        <p>We couldn't find any districts matching your criteria. Please try a different search or filter.</p>
        <button @click="resetFilters" class="btn btn-primary">Reset Filters</button>
      </div>
      <transition-group name="fade" tag="div" class="card-grid">
        <div v-for="district in filteredDistricts" :key="district.id" class="district-card" @click="showDistrictDetails(district)">
          <div class="district-icon" :style="{ backgroundColor: getRandomColor() }">
            <i class="fas fa-anchor"></i>
          </div>
          <div class="district-info">
            <h3 class="district-name">{{ district.name }}</h3>
            <p class="district-description">{{ district.description }}</p>
            <div v-if="district.hold" class="district-hold">
              <span class="hold-badge">Hold: {{ district.hold }}</span>
            </div>
          </div>
        </div>
      </transition-group>
    </div>

    <!-- Modal for district details -->
    <transition name="modal">
      <div v-if="selectedDistrict" class="modal" @click.self="closeModal">
        <div class="modal-content">
          <span class="close" @click="closeModal">&times;</span>
          <h2>{{ selectedDistrict.name }}</h2>
          <p>{{ selectedDistrict.description }}</p>
          <div v-if="selectedDistrict.hold" class="district-hold">
            <strong>Hold:</strong> {{ selectedDistrict.hold }}
          </div>
          <div class="modal-actions">
            <button class="btn btn-primary">Contact District</button>
            <button class="btn btn-secondary">View More Details</button>
          </div>
        </div>
      </div>
    </transition>
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
      selectedDistrict: null,
      error: null,
      searchQuery: '',
      filterOption: '',
    };
  },
  computed: {
    filteredDistricts() {
      return this.districts.filter(district => {
        const matchesSearch = district.name.toLowerCase().includes(this.searchQuery.toLowerCase()) ||
                              district.description.toLowerCase().includes(this.searchQuery.toLowerCase());
        const matchesFilter = this.filterOption === '' || district.region === this.filterOption;
        return matchesSearch && matchesFilter;
      });
    }
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
    showDistrictDetails(district) {
      this.selectedDistrict = district;
    },
    closeModal() {
      this.selectedDistrict = null;
    },
    async fetchDistricts() {
      this.loading = true;
      this.error = null;

      try {
        const response = await axios.get("api/ShowDistricts");
        this.districts = response.data;
      } catch (error) {
        console.error("Error fetching districts:", error);
        this.error = 'Failed to fetch districts. Please try again later.';
      } finally {
        this.loading = false;
      }
    },
    resetFilters() {
      this.searchQuery = '';
      this.filterOption = '';
    },
    getRandomColor() {
      const colors = ['#3498db', '#2ecc71', '#e74c3c', '#f39c12', '#9b59b6'];
      return colors[Math.floor(Math.random() * colors.length)];
    }
  }
};
</script>

<style scoped>
/* Global styles */
body {
  font-family: 'Inter', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f8fafc;
  color: #1e293b;
}

/* Navbar styles (unchanged) */
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
}

.nav-left, .nav-right {
  display: flex;
  align-items: center;
}

.nav-right {
  gap: 20px;
}

.logo-link {
  text-decoration: none;
  color: #fff;
  display: flex;
  align-items: center;
}

.coast-guard-logo {
  height: 50px;
  margin-right: 10px;
}

.app-title {
  font-size: 1.8em;
  font-weight: bold;
}

.header-button, .logout-btn {
  color: #fff;
  text-decoration: none;
  font-weight: bold;
  transition: color 0.3s ease;
}

.header-button:hover, .logout-btn:hover {
  color: #f39c12;
}

.spacer {
  height: 70px;
}

/* Main content styles */
.main-content {
  padding: 20px;
  max-width: 1200px;
  margin: 0 auto;
}

/* Hero Section */
.hero {
  text-align: center;
  margin-bottom: 20px;
  padding: 30px 0;
  background: linear-gradient(135deg, #3498db, #2c3e50);
  color: #fff;
  border-radius: 8px;
}

.hero-title {
  font-size: 2.5em;
  margin-bottom: 5px;
}

.hero-subtitle {
  font-size: 1.1em;
  opacity: 0.8;
}

/* Search and Filter */
.search-filter {
  display: flex;
  gap: 10px;
  margin-bottom: 20px;
}

.search-input, .filter-select {
  flex: 1;
  padding: 8px;
  border: 1px solid #e2e8f0;
  border-radius: 6px;
  font-size: 0.9em;
  transition: all 0.3s ease;
}

.search-input:focus, .filter-select:focus {
  outline: none;
  border-color: #3498db;
  box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
}

/* Districts container styles */
.districts-container {
  margin-top: 10px;
}

.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 20px;
}

.district-card {
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  transition: all 0.3s ease;
  cursor: pointer;
}

.district-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

.district-icon {
  color: #fff;
  padding: 20px;
  text-align: center;
  font-size: 2em;
}

.district-info {
  padding: 15px;
}

.district-name {
  font-size: 1.2em;
  margin: 0 0 8px;
  color: #2c3e50;
}

.district-description {
  color: #64748b;
  margin-bottom: 10px;
  line-height: 1.4;
  font-size: 0.9em;
}

.district-hold {
  margin-top: 8px;
}

.hold-badge {
  background-color: #e74c3c;
  color: #fff;
  padding: 3px 8px;
  border-radius: 12px;
  font-size: 0.8em;
  font-weight: bold;
}

/* Loading and no districts message styles */
.loading-message,
.no-districts-message {
  text-align: center;
  margin-top: 30px;
}

.spinner {
  border: 3px solid rgba(52, 152, 219, 0.3);
  border-top: 3px solid #3498db;
  border-radius: 50%;
  width: 40px;
  height: 40px;
  animation: spin 1s linear infinite;
  margin: 0 auto 15px;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.no-districts-img {
  width: 150px;
  margin-bottom: 15px;
}

.btn {
  display: inline-block;
  padding: 8px 16px;
  background-color: #3498db;
  color: #fff;
  text-decoration: none;
  border-radius: 6px;
  font-weight: bold;
  transition: all 0.3s ease;
  border: none;
  cursor: pointer;
  font-size: 0.9em;
}

.btn:hover {
  background-color: #2980b9;
  transform: translateY(-2px);
}

.btn-secondary {
  background-color: #e2e8f0;
  color: #2c3e50;
}

.btn-secondary:hover {
  background-color: #cbd5e1;
}

/* Modal styles */
.modal {
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
}

.modal-content {
  background-color: #fff;
  padding: 25px;
  border-radius: 8px;
  max-width: 500px;
  width: 90%;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.close {
  color: #94a3b8;
  float: right;
  font-size: 24px;
  font-weight: bold;
  cursor: pointer;
  transition: color 0.3s ease;
}

.close:hover {
  color: #2c3e50;
}

.modal-actions {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
  margin-top: 20px;
}

/* Transitions */
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s ease, transform 0.3s ease;
}
.fade-enter-from, .fade-leave-to {
  opacity: 0;
  transform: translateY(10px);
}

.modal-enter-active, .modal-leave-active {
  transition: opacity 0.2s, transform 0.2s;
}
.modal-enter-from, .modal-leave-to {
  opacity: 0;
  transform: scale(0.95);
}

/* Responsive design */
@media (max-width: 768px) {
  .nav-right {
    display: none;
  }

  .nav-left {
    margin-right: auto;
  }

  .navbar {
    padding: 8px;
  }

  .nav-left .app-title {
    font-size: 1.2em;
  }

  .nav-left .coast-guard-logo {
    height: 35px;
  }

  .spacer {
    height: 50px;
  }

  .hero-title {
    font-size: 2em;
  }

  .hero-subtitle {
    font-size: 0.9em;
  }

  .search-filter {
    flex-direction: column;
  }

  .card-grid {
    grid-template-columns: 1fr;
  }

  .modal-content {
    padding: 20px;
  }

  .modal-actions {
    flex-direction: column;
  }

  .btn {
    
    width: 100%;
  }
}
</style>