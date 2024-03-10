<template>
    <div>
      <v-app>
        <!-- App Bar -->
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
        loading: true,
        seals: [
          {
            name: "About Us",
            image: "path/to/about_us_image.jpg",
            description: "Learn more about our organization and its mission."
          },
          {
            name: "Functions",
            image: "path/to/functions_image.jpg",
            description: "Discover the various functions and roles of our organization."
          },
          {
            name: "Organization",
            image: "path/to/organization_image.jpg",
            description: "Get to know the structure and hierarchy of our organization."
          },
          {
            name: "ISO Certification",
            image: "path/to/iso_certification_image.jpg",
            description: "Learn about our ISO certification and commitment to quality."
          },
          {
            name: "2015 Score Card",
            image: "path/to/2015_score_card_image.jpg",
            description: "View our organization's performance scorecard for the year 2015."
          },
          {
            name: "2016 Score Card",
            image: "path/to/2016_score_card_image.jpg",
            description: "View our organization's performance scorecard for the year 2016."
          },
          {
            name: "2017 Score Card",
            image: "path/to/2017_score_card_image.jpg",
            description: "View our organization's performance scorecard for the year 2017."
          },
          {
            name: "2020 Score Card",
            image: "path/to/2020_score_card_image.jpg",
            description: "View our organization's performance scorecard for the year 2020."
          },
          {
            name: "2021 Scorecard",
            image: "path/to/2021_score_card_image.jpg",
            description: "View our organization's performance scorecard for the year 2021."
          }
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
  