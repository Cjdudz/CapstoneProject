<!-- ParentComponent.vue -->
<template>
    <Maritalhistory />
    <OnlineApplicationForm />
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
  