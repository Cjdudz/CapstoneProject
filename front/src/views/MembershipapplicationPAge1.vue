<template>
  <div>
    <MembershipapplicationPAge1 />
    <OnlineApplicationForm />
  </div>
</template>

<script>
// Import the MembershipapplicationPAge1component
import MembershipapplicationPAge1 from '../components/MembershipapplicationPAge1.vue'; // Update the import path
import OnlineApplicationForm from '../components/OnlineApplicationForm.vue'; 
export default {
  components: {
    OnlineApplicationForm,
    MembershipapplicationPAge1, // Register the MembershipapplicationPAge1component
  },
  // Other component logic
};
</script>

<style>
/* Add your view-specific styles here */
</style>
