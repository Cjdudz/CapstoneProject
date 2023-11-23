<template>
    <v-container>
      <v-form @submit.prevent="submitForm">
        <v-row>
          <v-col cols="12" md="6">
            <v-text-field v-model="form.name" label="Name"></v-text-field>
          </v-col>
          <v-col cols="12" md="6">
            <v-text-field v-model="form.address" label="Address"></v-text-field>
          </v-col>
          <v-col cols="12" md="4">
            <v-text-field v-model="form.age" label="Age" type="number"></v-text-field>
          </v-col>
          <v-col cols="12" md="4">
            <v-text-field v-model="form.height" label="Height" type="number"></v-text-field>
          </v-col>
          <v-col cols="12" md="4">
            <v-text-field v-model="form.weight" label="Weight" type="number"></v-text-field>
          </v-col>
          <v-col cols="12">
            <v-text-field v-model="form.physicalCondition" label="Physical Condition"></v-text-field>
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <v-btn type="submit" color="primary">Submit</v-btn>
          </v-col>
        </v-row>
      </v-form>
    </v-container>
  </template>
  
  <script>
  export default {
    data() {
      return {
        form: {
          name: '',
          address: '',
          age: null,
          height: null,
          weight: null,
          physicalCondition: ''
        }
      }
    },
    methods: {
      submitForm() {
        console.log(this.form);
        // You can add your form submission logic here
      }
    }
  }
  </script>
  
  <style scoped>
  /* Add your custom styles here */
  /* For example: */
  .v-container {
    margin-top: 50px;
    display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh
  }
  
  v-btn {
    margin-top: 10px;
  }
  </style>
  