<template>
  <div>
    <MembershipapplicationPAge2/>
    <OnlineApplicationForm />
  </div>
</template>

<script>
// Import the MembershipapplicationPAge2component
import MembershipapplicationPAge2 from '../components/MembershipapplicationPAge2.vue'; // Update the import path
import OnlineApplicationForm from './OnlineApplicationForm.vue';
export default {
  components: {
    MembershipapplicationPAge2,
    OnlineApplicationForm, // Register the MembershipapplicationPAge2component
  },
  // Other component logic
};
</script>

<style>
/* Add your view-specific styles here */
</style>
