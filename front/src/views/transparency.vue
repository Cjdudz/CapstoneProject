<template>
  <div>
    <!-- Navigation bar -->
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
        <router-link to="/Userstatus" class="header-button">User Status</router-link>
        <v-btn text @click="loginOrLogout" class="logout-btn">{{ isLoggedIn ? 'Logout' : 'Login' }}</v-btn>
      </div>
    </nav>

    <div class="spacer"></div>

    <!-- Main Content -->
    <v-main>
      <div class="transparency-seal">
        <h1 class="section-title">Transparency Seal - Philippine Coast Guard Auxiliary</h1>
        <div v-if="loading" class="loader">Loading...</div>
        <div v-else>
          <div class="seal-container">
            <div v-for="(item, index) in seals" :key="index" class="seal-item">
              <div class="seal-card">
                <img :src="item.image" :alt="item.name" class="seal-image">
                <div class="seal-details">
                  <h3 class="seal-title">{{ item.name }}</h3>
                  <p class="seal-description">{{ item.description }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </v-main>
  </div>
</template>

<script>
export default {
  data() {
    return {
      drawer: false,
      loading: false,
      seals: [
        {
          name: "Certificate of Accreditation",
          image: "/img/certificate1.png",
          description: "This certificate verifies the accreditation of the organization by the Philippine Coast Guard Auxiliary.",
        },
        {
          name: "License to Operate",
          image: "/img/license1.png",
          description: "This license grants permission for the organization to operate in accordance with the regulations set forth by the Philippine Coast Guard Auxiliary.",
        },
        {
          name: "Training Certification",
          image: "/img/certificate2.png",
          description: "This certificate certifies that the organization has completed the required training program as mandated by the Philippine Coast Guard Auxiliary.",
        },
        {
          name: "Safety Inspection Certificate",
          image: "/img/safety_inspection_certificate.png",
          description: "This certificate confirms that the organization's facilities and equipment have passed the safety inspection conducted by the Philippine Coast Guard Auxiliary.",
        },
        {
          name: "Community Service Award",
          image: "/img/award1.png",
          description: "This award recognizes the organization's outstanding contribution to community service as acknowledged by the Philippine Coast Guard Auxiliary.",
        },
        {
          name: "Leadership Excellence Award",
          image: "/img/award2.png",
          description: "This award is presented to the organization for demonstrating exceptional leadership qualities and initiatives in support of the Philippine Coast Guard Auxiliary's mission.",
        },
        // Add more certificates and licenses as needed
      ],
      isLoggedIn: false,
      interviewForm: {
        intervieweeName: "",
        interviewDate: "",
        comments: "",
      },
    };
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
      if (path === '/PcgaapplicationForm' && !this.areFormsFilled()) {
        this.showMessage = true; // Assuming you have this method
      } else {
        this.$router.push(path);
        this.drawer = false;
      }
    },
    startInterviewProcess() {
      this.showInterviewForm = true;
    },
    submitInterviewForm() {
      // Mock submission for static data
      console.log("Interview Form submitted");
    },
    areFormsFilled() {
      return (
        this.interviewForm.intervieweeName.trim() !== "" &&
        this.interviewForm.interviewDate.trim() !== "" &&
        this.interviewForm.comments.trim() !== ""
      );
    },
  },
};
</script>

<style scoped>
/* Navbar styles */
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 30px;
  background-color: #2c3e50; /* Retained original color */
  color: #fff;
  z-index: 1000; /* Ensure it's above other elements */
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
}

.nav-left {
  display: flex;
  align-items: center;
}

.nav-right {
  display: flex;
  align-items: center;
  gap: 25px; /* Add some space between buttons */
}

.logo-link {
  text-decoration: none;
  color: #fff;
  display: flex;
  align-items: center;
}

.coast-guard-logo {
  height: 60px;
  margin-right: 15px;
}

.app-title {
  font-size: 2em;
  font-weight: bold;
}

.header-button {
  color: #fff;
  text-decoration: none;
  font-weight: bold;  
  padding: 10px 15px;
  border-radius: 5px;
  transition: background-color 0.3s ease, color 0.3s ease;
}

.header-button:hover {
  background-color: #f39c12; /* Change background color on hover */
  color: #fff; /* Ensure text remains white */
}

.logout-btn {
  color: #fff;
  background-color: #e74c3c; /* Red background for logout button */
  border: none;
  padding: 10px 15px;
  cursor: pointer;
  font-weight: bold;
  border-radius: 5px;
  transition: background-color 0.3s ease;
}

.logout-btn:hover {
  background-color: #c0392b; /* Darker red on hover */
}

.spacer {
  height: 80px; /* Adjust the height for desired spacing */
}

/* Main content styles */
.transparency-seal {
  padding: 40px 20px;
  background-color: #f4f4f4;
  min-height: 100vh;
}

.section-title {
  font-size: 2.5em;
  font-weight: bold;
  color: #2c3e50;
  text-align: center;
  margin-bottom: 30px;
  text-transform: uppercase; /* Make text uppercase */
  letter-spacing: 2px; /* Add spacing between letters */
}

.loader {
  text-align: center;
  font-size: 1.2em;
  color: #2c3e50;
}

.seal-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  gap: 20px; /* Add space between items */
}

.seal-item {
  flex: 1 1 calc(33.333% - 40px); /* Responsive: 3 columns, adjust as needed */
  margin: 20px;
}

/* Seal card styles */
.seal-card {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
  border-radius: 15px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
  background-color: #fff; /* Add a white background to make the card stand out */
  transition: transform 0.3s, box-shadow 0.3s; /* Add transition for smooth hover effect */
}

.seal-card:hover {
  transform: scale(1.05);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Increase the shadow on hover for a "lifting" effect */
}

.seal-image {
  width: 80%;
  margin-bottom: 20px;
  border-radius: 15px; /* Round the corners of the images */
}

.seal-title {
  font-size: 1.5em;
  font-weight: bold;
  margin-bottom: 10px;
  color: #2c3e50; /* Dark blue color for the title */
}

.seal-description {
  text-align: center;
  color: #555; /* Dark gray color for the description */
}

/* Responsive design */
@media (max-width: 768px) {
  .navbar {
    flex-direction: column;
    align-items: flex-start;
  }

  .nav-right {
    flex-direction: column;
    align-items: flex-start;
    gap: 10px;
  }

  .spacer {
    height: 120px; /* Adjust the height for desired spacing */
  }

  .seal-item {
    flex: 1 1 100%; /* Full width on small screens */
  }
}
</style>
