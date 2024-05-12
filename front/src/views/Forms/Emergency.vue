<template>
  <form @submit.prevent="submitForm" class="pcga-form">
    <div class="form-group">
      <label for="lastName" class="form-label">Last Name:</label>
      <input type="text" id="lastName" v-model="form.lastName" required class="form-control">
    </div>
    <div class="form-group">
      <label for="firstName" class="form-label">First Name:</label>
      <input type="text" id="firstName" v-model="form.firstName" required class="form-control">
    </div>
    <div class="form-group">
      <label for="middleInitial" class="form-label">Middle Initial:</label>
      <input type="text" id="middleInitial" v-model="form.middleInitial" class="form-control">
    </div>
    <div class="form-group">
      <label for="suffix" class="form-label">Suffix:</label>
      <input type="text" id="suffix" v-model="form.suffix" class="form-control">
    </div>
    <div class="form-group">
      <label for="relationship" class="form-label">Relationship:</label>
      <input type="text" id="relationship" v-model="form.relationship" required class="form-control">
    </div>
    <div class="form-group">
      <label for="address" class="form-label">Address:</label>
      <input type="text" id="address" v-model="form.address" required class="form-control">
    </div>
    <div class="form-group">
      <label for="telNoHome" class="form-label">Tel No (Home):</label>
      <input type="text" id="telNoHome" v-model="form.telNoHome" class="form-control">
    </div>
    <div class="form-group">
      <label for="telNoBusiness" class="form-label">Tel No (Business):</label>
      <input type="text" id="telNoBusiness" v-model="form.telNoBusiness" class="form-control">
    </div>
    <div class="form-group">
      <label for="mobilePhone" class="form-label">Mobile Phone:</label>
      <input type="text" id="mobilePhone" v-model="form.mobilePhone" required class="form-control">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    <p v-if="errorMessage" class="error-message">{{ errorMessage }}</p>
  </form>
</template>

<script>
// Import Axios
import axios from 'axios';

export default {
  data() {
    return {
      form: {
        lastName: '',
        firstName: '',
        middleInitial: '',
        suffix: '',
        relationship: '',
        address: '',
        telNoHome: '',
        telNoBusiness: '',
        mobilePhone: ''
      },
      errorMessage: ''
    };
  },
  methods: {
    async submitForm() {
      try {
        // Send form data to CodeIgniter backend
        const response = await axios.post('/api/passF', this.form);

        // Assuming the backend responds with a success message
        console.log('Form submitted successfully:', response.data);

        // Reset the form after successful submission
        this.resetForm();
      } catch (error) {
        console.error('Error submitting form:', error.message);
        // Set error message for user
        this.errorMessage = 'Failed to submit the form. Please try again later.';
      }
    },
    resetForm() {
      // Reset form fields
      this.form = {
        lastName: '',
        firstName: '',
        middleInitial: '',
        suffix: '',
        relationship: '',
        address: '',
        telNoHome: '',
        telNoBusiness: '',
        mobilePhone: ''
      };
     // Clear error message
      this.errorMessage = '';
    }
  }
};
</script>

<style scoped>
.pcga-form {
  max-width: 600px;
  margin: auto;
}

.form-group {
  margin-bottom: 20px;
}

.form-label {
  font-weight: bold;
  display: block;
  margin-bottom: 5px;
}

.form-control {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.btn-primary {
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 10px 20px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.btn-primary:hover {
  background-color: #0062cc;
}

.error-message {
  color: red;
  font-weight: bold;
  margin-top: 10px;
}
</style>
