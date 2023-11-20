<template>
    <div>
      <!-- Your existing content for HomeView -->
  
      <ApplicantList :applicants="applicants" />
    </div>
  </template>
  
  <script>
  import ApplicantList from '../components/ApplicantList.vue';
  
  export default {
    data() {
      return {
        applicants: [], // Assuming this array holds your applicant data
      };
    },
    components: {
      ApplicantList,
    },
  };
  </script>
  
  <style scoped>
  /* Your styles for HomeView */
  </style>
  