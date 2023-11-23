<template>
    <div>   <!-- Display the Register component -->
      <Personalhistory />
      <OnlineApplicationForm />
    </div>
  </template>
  
  <script>
  import OnlineApplicationForm from "@/components/OnlineApplicationForm.vue";
import Personalhistory from "@/components/Personalhistory.vue";

  
  export default {
    components: {
    Personalhistory,
    OnlineApplicationForm,
},
};
  </script>
  
  <style scoped>
  /* Add your component-specific styles here */
  </style>
  