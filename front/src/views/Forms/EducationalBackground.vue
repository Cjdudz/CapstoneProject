<template>
  <form @submit.prevent="submitForm" class="pcga-form">
    <div class="form-group">
      <label for="college" class="form-label">College:</label>
      <input type="text" id="college" v-model="form.college" required class="form-control">
    </div>
    <div class="form-group">
      <label for="schoolName" class="form-label">School Name:</label>
      <input type="text" id="schoolName" v-model="form.schoolName" required class="form-control">
    </div>
    <div class="form-group">
      <label for="degreesObtained" class="form-label">Degrees Obtained:</label>
      <input type="text" id="degreesObtained" v-model="form.degreesObtained" required class="form-control">
    </div>
    <div class="form-group">
      <label for="inclusiveDates" class="form-label">Inclusive Dates:</label>
      <input type="text" id="inclusiveDates" v-model="form.inclusiveDates" required class="form-control">
    </div>
    <div class="form-group">
      <label for="yearGraduated" class="form-label">Year Graduated:</label>
      <input type="text" id="yearGraduated" v-model="form.yearGraduated" required class="form-control">
    </div>
    <button type="submit" class="btn-primary">Submit</button>
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
        college: '',
        schoolName: '',
        degreesObtained: '',
        inclusiveDates: '',
        yearGraduated: ''
      },
      errorMessage: ''
    };
  },
  methods: {
    async submitForm() {
      try {
        // Send form data to CodeIgniter backend
        const response = await axios.post('/api/submit', this.form);

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
        college: '',
        schoolName: '',
        degreesObtained: '',
        inclusiveDates: '',
        yearGraduated: ''
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
