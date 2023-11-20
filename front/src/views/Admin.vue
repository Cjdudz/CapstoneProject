<template>
    <vs-app>
      <div>
        <Admin />
        <v-container>
          <h1>Home Page</h1>
          <!-- Your home page content goes here -->
        </v-container>
      </div>
    </vs-app>
  </template>
  
  <script>
  import Admin from '../components/Admin.vue'; // Adjust the path based on your project structure
  
  export default {
    components: {
      Admin,
    },
  };
  </script>
  
  <style>
  /* Add your styles here if needed */
  </style>
  