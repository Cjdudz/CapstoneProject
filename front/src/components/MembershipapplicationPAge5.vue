<template>
  <v-app>
    <v-container>
      <v-form>
        <v-row>
          <v-col>
            <v-h1>MA - 2009 Page 3 of 4 MEMBERSHIP APPLICATION</v-h1>
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <v-h2>SECTION K - MISCELLANEOUS</v-h2>
            <v-textarea v-model="pangaka" label="I certify the following 'PANGAKA' in my own handwriting"></v-textarea>
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <v-h2>SECTION L - ACCEPTANCE OF SPONSORSHIP</v-h2>
            <v-text-field v-model="applicantSignature" label="Applicant's Signature"></v-text-field>
            <v-text-field v-model="sponsorSignature" label="Sponsor's Signature"></v-text-field>
            <v-text-field v-model="applicantDate" label="Applicant's Date" type="date"></v-text-field>
            <v-text-field v-model="sponsorDate" label="Sponsor's Date" type="date"></v-text-field>
            <v-btn @click.prevent="submitForm">Submit</v-btn>
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
.v-container{
  display: flex;
  justify-content: center;
  align-items: center;
  height: 170dvh; /* Set the height to 100% of the viewport height for vertical centering */
}
.v-h1 {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
}

.v-h2 {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 15px;
}

.v-textarea,
.v-text-field {
  width: 100%;
  margin-bottom: 15px;
}

.v-btn {
  background-color: #4caf50; /* Green */
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 4px;
}

</style>
