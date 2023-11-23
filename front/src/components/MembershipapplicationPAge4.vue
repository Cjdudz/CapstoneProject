<template>
  <v-app>
    <v-container>
      <v-form @submit.prevent="submitForm" class="styled-form">
        <v-row justify="center">
          <v-col cols="12" md="8">
            <h1 class="form-title">MA - 2009 Page 4 of 4 INSTRUCTIONS MEMBERSHIP APPLICATION</h1>
            <h2 class="form-subtitle">GENERAL</h2>
            <v-textarea v-model="general" label="Everyone requesting membership in the Philippine Coast Guard Auxiliary shall complete this form:" outlined></v-textarea>

            <h2 class="form-subtitle">SECTION I - BASIC DATA OF APPLICANT</h2>
            <v-textarea v-model="sectionI" label="To be completed by applicant:" outlined></v-textarea>

            <h2 class="form-subtitle">SECTION II - APPLICANT'S QUALIFICATIONS</h2>
            <v-text-field v-model="sectionII" label="To be completed by:" outlined></v-text-field>

            <v-btn type="submit" class="submit-button">Submit</v-btn>
          </v-col>
        </v-row>
      </v-form>
    </v-container>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      general: '',
      sectionI: '',
      sectionII: ''
    };
  },
  methods: {
    submitForm() {
      // Add your form submission logic here
      console.log('Form submitted!', this.general, this.sectionI, this.sectionII);
    }
  }
};
</script>

<style scoped>
.styled-form {
  margin-top: 20px;
}

.form-title, .form-subtitle {
  color: #333;
  margin-bottom: 20px;
}

.submit-button {
  background-color: #4CAF50;
  color: white;
  margin-top: 20px;
}
</style>
