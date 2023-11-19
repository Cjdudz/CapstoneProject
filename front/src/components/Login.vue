<template>
  <div class="coast-guard-container">
    <div class="coast-guard-login-container">
      <h2>Login</h2>
      <form @submit.prevent="login" class="coast-guard-login-form">
        <div class="form-group">
          <label for="username">Username:</label>
          <input type="text" v-model="username" class="form-control" required />
        </div>

        <div class="form-group">
          <label for="password">Password:</label>
          <input type="password" v-model="password" class="form-control" required />
        </div>

        <button type="submit" class="btn btn-coast-guard">Login</button>

        <!-- Error message display -->
        <p v-if="loginError" class="coast-guard-error-message">{{ loginError }}</p>
      </form>

      <!-- Link to the registration page -->
      <router-link to="/RegisterComponent" class="router-link">Don't have an account? Register here.</router-link>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: '',
      password: '',
      loginError: '', // New data property for login errors
    };
  },
  methods: {
    login() {
      // Here you can add your authentication logic
      // For simplicity, let's just log the credentials for now
      console.log('Username:', this.username);
      console.log('Password:', this.password);

      // Simulate a login error for demonstration purposes
      this.loginError = 'Invalid username or password';

      // For example, redirect to a dashboard
      this.$router.push('/');
    },
  },
};
</script>
<style scoped>
.coast-guard-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  margin: 20px;
  background-color: #dae2df; /* Coastal Blue-Green */
}

.coast-guard-login-container {
  width: 300px;
  padding: 20px;
  border: 1px solid #007bff;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  background-color: #f5f5f5; /* Set background color to light gray */
}

.coast-guard-login-form .form-group {
  margin-bottom: 15px;
}

.coast-guard-login-form label {
  display: block;
  margin-bottom: 5px;
  color: #007bff; /* Set label color to Coast Guard blue */
}

.coast-guard-login-form input {
  width: 100%;
  padding: 8px;
  border: 1px solid #007bff;
  border-radius: 4px;
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.coast-guard-login-form input:focus {
  border-color: #0056b3; /* Darker blue on focus */
  box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

.btn-coast-guard {
  width: 100%;
  padding: 10px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.btn-coast-guard:hover {
  background-color: #0056b3;
}

.coast-guard-error-message {
  color: #dc3545;
  font-size: 14px;
  margin-top: 5px;
}

.router-link {
  display: block;
  margin-top: 20px;
  text-align: center;
  color: #007bff;
  text-decoration: none;
}

.router-link:hover {
  text-decoration: underline;
}
</style>
