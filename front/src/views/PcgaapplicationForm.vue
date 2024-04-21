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
    <v-card class="form-card">
        <div class="header-design"></div>
        <h1 class="form-title">PCGA APPLICATION FORM</h1>
        <v-form @submit.prevent="submitForm" ref="form" class="form">
          <v-row>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.name" label="Name of Applicant" required></v-text-field>
            </v-col>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.age" label="Age" required></v-text-field>
            </v-col>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.nationality" label="Nationality" required></v-text-field>
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.dob" label="Date of Birth" type="date" required></v-text-field>
            </v-col>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.passport" label="Passport No." required></v-text-field>
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.address" label="Address" required></v-text-field>
            </v-col>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.telephone" label="Telephone" type="tel" required></v-text-field>
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.email" label="Email" type="email" required></v-text-field>
            </v-col>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.occupation" label="Occupation" required></v-text-field>
            </v-col>
          </v-row>
          <v-text-field v-model="form.club" label="Name of Club" required></v-text-field>
          <v-row>
            <v-col cols="12">
              <v-text-field v-model="form.applicationDate" label="Date of Application" type="date" required></v-text-field>
            </v-col>
          </v-row>
          <v-btn type="submit" class="submit-btn">Submit</v-btn>
        </v-form>
      </v-card>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      form: {
        name: '',
        nationality: '',
        dob: '',
        passport: '',
        address: '',
        telephone: '',
        email: '',
        occupation: '',
        club: '',
        applicationDate: '',
      },
      // Add other form data objects here
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
      this.$router.push(path);
    },
    async submitForm() {
      try {
        // Send form data to CodeIgniter backend
        const response = await axios.post('/api/passForm', this.form);

        // Assuming the backend responds with a success message
        console.log('Form submitted successfully:', response.data);

        // Reset the form after successful submission (optional)
        this.resetForm();
      } catch (error) {
        console.error('Error submitting form:', error.message);
      }
    },
    resetForm() {
      // Reset form fields after successful submission
      this.form = {
        name: '',
        nationality: '',
        dob: '',
        passport: '',
        address: '',
        telephone: '',
        email: '',
        occupation: '',
        club: '',
        applicationDate: '',
      };
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
  height: 40px;
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

/* General form styles */
.form-card {
  max-width: 800px;
  margin: 20px auto;
  padding: 20px;
  background-color: #f2f5f8;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.header-design {
  /* Add your header design styles here */
}

.form-title {
  text-align: center;
  font-size: 28px;
  margin-bottom: 20px;
  color: #2c3e50;
}

.form {
  /* Add your form styles here */
}

.submit-btn {
  display: block;
  width: 100%;
  padding: 15px;
  background-color: #2980b9;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 18px;
  transition: background-color 0.3s;
}

.submit-btn:hover {
  background-color: #1c6cad;
}

/* Input field styles */
input[type="text"],
input[type="date"],
input[type="email"],
textarea {
  width: 100%;
  padding: 12px;
  margin-bottom: 15px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
  font-size: 16px;
  color: #333;
}

/* Radio button styles */
input[type="radio"] {
  margin-right: 5px;
}
</style>
