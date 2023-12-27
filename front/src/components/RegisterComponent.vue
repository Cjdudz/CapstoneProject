<template>
  <div class="container">
    <div class="login-container">
      <v-sheet width="300" class="mx-auto custom-border">
        <v-form @submit.prevent="register">
          <v-alert v-if="message === 'error'" type="error" dense dismissible>
            Invalid response
          </v-alert>
          <v-text-field v-model="username" label="Username" required class="mt-3"></v-text-field>
          <v-text-field v-model="password" label="Password" type="password" required></v-text-field>
          <v-text-field v-model="passwordConfirm" label="Confirm Password" type="password" required></v-text-field>
          <v-select v-model="userRole" :items="userRoles" label="Select User Role" required class="mt-3"></v-select>
          <v-alert v-if="message === 'passwordMismatch'" type="error" dense dismissible>
            Passwords do not match
          </v-alert>
          <v-alert v-if="message === 'registrationFailed'" type="error" dense dismissible>
            Registration failed. Please try again.
          </v-alert>
          <v-btn type="submit" block class="mt-4" color="primary">Submit</v-btn>
          <div class="mt-3 text-center">
            <v-divider></v-divider>
            <span class="caption">Already have an account?</span>
            <router-link to="/logincomponent" class="router-link">Login here</router-link>
          </div>
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
      userRole: '',
      userRoles: ['user', 'admin'],
      message: '',
    };
  },
  methods: {
    async register() {
      if (this.password === this.passwordConfirm) {
        try {
          const response = await axios.post('api/register', {
            username: this.username,
            password: this.password,
            role: this.userRole,
          });

          if (response.data.msg === 'okay') {
            alert('Registered successfully');
            this.$router.push('/logincomponent');
          } else {
            this.message = 'registrationFailed';
          }
        } catch (error) {
          console.error('Error during registration:', error);
          this.message = 'error';
        }
      } else {
        this.message = 'passwordMismatch';
      }
    },
  },
};
</script>
<style scoped>
.container {
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #7c5d5d; /* Change to a common background color */
}

.login-container {
  max-width: 400px;
  width: 100%;
  padding: 20px;
  background-color: white;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  border: 1px solid #ccc;
  height: 70;
}

.custom-border {
  border: 1px solid #ccc;
}

.v-text-field {
  margin: 20px 0;
}

.error-message {
  color: #d32f2f; /* Use the same color for error messages */
}

.router-link {
  color: #1976D2; /* Use the same color for router links */
  text-decoration: none;
}

.router-link:hover {
  text-decoration: underline;
}

.caption {
  font-size: 12px;
  margin-top: 8px;
  display: block;
  color: #555;
}

.text-center {
  text-align: center;
}

/* Add styles for the v-divider */
.v-divider {
  margin: 16px 0;
}
</style>
