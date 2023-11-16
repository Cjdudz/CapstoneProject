<template>
    <div>
    
  
      <!-- Display the Register component -->
      <RegisterComponent />
  
      <!-- Display the Login component (you may have a Login button or link) -->
      <LoginComponent @login-success="handleLoginSuccess" />
    </div>
  </template>
  
  <script>
  import RegisterComponent from "@/components/RegisterComponent.vue";
  import LoginComponent from "@/components/Login.vue";
  
  export default {
    components: {
      RegisterComponent,
      LoginComponent,
    },
    methods: {
      handleLoginSuccess() {
        // Handle actions after successful login
        this.$router.push("/Login");
      },
    },
  };
  </script>
  
  <style scoped>
  /* Add your component-specific styles here */
  </style>
  