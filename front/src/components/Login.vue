<template>
  <div class="container">
    <v-sheet width="300" class="mx-auto login-container">
      <v-form @submit.prevent="login" class="form-container">
        <v-text-field v-model="username" label="Username" required></v-text-field>
        <v-text-field v-model="password" label="Password" type="password" required></v-text-field>
        <v-btn type="submit" block class="mt-2">Login</v-btn>
      </v-form>

      <p v-if="message" class="error-message">{{ message }}</p>

      <div class="forgot-register-links">
        <router-link to="/forgot-password" class="link">Forgot Password?</router-link>
        <v-card-text>If you don't have an account, register <router-link to="/RegisterComponent" class="link">here</router-link> first.</v-card-text>
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
            this.$router.push('/');
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
  background-color: #8f4a4a;
}

.login-container {
  text-align: center;
  background-color: #ffffff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.form-container {
  max-width: 300px;
}

.error-message {
  color: red;
  margin-top: 5px;
}

.forgot-register-links {
  margin-top: 10px;
}

.forgot-register-links .link {
  margin-right: 10px;
  color: blue;
  text-decoration: none;
}

.forgot-register-links .v-card-text {
  margin-top: 10px;
}
</style>
