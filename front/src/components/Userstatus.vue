<template>
  <div>
    <!-- Navigation bar -->
    <nav class="navbar">
      <div class="nav-left">
        <router-link to="/Home" class="logo-link">
        <img src="img/PCGA-removebg-preview.png " alt="Coast Guard Logo" class="coast-guard-logo" />
          <span class="app-title">PCGA</span>
        </router-link>
      </div>
      <div class="nav-right">
          <router-link to="/Navbar" class = "header-button">Home</router-link>
        <router-link to="/Transparency" class="header-button">Transparency Seal</router-link>
        <router-link to="/Disctricts" class="header-button">Coast Guard Districts</router-link>
        <router-link to="/LandingApp" class="header-button">Apply Online</router-link>
        <router-link to="/Userstatus" class="header-button">User Status</router-link>
        <v-btn text @click="loginOrLogout" class="logout-btn">{{ isLoggedIn ? 'Logout' : 'Logout' }}</v-btn>
      </div>
    </nav>
    <div class="spacer"></div>
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

<style scoped>/* Navbar styles */
/* Navbar styles */
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #2c3e50;
  color: #fff;
  z-index: 1000; /* Ensure it's above other elements */
}

/* Nav Left styles */
.nav-left {
  display: flex;
  align-items: center;
}

/* Nav Right styles */
.nav-right {
  display: flex;
  align-items: center;
  gap: 20px; /* Add some space between buttons */
}

/* Logo link styles */
.logo-link {
  text-decoration: none;
  color: #fff;
}

/* Coast Guard Logo styles */
.coast-guard-logo {
  height: 50px;
  margin-right: 10px;
}

/* App Title styles */
.app-title {
  font-size: 1.8em;
  font-weight: bold;
}

/* Header button styles */
.header-button {
  color: #fff;
  text-decoration: none;
  font-weight: bold;  
  transition: color 0.3s ease;
}

.header-button:hover {
  color: #f39c12; /* Change color on hover */
}

/* Logout button styles */
.logout-btn {
  color: #fff;
  background-color: transparent;
  border: none;
  cursor: pointer;
  font-weight: bold;
  transition: color 0.3s ease;
}

.logout-btn:hover {
  color: #f39c12; /* Change color on hover */
}

.spacer {
  height: 100px; /* Adjust the height for desired spacing */
}

/* Additional CSS for responsiveness */
@media only screen and (max-width: 600px) {
  .navbar {
    flex-direction: column;
    align-items: flex-start;
  }

  .nav-right {
    margin-top: 10px;
  }

  .nav-left {
    margin-bottom: 10px;
  }


  .nav-left .app-title {
    font-size: 1.4em; /* Decrease font size for smaller screens */
  }

  .nav-left .coast-guard-logo {
    height: 40px; /* Decrease logo size for smaller screens */
  }

  .spacer {
    height: 60px; /* Adjust spacing for smaller screens */
  }

  .form-container {
    width: 90%; /* Make form container width 90% on small screens */
    margin: 20px auto; /* Adjust margin for smaller screens */
  }

  .step-container {
    margin-bottom: 20px; /* Adjust margin for smaller screens */
  }

  .step-title {
    font-size: 16px; /* Decrease font size for smaller screens */
  }

  .form-input {
    padding: 8px; /* Adjust padding for smaller screens */
  }

  .button-container {
    flex-direction: column; /* Stack buttons vertically on smaller screens */
  }

  button {
    width: 100%; /* Make buttons full width on smaller screens */
  }
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
