<template>
  <div>
    <!-- Navigation bar -->
    <nav class="navbar">
      <div class="nav-left">
        <router-link to="/Home" class="logo-link">
          <img src="/img/PCGA.png" alt="Coast Guard Logo" class="coast-guard-logo" />
          <span class="app-title">PCGA</span>
        </router-link>
      </div>
        <div class="nav-right">
          <router-link to="/Navbar" class = "header-button">Home</router-link>
        <router-link to="/Transparency" class="header-button">Transparency Seal</router-link>
        <router-link to="/Disctricts" class="header-button">Coast Guard Districts</router-link>
        <router-link to="/PcgaapplicationForm" class="header-button">Apply Online</router-link>
        <router-link to="/IdentificationCard" class="header-button">Identification</router-link>
        <router-link to="/Userstatus" class="header-button">User Status</router-link>
        <v-btn text @click="loginOrLogout" class="logout-btn">{{ isLoggedIn ? 'Logout' : 'Logout' }}</v-btn>
      </div>
    </nav>
      <!-- Main Content -->
      <v-main>
        <div class="transparency-seal">
          <h1>Transparency Seal - Philippine Coast Guard Auxiliary</h1>
          <div v-if="loading">Loading...</div>
          <div v-else>
            <div v-for="(item, index) in seals" :key="index" class="seal-item">
              <img :src="item.image" :alt="item.name">
              <h3>{{ item.name }}</h3>
              <p>{{ item.description }}</p>
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
    image: "/img/certificate3.png",
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
/* Navigation bar styles */
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #2c3e50;
  color: #fff;
}

.nav-left {
  display: flex;
  align-items: center;
}

.nav-right {
  display: flex;
  align-items: center;
}

.logo-link {
  text-decoration: none;
  color: #fff;
}

.coast-guard-logo {
  height: 40px;
  margin-right: 10px;
}

.app-title {
  font-size: 1.5em;
  font-weight: bold;
}

.header-button {
  color: #fff;
  margin-left: 20px;
  text-decoration: none;
  font-weight: bold;
  transition: all 0.3s ease;
}

.logout-btn {
  color: #0e0d0d;
  margin-left: 20px;
}

.logout-btn:hover {
  text-decoration: underline;
}

.header-button:hover {
  text-decoration: underline;
}

/* General form styles */
.form-card {
  max-width: 800px;
  margin: 20px auto;
  padding: 20px;
  background-color: #f2f5f8;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.header-design {
  /* Add your header design styles here */
}


/* Responsive styles */
@media only screen and (max-width: 960px) {
  .v-app-bar {
    font-size: 18px;
  }
}

@media only screen and (max-width: 600px) {
  .v-app-bar {
    font-size: 16px;
  }
}

.header-button {
  color: white;
  margin-left: 10px; /* Adjust spacing between buttons */
}

.transparency-seal {
    max-width: 800px;
    margin: 0 auto;
}

.seal-item {
    margin-bottom: 20px;
}
</style>
