<template>
  <div>
    <h2>User Table</h2>
    <table class="user-table">
      <thead>
        <tr>
          <th class="table-header">ID</th>
          <th class="table-header">Name</th>
          <th class="table-header">Description</th>
          <th class="table-header">Appointment Date & Time</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="appointment in appointments" :key="appointment.id">
          <td>{{ appointment.id }}</td>
          <td>{{ appointment.title }}</td>
          <td>{{ appointment.description }}</td>
          <td>{{ appointment.date_time }}</td>
        </tr>
      </tbody>
    </table>
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
        const response = await axios.get('/api/appointment');
        this.appointments = response.data;
      } catch (error) {
        console.error('Error fetching appointments:', error);
        this.error = error.message || 'An error occurred while fetching appointments.';
      }
    },
  },
};
</script>

<style>
.user-table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

.table-header {
  background-color: #f2f2f2;
}

.user-table th, .user-table td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}

.error-message {
  color: red;
  margin-top: 10px;
}
</style>
