<template>
  <v-app>
    <v-container>
      <v-card class="form-card">
        <div class="header-design"></div>
        <h1 class="form-title">PCGA APPLICATION FORM</h1>
        <v-form @submit.prevent="submitForm" ref="form" class="form">
          <v-row>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.name" label="Name of Applicant" required></v-text-field>
            </v-col>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.age" label="Age" required></v-text-field>
            </v-col>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.nationality" label="Nationality" required></v-text-field>
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.dob" label="Date of Birth" type="date" required></v-text-field>
            </v-col>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.passport" label="Passport No." required></v-text-field>
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.address" label="Address" required></v-text-field>
            </v-col>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.telephone" label="Telephone" type="tel" required></v-text-field>
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.email" label="Email" type="email" required></v-text-field>
            </v-col>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.occupation" label="Occupation" required></v-text-field>
            </v-col>
          </v-row>
          <v-text-field v-model="form.club" label="Name of Club" required></v-text-field>
          <v-row>
            <v-col cols="12">
              <v-text-field v-model="form.applicationDate" label="Date of Application" type="date" required></v-text-field>
            </v-col>
          </v-row>
          <v-btn type="submit" class="submit-btn">Submit</v-btn>
        </v-form>
      </v-card>
    </v-container>
  </v-app>
</template>
<script>
import axios from 'axios';

export default {
  
      data() {
  return {
    form: {
      name: '',
      nationality: '',
      dob: '',
      passport: '',
      address: '',
      telephone: '',
      email: '',
      occupation: '',
      club: '',
      applicationDate: '',
    },
  };
},
methods: {
    async submitForm() {
      try {
        // Send form data to CodeIgniter backend
        const response = await axios.post('/api/passForm', this.form);

        // Assuming the backend responds with a success message
        console.log('Form submitted successfully:', response.data);

        // Reset the form after successful submission (optional)
        this.resetForm();
      } catch (error) {
        console.error('Error submitting form:', error.message);
      }
    },
    resetForm() {
      // Reset form fields after successful submission
      this.form = {
        name: '',
        nationality: '',
        dob: '',
        passport: '',
        address: '',
        telephone: '',
        email: '',
        occupation: '',
        club: '',
        applicationDate: '',
      };
    },
  },
};
</script>


<style scoped>
.form-card {
  max-width: 600px;
  margin: auto;
  padding: 20px;
  position: relative;
}

.header-design {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 80px;
  background: linear-gradient(to right, #4caf50, #2196f3); /* Gradient background */
}

.form-title {
  font-size: 28px;
  text-align: center;
  margin-top: 40px; /* Adjusted margin for spacing */
  color: white; /* Text color on top of the gradient background */
}

/* ... (your existing styles remain unchanged) ... */
</style>