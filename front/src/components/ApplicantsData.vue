<template>
  <div>
    <h2 class="table-title">User Appointments</h2>
    <table class="user-table">
      <thead>
        <tr>
          <th class="table-header">ID</th>
          <th class="table-header">Name</th>
          <th class="table-header">Age</th>
          <th class="table-header">Nationality</th>
          <th class="table-header">Date of Birth</th>
          <th class="table-header">Passport</th>
          <th class="table-header">Address</th>
          <th class="table-header">Telephone</th>
          <th class="table-header">Email</th>
          <th class="table-header">Occupation</th>
          <th class="table-header">Club</th>
          <th class="table-header">Application Date</th>
          <th class="table-header">Status</th>
          <th class="table-header">Actions</th>
          
        </tr>
      </thead>
      <tbody>
        <tr v-for="appointment in appointments" :key="appointment.id">
          <td>{{ appointment.id }}</td>
          <td>{{ appointment.name }}</td>
          <td>{{ appointment.age }}</td>
          <td>{{ appointment.nationality }}</td>
          <td>{{ formatDateTime(appointment.dob) }}</td>
          <td>{{ appointment.passport }}</td>
          <td>{{ appointment.address }}</td>
          <td>{{ appointment.telephone }}</td>
          <td>{{ appointment.email }}</td>
          <td>{{ appointment.occupation }}</td>
          <td>{{ appointment.club }}</td>
          
          <td>{{ formatDateTime(appointment.applicationDate) }}</td>
          <td>{{ appointment.status }}</td>
          <td>
            <button @click="acceptAppointment(appointment.id)">Accept</button>
            <button @click="rejectAppointment(appointment.id)">Reject</button>
          </td>
        </tr>
      </tbody>
    </table>
    <div v-if="error" class="error-message">
      <i class="fas fa-exclamation-circle"></i> {{ error }}
    </div>
    <div v-if="loading" class="loading-message">
      Loading...
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
      loading: false,
    };
  },
  mounted() {
    this.fetchAppointments();
  },
  methods: {
    async fetchAppointments() {
      this.loading = true;
      try {
        const response = await axios.get('/api/appointment');
        this.appointments = response.data;
      } catch (error) {
        this.handleError(error, 'Error fetching appointments');
      } finally {
        this.loading = false;
      }
    },
    async acceptAppointment(appointmentId) {
      this.loading = true;
      try {
        const response = await axios.post('/api/accept', { id: appointmentId });
        // Handle success if needed
        this.fetchAppointments(); // Refresh appointments after accepting
      } catch (error) {
        this.handleError(error, 'Error accepting appointment');
      } finally {
        this.loading = false;
      }
    },
    async rejectAppointment(appointmentId) {
      this.loading = true;
      try {
        const response = await axios.post('/api/reject', { id: appointmentId });
        // Handle success if needed
        this.fetchAppointments(); // Refresh appointments after rejecting
      } catch (error) {
        this.handleError(error, 'Error rejecting appointment');
      } finally {
        this.loading = false;
      }
    },
    handleError(error, defaultMessage) {
      console.error(defaultMessage, error);
      if (error.response && error.response.data && error.response.data.message) {
        this.error = error.response.data.message;
      } else {
        this.error = defaultMessage;
      }
    },
    formatDateTime(dateTime) {
      const options = { year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric', minute: 'numeric' };
      return new Date(dateTime).toLocaleDateString('en-US', options);
    },
  },
};
</script>

<style scoped>
.user-table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

.table-title {
  font-size: 24px;
  color: #3498db;
  margin-bottom: 10px;
}

.table-header {
  background-color: #3498db;
  color: #fff;
  padding: 10px;
}

.user-table th, .user-table td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}

.user-table tbody tr:nth-child(even) {
  background-color: #f9f9f9;
}

.error-message {
  color: red;
  margin-top: 10px;
  display: flex;
  align-items: center;
}

.error-message i {
  margin-right: 5px;
  color: #ff6347;
}

.loading-message {
  margin-top: 10px;
  color: #3498db;
}
</style>
