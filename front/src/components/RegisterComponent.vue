<template>
 <div class="container">
    <div :class="['register-container', { 'admin-style': role === 'admin' }]">
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
        <div class="form-group">
          <label for="role" :class="{ 'admin-label': role === 'admin' }">Role:</label>
          <select v-model="role" class="form-control" :class="{ 'admin-select': role === 'admin' }" required>
            <option value="user">User</option>
            <option value="admin">Admin</option>
          </select>
        </div>

        <button type="submit" class="btn btn-coastguard">Register</button>
      </form>

      <div class="login-link">
        <router-link to="/LoginComponent">Already have an account? Login here.</router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: '',
      password: '',
      role: 'user', // Default to user role
    };
  },
  methods: {
    register() {
      // Here you can add your registration logic
      // For simplicity, let's just log the registration details for now
      console.log('Registered Username:', this.username);
      console.log('Registered Password:', this.password);
      console.log('Role:', this.role);

      // After successful registration, redirect to the login page
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
  margin: 20px;
  background-color: #dae2df; /* Coastal Blue-Green */
}

.register-container {
  width: 300px;
  padding: 20px;
  border: 1px solid #253031; /* Deep Navy */
  border-radius: 10px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
  background-color: #fff;
  transition: box-shadow 0.3s ease;
}

.register-container:hover {
  box-shadow: 0 0 30px rgba(0, 0, 0, 0.3);
}

.register-container h2 {
  font-size: 20px;
  text-align: center;
  margin-bottom: 20px;
  color: #253031; /* Deep Navy */
}

.register-form label {
  display: block;
  margin-bottom: 10px;
  font-weight: bold;
  color: #344e5e; /* Slate Blue */
}
.register-container.admin-style {
  /* Add additional styles for the admin role here */
  background-color: #f8d7da; /* Light Red */
  border-color: #dc3545; /* Red */
  color: #721c24; /* Dark Red */
}
.register-form input {
  width: 100%;
  padding: 15px;
  margin-bottom: 20px;
  border: 1px solid #344e5e; /* Slate Blue */
  border-radius: 8px;
  font-size: 16px;
  transition: border-color 0.3s ease;
}

.register-form input:focus {
  border-color: #205c7a; /* Dark Cerulean */
}

.register-form button {
  width: 100%;
  padding: 10px;
  background-color: #205c7a; /* Dark Cerulean */
  color: #fff;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  font-size: 18px;
}

.register-form button:hover {
  background-color: #0e3841; /* Dark Slate Gray */
}

.login-link {
  margin-top: 20px;
  text-align: center;
}

.login-link a {
  color: #205c7a; /* Dark Cerulean */
  text-decoration: none;
  font-weight: bold;
  font-size: 16px;
  transition: color 0.3s ease;
}

.login-link a:hover {
  color: #0e3841; /* Dark Slate Gray */
}
</style>
