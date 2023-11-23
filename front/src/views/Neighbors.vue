<template>
    <div>

      <Neighbors />
      <OnlineApplicationForm />
    </div>
  </template>
  
 
  OnlineApplicationForm,
  <script>
  // Import the Neighborscomponent
  import Neighbors from '../components/Neighbors.vue'; // Update the import path
  import OnlineApplicationForm from '../components/OnlineApplicationForm.vue';
  export default {
    components: {
      Neighbors,
    OnlineApplicationForm, // Register the MembershipapplicationPAge2component
    },
    // Other component logic
  };
  </script>
  
  <style>
  /* Add your view-specific styles here */
  </style>
  