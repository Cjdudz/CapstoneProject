<template>
    <div class="container">
      <div class="register-container">
        <h2>Register</h2>
        <form @submit.prevent="register" class="register-form">
          <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" v-model="username" class="form-control" required />
          </div>
  
          <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" v-model="password" class="form-control" required />
          </div>
  
          <button type="submit" class="btn btn-primary">Register</button>
        </form>
  
        <!-- Link to the login page -->
        <router-link to="/LoginComponent">Already have an account? Login here.</router-link>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        username: '',
        password: '',
      };
    },
    methods: {
      register() {
        // Here you can add your registration logic
        // For simplicity, let's just log the registration details for now
        console.log('Registered Username:', this.username);
        console.log('Registered Password:', this.password);
  
        // After successful registration, you can redirect to the login page
        this.$router.push('/LoginComponent');
      },
    },
  };
  </script>
  
  <style scoped>
  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
  }
  
  .register-container {
    width: 300px;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
  
  .register-form .form-group {
    margin-bottom: 15px;
  }
  
  .register-form label {
    display: block;
    margin-bottom: 5px;
  }
  
  .register-form input {
    width: 100%;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
  }
  
  .register-form button {
    width: 100%;
    padding: 10px;
    background-color: #28a745;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }
  
  .register-form button:hover {
    background-color: #218838;
  }
  
  /* Style for the login link */
  .router-link {
    display: block;
    margin-top: 10px;
    text-align: center;
    color: #007bff;
    text-decoration: none;
  }
  </style>
  