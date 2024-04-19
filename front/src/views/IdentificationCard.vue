<template>
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
    </div>
    <div class="form-group">
      <label for="maritalStatus">Marital Status</label>
      <select id="maritalStatus" v-model="formData.maritalStatus" required>
        <option value="">Select</option>
        <option value="Single">Single</option>
        <option value="Widowed">Widowed</option>
        <option value="Divorced">Divorced</option>
        <option value="Married">Married</option>
        <option value="Separated">Separated</option>
      </select>
    </div>
    <div class="form-group">
      <label for="weight">Weight (kgs)</label>
      <input type="number" id="weight" v-model="formData.weight" required>
    </div>
    <div class="form-group">
      <label for="eyes">Eyes</label>
      <input type="text" id="eyes" v-model="formData.eyes" required>
    </div>
    <div class="form-group">
      <label for="height">Height (cm)</label>
      <input type="number" id="height" v-model="formData.height" required>
    </div>
    <div class="form-group">
      <label for="hair">Hair</label>
      <input type="text" id="hair" v-model="formData.hair" required>
    </div>
    <div class="form-group">
      <label for="bloodType">Blood Type</label>
      <input type="text" id="bloodType" v-model="formData.bloodType" required>
    </div>
    <div class="form-group">
      <label for="sex">Sex</label>
      <select id="sex" v-model="formData.sex" required>
        <option value="">Select</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
      </select>
    </div>
    <div class="form-group">
      <label for="religion">Religion</label>
      <input type="text" id="religion" v-model="formData.religion" required>
    </div>
    <div class="form-group">
      <label for="dateOfBirth">Date of Birth</label>
      <input type="date" id="dateOfBirth" v-model="formData.dateOfBirth" required>
    </div>
    <div class="form-group">
      <label for="identifyingData">Identifying Data/Mark</label>
      <input type="text" id="identifyingData" v-model="formData.identifyingData" required>
    </div>
    <div class="form-group">
      <label for="emergencyContact">Person to be Notified in Case of Emergency</label>
      <input type="text" id="emergencyContact" v-model="formData.emergencyContact" required>
    </div>
    <div class="form-group">
      <label for="emergencyContactAddress">Address of Person to be Notified</label>
      <input type="text" id="emergencyContactAddress" v-model="formData.emergencyContactAddress" required>
    </div>
    <div class="form-group">
      <label for="emergencyContactNumber">Contact Number</label>
      <input type="text" id="emergencyContactNumber" v-model="formData.emergencyContactNumber" required>
    </div>
    <button type="submit">Submit</button>
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
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 10px 20px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #0056b3;
}
</style>
