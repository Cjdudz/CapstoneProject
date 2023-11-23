<template>
    <div id="app">
      <PcgaapplicationForm />
      <OnlineApplicationForm />
      <router-view />
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
  