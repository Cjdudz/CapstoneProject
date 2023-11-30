<template>
  <div>
    <h2>Appointment List</h2>
    <ul>
      <li v-for="appointment in appointments" :key="appointment.id">
        {{ appointment.title }} - {{ appointment.date_time }}
      </li>
    </ul>
    <div v-if="error" class="error-message">
      Error fetching appointments: {{ error }}
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      appointments: [],
      error: null,
    };
  },
  mounted() {
    // Fetch appointments from the backend
    this.fetchAppointments();
  },
  methods: {
    async fetchAppointments() {
      try {
        const response = await axios.get('/api/appointment'); // Assuming your API endpoint is at the root level
        this.appointments = response.data;
      } catch (error) {
        console.error('Error fetching appointments:', error);
        this.error = error.response ? error.response.data : 'Failed to fetch appointments. Please try again later.';
      }
    },
  },
};
</script>

<style>
.error-message {
  color: red;
  margin-top: 10px;
}
</style>
