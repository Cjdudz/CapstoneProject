<template>
    <v-app>
        <v-app-bar>
    <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
    <v-toolbar-title>
      <img src="/img/PCGA.png" alt="Coast Guard Logo" class="coast-guard-logo" />
      505th PCGA Application System
    </v-toolbar-title>
    <v-spacer></v-spacer>
    <v-btn text @click="loginOrLogout">Logout</v-btn>
  </v-app-bar>
  
      <v-navigation-drawer app v-model="drawer">
        <v-list>
          <v-list-item link @click="redirectTo('/home')">
            <v-list-item-content>
              <v-list-item-title>Home</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
  
          <v-divider></v-divider>
  
          <v-list-item link @click="redirectTo('/PcgaapplicationForm')">
            <v-list-item-content>
              <v-list-item-title>Apply Online</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
  
          <v-list-item>
            <v-list-item-content>
              <v-list-item-title @click="startInterviewProcess">Appointment Interview</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
  
          <v-list-item v-if="isLoggedIn" @click="logout">
            <v-list-item-content>
              <v-list-item-title>Logout</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-navigation-drawer>


<v-main>
    <HelloWorld />
    
</v-main>
<v-footer>
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

export default {
    data() {
        return {
            drawer: false,
            showInterviewForm: false,
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
                // User is logged in, perform logout action
                this.logout();
            }
            else {
                // User is not logged in, redirect to login page
                this.redirectTo('/LoginComponent');
            }
        },
        logout() {
            // Perform logout actions (e.g., clear session, reset state)
            console.log("Logout clicked");
            this.isLoggedIn = false;
        },
        redirectTo(path) {
            this.$router.push(path);
            this.drawer = false;
        },
        logout() {
            console.log("Logout clicked");
        },
        startInterviewProcess() {
            this.showInterviewForm = true;
            this.showApplicationForm = false;
        },
        submitInterviewForm() {
            console.log("Interview Form submitted:", this.interviewForm);
        },
    },
    components: { HelloWorld }
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
  background-color: rgb(78, 32, 134); /* Update with your preferred color */
  color: white;
}

.v-toolbar-title {
  font-size: 24px;
  font-weight: bold;
}

.application-form {
  text-align: left;
  margin-top: 20px;
}

.application-form h2 {
  color: #333;
}

.application-form form {
  max-width: 300px;
  margin: 0 auto;
}

.application-form label {
  display: block;
  margin-bottom: 5px;
  color: #555;
}

.application-form input,
.application-form textarea {
  width: 100%;
  padding: 8px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.application-form button {
  background-color: #4caf50;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
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

.coast-guard-logo {
  max-height: 40px;
  max-width: 100%;
  margin-right: 8px;
}

/* Main content styles */
.v-main {
  padding: 20px;
  margin-top: 0;
  background-image: url(''); /* Adjust the path based on your project structure */
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
  background-color:rgb(78, 32, 134);
  color: white;
  padding: 10px 0;
  position: fixed;
  bottom: 0;
  width: 100%;
}

/* Responsive styles */
@media only screen and (max-width: 600px) {
  .v-app-bar {
    /* Adjust styles for small screens */
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
