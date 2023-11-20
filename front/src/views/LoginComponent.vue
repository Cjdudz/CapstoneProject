<template>
    <div>
  
  
      <!-- Include the LoginView component -->
      <Login />
  
      <!-- Other content of the HomeView component -->
     
    </div>
  </template>
  
  <script>
  import { defineComponent } from 'vue';
  
  // Components

  import Login from '../components/Login.vue'; // Adjust the path as needed
  
  export default defineComponent({
    name: 'HomeView',
  
    components: {
     
      Login,
    },
  });
  </script>