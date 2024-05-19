<template>
  <form @submit.prevent="submitForm" class="pcga-form">
    <div class="form-group">
      <label for="professionalLicenses" class="form-label">Professional Licenses:</label>
      <input type="text" id="professionalLicenses" v-model="form.ProfessionalLicenses" required class="form-control">
    </div>
    <div class="form-group">
      <label for="specialTraining" class="form-label">Special Training:</label>
      <input type="text" id="specialTraining" v-model="form.SpecialTraining" required class="form-control">
    </div>
    <div class="form-group">
      <label for="specialInterestsOrSkills" class="form-label">Special Interests or Skills:</label>
      <input type="text" id="specialInterestsOrSkills" v-model="form.SpecialInterestsOrSkills" required class="form-control">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    <div class="error-message" v-if="errorMessage">{{ errorMessage }}</div>
  </form>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      form: {
        ProfessionalLicenses: '',
        SpecialTraining: '',
        SpecialInterestsOrSkills: ''
      },
      errorMessage: ''
    };
  },
  methods: {
    async submitForm() {
      try {
        // Send form data to CodeIgniter backend
        const response = await axios.post('/api/pass', this.form);

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
        professionalLicenses: '',
        specialTraining: '',
        specialInterestsOrSkills: ''
      };
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
