<template>
    <v-app>
    <v-app-bar>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>
        <img src="/img/PCGA.png" alt="Coast Guard Logo" class="coast-guard-logo" />
        <span class="app-title">PCGA</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>

      <!-- Transparency Seal Dropdown Menu -->
      <v-btn text class="header-button" href="/Transparency">Transparency Seal</v-btn>
    
    <!-- Coast Guard Districts Button -->
    <v-btn text class="header-button" href="/Disctricts">Coast Guard Districts</v-btn>
    
    <!-- Procurement Button -->
    <v-btn text class="header-button" href="/Procurement">Procurement</v-btn>

      <v-btn text href="/contact-us" class="header-button">Contact Us</v-btn>
      <v-btn text @click="loginOrLogout" class="logout-btn">{{ isLoggedIn ? 'Logout' : 'Login' }}</v-btn>
    </v-app-bar>


    <v-dialog v-model="showMessage" max-width="400">
      <v-card class="message-dialog">
        <v-card-title class="headline">Message</v-card-title>
        <v-card-text>
          Please fill out all the required forms.
        </v-card-text>
        <v-card-actions>
          <v-btn @click="handleMessageOK" color="primary">OK</v-btn>
          <v-btn @click="handleCancelMessage" color="grey">Cancel</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

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

    <v-main>
      <HelloWorld />
      
    </v-main>

    <v-footer app>
      <v-container>
        <v-row>
          <v-col>
            <p class="white--text">&copy; 2023 505th PCGA Application System. All rights reserved.</p>
          </v-col>
        </v-row>
      </v-container>
    </v-footer>

    <v-container>
      <v-row v-if="showInterviewForm">
        <v-col>
          <v-container class="my-5">
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
          </v-container>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
import HelloWorld from './HelloWorld.vue';
import axios from 'axios';
export default {
  data() {
    return {
      drawer: false,
      showMessage: false,
      showInterviewForm: false,
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
        this.showMessage = true;
      } else {
        this.$router.push(path);
        this.drawer = false;
      }
    },
    areFormsFilled() {
      return (
        this.interviewForm.intervieweeName.trim() !== "" &&
        this.interviewForm.interviewDate.trim() !== "" &&
        this.interviewForm.comments.trim() !== ""
      );
    },
    startInterviewProcess() {
      this.showInterviewForm = true;
    },
    submitInterviewForm() {
    // Adjust the URL based on your CodeIgniter setup
    const apiUrl = '/api/submit_interview_form'; // Corrected URL with quotes

    // Use Axios to send a POST request to the backend
    axios.post(apiUrl, this.interviewForm) // Corrected URL variable
        .then(response => {
            console.log("Interview Form submitted:", response.data.message);
            // Add any additional logic based on the response
        })
        .catch(error => {
            console.error("Error submitting interview form:", error);
            // Handle errors if needed
        });
},
    handleMessageOK() {
      this.showMessage = false;
      this.$router.push('/PcgaapplicationForm');
      this.drawer = false;
    },
    handleCancelMessage() {
      this.showMessage = false;
      // Handle any additional logic on cancel
    },
  },
  components: { HelloWorld },
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
  background-image: url(''); 
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  
}

.display-4 {
  font-size: 2.5rem;
  color: #333;
  font-weight: bold;
}

.subtitle-1 {
  font-size: 1.2rem;
  color: #555;
}

.headline {
  font-size: 1.8rem;
  color: #333;
  font-weight: bold;
}

.applicant-list {
  margin-top: 20px;
}

.applicant-list h2 {
  color: #333;
}

.applicant-list table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 10px;
}

.applicant-list th, .applicant-list td {
  border: 1px solid #ccc;
  padding: 8px;
  text-align: left;
}

.applicant-list th {
  background-color: #4caf50;
  color: white;
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
@media only screen and (max-width: 1264px) {
  .v-main {
    margin-top: 56px;
  }
}
.header-button {
  color: white;
  margin-left: 10px; /* Adjust spacing between buttons */
}
@media only screen and (max-width: 960px) {
  .v-app-bar {
    font-size: 18px;
  }
}

@media only screen and (max-width: 600px) {
  .v-app-bar {
    font-size: 16px;
  }

  .v-navigation-drawer {
    /* Adjust styles for small screens */
  }

  .v-main {
    /* Adjust styles for small screens */
  }

  .v-footer {
    /* Adjust styles for small screens */
  }
}
</style>
