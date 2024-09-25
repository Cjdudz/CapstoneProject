<template>
  <v-app>
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
      

      <v-btn text href="/contact-us" class="header-button">Contact Us</v-btn>
      <v-btn text @click="loginOrLogout" class="logout-btn">{{ isLoggedIn ? 'Logout' : 'Login' }}</v-btn>
    </v-app-bar>

    <!-- Main Content -->
    <v-main>
      <!-- PCGA Procurement Content -->
      <div>
       
        <div v-if="loading" class="loading">Loading...</div>
        <div v-else>
          <div v-for="(section, index) in procurementSections" :key="index">
            <h2>{{ section.title }}</h2>
            <div v-if="section.items.length === 0">No items available</div>
            <div v-else>
              <div v-for="item in section.items" :key="item.id" class="card">
                <h3>{{ item.title }}</h3>
                <p>{{ item.description }}</p>
                <p>Published Date: {{ item.publishedDate }}</p>
                <p>Contact: {{ item.contact }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </v-main>

    <!-- Footer -->
    <v-footer app>
      <v-container>
        <v-row>
          <v-col>
            <p class="white--text">&copy; 2024 PCGA. All rights reserved.</p>
          </v-col>
        </v-row>
      </v-container>
    </v-footer>
  </v-app>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      drawer: false,
      loading: true,
      isLoggedIn: false,
      procurementSections: [
        { title: "Reports", items: [] },
        { title: "Bidding Opportunities", items: [] },
        { title: "Bidding Documents", items: [] },
        { title: "Supplemental/Bid Bulletin", items: [] },
        { title: "Minutes of Pre-Bid Conference & Bid Opening", items: [] },
        { title: "Notice of Awards", items: [] },
        { title: "Notice to Proceed", items: [] },
        { title: "Notice of Postponement", items: [] },
        { title: "Notice of Resumption", items: [] }
      ]
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
      // Redirect logic
    },
    startInterviewProcess() {
      // Interview process logic
    },
    fetchData() {
      Promise.all(
        this.procurementSections.map(section => {
          return axios.get(`https://api.example.com/pcga/${section.title.toLowerCase().replace(/ /g, '-')}`)
            .then(response => {
              section.items = response.data;
            })
            .catch(error => {
              console.error(`Error fetching ${section.title}:`, error);
            });
        })
      )
      .finally(() => {
        this.loading = false;
      });
    }
  },
  mounted() {
    this.fetchData();
  }
};
</script>

<style scoped>
/* Styles specific to this component */
</style>

  
  <style>
  h1 {
    margin-bottom: 20px;
  }
  
  header {
    background-color: #007bff;
    color: #fff;
    padding: 20px 0;
  }
  
  h2 {
    margin-top: 30px;
  }
  
  .card {
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 20px;
    margin: 10px;
    width: 300px;
    background-color: #f9f9f9;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }
  
  h3 {
    margin-top: 0;
  }
  
  p {
    margin-bottom: 10px;
  }
  
  .loading {
    font-style: italic;
  }
  
  footer {
    margin-top: 20px;
    color: #666;
  }
  
  </style>
  