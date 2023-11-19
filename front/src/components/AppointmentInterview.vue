<template>
    <div class="appointment-interview">
      <h2>Interview Appointment</h2>
      <form @submit.prevent="scheduleAppointment">
        <div class="form-group">
          <label for="date">Date:</label>
          <input type="date" v-model="appointment.date" required />
        </div>
  
        <div class="form-group">
          <label for="time">Time:</label>
          <input type="time" v-model="appointment.time" required />
        </div>
  
        <div class="form-group">
          <label for="location">Location:</label>
          <input type="text" v-model="appointment.location" required />
        </div>
  
        <button type="submit">Schedule Interview</button>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        appointment: {
          date: '',
          time: '',
          location: '',
        },
      };
    },
    methods: {
      scheduleAppointment() {
        // Handle appointment scheduling logic
        console.log('Appointment Scheduled:', this.appointment);
        // You can perform additional logic here, such as sending the data to a server.
      },
    },
  };
  </script>
  
  <style scoped>
  .appointment-interview {
    max-width: 400px;
    margin: auto;
  }
  
  .form-group {
    margin-bottom: 15px;
  }
  
  button {
    background-color: #4caf50;
    color: white;
    padding: 10px 15px;
    border: none;
    cursor: pointer;
  }
  </style>
  