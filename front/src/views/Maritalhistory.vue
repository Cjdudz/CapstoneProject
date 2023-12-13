<!-- ParentComponent.vue -->
<template>
    <Maritalhistory />
    <div class="online-application-form">
    <OnlineApplicationForm />
  </div>
  </template>
  
  <script>
  import { defineComponent } from 'vue';
  import Maritalhistory from '../components/Maritalhistory.vue';
import OnlineApplicationForm from './OnlineApplicationForm.vue';
  
  export default defineComponent({
    name: 'ParentComponent',
  
    components: {
    Maritalhistory,
    OnlineApplicationForm
},
  });
  </script>
  <style scoped>
  .online-application-form {
    margin-top: 600px;
  }
  /* Component-specific styles go here */
  </style>