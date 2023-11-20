<!-- App.vue -->

<template>
    <div id="app">
      <users />
    </div>
  </template>
  
  <script>
  import users from '../components/users.vue';
  
  export default {
    components: {
      users,
    },
  };
  </script>
  
  <style>
  /* Add your global styling here if needed */
  </style>
  