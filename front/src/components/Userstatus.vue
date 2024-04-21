<template>
  <div>
    <!-- Navigation bar -->
    <nav class="navbar">
      <div class="nav-left">
        <router-link to="/Home" class="logo-link">
          <img src="/img/PCGA.png" alt="Coast Guard Logo" class="coast-guard-logo" />
          <span class="app-title">PCGA</span>
        </router-link>
      </div>
      <div class="nav-right">
          <router-link to="/Navbar" class = "header-button">Home</router-link>
        <router-link to="/Transparency" class="header-button">Transparency Seal</router-link>
        <router-link to="/Disctricts" class="header-button">Coast Guard Districts</router-link>
        <router-link to="/PcgaapplicationForm" class="header-button">Apply Online</router-link>
        <router-link to="/IdentificationCard" class="header-button">Identification</router-link>
        <router-link to="/Userstatus" class="header-button">User Status</router-link>
        <v-btn text @click="loginOrLogout" class="logout-btn">{{ isLoggedIn ? 'Logout' : 'Logout' }}</v-btn>
      </div>
    </nav>

    <!-- User Status Component -->
    <v-container>
      <v-card class="compact-card" elevation="2">
        <v-card-title class="compact-header">
          <h2 class="compact-title"> User Status</h2>
        </v-card-title>
        <v-card-text class="compact-body">
          <v-row>
            <v-col v-for="(appointments, title) in appointmentGroups" :key="title" cols="12" md="6">
              <v-card class="mt-3" outlined>
                <v-card-title class="table-title">{{ title }}</v-card-title>
                <v-data-table
                  :headers="tableHeaders"
                  :items="appointments"
                  :item-key="appointment => appointment.id"
                  :dense="true"
                  :hide-default-footer="true"
                >
                  <template v-slot:items="{ item }">
                    <td>{{ item.name }}</td>
                    <td>{{ getStatusEmoji(item.status) }}</td>
                  </template>
                </v-data-table>
              </v-card>
            </v-col>
          </v-row>
        </v-card-text>
      </v-card>
    </v-container>

    <!-- Main content -->
    <main>
      <section class="hero">
        <!-- Hero section content here -->
      </section>

      <section class="projects-container">
        <!-- Projects section content here -->
      </section>

      <section class="services">
        <!-- Services section content here -->
      </section>
    </main>

    <!-- Footer -->
    <footer class="footer">
      <!-- Footer content here -->
    </footer>
  </div>
</template>

<script>
import HelloWorld from './HelloWorld.vue';
import axios from 'axios';

export default {
  components: {
    HelloWorld,
  },
  data() {
    return {
      isLoggedIn: false, // Add isLoggedIn here if it's not defined elsewhere
      appointmentGroups: {
        'Accepted Appointments': [],
        'Rejected Appointments': [],
      },
      tableHeaders: [
        { text: 'Name', value: 'name' },
        { text: 'Status', value: 'status' },
      ],
    };
  },
  mounted() {
    this.fetchAppointmentStatus();
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
      this.$router.push(path);
      this.drawer = false;
    },
    async fetchAppointmentStatus() {
      try {
        const appointments = (await axios.get('/api/UserStatus')).data;
        this.separateAppointments(appointments);
      } catch (error) {
        console.error('Error fetching appointment status:', error);
      }
    },
    separateAppointments(appointments) {
      this.appointmentGroups['Accepted Appointments'] = appointments.filter(appointment => appointment.status === 'accepted');
      this.appointmentGroups['Rejected Appointments'] = appointments.filter(appointment => appointment.status === 'rejected');
    },
    getStatusEmoji(status) {
      return status === 'accepted' ? '✅' : '❌';
    },
  },
};
</script>

<style scoped>
/* Navigation bar styles */
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #2c3e50;
  color: #fff;
}

.nav-left {
  display: flex;
  align-items: center;
}

.nav-right {
  display: flex;
  align-items: center;
}

.logo-link {
  text-decoration: none;
  color: #fff;
}

.coast-guard-logo {
  height: 40px; /* Adjust as needed */
  margin-right: 10px;
}

.app-title {
  font-size: 1.5em;
  font-weight: bold;
}

.header-button {
  color: #fff;
  margin-left: 20px;
  text-decoration: none;
  font-weight: bold;
  transition: all 0.3s ease;
}

.logout-btn {
  color: #0e0d0d;
  margin-left: 20px;
}

.logout-btn:hover {
  text-decoration: underline;
}

.header-button:hover {
  text-decoration: underline;
}

/* User Status Component styles */
.compact-card {
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.compact-title {
  margin-bottom: 0;
  font-size: 24px;
  color: #333;
}

.table-title {
  font-size: 18px;
  color: #555;
}
</style>
