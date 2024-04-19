<template>
  <div>
    <v-app>
      <!-- App Bar -->
      <v-app-bar app>
        <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
        <v-toolbar-title>
          <img src="/img/PCGA.png" alt="Coast Guard Logo" class="coast-guard-logo" />
          <span class="app-title">PCGA</span>
        </v-toolbar-title>
        <v-btn text @click="redirectTo('/Navbar')">Home</v-btn>
        <v-btn text @click="redirectTo('/Transparency')">Transparency Seal</v-btn>
        <v-btn text @click="redirectTo('/Disctricts')">Coast Guard Districts</v-btn>
        <v-btn text @click="redirectTo('/contact-us')">Contact Us</v-btn>
        <v-btn text @click="loginOrLogout" class="header-button">{{ isLoggedIn ? 'Logout' : 'Login' }}</v-btn>
      </v-app-bar>

      <!-- Navigation Drawer -->
      <v-navigation-drawer app v-model="drawer">
        <v-list>
          <v-list-item link @click="redirectTo('/home')">
            <v-list-item-icon>
              <v-icon>mdi-home</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title>About</v-list-item-title>
            </v-list-item-content>
          </v-list-item>

          <v-divider></v-divider>

          <v-list-item link @click="redirectTo('/PcgaapplicationForm')">
            <v-list-item-icon>
              <v-icon>mdi-file-document-edit</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title>Apply Online</v-list-item-title>
            </v-list-item-content>
          </v-list-item>

          <v-list-item link @click="redirectTo('/Userstatus')">
            <v-list-item-icon>
              <v-icon>mdi-account-check</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title>User Status</v-list-item-title>
            </v-list-item-content>
          </v-list-item>

          <!-- Add more navigation items here if needed -->
        </v-list>
      </v-navigation-drawer>

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

      <!-- Footer -->
      <v-footer app>
        <v-container>
          <v-row>
            <v-col>
              <p class="white--text">&copy; 2023 505th PCGA Application System. All rights reserved.</p>
            </v-col>
          </v-row>
        </v-container>
      </v-footer>
    </v-app>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      drawer: false,
      loading: false, // Set to false to display static data immediately
      seals: [
        {
          name: "Seal 1",
          image: "/img/seal1.png",
          description: "Description for Seal 1"
        },
        {
          name: "Seal 2",
          image: "/img/seal2.png",
          description: "Description for Seal 2"
        },
        // Add more seals as needed
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
      const apiUrl = '/api/submit_interview_form';
      axios.post(apiUrl, this.interviewForm)
        .then(response => {
          console.log("Interview Form submitted:", response.data.message);
        })
        .catch(error => {
          console.error("Error submitting interview form:", error);
        });
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
/* Global styles */
body {
  font-family: 'Roboto', sans-serif;
  margin: 0;
  overflow-x: hidden;
}

/* Header styles */
.v-app-bar {
  box-shadow: 0px 1px 5px rgba(149, 6, 6, 0.2);
  margin-top: 0;
  background-color: rgb(78, 32, 134);
  color: white;
}

.v-toolbar-title {
  font-size: 24px;
  font-weight: bold;
}

.coast-guard-logo {
  max-height: 40px;
  max-width: 100%;
  margin-right: 8px;
}

/* Navigation drawer styles */
.v-navigation-drawer {
  background-color: #303030;
  margin-top: 0;
}

.v-list-item-title {
  color: white;
  font-weight: bold;
}

.v-divider {
  background-color: #757575;
}

/* Main content styles */
.v-main {
  padding: 20px;
  margin-top: 60px;
}

/* Footer styles */
.v-footer {
  background-color: rgb(78, 32, 134);
  color: white;
  padding: 10px 0;
  position: fixed;
  bottom: 0;
  width: 100%;
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
