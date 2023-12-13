<template>
  <v-app>
    <v-container class="custom-form">
      <v-card class="form-card">
        <v-form @submit.prevent="submitForm">
          <v-row>
            <v-col>
              <v-divider class="mb-4"></v-divider>
              <h3 class="section-title">III. Marital History</h3>
              <v-text-field label="Name of Spouse" v-model="form.maritalHistory.spouseName"></v-text-field>
              <v-text-field label="Date and Place of Marriage" v-model="form.maritalHistory.marriageDetails"></v-text-field>
              <v-text-field label="Children" v-model="form.maritalHistory.children"></v-text-field>
              <v-text-field label="Place of Residence" v-model="form.maritalHistory.residence"></v-text-field>
              <v-text-field label="Full Name of Citizenship" v-model="form.maritalHistory.citizenship"></v-text-field>
            </v-col>
            <v-col>
              <v-divider class="mb-4"></v-divider>
              <h3 class="section-title">IV. Family History and Information</h3>
              <v-text-field label="Father's Name" v-model="form.familyHistory.fatherName"></v-text-field>
              <v-text-field label="Occupation and Place of Birth" v-model="form.familyHistory.occupation"></v-text-field>
            </v-col>
          </v-row>
          <v-divider class="mb-4"></v-divider>
          <h3 class="section-title">E. Father-in-Law</h3>
          <v-text-field label="Date and Place of Birth" v-model="form.fatherInLaw.birthDetails"></v-text-field>
          <v-text-field label="Address" v-model="form.fatherInLaw.address"></v-text-field>
          <v-text-field label="Occupation and Place of Employment" v-model="form.fatherInLaw.occupation"></v-text-field>
          <v-text-field label="Date and Place of Employment" v-model="form.fatherInLaw.employmentDetails"></v-text-field>
          <v-text-field label="Educational Background" v-model="form.fatherInLaw.education"></v-text-field>
          <v-text-field label="Post Graduate Courses and Other Qualifications" v-model="form.fatherInLaw.courses"></v-text-field>
          <v-text-field label="Further Eligibility, if any, and other qualifications" v-model="form.fatherInLaw.eligibility"></v-text-field>
          <v-btn type="submit" color="primary" class="submit-button">Submit</v-btn>
        </v-form>
      </v-card>
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
.custom-form {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  padding: 20px; /* Add padding to create space around the form */
}

.form-card {
  max-width: 800px;
  margin: auto;
  padding: 20px;
  max-height: 400vh;
}

.section-title {
  color: #2a4e6c;
  margin-top: 16px;
  font-size: 1.2em; /* Adjust font size */
  font-weight: bold; /* Adjust font weight */
}

.v-text-field {
  width: 100%;
  margin-bottom: 20px; /* Adjust margin for better spacing */
}

.submit-button {
  margin-top: 20px; /* Adjust margin for better spacing */
}
</style>
