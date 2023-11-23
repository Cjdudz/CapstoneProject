<template>
    <v-app>
      <v-container>
        <v-form @submit.prevent="submitForm">
          <v-row>
            <v-col>
              <v-divider class="mb-4"></v-divider>
              <h3>III. Marital History</h3>
              <v-text-field label="Name of Spouse" v-model="form.maritalHistory.spouseName"></v-text-field>
              <v-text-field label="Date and Place of Marriage" v-model="form.maritalHistory.marriageDetails"></v-text-field>
              <v-text-field label="Children" v-model="form.maritalHistory.children"></v-text-field>
              <v-text-field label="Place of Residence" v-model="form.maritalHistory.residence"></v-text-field>
              <v-text-field label="Full Name of Citizenship" v-model="form.maritalHistory.citizenship"></v-text-field>
            </v-col>
  
            <v-col>
              <v-divider class="mb-4"></v-divider>
              <h3>IV. Family History and Information</h3>
              <v-text-field label="Father's Name" v-model="form.familyHistory.fatherName"></v-text-field>
              <v-text-field label="Occupation and Place of Birth" v-model="form.familyHistory.occupation"></v-text-field>
            </v-col>
          </v-row>
  
          <v-divider class="mb-4"></v-divider>
  
          <h3>E. Father-in-Law</h3>
          <v-text-field label="Date and Place of Birth" v-model="form.fatherInLaw.birthDetails"></v-text-field>
          <v-text-field label="Address" v-model="form.fatherInLaw.address"></v-text-field>
          <v-text-field label="Occupation and Place of Employment" v-model="form.fatherInLaw.occupation"></v-text-field>
          <v-text-field label="Date and Place of Employment" v-model="form.fatherInLaw.employmentDetails"></v-text-field>
          <v-text-field label="Educational Background" v-model="form.fatherInLaw.education"></v-text-field>
          <v-text-field label="Post Graduate Courses and Other Qualifications" v-model="form.fatherInLaw.courses"></v-text-field>
          <v-text-field label="Further Eligibility, if any, and other qualifications" v-model="form.fatherInLaw.eligibility"></v-text-field>
  
          <v-btn type="submit" color="primary">Submit</v-btn>
        </v-form>
      </v-container>
    </v-app>
  </template>
  
  <script>
  export default {
    data() {
      return {
        form: {
          maritalHistory: {
            spouseName: '',
            marriageDetails: '',
            children: '',
            residence: '',
            citizenship: ''
          },
          familyHistory: {
            fatherName: '',
            occupation: ''
          },
          fatherInLaw: {
            birthDetails: '',
            address: '',
            occupation: '',
            employmentDetails: '',
            education: '',
            courses: '',
            eligibility: ''
          }
        }
      };
    },
    methods: {
      submitForm() {
        // Handle form submission logic here
        console.log('Form submitted:', this.form);
      }
    }
  };
  </script>
  
  <style scoped>
  .v-container{
    display: flex;
  justify-content: center;
  align-items: center;
  height: 250dvh
  }
  .custom-form {
    max-width: 800px;
    margin: auto;
    
  }
  
  h3 {
    color: #2a4e6c;
  }
  
  .v-text-field {
    width: 100%;
  }
  
  .submit-btn {
    margin-top: 16px;
  }
  </style>