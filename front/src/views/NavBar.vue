<template>
    <div>
      <NavBar />
      <RouterView />
    </div>
  </template>
  
  <script>
  // Import the NavBarcomponent
  import NavBar from '../components/NavBar.vue'; 
  import PcgaapplicationFormVue from '../components/PcgaapplicationForm.vue';
  import Home from './Home.vue';
  export default {
    components: {
      NavBar, // Register the NavBarcomponent
    PcgaapplicationFormVue,
    Home,
    },
    // Other component logic
  };
  </script>
  
  <style>
  /* Add your view-specific styles here */
  </style>
  