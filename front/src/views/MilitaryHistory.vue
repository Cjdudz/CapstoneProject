<template>
    <div>
      <MilitaryHistory/>
      <OnlineApplicationForm />
    </div>
  </template>
  
  <script>
  // Import the MilitaryHistorycomponent
 
import MilitaryHistory from '../components/MilitaryHistory.vue'; // Update the import path
import OnlineApplicationForm from '../components/OnlineApplicationForm.vue';
  
  export default {
    components: {
    MilitaryHistory,
    OnlineApplicationForm,
}
}
  </script>
  
  <style>
  /* Add your view-specific styles here */
  </style>
  