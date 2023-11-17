  <template>
    <v-app>
      <v-app-bar app dark color="primary">
         <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
  <v-toolbar-title>
    <img src= "/img/PCGA.png"  alt="Coast Guard Logo" class="coast-guard-logo"> 
    505th PCGA Application System
  </v-toolbar-title>
        <v-spacer></v-spacer>
        <v-btn text @click="redirectTo('/LoginComponent')">Login</v-btn>
        <v-btn text @click="redirectTo('/RegisterComponent')">Register</v-btn>
      </v-app-bar>

      <v-navigation-drawer app v-model="drawer" dark color="primary">
        <v-list>
          <v-list-item link @click="redirectTo('/home')">
            <v-list-item-content>
              <v-list-item-title>Home</v-list-item-title>
            </v-list-item-content>
          </v-list-item>

          <v-divider></v-divider>

          <v-list-item link @click="redirectTo('/application')">
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
      <!-- Application form on the side -->
      

      <v-main>
        <v-container>
          <v-row>
            <v-col>
              <v-container class="my-5">
                <h1 class="display-4">Welcome to the 505th PCGA Application System</h1>
                <p class="subtitle-1">Apply online and schedule your appointment interview with ease.</p>
              </v-container>
            </v-col>
          </v-row>

          <v-row>
            <v-col>
              <v-container class="my-5">
                <!-- Add a button to trigger the application process form -->
                <v-btn @click="startApplicationProcess">Start Application Process</v-btn>
              </v-container>
            </v-col>
          </v-row>

          <!-- Add a conditional rendering for the application process form -->
          <v-row v-if="showApplicationForm">
            <v-col>
              <v-container class="my-5">
                <!-- Add your application process form here -->
                <v-dialog v-model="showApplicationForm" max-width="600">
                  <v-card>
                    <v-card-title class="headline">Application Process Form</v-card-title>
                    <v-card-text>
                      <v-form>
                            <!-- Add form fields for the application process -->
                  <v-text-field label="Full Name" v-model="applicationForm.fullName"></v-text-field>
                  <v-text-field label="Email" v-model="applicationForm.email"></v-text-field>
                  <v-text-field label="Phone Number" v-model="applicationForm.phoneNumber"></v-text-field>
                  <!-- Add more form fields as needed -->

                  <v-btn @click="submitApplicationForm">Submit Application</v-btn>
                </v-form>
              </v-card-text>
              <v-card-actions>
                <v-btn @click="showApplicationForm = false">Close</v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </v-container>
      </v-col>
    </v-row>

          <v-row>
            <v-col>
              <v-container class="my-5">
                <!-- Add a button to trigger the interview process form -->
                <v-btn @click="startInterviewProcess">Start Interview Process</v-btn>
              </v-container>
            </v-col>
          </v-row>

          <v-row v-if="showInterviewForm">
      <v-col>
        <v-container class="my-5">
          <!-- Add your interview process form here -->
          <v-dialog v-model="showInterviewForm" max-width="600">
            <v-card>
              <v-card-title class="headline">Interview Process Form</v-card-title>
              <v-card-text>
                <v-form>
                  <!-- Add form fields for the interview process -->
                  <v-text-field label="Interviewee Name" v-model="interviewForm.intervieweeName"></v-text-field>
                  <v-text-field label="Interview Date" v-model="interviewForm.interviewDate" type="date"></v-text-field>
                  <v-textarea label="Comments" v-model="interviewForm.comments"></v-textarea>
                  <!-- Add more form fields as needed -->

                  <v-btn @click="submitInterviewForm">Submit Interview</v-btn>
                </v-form>
              </v-card-text>
              <v-card-actions>
                <v-btn @click="showInterviewForm = false">Close</v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </v-container>
      </v-col>
    </v-row>
        </v-container>
      </v-main>

      <v-footer app dark color="primary">
        <v-container>
          <v-row>
            <v-col>
              <p class="white--text">&copy; 2023 505th PCGA Application System. All rights reserved.</p>
            </v-col>
          </v-row>
        </v-container>
      </v-footer>
    </v-app>
  </template>

  <script>
  export default {
    data() {
      return {
        drawer: false,
        isLoggedIn: false,
        showApplicationForm: false,
        applicationForm: {
          fullName: '',
          // Add more application form fields as needed
        },
        showInterviewForm: false,
        interviewForm: {
          intervieweeName: '',
          // Add more interview form fields as needed
        },
      };
    },
    methods: {
      redirectTo(path) {
        this.$router.push(path);
        this.drawer = false;
      },
      logout() {
        // Implement your logout logic here
        console.log('Logout clicked');
      },
      startApplicationProcess() {
        // Show the application form when the button is clicked
        this.showApplicationForm = true;
        // Hide the interview form
        this.showInterviewForm = false;
      },
      startInterviewProcess() {
        // Show the interview form when the button is clicked
        this.showInterviewForm = true;
        // Hide the application form
        this.showApplicationForm = false;
      },
      submitApplicationForm() {
        // Implement your logic to submit the application form
        console.log('Application Form submitted:', this.applicationForm);
        // You can add additional logic to handle form submission, e.g., sending data to a server
      },
      submitInterviewForm() {
        // Implement your logic to submit the interview form
        console.log('Interview Form submitted:', this.interviewForm);
        // You can add additional logic to handle form submission, e.g., sending data to a server
      },
    },
  };
  </script>
<style scoped>
/* Global styles */
body {
  font-family: 'Roboto', sans-serif;
  margin: 30;
  overflow-x: hidden;
  
}

/* Header styles */
.v-app-bar {
  box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.2);
  margin-top: 0;
  
}

.v-toolbar-title {
  font-size: 24px;
  font-weight: bold; /* Make the title bold */
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
  font-weight: bold; /* Make the list item titles bold */
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
}

.display-4 {
  font-size: 2.5rem;
  color: #333;
  font-weight: bold; /* Make the display-4 text bold */
}

.subtitle-1 {
  font-size: 1.2rem;
  color: #555;
}

.headline {
  font-size: 1.8rem;
  color: #333;
  font-weight: bold; /* Make the headline text bold */
}

/* Footer styles */
.v-footer {
  background-color: #333;
  color: white;
  padding: 5px 0; /* Reduce padding to make it smaller */
  position: fixed; /* Fix the footer at the bottom */
  bottom: 0; /* Position at the bottom of the viewport */
  width: 100%; /* Make the footer span the entire width of the viewport */
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
