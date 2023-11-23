<template>
    <v-container>
      <v-form @submit.prevent="submitForm">
        <v-row>
          <v-col>
            <v-h1>{{ certificationText }}</v-h1>
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <!-- Replace text field with file input for Signed at -->
            <v-file-input label="Signed at:" v-model="signedAt" accept="image/*"></v-file-input>
          </v-col>
          <v-col>
            <v-text-field label="Date:" type="date" v-model="date"></v-text-field>
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <!-- Replace text field with file input for Left Thumbmark -->
            <v-file-input label="Left Thumbmark:" v-model="leftThumbmark" accept="image/*"></v-file-input>
          </v-col>
          <v-col>
            <!-- Replace text field with file input for Right Thumbmark -->
            <v-file-input label="Right Thumbmark:" v-model="rightThumbmark" accept="image/*"></v-file-input>
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <!-- Replace text field with file input for Witness 1 -->
            <v-file-input label="Witness 1:" v-model="witness1" accept="image/*"></v-file-input>
          </v-col>
          <v-col>
            <!-- Replace text field with file input for Witness 2 -->
            <v-file-input label="Witness 2:" v-model="witness2" accept="image/*"></v-file-input>
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <v-btn type="submit">Submit</v-btn>
          </v-col>
        </v-row>
      </v-form>
    </v-container>
  </template>
  
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        signedAt: '',
        date: '',
        leftThumbmark: '',
        rightThumbmark: '',
        witness1: '',
        witness2: '',
        certificationText:
          "I certify that the foregoing answers are true and correct to the best of my knowledge and belief and I agree that any misstatement or omission may be cause for denial of my application for clearance.",
      };
    },
    methods: {
      submitForm() {
        const formData = {
          signedAt: this.signedAt,
          date: this.date,
          leftThumbmark: this.leftThumbmark,
          rightThumbmark: this.rightThumbmark,
          witness1: this.witness1,
          witness2: this.witness2,
        };
  
        // In a real application, replace the URL with your backend endpoint
        axios
          .post('https://jsonplaceholder.typicode.com/posts', formData)
          .then((response) => {
            console.log('Form submitted successfully:', response.data);
            // Reset form fields if needed
            this.resetForm();
          })
          .catch((error) => {
            console.error('Error submitting form:', error);
          });
      },
      resetForm() {
        this.signedAt = '';
        this.date = '';
        this.leftThumbmark = '';
        this.rightThumbmark = '';
        this.witness1 = '';
        this.witness2 = '';
      },
    },
  };
  </script>
  
  <style scoped>
  /* Add your styles here */
  </style>
  