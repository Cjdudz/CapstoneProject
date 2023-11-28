<template>
  <v-app>
    <v-container>
      <v-card>
          <h1>PCGA APPLICATION FORM</h1>
        <v-form @submit.prevent="submitForm" class="form">
          <v-row>
            <v-col>
              <v-text-field v-model="form.name" label="Name of Applicant"></v-text-field>
            </v-col>
            <v-col>
              <v-text-field v-model="form.nationality" label="Nationality"></v-text-field>
            </v-col>
          </v-row>
          <v-row>
            <v-col>
              <v-text-field v-model="form.dob" label="Date of Birth" type="date"></v-text-field>
            </v-col>
            <v-col>
              <v-text-field v-model="form.passport" label="Passport No."></v-text-field>
            </v-col>
          </v-row>
          <v-row>
            <v-col>
              <v-text-field v-model="form.address" label="Address"></v-text-field>
            </v-col>
            <v-col>
              <v-text-field v-model="form.telephone" label="Telephone" type="tel"></v-text-field>
            </v-col>
          </v-row>
          <v-row>
            <v-col>
              <v-text-field v-model="form.email" label="Email" type="email"></v-text-field>
            </v-col>
            <v-col>
              <v-text-field v-model="form.occupation" label="Occupation"></v-text-field>
            </v-col>
          </v-row>
          <v-text-field v-model="form.club" label="Name of Club"></v-text-field>
          <v-row>
            <v-col>
              <v-text-field v-model="form.applicationDate" label="Date of Application" type="date"></v-text-field>
            </v-col>
          </v-row>
          <v-btn type="submit">Submit</v-btn>
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
      }
    };
  },
  methods: {
    submitForm() {
      // Handle form submission logic
    }
  }
};
</script>
<style scoped>
/* Add your styles here */

.form {
  max-width: 600px;
  margin: auto;
}

.v-text-field {
  width: 100%;
  margin-bottom: 16px;
}

.v-btn {
  margin-top: 16px;
}
</style>