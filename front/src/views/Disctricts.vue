<template>
  <div id="app">
    <!-- Navigation Bar -->
    <v-app-bar app>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>
        <img src="/img/PCGA.png" alt="Coast Guard Logo" class="coast-guard-logo" />
        <span class="app-title">PCGA</span>
      </v-toolbar-title>
      <v-btn text @click="$router.push({ name: 'NavBar' })">
        Home
      </v-btn>

      <!-- Transparency Seal Dropdown Menu -->
      <v-btn text class="header-button" href="/Transparency">Transparency Seal</v-btn>
      
      <!-- Coast Guard Districts Button -->
      <v-btn text class="header-button" href="/Disctricts">Coast Guard Districts</v-btn>
      
      <!-- Procurement Button -->

      <v-btn text href="/contact-us" class="header-button">Contact Us</v-btn>
      <v-btn text @click="loginOrLogout" class="logout-btn">{{ isLoggedIn ? 'Logout' : 'Login' }}</v-btn>
    </v-app-bar>

    <!-- Navigation Drawer -->
    <v-navigation-drawer app v-model="drawer">
      <v-list>
      
        <v-divider></v-divider>

        <v-list-item link @click="redirectTo('/PcgaapplicationForm')">
          <v-list-item-icon>
            <v-icon>mdi-file-document-edit</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>Apply Online</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item link @click="startInterviewProcess">
          <v-list-item-icon>
            <v-icon>mdi-calendar-clock</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>Appointment Interview</v-list-item-title>
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

        <v-list-item v-if="isLoggedIn" @click="logout">
          <v-list-item-icon>
            <v-icon>mdi-logout</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>Logout</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <!-- Main Content -->
    <main>
      <header>
        <h1>Philippine Coast Guard Auxiliary Districts</h1>
      </header>
      <div v-if="loading" class="loading">Loading...</div>
      <div v-else class="districts">
        <div v-for="district in districts" :key="district.id" class="card">
          <h2>{{ district.name }}</h2>
          <p>{{ district.description }}</p>
          <p>Contact: {{ district.contact }}</p>
        </div>
      </div>
    </main>

    <!-- Interview Form -->
    <v-container v-if="showInterviewForm">
      <v-row>
        <v-col cols="12">
          <v-dialog v-model="showInterviewForm" max-width="600">
            <v-card>
              <v-card-title class="headline text-center">Interview Process Form</v-card-title>
              <v-card-text>
                <v-form>
                  <v-text-field label="Interviewee Name" v-model="interviewForm.intervieweeName"></v-text-field>
                  <v-text-field label="Interview Date" v-model="interviewForm.interviewDate" type="date"></v-text-field>
                  <v-textarea label="Comments" v-model="interviewForm.comments"></v-textarea>

                  <v-btn color="primary" dark class="mt-4" @click="submitInterviewForm">Submit Interview</v-btn>
                </v-form>
              </v-card-text>
              <v-card-actions class="justify-center">
                <v-btn @click="showInterviewForm = false" color="grey">Close</v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </v-col>
      </v-row>
    </v-container>

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
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      districts: [],
      loading: true,
      drawer: false,
      showInterviewForm: false,
      isLoggedIn: false,
      interviewForm: {
        intervieweeName: "",
        interviewDate: "",
        comments: "",
      },
    };
  },
  mounted() {
  // Fetch districts from API
  axios.get("/api/ShowDistricts")
    .then(response => {
      this.districts = response.data;
      this.loading = false;
    })
    .catch(error => {
      console.error("Error fetching districts:", error);
      this.loading = false;
    });
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
        // Redirect to the desired path
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
main {
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
</style>
