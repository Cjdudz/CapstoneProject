<template>
    <div id="app">
      <PcgaapplicationForm />
      <OnlineApplicationForm />
  
    </div>
  </template>
  
  <script>
  import PcgaapplicationForm from '../components/PcgaapplicationForm.vue'
  import OnlineApplicationForm from '../components/OnlineApplicationForm.vue';
  export default {
    components: {
        PcgaapplicationForm,
        OnlineApplicationForm,
    },
  }
  </script>
  