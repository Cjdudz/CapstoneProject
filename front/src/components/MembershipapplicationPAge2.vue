<template>
  <v-app>
    <v-container>
      <v-form @submit.prevent="submitForm">
        <v-row justify="center">
          <v-col cols="12" md="8">
            <v-sheet class="pa-4 form-container">
              <h1 class="form-title">IMA-2009 Page 2 of 4</h1>
              <h2 class="form-subtitle">IMA MEMBERSHIP APPLICATION</h2>

              <!-- Last Name -->
              <v-text-field v-model="lastName" label="Last Name" outlined dense required></v-text-field>

              <!-- First Name -->
              <v-text-field v-model="firstName" label="First Name" outlined dense required></v-text-field>

              <!-- Middle Initial -->
              <v-text-field v-model="middleInitial" label="Middle Initial" outlined dense></v-text-field>

              <!-- Suffix -->
              <v-text-field v-model="suffix" label="Suffix" outlined dense></v-text-field>

              <!-- Tel No. (Home) -->
              <v-text-field v-model="telHome" label="Tel No. (Home)" outlined dense required></v-text-field>

              <!-- Tel No. (Business) -->
              <v-text-field v-model="telBusiness" label="Tel No. (Business)" outlined dense></v-text-field>

              <!-- Submit Button -->
              <v-btn type="submit" class="submit-button" :disabled="!formIsValid">Submit</v-btn>
            </v-sheet>
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
      lastName: '',
      firstName: '',
      middleInitial: '',
      suffix: '',
      telHome: '',
      telBusiness: ''
    };
  },
  computed: {
    formIsValid() {
      // Add any form validation logic here
      return this.lastName && this.firstName && this.telHome;
    }
  },
  methods: {
    submitForm() {
      // Add your form submission logic here
      console.log('Form submitted!', this.lastName, this.firstName);
      // You can send the data to the server or perform any other actions
    }
  }
};
</script>
<style scoped>
.v-container {
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.form-title, .form-subtitle {
  color: #333;
  margin-bottom: 20px;
  font-size: 1.5rem;
  font-weight: bold;
}

.submit-button {
  background-color: #2196F3; /* Blue */
  color: white;
  margin-top: 20px;
}

/* Add more styling as needed */
</style>