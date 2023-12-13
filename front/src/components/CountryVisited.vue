<template>
  <v-app>
    <v-container>
      <v-form @submit.prevent="handleSubmit">
        <h1 class="title">Foreign Countries Visited</h1>
        <v-simple-table class="visit-table">
          <template v-slot:default>
            <thead>
              <tr>
                <th>Country Visited</th>
                <th>Purpose of Visit</th>
                <th>Date</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(visit, index) in visits" :key="index">
                <td><v-text-field v-model="visit.country" label="Country Visited"></v-text-field></td>
                <td><v-text-field v-model="visit.purpose" label="Purpose of Visit"></v-text-field></td>
                <td><v-date-picker v-model="visit.date" label="Date"></v-date-picker></td>
                <td>
                  <v-btn @click="removeVisit(index)" class="remove-button">Remove</v-btn>
                </td>
              </tr>
            </tbody>
          </template>
        </v-simple-table>

        <v-container class="button-container">
          <v-row>
            <v-col>
              <v-btn @click="addVisit" class="add-button mr-4">Add Visit</v-btn>
              <v-btn type="submit" class="submit-button">Submit</v-btn>
            </v-col>
          </v-row>
        </v-container>
      </v-form>
    </v-container>
  </v-app>
</template>

<script>
import { VContainer, VForm, VSimpleTable, VBtn, VTextField, VDatePicker } from 'vuetify';

export default {
  components: {
    VContainer,
    VForm,
    VSimpleTable,
    VBtn,
    VTextField,
    VDatePicker,
  },
  data() {
    return {
      visits: [
        { country: '', purpose: '', date: null },
      ],
    };
  },
  methods: {
    addVisit() {
      this.visits.push({ country: '', purpose: '', date: null });
    },
    removeVisit(index) {
      this.visits.splice(index, 1);
    },
    handleSubmit() {
      // Handle form submission logic
      console.log('Form Submitted', this.visits);
    },
  },
};
</script>

<style scoped>
#app {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

.title {
  text-align: center;
  margin-bottom: 20px;
}

.mr-4 {
  margin-right: 4px;
}

.visit-table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

th, td {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

.input-field {
  width: 100%;
  padding: 8px;
}

.remove-button {
  background-color: #f44336;
  color: white;
  border: none;
  padding: 5px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  cursor: pointer;
}

.remove-button:hover {
  background-color: #d32f2f; /* Darker red on hover */
}

.add-button,
.submit-button {
  color: white;
  border: none;
  padding: 10px;
  cursor: pointer;
}

.add-button {
  background-color: #4caf50;
  margin-bottom: 20px;
}

.add-button:hover {
  background-color: #45a049; /* Darker green on hover */
}

.submit-button {
  background-color: #008CBA;
}

.submit-button:hover {
  background-color: #007799; /* Darker blue on hover */
}

.button-container {
  text-align: center;
}
</style>
