<template>
    <div>
      <!-- Other content in your view -->
  
      <!-- Include the Landingpage component -->
      <Landingpage />
    </div>
  </template>
  
  <script>
  // Import the Landingpage component
  import Landingpage from '../components/Landingpage.vue'; // Update the import path
  
  export default {
    components: {
       Landingpage, // Register the Landingpage component
    },
    // Other component logic
  };
  </script>
  
  <style>
  /* Add your view-specific styles here */
  </style>
  