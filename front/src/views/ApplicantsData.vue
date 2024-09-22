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
      <v-toolbar-title class="custom-title"> Appointments</v-toolbar-title>
    </v-app-bar>

    <!-- Main Content -->
    <v-main>
      <div>
        <!-- User Appointments Table -->
        <h2 class="table-title">User Appointments</h2>
        <table class="user-table">
  <thead>
    <tr>
      <th class="table-header">ID</th>
      <th class="table-header">Type of Application</th>
      <th class="table-header">Last Name</th>
      <th class="table-header">First Name</th>
      <th class="table-header">Middle Name</th>
      <!-- Add more headers here if necessary -->
    </tr>
  </thead>
  <tbody>
    <tr v-for="appointment in appointments" :key="appointment.ID">
      <!-- Display correct appointment data -->
      <td>{{ appointment.ID }}</td>
      <td>{{ appointment.TypeOfApplication }}</td>
      <td>{{ appointment.LastName }}</td>
      <td>{{ appointment.FirstName }}</td>
      <td>{{ appointment.MiddleName }}</td>
      <!-- Add more table data cells if necessary -->
    </tr>
  </tbody>
</table>
      </div>
    </v-main>
  </v-app>,
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      drawer: true,
      items: [
        { text: 'Dashboard', icon: 'mdi-view-dashboard', route: '/Admin' },
        { text: 'Users', icon: 'mdi-account', route: '/users' },
        { text: 'Applicants data', icon: 'mdi-account-multiple', route: '/ApplicantsData' },
        { text: 'Updates and News Management', icon: 'mdi-newspaper', route: '/Updates&news' },
        { text: 'District Management', icon: 'mdi-cogs', route: '/ManageDistrict' },
        { text: 'Available Updates', icon: 'mdi-update', route: '/Availableupdates' },
        { text: 'Add Content', icon: 'mdi-plus', route: '/add-content' },
      ],
      appointments: [],
      error: null,
      loading: false,
    };
  },
  mounted() {
    this.fetchAppointments();
    console.log(this.appointments);
  },
  methods: {
  async fetchAppointments() {
    this.loading = true;
    try {
      const response = await axios.get('/api/data');
      this.appointments = response.data.personalInformation;
      // Log the appointments after data is fetched
      console.log(this.appointments);
    } catch (error) {
      this.handleError(error, 'Error fetching appointments');
    } finally {
      this.loading = false;
    }
  },
  handleError(error, defaultMessage) {
    console.error(defaultMessage, error);
    if (error.response && error.response.data && error.response.data.message) {
      this.error = error.response.data.message;
    } else {
      this.error = defaultMessage;
    }
  },
  onMouseEnter() {
    this.drawer = true;
  },
  onMouseLeave() {
    this.drawer = false;
  },
  logout() {
    // Handle logout functionality
    console.log('Logout button clicked');
    // Example: Redirect to login page
    this.$router.push('/LoginComponent');
  },
  navigateTo(route) {
    this.$router.push(route);
    this.drawer = false;
  },
},
};
</script>


<style scoped>
.user-table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

.table-title {
  font-size: 24px;
  color: #3498db;
  margin-bottom: 10px;
}

.table-header {
  background-color: #3498db;
  color: #fff;
  padding: 10px;
}

.user-table th, .user-table td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}

.user-table tbody tr:nth-child(even) {
  background-color: #f9f9f9;
}
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
.error-message {
  color: red;
  margin-top: 10px;
  display: flex;
  align-items: center;
}

.error-message i {
  margin-right: 5px;
  color: #ff6347;
}

.loading-message {
  margin-top: 10px;
  color: #3498db;
}
</style>
