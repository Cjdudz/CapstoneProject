<template>
    <div>
      <h1>My Chat App</h1>
      <chat-component></chat-component>
    </div>
  </template>
  
  <script>
  import Chatcomponent from "../components/Chatcomponent.vue";
  
  export default {
    components: {
      Chatcomponent,
    },
  };
  </script>
  
  <style>
  /* Add your global styles here */
  </style>
  