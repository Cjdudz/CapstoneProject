<template>
    <div>
      <!-- Your existing content for HomeView -->
  
      <Userstatus/>
    </div>
  </template>
  
  <script>
  import Userstatus from '../components/Userstatus.vue';
  
  export default {
    data() {
      return {
        applicants: [], // Assuming this array holds your applicant data
      };
    },
    components: {
      Userstatus,
    },
  };
  </script>
  
  <style scoped>
  /* Your styles for HomeView */
  </style>
  