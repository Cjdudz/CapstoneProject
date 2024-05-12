<template>
  <div class="step-container">
    <h2 class="step-title">Step 1: Personal Information</h2>
    <div class="form-section">
      <h2>Section 1: Personal Information</h2>
      <label>ID:</label>
      <input type="text" v-model="personalInfo.id">
      <label>Type of Application:</label>
      <input type="text" v-model="personalInfo.typeOfApplication">
      <label>Last Name:</label>
      <input type="text" v-model="personalInfo.lastName">
      <label>First Name:</label>
      <input type="text" v-model="personalInfo.firstName">
      <label>Middle Name:</label>
      <input type="text" v-model="personalInfo.middleName">
      <label>Suffix:</label>
      <input type="text" v-model="personalInfo.suffix">
      <br>
      <label>Gender:</label>
      <select v-model="personalInfo.gender">
        <option value="Male">Male</option>
        <option value="Female">Female</option>
      </select>
      <br>
      <label>Other Names Used:</label>
      <input type="text" v-model="personalInfo.otherNamesUsed">
      <br>
      <label>Home Address:</label>
      <input type="text" v-model="personalInfo.homeAddress">
      <label>Marital Status:</label>
      <select v-model="personalInfo.maritalStatus">
        <option value="Single">Single</option>
        <option value="Married">Married</option>
        <option value="Separated">Separated</option>
        <option value="Widow/Widower">Widow/Widower</option>
      </select>
      <br>
      <label>Spouse Name:</label>
      <input type="text" v-model="personalInfo.spouseName">
      <label>Number of Children:</label>
      <input type="number" v-model="personalInfo.numberOfChildren">
      <label>Height:</label>
      <input type="text" v-model="personalInfo.height">
      <label>Weight:</label>
      <input type="text" v-model="personalInfo.weight">
      <label>Color of Eyes:</label>
      <input type="text" v-model="personalInfo.colorOfEyes">
      <label>Color of Hair:</label>
      <input type="text" v-model="personalInfo.colorOfHair">
      <label>Scars or Marks:</label>
      <input type="text" v-model="personalInfo.scarsOrMarks">
      <label>SSS or GSIS No.:</label>
      <input type="text" v-model="personalInfo.sssOrGsisNo">
      <label>Date of Birth:</label>
      <input type="date" v-model="personalInfo.dateOfBirth">
      <label>Place of Birth:</label>
      <input type="text" v-model="personalInfo.placeOfBirth">
      <label>Citizenship:</label>
      <input type="text" v-model="personalInfo.citizenship">
      <label>Religion:</label>
      <input type="text" v-model="personalInfo.religion">
      <label>Blood Type:</label>
      <input type="text" v-model="personalInfo.bloodType">
      <label>Tel. No. (Home):</label>
      <input type="text" v-model="personalInfo.telNoHome">
      <label>Tel. No. (Business):</label>
      <input type="text" v-model="personalInfo.telNoBusiness">
      <br>
      <label>Mobile Phone:</label>
      <input type="text" v-model="personalInfo.mobilePhone">
      <label>Email 1:</label>
      <input type="email" v-model="personalInfo.email1">
      <label>Email 2:</label>
      <input type="email" v-model="personalInfo.email2">
      <br>
      <label>Fax No.:</label>
      <input type="text" v-model="personalInfo.faxNo">
      <label>ACR No.:</label>
      <input type="text" v-model="personalInfo.acrNo">
      <label>Passport No./Expiry Date:</label>
      <input type="text" v-model="personalInfo.passport">
      <label>Type of Visa Issued:</label>
      <input type="text" v-model="personalInfo.typeOfVisa">
      <label>TIN No.:</label>
      <input type="text" v-model="personalInfo.tinNo">
      <br>
      <!-- Add submit button -->
      <button @click="submitForm">Submit Step 1</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      personalInfo: {
        id: '',
        typeOfApplication: '',
        lastName: '',
        firstName: '',
        middleName: '',
        suffix: '',
        gender: '',
        otherNamesUsed: '',
        homeAddress: '',
        maritalStatus: '',
        spouseName: '',
        numberOfChildren: null,
        height: '',
        weight: '',
        colorOfEyes: '',
        colorOfHair: '',
        scarsOrMarks: '',
        sssOrGsisNo: '',
        dateOfBirth: '',
        placeOfBirth: '',
        citizenship: '',
        religion: '',
        bloodType: '',
        telNoHome: '',
        telNoBusiness: '',
        mobilePhone: '',
        email1: '',
        email2: '',
        faxNo: '',
        acrNo: '',
        passport: '',
        typeOfVisa: '',
        tinNo: ''
      }
    }
  },
  methods: {
    submitForm() {
      // Assuming you have a backend URL for form submission
      const submitURL = 'your_backend_url_here';

      // Post the form data using Axios
      axios.post(submitURL, this.personalInfo)
        .then(response => {
          console.log('Form submitted successfully:', response.data);
          // Optionally, you can perform actions based on the response
        })
        .catch(error => {
          console.error('Error submitting form:', error);
          // Optionally, you can handle errors here
        });
    }
  }
}
</script>