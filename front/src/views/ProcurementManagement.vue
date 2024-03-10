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
        <div class="procurement-reports">
          <!-- Procurement Reports Component Content -->
          <h2 class="title">Procurement Reports</h2>
          <div class="select-wrapper">
            <label for="reportType" class="label">Select Report Type:</label>
            <select v-model="selectedReportType" @change="loadReports" class="select">
              <option v-for="(option, key) in reportOptions" :value="key" :key="key">{{ option }}</option>
            </select>
          </div>
  
          <div v-if="loading" class="loading">
            <span>Loading...</span>
          </div>
  
          <div v-if="error" class="error">
            <span>{{ error }}</span>
          </div>
  
          <div v-if="reports.length > 0" class="report-list">
            <h3 class="subtitle">Reports:</h3>
            <ul>
              <li v-for="(report, index) in reports" :key="index" class="report-item">{{ report }}</li>
            </ul>
          </div>
  
          <div v-else class="no-reports">
            <p>No reports available.</p>
          </div>
        </div>
      </v-main>
    </v-app>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        drawer: true,
        items: [
          { text: 'Dashboard', icon: 'mdi-view-dashboard', symbol: '$', route: '/Admin' },
          { text: 'Users', icon: 'mdi-account', symbol: 'U', route: '/users' },
          { text: 'Applicants data', icon: 'mdi-account-multiple', symbol: 'A', route: '/ApplicantsData' },
          { text: 'Procurement', icon: 'mdi-cart', route: '/ProcurementManagement' },
          { text: 'Updates and News Management', icon: 'mdi-newspaper', route: '/Updates&news' },
          { text: 'Services Management', icon: 'mdi-cogs', route: '/ManageDistrict' }
        ],
        selectedReportType: 'biddingOpportunities',
        reports: [],
        loading: false,
        error: null,
        reportOptions: {
          biddingOpportunities: 'Bidding Opportunities',
          biddingDocuments: 'Bidding Documents',
          supplementalBidBulletin: 'Supplemental/Bid Bulletin',
          preBidConferenceMinutes: 'Minutes of Pre-Bid Conference & Bid Opening',
          noticeOfAwards: 'Notice of Awards',
          noticeToProceed: 'Notice to Proceed',
          noticeOfPostponement: 'Notice of Postponement',
        },
      };
    },
    methods: {
      loadReports() {
        this.loading = true;
        this.error = null;
  
        // Simulated asynchronous call to fetch reports based on selected report type
        // Replace this with your actual API call to fetch reports
        setTimeout(() => {
          switch (this.selectedReportType) {
            case 'biddingOpportunities':
              this.reports = ['2023', 'MSSTI Office Supplies', 'SAR Vessel Cathodic Protection Anodes'];
              break;
            case 'biddingDocuments':
              this.reports = ['2023', 'MARSLEC Opening & Prelim Bid Exam', 'MARSLEC Operational & Training Equipment'];
              break;
            case 'supplementalBidBulletin':
              this.reports = ['2023', 'MARSLEC for the Opening of Bid', 'Notice of Resumption'];
              break;
            // Add cases for other report types
            default:
              this.reports = [];
          }
          this.loading = false;
        }, 1000); // Simulated delay for loading spinner
      },
      navigateTo(route) {
        this.$router.push(route);
        this.drawer = false; // Close the drawer after navigation
      },
      onMouseEnter() {
        // Show navigation drawer on mouse enter
        this.drawer = true;
      },
      onMouseLeave() {
        // Hide navigation drawer on mouse leave
        this.drawer = false;
      },
      logout() {
        // Handle logout functionality
        console.log('Logout button clicked');
        // Example: Redirect to login page
        this.$router.push('/LoginComponent');
      },
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


.procurement-reports {
  max-width: 600px;
  margin: auto;
  padding: 20px;
  background-color: #f5f5f5;
  border-radius: 8px;
  box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

.title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
}

.select-wrapper {
  margin-bottom: 20px;
}

.label {
  font-size: 16px;
  margin-right: 10px;
}

.select {
  padding: 8px 12px;
  border-radius: 4px;
  border: 1px solid #ccc;
  background-color: #fff;
  font-size: 16px;
}

.loading, .error {
  font-size: 16px;
  text-align: center;
  margin-bottom: 20px;
}

.report-list {
  margin-bottom: 20px;
}

.subtitle {
  font-size: 18px;
  margin-bottom: 10px;
}

.report-item {
  font-size: 16px;
}

.no-reports {
  font-size: 16px;
  text-align: center;
}
</style>
