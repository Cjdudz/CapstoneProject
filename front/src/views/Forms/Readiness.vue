<template>
  <form @submit.prevent="submitForm" class="pcga-form">
    <h2>Section 6: Readiness Input</h2>
    <div class="form-group">
      <label>Functions You Want to be Involved In:</label>
      <input type="text" v-model="form.functions_involved">
    </div>
    <div class="form-group">
      <label>Purpose in Joining the PCGA:</label>
      <input type="text" v-model="form.purpose">
    </div>
    <div class="form-group">
      <label>Are You Willing to be Trained?</label>
      <input type="radio" value="Yes" v-model="form.willing_to_be_trained"> Yes
      <input type="radio" value="No" v-model="form.willing_to_be_trained"> No
    </div>
    <div class="form-group">
      <label>Are You Willing to Travel Outside Your Home Area?</label>
      <input type="radio" value="Yes" v-model="form.willing_to_travel"> Yes
      <input type="radio" value="No" v-model="form.willing_to_travel"> No
    </div>
    <div class="form-group">
      <label>Are You Available on Call 24 hrs?</label>
      <input type="radio" value="Yes" v-model="form.available_24hrs"> Yes
      <input type="radio" value="No" v-model="form.available_24hrs"> No
      <span v-if="!form.available_24hrs" class="form-group">
        (If No, Provide Days/Advance Notice Needed)
        <input type="text" v-model="form.days_advance_notice">
      </span>
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
        functions_involved: '',
        purpose: '',
        willing_to_be_trained: '',
        willing_to_travel: '',
        available_24hrs: '',
        days_advance_notice: ''
      },
      errorMessage: ''
    };
  },
  methods: {
    async submitForm() {
      try {
        const response = await axios.post('/api/passFormR', this.form, {
          headers: {
            'Content-Type': 'application/json'
          }
        });
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
        functions_involved: '',
        purpose: '',
        willing_to_be_trained: '',
        willing_to_travel: '',
        available_24hrs: '',
        days_advance_notice: ''
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
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

button {
  background-color: #fff;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 10px 20px;
  cursor: pointer;
  transition: background-color 0.3s ease;
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
