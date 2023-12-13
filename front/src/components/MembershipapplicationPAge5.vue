<template>
  <v-app>
    <v-container class="form-container">
      <v-card class="form-card">
        <v-form>
          <v-row>
            <v-col>
              <v-h1 class="form-title">MA - 2009 Page 3 of 4 MEMBERSHIP APPLICATION</v-h1>
            </v-col>
          </v-row>
          <v-row>
            <v-col>
              <v-h2 class="section-title">SECTION K - MISCELLANEOUS</v-h2>
              <v-textarea v-model="pangaka" label="I certify the following 'PANGAKA' in my own handwriting"></v-textarea>
            </v-col>
          </v-row>
          <v-row>
            <v-col>
              <v-h2 class="section-title">SECTION L - ACCEPTANCE OF SPONSORSHIP</v-h2>
              <v-text-field v-model="applicantSignature" label="Applicant's Signature"></v-text-field>
              <v-text-field v-model="sponsorSignature" label="Sponsor's Signature"></v-text-field>
              <v-text-field v-model="applicantDate" label="Applicant's Date" type="date"></v-text-field>
              <v-text-field v-model="sponsorDate" label="Sponsor's Date" type="date"></v-text-field>
              <v-btn @click.prevent="submitForm" class="submit-btn">Submit</v-btn>
            </v-col>
          </v-row>
        </v-form>
      </v-card>
    </v-container>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      pangaka: '',
      applicantSignature: '',
      sponsorSignature: '',
      applicantDate: '',
      sponsorDate: ''
    };
  },
  methods: {
    submitForm() {
      // Add your form submission logic here
      console.log('Form submitted');
    },
  },
};
</script>

<style scoped>
.form-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 120vh;
}

.form-card {
  height: 100vh;
  max-width: 600px;
  margin: auto;
  padding: 20px;
}

.form-title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
}

.section-title {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 15px;
}

.v-textarea,
.v-text-field {
  width: 100%;
  margin-bottom: 15px;
}

.submit-btn {
  margin-top: 20px;
  width: 100%;
  background-color: #2196F3;
  color: white;
  padding: 12px 24px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 18px;
  border-radius: 4px;
  cursor: pointer;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
</style>
