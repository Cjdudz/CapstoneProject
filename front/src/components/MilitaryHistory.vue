<template>
    <v-app>
      <v-container class="centered-container">
        <v-form>
          <v-row>
            <v-col>
              <v-h1 class="section-title">Military History</v-h1>
              <v-text-field label="Date Entered the AFP" type="date" v-model="militaryHistory.dateEntered"></v-text-field>
              <v-text-field label="Source of Commission" v-model="militaryHistory.sourceOfCommission"></v-text-field>
              <!-- Add other fields here -->
            </v-col>
          </v-row>
  
          <v-row>
            <v-col>
              <v-h1 class="section-title">Places of Residence History</v-h1>
              <v-text-field label="Places/Addresses" v-model="residenceHistory.places"></v-text-field>
              <v-text-field label="Inclusive Dates" type="date" v-model="residenceHistory.dates"></v-text-field>
              <!-- Add other fields here -->
            </v-col>
          </v-row>
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
  };
  </script>
  
  <style>
  .centered-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh; /* Adjust this value based on your needs */
  }
  
  v-form {
    width: 50%; /* Adjust this value based on your needs */
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
  
  v-label {
    display: block;
    margin-bottom: 10px;
  }
  
  v-input {
    width: 100%;
    padding: 8px;
    margin-top: 4px;
    margin-bottom: 12px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
  }
  </style>
  