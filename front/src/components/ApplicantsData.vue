<template>
    <v-container>
      <v-row>
        <v-col>
          <v-card>
            <v-card-title>Applicants</v-card-title>
            <v-card-text>
              <v-list>
                <v-list-item v-for="(applicant, index) in applicants" :key="index">
                  <v-list-item-content>
                    <v-list-item-title>{{ applicant.name }}</v-list-item-title>
                    <v-list-item-subtitle>{{ applicant.email }}</v-list-item-subtitle>
                  </v-list-item-content>
                </v-list-item>
              </v-list>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
  
      <v-row>
        <v-col>
          <v-card>
            <v-card-title>Add New Applicant</v-card-title>
            <v-card-text>
              <v-form @submit.prevent="addApplicant">
                <v-text-field v-model="newApplicant.name" label="Name"></v-text-field>
                <v-text-field v-model="newApplicant.email" label="Email"></v-text-field>
                <v-btn type="submit" color="primary">Add Applicant</v-btn>
              </v-form>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </template>
  
  <script>
  export default {
    data() {
      return {
        applicants: [
          { name: "John Doe", email: "john@example.com" },
          { name: "Jane Doe", email: "jane@example.com" },
        ],
        newApplicant: {
          name: "",
          email: "",
        },
      };
    },
    methods: {
      addApplicant() {
        this.applicants.push({ ...this.newApplicant });
        this.newApplicant = { name: "", email: "" };
      },
    },
  };
  </script>
  
  <style scoped>
  /* Add your custom styles here */
  </style>
  