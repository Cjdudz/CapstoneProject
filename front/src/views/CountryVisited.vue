<template>
    <CountryVisited />
    <OnlineApplicationForm />
  </template>
  
  <script>
  import { defineComponent } from 'vue';
  import CountryVisited from '@/components/CountryVisited.vue';
import OnlineApplicationForm from '@/components/OnlineApplicationForm.vue';
  
  export default defineComponent({
    name: 'ParentComponent',    
  
    components: {
    CountryVisited,
    OnlineApplicationForm,
},
  });
  </script>
  