<template>
  <div class="pcga-form">
    <h2 class="step-title">Step 1: Personal Information</h2>
    <div class="form-group">
      <h2>Section 1: Personal Information</h2>
      <label>ID:</label>
      <input type="text" v-model="personalInfo.id">
      <label>Type of Application:</label>
      <input type="text" v-model="personalInfo.TypeOfApplication">
      <label>Last Name:</label>
      <input type="text" v-model="personalInfo.LastName">
      <label>First Name:</label>
      <input type="text" v-model="personalInfo.FirstName">
      <label>Middle Name:</label>
      <input type="text" v-model="personalInfo.MiddleName">
      <label>Suffix:</label>
      <input type="text" v-model="personalInfo.Suffix">
      <br>
      <label>Gender:</label>
      <select v-model="personalInfo.Gender">
        <option value="Male">Male</option>
        <option value="Female">Female</option>
      </select>
      <br>
      <label>Other Names Used:</label>
      <input type="text" v-model="personalInfo.OtherNamesUsed">
      <br>
      <label>Home Address:</label>
      <input type="text" v-model="personalInfo.HomeAddress">
      <label>Marital Status:</label>
      <select v-model="personalInfo.MaritalStatus">
        <option value="Single">Single</option>
        <option value="Married">Married</option>
        <option value="Separated">Separated</option>
        <option value="Widow/Widower">Widow/Widower</option>
      </select>
      <br>
      <label>Spouse Name:</label>
      <input type="text" v-model="personalInfo.SpouseName">
      <label>Number of Children:</label>
      <input type="number" v-model="personalInfo.NumberOfChildren">
      <label>Height:</label>
      <input type="text" v-model="personalInfo.Height">
      <label>Weight:</label>
      <input type="text" v-model="personalInfo.Weight">
      <label>Color of Eyes:</label>
      <input type="text" v-model="personalInfo.ColorOfEyes">
      <label>Color of Hair:</label>
      <input type="text" v-model="personalInfo.ColorOfHair">
      <label>Scars or Marks:</label>
      <input type="text" v-model="personalInfo.ScarsOrMarks">
      <label>SSS or GSIS No.:</label>
      <input type="text" v-model="personalInfo.SSSorGSISNo">
      <label>Date of Birth:</label>
      <input type="date" v-model="personalInfo.DateOfBirth">
      <label>Place of Birth:</label>
      <input type="text" v-model="personalInfo.PlaceOfBirth">
      <label>Citizenship:</label>
      <input type="text" v-model="personalInfo.Citizenship">
      <label>Religion:</label>
      <input type="text" v-model="personalInfo.Religion">
      <label>Blood Type:</label>
      <input type="text" v-model="personalInfo.BloodType">
      <label>Tel. No. (Home):</label>
      <input type="text" v-model="personalInfo.TelNoHome">
      <label>Tel. No. (Business):</label>
      <input type="text" v-model="personalInfo.TelNoBusiness">
      <br>
      <label>Mobile Phone:</label>
      <input type="text" v-model="personalInfo.MobilePhone">
      <label>Email 1:</label>
      <input type="email" v-model="personalInfo.Email1">
      <label>Email 2:</label>
      <input type="email" v-model="personalInfo.Email2">
      <br>
      <label>Fax No.:</label>
      <input type="text" v-model="personalInfo.FaxNo">
      <label>ACR No.:</label>
      <input type="text" v-model="personalInfo.ACRNo">
      <label>Passport No./Expiry Date:</label>
      <input type="text" v-model="personalInfo.PassportNo">
      <label>Type of Visa Issued:</label>
      <input type="text" v-model="personalInfo.TypeOfVisa">
      <label>TIN No.:</label>
      <input type="text" v-model="personalInfo.TINNo">
      <br>
      <!-- Add submit button -->
      <button @click="submitForm" class="submit-button">Submit</button>
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
        TypeOfApplication: '',
        LastName: '',
        FirstName: '',
        MiddleName: '',
        Suffix: '',
        Gender: '',
        OtherNamesUsed: '',
        HomeAddress: '',
        MaritalStatus: '',
        SpouseName: '',
        NumberOfChildren: null,
        Height: '',
        Weight: '',
        ColorOfEyes: '',
        ColorOfHair: '',
        ScarsOrMarks: '',
        SSSorGSISNo: '',
        DateOfBirth: '',
        PlaceOfBirth: '',
        Citizenship: '',
        Religion: '',
        BloodType: '',
        TelNoHome: '',
        TelNoBusiness: '',
        MobilePhone: '',
        Email1: '',
        Email2: '',
        FaxNo: '',
        ACRNo: '',
        PassportNo: '',
        ExpiryDate: '',
        TypeOfVisa: '',
        TINNo: ''
      }
    }
  },
  methods: {
    submitForm() {
      // Assuming you have a backend URL for form submission
      const submitURL = 'http://localhost:8080/api/submitAll';

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
  background-color: #114e9e;
  color: #ffffff;
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