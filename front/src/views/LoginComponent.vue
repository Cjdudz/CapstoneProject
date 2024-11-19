<script>
import axios from 'axios';

export default {
  data: () => ({
    username: '',
    password: '',
    message: '',
    showPassword: false,  
  }),
  methods: {
      async login() {
    try {
      const response = await axios.post('/api/login', {
        username: this.username,
        password: this.password,
      });

      if ('token' in response.data) {
        // Store the token in a cookie (non-HttpOnly, accessible by JavaScript)
        const expirationTime = new Date();
        expirationTime.setTime(expirationTime.getTime() + 3600 * 1000); // 1 hour

        // Set the token and expiration in a cookie
        document.cookie = `auth_token=${response.data.token}; expires=${expirationTime.toUTCString()}; path=/; secure;`;

        // Redirect based on user role
        switch (response.data.role) {
          case 'admin':
            this.$router.push('/Admin');
            break;
          case 'user':
            this.$router.push('/NavBar');
            break;
          default:
            this.message = 'Invalid role. Please contact support.';
        }
      } else {
        this.message = 'Login failed. Please try again.';
      }
    } catch (error) {
      this.message = 'Error during login. Please try again later.';
      console.error('Error during login:', error);
    }
  }
  },
};
</script>

<template>
  <v-app>
    <div class="background">
      <v-container class="login-container" fluid fill-height>
        <v-row>
          <!-- Larger login form with rounded corners -->
          <v-col cols="12" sm="8" md="6" lg="5" class="login-col">
            <v-card class="login-card rounded-xl">
              <v-card-title class="title">Login</v-card-title>
              <v-card-text class="form">
                <v-form @submit.prevent="login">
                  <v-text-field
                    class="bold-label"
                    v-model="username"
                    label="Username"
                    outlined
                    dense
                    color="black"
                  ></v-text-field>

                  <!-- Password field with toggle visibility -->
                  <v-text-field
                    v-model="password"
                    :type="showPassword ? 'text' : 'password'"
                    label="Password"
                    outlined
                    dense
                    color="black"
                    :append-icon="showPassword ? 'mdi-eye-off' : 'mdi-eye'"
                    @click:append="showPassword = !showPassword"
                  ></v-text-field>

                  <v-btn
                    type="submit"
                    block
                    class="login-button color--success"
                    :disabled="!username || !password"
                    >Login</v-btn>
                </v-form>
              </v-card-text>

              <v-card-actions class="center-links">
                <router-link to="/ForgotPass" class="forgot-password"
                  >Forgot Password?</router-link
                >
              </v-card-actions>
              <v-card-actions class="center-links">
                <router-link
                  v-if="!isAuthenticated"
                  to="/registercomponent"
                  class="register-link"
                  >Don't have an account? Register here</router-link
                >
              </v-card-actions>
              <v-alert
                v-if="message"
                type="error"
                dismissible
                class="error-message"
              >
                {{ message }}
              </v-alert>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </div>
  </v-app>
</template>

<style scoped>
.background {
  background-image: url('~@/assets/pcga-loginpage.png');
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  height: 100vh; /* Full-page background */
}

.login-container {
  height: 100vh;
  display: flex;
  align-items: center;
  padding-left: 150px; /* Shift form slightly to the right */
}

.login-col {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  flex-direction: column;
  padding: 30px; /* Increased padding */
}

.login-card {
  border-radius: 20px; /* Rounded corners for the login form */
  width: 100%; /* Take the full width of the column */
  background-color: rgba(255, 255, 255, 0.95); /* Slightly more opaque for better contrast */
  border: 2px solid #005cb2; /* Adjusted blue for stronger contrast */
  box-shadow: none; /* Removed shadow */
  padding: 20px; /* Padding inside the card */
}

.title {
  text-align: center;
  color: #005cb2; /* Adjusted blue for text */
  margin-bottom: 16px;
  font-size: 25px;
  font-weight: 700;
  padding-bottom: 10px; /* Added padding to the title */
}

.form {
  padding: 50px;
}

.login-button {
  margin-top: 16px;
  background-color: #005cb2; /* Stronger blue color */
  color: #fff;
  border: none;
  border-radius: 5px;
}

.login-button:hover {
  background-color: #004080; /* Darker hover effect */
}

.forgot-password,
.register-link {
  text-align: center;
  margin-top: 16px;
  color: #005cb2;
  text-decoration: none;
  display: block; /* Display as block elements to center them */
}

.forgot-password:hover,
.register-link:hover {
  color: #004080;
}

.center-links {
  justify-content: center; /* Center the links */
  display: flex;
  width: 100%;
}

.error-message {
  margin-top: 16px;
  color: #f44336;
}

.bold-label .v-label {
  font-weight: bold;
}
</style>