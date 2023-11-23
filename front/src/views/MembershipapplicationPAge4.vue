<template>
  <div>
    <MembershipapplicationPAge4/>
    <OnlineApplicationForm />
  </div>
</template>

<script>
// Import the MembershipapplicationPAge4component
import MembershipapplicationPAge4 from '../components/MembershipapplicationPAge4.vue'; // Update the import path
import OnlineApplicationForm from '../components/OnlineApplicationForm.vue';
export default {
  components: {
    OnlineApplicationForm,
    MembershipapplicationPAge4, // Register the MembershipapplicationPAge2component
  },
  // Other component logic
};
</script>

<style>
/* Add your view-specific styles here */
</style>
