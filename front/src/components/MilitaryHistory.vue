<template>
  <v-app>
    <v-container class="centered-container">
      <v-form class="form-card" @submit.prevent="submitForm">
        <v-row>
          <v-col>
            <v-h1 class="section-title">Military History</v-h1>
            <v-text-field label="Date Entered the AFP" type="date" v-model="militaryHistory.dateEntered"></v-text-field>
            <v-text-field label="Source of Commission" v-model="militaryHistory.sourceOfCommission"></v-text-field>
            <!-- Add other fields here -->
          </v-col>
        </v-row>

        <v-divider class="mb-4"></v-divider>

        <v-row>
          <v-col>
            <v-h1 class="section-title">Places of Residence History</v-h1>
            <v-text-field label="Places/Addresses" v-model="residenceHistory.places"></v-text-field>
            <v-text-field label="Inclusive Dates" type="date" v-model="residenceHistory.dates"></v-text-field>
            <!-- Add other fields here -->
          </v-col>
        </v-row>

        <v-btn type="submit" color="primary" class="submit-button">Submit</v-btn>
      </v-form>
    </v-container>
  </v-app>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      militaryHistory: {
        dateEntered: '',
        sourceOfCommission: '',
        // Add other fields here
      },
      residenceHistory: {
        places: '',
        dates: '',
        // Add other fields here
      },
    };
  },
  methods: {
    submitForm() {
      // Handle form submission logic here
      console.log('Form submitted:', { militaryHistory: this.militaryHistory, residenceHistory: this.residenceHistory });
    }
  }
};
</script>

<style>
.centered-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
}

.form-card {
  width: 50%;
  margin: 20px;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.section-title {
  font-size: 1.5em;
  margin-bottom: 10px;
}

v-divider {
  margin: 20px 0;
}

.submit-button {
  margin-top: 20px;
  width: 100%;
}
</style>
