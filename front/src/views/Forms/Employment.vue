<template>
  <form @submit.prevent="submitForm" class="pcga-form">
    <div class="form-group">
      <label for="employmentStatus">Employment Status:</label>
      <input type="text" id="employmentStatus" v-model="form.employmentStatus" required>
    </div>
    <div class="form-group">
      <label for="company">Company:</label>
      <input type="text" id="company" v-model="form.company" required>
    </div>
    <div class="form-group">
      <label for="natureOfOffice">Nature Of Office:</label>
      <input type="text" id="natureOfOffice" v-model="form.natureOfOffice" required>
    </div>
    <div class="form-group">
      <label for="pastOrCurrentGovernmentPosition">Past or Current Government Position:</label>
      <input type="text" id="pastOrCurrentGovernmentPosition" v-model="form.pastOrCurrentGovernmentPosition" required>
    </div>
    <div class="form-group">
      <label for="highestAppointmentOrElectedOffice">Highest Appointment or Elected Office:</label>
      <input type="text" id="highestAppointmentOrElectedOffice" v-model="form.highestAppointmentOrElectedOffice" required>
    </div>
    <button type="submit">Submit</button>
  </form>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      form: {
        employmentStatus: '',
        company: '',
        natureOfOffice: '',
        pastOrCurrentGovernmentPosition: '',
        highestAppointmentOrElectedOffice: ''
      },
      errorMessage: ''
    };
  },
  methods: {
    async submitForm() {
      try {
        const response = await axios.post('/api/passFormE', this.form);
        console.log('Form submitted successfully');
        // Reset form fields
        this.resetForm();
      } catch (error) {
        console.error('Error submitting form:', error);
        this.errorMessage = 'Failed to submit form';
      }
    },
    resetForm() {
      // Reset form fields
      this.form = {
        employmentStatus: '',
        company: '',
        natureOfOffice: '',
        pastOrCurrentGovernmentPosition: '',
        highestAppointmentOrElectedOffice: ''
      };
      this.errorMessage = ''; // Clear error message on successful submission
    }
  }
};
</script>

<style>
.pcga-form {
  max-width: 600px;
  margin: auto;
}

.form-group {
  margin-bottom: 20px;
}

label {
  font-weight: bold;
  display: block;
  margin-bottom: 5px;
}

input[type="text"],
input[type="number"],
select,
input[type="date"] {
  width: calc(100% - 22px); /* Adjusting for padding and border */
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

button[type="submit"] {
  background-color: #0056b3;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 10px 20px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
  background-color: #004080;
}

button:hover {
  background-color: #0056b3;
}
</style>
