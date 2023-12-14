<template>
  <div class="container">
    <v-sheet width="300" class="mx-auto login-container artistic-login-container">
      <v-form @submit.prevent="login" class="form-container artistic-form-container">
        <v-text-field v-model="username" label="Username" required class="artistic-text-field"></v-text-field>
        <v-text-field v-model="password" label="Password" type="password" required class="artistic-text-field"></v-text-field>
        <v-btn type="submit" block class="mt-2 artistic-btn">Login</v-btn>
      </v-form>

      <p v-if="message" class="error-message artistic-error-message">{{ message }}</p>

      <div class="forgot-register-links">
        <router-link to="/forgot-password" class="link artistic-link">Forgot Password?</router-link>
        <v-card-text>If you don't have an account, register <router-link to="/RegisterComponent" class="link artistic-link">here</router-link> first.</v-card-text>
      </div>
    </v-sheet>
  </div>
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
        const response = await axios.post('api/login', {
          username: this.username,
          password: this.password,
        });

        if ('msg' in response.data) {
          if (response.data.msg === 'okay') {
            // Check the role and redirect accordingly
            if (response.data.role === 'admin') {
              this.$router.push('/Admin');
            } else {
              this.$router.push('/NavBar'); // Update the route for regular users
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
.container {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
  background-color: #9897d6;
}

.login-container {
  text-align: center;
  background-color: #ffffff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.artistic-login-container {
  background-color: #f0f0f0;
  border-radius: 12px;
  padding: 20px;
}

.form-container {
  max-width: 300px;
}

.artistic-form-container {
  background-color: #f0f0f0;
  border-radius: 12px;
  padding: 20px;
}

.artistic-text-field {
  border: 2px solid #9897d6;
  border-radius: 8px;
  margin-bottom: 15px;
}

.artistic-error-message {
  color: #ff0000;
  font-size: 14px;
  margin-top: 5px;
}

.artistic-btn {
  background-color: #9897d6;
  color: #ffffff;
  border-radius: 8px;
  transition: background-color 0.3s ease;
}

.artistic-btn:hover {
  background-color: #6d3131;
}

.artistic-link {
  margin-right: 10px;
  color: #1745c1;
  text-decoration: none;
}

.forgot-register-links .v-card-text {
  margin-top: 10px;
}
</style>
