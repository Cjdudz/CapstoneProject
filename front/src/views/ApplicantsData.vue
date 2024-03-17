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
              <th class="table-header">Name</th>
              <th class="table-header">Age</th>
              <th class="table-header">Nationality</th>
              <th class="table-header">Date of Birth</th>
              <th class="table-header">Passport</th>
              <th class="table-header">Address</th>
              <th class="table-header">Telephone</th>
              <th class="table-header">Email</th>
              <th class="table-header">Occupation</th>
              <th class="table-header">Club</th>
              <th class="table-header">Application Date</th>
              <th class="table-header">Status</th>
              <th class="table-header">Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="appointment in appointments" :key="appointment.id">
              <td>{{ appointment.id }}</td>
              <td>{{ appointment.name }}</td>
              <td>{{ appointment.age }}</td>
              <td>{{ appointment.nationality }}</td>
              <td>{{ formatDateTime(appointment.dob) }}</td>
              <td>{{ appointment.passport }}</td>
              <td>{{ appointment.address }}</td>
              <td>{{ appointment.telephone }}</td>
              <td>{{ appointment.email }}</td>
              <td>{{ appointment.occupation }}</td>
              <td>{{ appointment.club }}</td>
              <td>{{ formatDateTime(appointment.applicationDate) }}</td>
              <td>{{ appointment.status }}</td>
              <td>
                <button @click="acceptAppointment(appointment.id)">Accept</button>
                <button @click="rejectAppointment(appointment.id)">Reject</button>
              </td>
            </tr>
          </tbody>
        </table>
        <div v-if="error" class="error-message">
          <i class="fas fa-exclamation-circle"></i> {{ error }}
        </div>
        <div v-if="loading" class="loading-message">
          Loading...
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
  { text: 'Updates and News Management', icon: 'mdi-newspaper', route: '/Updates&news' },
  { text: 'Services Management', icon: 'mdi-cogs', route: '/ManageDistrict' },
  { text: 'Available Updates', icon: 'mdi-update', route: '/Availableupdates' },

      ],
      appointments: [],
      error: null,
      loading: false,
    };
  },
  mounted() {
    this.fetchAppointments();
  },
  methods: {
    async fetchAppointments() {
      this.loading = true;
      try {
        const response = await axios.get('/api/appointment');
        this.appointments = response.data;
      } catch (error) {
        this.handleError(error, 'Error fetching appointments');
      } finally {
        this.loading = false;
      }
    },
    async acceptAppointment(appointmentId) {
      this.loading = true;
      try {
        const response = await axios.post('/api/accept', { id: appointmentId });
        // Handle success if needed
        this.fetchAppointments(); // Refresh appointments after accepting
      } catch (error) {
        this.handleError(error, 'Error accepting appointment');
      } finally {
        this.loading = false;
      }
    },
    async rejectAppointment(appointmentId) {
      this.loading = true;
      try {
        const response = await axios.post('/api/reject', { id: appointmentId });
        // Handle success if needed
        this.fetchAppointments(); // Refresh appointments after rejecting
      } catch (error) {
        this.handleError(error, 'Error rejecting appointment');
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
    formatDateTime(dateTime) {
      const options = { year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric', minute: 'numeric' };
      return new Date(dateTime).toLocaleDateString('en-US', options);
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
