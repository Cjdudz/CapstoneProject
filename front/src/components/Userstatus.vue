<template>
  <v-container>
    <v-card class="compact-card" elevation="2">
      <v-card-title class="compact-header">
        <h2 class="compact-title"> User Status</h2>
      </v-card-title>
      <v-card-text class="compact-body">
        <v-row>
          <v-col v-for="(appointments, title) in appointmentGroups" :key="title" cols="12" md="6">
            <v-card class="mt-3" outlined>
              <v-card-title class="table-title">{{ title }}</v-card-title>
              <v-data-table
                :headers="tableHeaders"
                :items="appointments"
                :item-key="appointment => appointment.id"
                :dense="true"
                :hide-default-footer="true"
              >
                <template v-slot:items="{ item }">
                  <td>{{ item.name }}</td>
                  <td>{{ getStatusEmoji(item.status) }}</td>
                </template>
              </v-data-table>
            </v-card>
          </v-col>
        </v-row>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      appointmentGroups: {
        'Accepted Appointments': [],
        'Rejected Appointments': [],
      },
      tableHeaders: [
        { text: 'Name', value: 'name' },
        { text: 'Status', value: 'status' },
      ],
    };
  },
  mounted() {
    this.fetchAppointmentStatus();
  },
  methods: {
    async fetchAppointmentStatus() {
      try {
        const appointments = (await axios.get('/api/UserStatus')).data;
        this.separateAppointments(appointments);
      } catch (error) {
        console.error('Error fetching appointment status:', error);
      }
    },
    separateAppointments(appointments) {
      this.appointmentGroups['Accepted Appointments'] = appointments.filter(appointment => appointment.status === 'accepted');
      this.appointmentGroups['Rejected Appointments'] = appointments.filter(appointment => appointment.status === 'rejected');
    },
    getStatusEmoji(status) {
      return status === 'confirmed' || status === 'accepted' ? '✅' : '❌';
    },
  },
};
</script>

<style scoped>
.compact-card {
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.compact-title {
  margin-bottom: 0;
  font-size: 24px;
  color: #333;
}

.table-title {
  font-size: 18px;
  color: #555;
}
</style>
