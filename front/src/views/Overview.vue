<template>
    <div id="app">
      <Overview />
      <router-view />
    </div>
  </template>
  
  <script>
  import Overview from '../components/Overview.vue'
  
  export default {
    components: {
        Overview,
    },
  }
  </script>
  