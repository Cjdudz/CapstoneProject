<template>
  <div class="user-container">
    <div class="login-container">
      <v-sheet width="300" class="mx-auto form-container">
        <v-form @submit.prevent="register">
          <div v-if="message === 'error'" class="error-message">Invalid response</div>
          <v-text-field v-model="username" label="Username" required></v-text-field>
          <v-text-field v-model="password" label="Password" type="password" required></v-text-field>
          <v-text-field v-model="passwordConfirm" label="Password Confirm" type="password" required></v-text-field>
          <v-select v-model="role" :items="['user', 'admin']" label="Role" required></v-select>
          <div v-if="message === 'passwordMismatch'" class="error-message">Passwords do not match</div>
          <div v-if="message === 'registrationFailed'" class="error-message">Registration failed. Please try again.</div>
          <v-btn type="submit" block class="mt-2">Submit</v-btn>
        </v-form>
      </v-sheet>
    </div>
  </div>
</template>
<script>
import axios from 'axios';

export default {
  data() {
    return {
      username: '',
      password: '',
      passwordConfirm: '',
      role: 'user', // Default role is 'user'
      message: '',
    };
  },
  methods: {
    async register() {
      if (this.password === this.passwordConfirm) {
        try {
          let apiUrl = "api/register";

          // Check if the selected role is 'admin' and update the API URL accordingly
          if (this.role === 'admin') {
            apiUrl = "api/registerAdmin";
          }

          const response = await axios.post(apiUrl, {
            username: this.username,
            password: this.password,
            role: this.role,
          });

          if (response.data.msg === 'okay') {
            alert("Registered successfully");
            this.$router.push('/LoginComponent');
          } else {
            this.message = 'registrationFailed';
          }
        } catch (error) {
          console.error("Error during registration:", error);
          this.message = 'error';
        }
      } else {
        this.message = "passwordMismatch";
      }
    }
  }
};
</script>

<style scoped>
.user-container {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
  background-color: #a95454; /* Add a background color */
}

.login-container {
  text-align: center;
  background-color: #ffffff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.form-container {
  max-width:px;
}

.error-message {
  color: red;
  margin-top: 5px;
}
</style>
