<template>
  <v-app>
    <v-container class="login-container" fluid fill-height>
      <v-row justify="center" align="center">
        <v-col cols="12" sm="8" md="6" lg="4">
          <v-card class="login-card">
            <v-card-title class="title">Login</v-card-title>
            <v-card-text class="form">
              <v-form @submit.prevent="login">
                <v-text-field v-model="username" label="Username" outlined dense color="white"></v-text-field>
                <v-text-field v-model="password" label="Password" type="password" outlined dense color="white"></v-text-field>
                <v-btn type="submit" block class="login-button">Login</v-btn>
              </v-form>
            </v-card-text>
            <v-card-actions>
              <router-link to="/forgot-password" class="forgot-password">Forgot Password?</router-link>
            </v-card-actions>
            <v-card-actions>
              <router-link to="/registercomponent" class="register-link">Don't have an account? Register here</router-link>
            </v-card-actions>
            <v-alert v-if="message" type="error" dismissible class="error-message">
              {{ message }}
            </v-alert>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
import axios from 'axios';

export default {
  data: () => ({
    username: '',
    password: '',
    message: '',
  }),
  methods: {
    async login() {
      try {
        const response = await axios.post('/api/login', {
          username: this.username,
          password: this.password,
        });

        if ('msg' in response.data) {
          if (response.data.msg === 'okay') {
            // Check the user role and redirect accordingly
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
        } else {
          this.message = 'Unexpected response structure. Please try again.';
          console.error('Unexpected response structure:', response);
        }
      } catch (error) {
        this.message = 'Error during login. Please try again later.';
        console.error('Error during login:', error);
      }
    },
  },
};
</script>

<style scoped>
.v-app {
  background: linear-gradient(135deg, #536dfe 0%, #1e88e5 100%);
}

.login-container {
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}

.login-card {
  border-radius: 10px;
  box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3);
}

.title {
  text-align: center;
  color: #1976D2;
  margin-bottom: 16px;
  font-size: 25px;
  font-weight: 700;
}

.form {
  padding: 20px;
}

.login-button {
  margin-top: 16px;
  background-color: #3f51b5;
  color: #fff;
  border: none;
  border-radius: 5px;
}

.login-button:hover {
  background-color: #303f9f;
}

.forgot-password,
.register-link {
  text-align: center;
  margin-top: 16px;
  color: #1976D2;
  text-decoration: none;
  display: inline-block;
}

.forgot-password:hover,
.register-link:hover {
  color: #296540;
}

.error-message {
  margin-top: 16px;
  color: #f44336;
}
</style>
