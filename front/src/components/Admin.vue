<template>
  <v-app>
    <!-- Navigation Drawer -->
    <v-navigation-drawer app v-model="drawer">
      <v-list>
        <!-- Navigation items -->
        <v-list-item v-for="(item, index) in items" :key="index" link>
          <v-list-item-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title @click="navigateTo(item.route)">
              {{ item.text }}
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <!-- Logout Button -->
        <v-list-item>
          <v-row>
            <v-col>
              <v-list-item-action>
                <v-btn icon @click="logout">
                  <v-icon>mdi-logout</v-icon>
                </v-btn>
              </v-list-item-action>
            </v-col>
          </v-row>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <!-- App Bar -->
    <v-app-bar app>
      <div @mouseenter="onMouseEnter" @mouseleave="onMouseLeave">
        <v-app-bar-nav-icon v-if="!drawer"></v-app-bar-nav-icon>
      </div>
      <v-toolbar-title class="custom-title">PCGA</v-toolbar-title>
    </v-app-bar>

    <!-- Main Content -->
    <v-main>
      <v-container>
        <!-- Overview Section -->
        <section class="overview">
          <h2>PCGA Overview</h2>



          <div class="chart-container">
            <canvas id="ageChart"></canvas>
          </div>

          <!-- Info Cards -->
          <v-card class="info-card" @click="viewCard('members')" :class="{ 'selected-card': selectedCard === 'members' }">
            <v-card-title>
              <h3>Members</h3>
            </v-card-title>
            <v-card-text>
              <p>Total Members: {{ memberCount }}</p>
            </v-card-text>
          </v-card>

          <v-card class="info-card" @click="viewCard('alerts')" :class="{ 'selected-card': selectedCard === 'alerts' }">
            <v-card-title>
              <h3>Active Alerts</h3>
            </v-card-title>
            <v-card-text>
              <p>Total Active Alerts: {{ activeAlertsCount }}</p>
            </v-card-text>
          </v-card>

          <v-card class="info-card" @click="viewCard('revenue')" :class="{ 'selected-card': selectedCard === 'revenue' }">
            <v-card-title>
              <h3>Revenue</h3>
            </v-card-title>
            <v-card-text>
              <p>Total Revenue: ${{ totalRevenue }}</p>
            </v-card-text>
          </v-card>

          <v-card class="info-card" @click="viewCard('projects')" :class="{ 'selected-card': selectedCard === 'projects' }">
            <v-card-title>
              <h3>Projects</h3>
            </v-card-title>
            <v-card-text>
              <p>Total Projects: {{ totalProjects }}</p>
            </v-card-text>
          </v-card>

          <!-- Chart Container -->
          
        </section>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import axios from 'axios';
import Chart from 'chart.js/auto';

export default {
  data() {
    return {
      drawer: true,
      hoverDelay: null,
      items: [
  { text: 'Dashboard', icon: 'mdi-view-dashboard', symbol: '$', route: '/Admin' },
  { text: 'Users', icon: 'mdi-account', symbol: 'U', route: '/users' },
  { text: 'Applicants data', icon: 'mdi-account-multiple', symbol: 'A', route: '/ApplicantsData' },
  { text: 'Updates and News Management', icon: 'mdi-newspaper', route: '/Updates&news' },
  { text: 'District Management', icon: 'mdi-cogs', route: '/ManageDistrict' },
  { text: 'Available Updates', icon: 'mdi-update', route: '/Availableupdates' },
],


      memberCount: null,
      activeAlertsCount: null,
      totalRevenue: null,
      totalProjects: null,
      selectedCard: null,
      ageChart: null, // Chart instance reference
    };
  },
  mounted() {
    this.fetchOverviewData();
  },
  methods: {
    fetchOverviewData() {
      axios.get('/api/overview')
        .then(response => {
          const data = response.data;
          this.memberCount = data.memberCount;
          this.activeAlertsCount = data.activeAlertsCount;
          this.totalRevenue = data.totalRevenue;
          this.totalProjects = data.totalProjects;

          if (data.ageChartData) {
            this.updateAgeChart(data.ageChartData);
          }
        })
        .catch(error => {
          console.error('Error fetching data:', error);
        });
    },
    updateAgeChart(ageChartData) {
  const ctx = document.getElementById('ageChart').getContext('2d');
  // Destroy previous chart instance if exists
  if (this.ageChart) {
    this.ageChart.destroy();
  }

  this.ageChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ageChartData.labels,
      datasets: [{
        label: 'Applicant Ages',
        data: ageChartData.ages,
        backgroundColor: [
          'rgba(255, 99, 132, 0.6)',
          'rgba(54, 162, 235, 0.6)',
          'rgba(255, 206, 86, 0.6)',
          'rgba(75, 192, 192, 0.6)',
          'rgba(153, 102, 255, 0.6)',
          'rgba(255, 159, 64, 0.6)',
          'rgba(255, 99, 132, 0.6)'
        ],
        borderColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(255, 99, 132, 1)'
        ],
        borderWidth: 1,
      }],
    },
    options: {
      plugins: {
        legend: {
          display: false
        }
      },
      scales: {
        x: {
          grid: {
            display: false
          }
        },
        y: {
          beginAtZero: true,
          grid: {
            color: 'rgba(0, 0, 0, 0.1)'
          }
        }
      },
      cornerRadius: 10,
      responsive: true,
      maintainAspectRatio: false
    },
  });
},
    viewCard(card) {
      this.selectedCard = this.selectedCard === card ? null : card;
    },
    navigateTo(route) {
      this.$router.push(route);
      this.drawer = false;
    },
    onMouseEnter() {
      this.hoverDelay = setTimeout(() => {
        this.drawer = true;
      }, 200);
    },
    onMouseLeave() {
      clearTimeout(this.hoverDelay);
    },logout() {
  // Clear the authentication token from session storage
  sessionStorage.removeItem('token');

  // Clear the authentication token from HttpOnly cookie
  document.cookie = 'token=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/; secure; HttpOnly';

  // Redirect the user to the login page
  this.$router.push('/');
}

  },
};
</script>

<style scoped>
  /* Navigation Drawer Styles */
  .v-navigation-drawer {
    background-color: #1a237e; /* Dark blue background color */
    color: white;
  }

  .v-list-item {
    border-bottom: 1px solid #3949ab; /* Dark blue border between items */
  }

  .v-list-item-title {
    color: white;
    font-weight: bold;
  }

  /* App Bar Styles */
  .v-app-bar {
    background-color: #283593; /* Darker blue app bar */
    color: white;
  }

  .custom-title {
    font-family: 'Pacifico', cursive; /* Custom font for the title */
    font-size: 24px;
  }

  /* Main Content Styles */
  .overview {
    margin-top: 20px;
    text-align: center;
  }

  .info-card {
    cursor: pointer;
    margin: 10px;
    padding: 20px;
    border-radius: 10px;
    transition: background-color 0.3s ease-in-out;
  }

  .info-card:hover {
    background-color: #7986cb; /* Lighter blue on hover */
  }

  .selected-card {
    background-color: #303f9f; /* Darker blue for selected card */
  }

  .chart-container {
    margin-top: 20px;
  }

  /* Logout Button Styles */
  .v-btn {
    color: #ffffff; /* White button text color */
  }

  /* Global Styles */
  body {
    font-family: 'Roboto', sans-serif; /* Default font family */
    background-color: #fafafa; /* Light gray background color */
  }
</style>
