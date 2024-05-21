<template>

  <!-- Form -->
  <form class="pcga-form" @submit.prevent="submitForm">
    <div class="form-group">
      <label for="idNo">ID No.</label>
      <input type="text" id="idNo" v-model="formData.idNo" required>
    </div>
    <div class="form-group">
      <label for="auxiliaryDistrict">Auxiliary District</label>
      <input type="text" id="auxiliaryDistrict" v-model="formData.auxiliaryDistrict" required>
    </div>
    <div class="form-group">
      <label for="squadronNo">Squadron No.</label>
      <input type="text" id="squadronNo" v-model="formData.squadronNo" required>
    </div>
    <div class="form-group">
      <label for="firstName">First Name</label>
      <input type="text" id="firstName" v-model="formData.firstName" required>
    </div>
    <div class="form-group">
      <label for="middleName">Middle Name</label>
      <input type="text" id="middleName" v-model="formData.middleName" required>
    </div>
    <div class="form-group">
      <label for="lastName">Last Name</label>
      <input type="text" id="lastName" v-model="formData.lastName" required>
    </div>
    <div class="form-group" v-if="formData.maritalStatus === 'Married' && formData.sex === 'Female'">
      <label for="maidenLastName">Maiden's Last Name</label>
      <input type="text" id="maidenLastName" v-model="formData.maidenLastName" required>
    </div>
    <div class="form-group">
      <label for="rankDesignationAuthority">Rank Designation Authority</label>
      <input type="text" id="rankDesignationAuthority" v-model="formData.rankDesignationAuthority" required>
    </div>
    <div class="form-group">
      <label for="homeAddress">Home Address</label>
      <input type="text" id="homeAddress" v-model="formData.homeAddress" required>
    </div><button type="submit">Submit</button>

  </form>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      formData: {
        idNo: '',
        auxiliaryDistrict: '',
        squadronNo: '',
        firstName: '',
        middleName: '',
        lastName: '',
        maidenLastName: '',
        rankDesignationAuthority: '',
        homeAddress: '',
        maritalStatus: '',
        weight: '',
        eyes: '',
        height: '',
        hair: '',
        bloodType: '',
        sex: '',
        religion: '',
        dateOfBirth: '',
        identifyingData: '',
        emergencyContact: '',
        emergencyContactAddress: '',
        emergencyContactNumber: ''
      }
    };
  },
  methods: {
    async submitForm() {
      try {
        // Send form data to CodeIgniter backend
        const response = await axios.post('/api/SubmitForm', this.formData);

        // Assuming the backend responds with a success message
        console.log('Form submitted successfully:', response.data);

        // Reset the form after successful submission
        this.resetForm();
      } catch (error) {
        console.error('Error submitting form:', error.message);
      }
    },
    resetForm() {
      // Reset all form fields to their initial values
      this.formData = {
        idNo: '',
        auxiliaryDistrict: '',
        squadronNo: '',
        firstName: '',
        middleName: '',
        lastName: '',
        maidenLastName: '',
        rankDesignationAuthority: '',
        homeAddress: '',
        maritalStatus: '',
        weight: '',
        eyes: '',
        height: '',
        hair: '',
        bloodType: '',
        sex: '',
        religion: '',
        dateOfBirth: '',
        identifyingData: '',
        emergencyContact: '',
        emergencyContactAddress: '',
        emergencyContactNumber: ''
      };
    }
  }
}
</script>

<style scoped>
/* Form styles */
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
  background-color: #0056b3; /* Change to the desired background color */
  color: #fff; /* Change to the desired text color */
  border: none;
  border-radius: 5px;
  padding: 10px 20px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
  background-color: #004080; /* Darker shade on hover */
}

button:hover {
  background-color: #0056b3;
}

/* Navigation bar styles */
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #2c3e50;
  color: #fff;
}

.nav-left {
  display: flex;
  align-items: center;
}

.nav-right {
  display: flex;
  align-items: center;
}

.logo-link {
  text-decoration: none;
  color: #fff;
}

.coast-guard-logo {
  height: 40px; /* Adjust as needed */
  margin-right: 10px;
}

.app-title {
  font-size: 1.5em;
  font-weight: bold;
}

.header-button {
  color: #fff;
  margin-left: 20px;
  text-decoration: none;
  font-weight: bold;
  transition: all 0.3s ease;
}

.logout-btn {
  color: #0e0d0d;
  margin-left: 20px;
}

.logout-btn:hover {
  text-decoration: underline;
}

.header-button:hover {
  text-decoration: underline;
}
</style>