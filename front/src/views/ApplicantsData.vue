<template>
    <div>
      <!-- Other content in your view -->
  
      <!-- Include the ApplicantsData component -->
      <ApplicantsData />
    </div>
  </template>
  
  <script>
  // Import the ApplicantsData component
  import ApplicantsData from '@/views/ApplicantsData.vue'; // Update the import path
  
  export default {
    components: {
       ApplicantsData, // Register the ApplicantsData component
    },
    // Other component logic
  };
  </script>
  
  <style>
  /* Add your view-specific styles here */
  </style>
  