<template>
  <v-container>
    <v-card class="mx-auto my-12 pa-6" max-width="500">
      <v-card-title class="headline">Password Reset</v-card-title>
  
      <v-card-text>
        <!-- Step 1: Request Password Reset -->
        <div v-if="currentStep === 1">
          <v-text-field
            v-model="email"
            label="Email"
            type="email"
            required
            outlined
            class="mb-4"
          ></v-text-field>
          <v-btn
            color="primary"
            @click="requestPasswordReset"
            :loading="loading"
            :disabled="loading || !email"
            class="mb-4"
          >
            Request Reset Link
          </v-btn>
        </div>
  
        <!-- Step 2: Reset Password -->
        <div v-if="currentStep === 2">
          <v-text-field
            v-model="password"
            label="New Password"
            type="password"
            required
            outlined
            class="mb-4"
          ></v-text-field>
          <v-text-field
            v-model="confirmPassword"
            label="Confirm Password"
            type="password"
            required
            outlined
            class="mb-4"
          ></v-text-field>
          <v-btn
            color="primary"
            @click="resetPassword"
            :loading="loading"
            :disabled="loading || !password || !confirmPassword"
            class="mb-4"
          >
            Reset Password
          </v-btn>
        </div>
  
        <!-- Step 3: Success Message -->
        <div v-if="currentStep === 3">
          <v-alert type="success" class="mb-4">
            {{ successMessage }}
          </v-alert>
        </div>

        <v-btn color="primary" @click="goToLogin">
          Back to Login
        </v-btn>
  
        <!-- Error Message -->
        <v-alert v-if="errorMessage" type="error" class="mt-4">
          {{ errorMessage }}
        </v-alert>
      </v-card-text>
    </v-card>
  </v-container>
</template>
  
  <script>
  import axios from 'axios';
  
  export default {
    name: 'PasswordReset',
    data() {
      return {
        email: '',
        password: '',
        confirmPassword: '',
        token: this.$route.query.token || '', // Get token from URL query parameter
        currentStep: 1,
        loading: false, // Add a loading state
        errorMessage: '',
        successMessage: ''
      };
    },
    mounted() {
      // If token is present in the URL, skip to the reset password step
      if (this.token) {
        this.verifyToken();
      }
    },
    methods: {
      // Step 1: Request Password Reset
      async requestPasswordReset() {
        this.loading = true; // Start loading
        this.errorMessage = '';
        this.successMessage = '';
  
        try {
          const response = await axios.post("api/password-reset/request", {
            email: this.email
          });
  
          if (response.status === 200) {
            this.successMessage = response.data.message;
            this.$router.push('/LoginComponent');
            this.currentStep = 3; // Show success message
          } else {
            this.errorMessage = `Failed to request reset link: ${response.status}`;
            console.error('Failed to request reset link:', response.status);
          }
        } catch (error) {
          console.error("Error requesting password reset:", error); // Error handling
          this.errorMessage = 'Error requesting password reset. Please try again.';
        } finally {
          this.loading = false; // Stop loading after fetching or error
        }
      },
  
      // Step 2: Verify Password Reset Token
      async verifyToken() {
        this.loading = true; // Start loading
        this.errorMessage = '';
        this.successMessage = '';
  
        try {
          const response = await axios.get(`api/password-reset/verify/${this.token}`);
  
          if (response.status === 200) {
            this.currentStep = 2; // Move to the reset password step
          } else {
            this.errorMessage = `Invalid or expired token: ${response.status}`;
            console.error('Invalid or expired token:', response.status);
          }
        } catch (error) {
          console.error("Error verifying token:", error); // Error handling
          this.errorMessage = 'Invalid or expired token. Please request a new password reset.';
          this.currentStep = 1; // Return to the request reset step
        } finally {
          this.loading = false; // Stop loading after fetching or error
        }
      },
      goToLogin() {
      this.$router.push({ name: 'login' }); // Redirect to the login page using named route 'login'
    },
      // Step 3: Reset Password
      async resetPassword() {
        if (this.password !== this.confirmPassword) {
          this.errorMessage = 'Passwords do not match.';
          return;
        }
  
        this.loading = true; // Start loading
        this.errorMessage = '';
        this.successMessage = '';
  
        try {
          const response = await axios.post("api/password-reset/reset", {
            token: this.token,
            password: this.password,
            confirm_password: this.confirmPassword
          });
  
          if (response.status === 200) {
            this.successMessage = response.data.message;
            this.currentStep = 3; // Show success message
          } else {
            this.errorMessage = `Failed to reset password: ${response.status}`;
            console.error('Failed to reset password:', response.status);
          }
        } catch (error) {
          console.error("Error resetting password:", error); // Error handling
          this.errorMessage = 'Error resetting password. Please try again.';
        } finally {
          this.loading = false; // Stop loading after fetching or error
        }
      }
    }
  };
  </script>
  
  <style scoped>
  .v-container {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
  }
  </style>