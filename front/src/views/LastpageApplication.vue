<template>
    <div>
      <LastpageApplication />
      <OnlineApplicationForm />
    </div>
  </template>
  
  <script>
  // Import the LastpageApplicationcomponent
 
import OnlineApplicationForm from '@/components/OnlineApplicationForm.vue';
import LastpageApplication from '../components/LastpageApplication.vue'; // Update the import path
  
  export default {
    components: {
    LastpageApplication,
    OnlineApplicationForm,
}
}
  </script>
  
  <style>
  /* Add your view-specific styles here */
  </style>
  