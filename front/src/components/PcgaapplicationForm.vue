<template>
  <div id="app" class="container">
    <h2 class="heading">PCGA Application Form</h2>
    <form @submit.prevent="submitForm" class="form">
      <div class="section">
      <h3>Personal Information</h3>
      <label>Name of Applicant: <input v-model="formData.name" type="text"></label><br>
      <label>Nationality: <input v-model="formData.nationality" type="text"></label><br>
      <label>Date of Birth: <input v-model="formData.dob" type="date"></label><br>
      <label>Passport No.: <input v-model="formData.passport" type="text"></label><br>
      <label>Address: <input v-model="formData.address" type="text"></label><br>
      <label>Telephone: <input v-model="formData.telephone" type="tel"></label><br>
      <label>Email: <input v-model="formData.email" type="email"></label><br>
      <label>Occupation: <input v-model="formData.occupation" type="text"></label><br>
      <label>Name of Club: <input v-model="formData.club" type="text"></label><br>
      <label>Date of Application: <input v-model="formData.applicationDate" type="date"></label><br>
      </div>
      <!-- Membership Application Page 1 -->
      <h3>Membership Application Page 1</h3>
      <label>Last Name: <input v-model="formData.lastName" type="text"></label><br>
      <label>First Name: <input v-model="formData.firstName" type="text"></label><br>
      <label>Middle Name: <input v-model="formData.middleName" type="text"></label><br>
      <label>Suffix: <input v-model="formData.suffix" type="text"></label><br>
      <label>Marital Status:
        <select v-model="formData.maritalStatus">
          <option>Separated</option>
          <option>Married</option>
          <option>Single</option>
          <option>Widower</option>
        </select>
      </label><br>
      <label>No. of Children: <input type="number" v-model="formData.numChildren"></label><br>
      <label>Sex:
        <select v-model="formData.sex">
          <option>Male</option>
          <option>Female</option>
        </select>
      </label><br>
      <label>Height: <input v-model="formData.height"></label><br>
      <label>Weight: <input v-model="formData.weight"></label><br>

      <!-- Membership Application Page 2 -->
      <h3>Membership Application Page 2</h3>
      <label>Last Name: <input v-model="formData.page2LastName" type="text"></label><br>
      <label>First Name: <input v-model="formData.page2FirstName" type="text"></label><br>
      <label>Middle Initial: <input v-model="formData.middleInitial" type="text"></label><br>
      <label>Suffix: <input v-model="formData.page2Suffix" type="text"></label><br>
      <label>Tel No. (Home): <input v-model="formData.telHome" type="text"></label><br>
      <label>Tel No. (Business): <input v-model="formData.telBusiness" type="text"></label><br>

      <!-- Membership Application Page 3 -->
      <h3>Membership Application Page 3</h3>
      <label>Last Name: <input v-model="formData.page3LastName" type="text"></label><br>
      <label>First Name: <input v-model="formData.page3FirstName" type="text"></label><br>
      <label>Middle Initial: <input v-model="formData.page3MiddleInitial" type="text"></label><br>
      <label>Suffix: <input v-model="formData.page3Suffix" type="text"></label><br>
      <label>Tel No. (Home): <input v-model="formData.page3TelHome" type="text"></label><br>
      <label>Tel No. (Business): <input v-model="formData.page3TelBusiness" type="text"></label><br>

      <!-- Membership Application Page 4 -->
      <h3>Membership Application Page 4</h3>
      <label>Last Name: <input v-model="formData.page4LastName" type="text"></label><br>
      <label>First Name: <input v-model="formData.page4FirstName" type="text"></label><br>
      <label>Middle Initial: <input v-model="formData.page4MiddleInitial" type="text"></label><br>
      <label>Suffix: <input v-model="formData.page4Suffix" type="text"></label><br>
      <label>Tel No. (Home): <input v-model="formData.page4TelHome" type="text"></label><br>
      <label>Tel No. (Business): <input v-model="formData.page4TelBusiness" type="text"></label><br>

      <!-- Personal History -->
      <h3>Personal History</h3>
      <label>Name: <input v-model="formData.personalHistoryName" type="text"></label><br>
      <label>Address: <input v-model="formData.personalHistoryAddress" type="text"></label><br>
      <label>Age: <input v-model="formData.personalHistoryAge" type="number"></label><br>
      <label>Height: <input v-model="formData.personalHistoryHeight" type="number"></label><br>
      <label>Weight: <input v-model="formData.personalHistoryWeight" type="number"></label><br>
      <label>Physical Condition: <input v-model="formData.physicalCondition" type="text"></label><br>

      <!-- Marital History -->
      <h3>Marital History</h3>
      <label>Name of Spouse: <input v-model="formData.spouseName" type="text"></label><br>
      <label>Date and Place of Marriage: <input v-model="formData.marriageDetails" type="text"></label><br>
      <label>Children: <input v-model="formData.children" type="text"></label><br>
      <label>Place of Residence: <input v-model="formData.residence" type="text"></label><br>
      <label>Full Name of Citizenship: <input v-model="formData.citizenship" type="text"></label><br>

      <!-- Father in Law -->
      <h3>Father in Law</h3>
      <label>Date and Place of Birth: <input v-model="formData.fatherInLawBirth" type="text"></label><br>
      <label>Address: <input v-model="formData.fatherInLawAddress" type="text"></label><br>
      <label>Occupation and Place of Employment: <input v-model="formData.fatherInLawOccupation" type="text"></label><br>
      <label>Date and Place of Employment: <input v-model="formData.fatherInLawEmployment" type="text"></label><br>
      <label>Educational Background: <input v-model="formData.fatherInLawEducation" type="text"></label><br>
      <label>Post Graduate Courses and Other Qualifications: <input v-model="formData.fatherInLawCourses" type="text"></label><br>
      <label>Further Eligibility, if any, and other qualifications: <input v-model="formData.fatherInLawEligibility" type="text"></label><br>

      <!-- Military History -->
      <h3>Military History</h3>
      <label>Date Entered the AFP: <input v-model="formData.militaryHistoryDateEntered" type="date"></label><br>
      <label>Source of Commission: <input v-model="formData.militaryHistorySourceOfCommission" type="text"></label><br>

      <!-- Foreign Countries Visited -->
      <h3>Foreign Countries Visited</h3>
      <table>
        <tr>
          <th>Country Visited</th>
          <th>Purpose of Visit</th>
          <th>Date</th>
        </tr>
        <tr v-for="(visit, index) in formData.visits" :key="index">
          <td><input v-model="visit.country" type="text"></td>
          <td><input v-model="visit.purpose" type="text"></td>
          <td><input v-model="visit.date" type="date"></td>
        </tr>
      </table>

      <!-- List down three (3) neighbors at your present residence -->
      <h3>Neighbors at Present Residence</h3>
      <label>Business Address/Residence: <input v-model="formData.neighbors.address" type="text"></label><br>

      <!-- Organization or social groups -->
      <h3>Organization or Social Groups</h3>
      <label>Membership & Position: <input v-model="formData.organization.membership" type="text"></label><br>

      <!-- Miscellaneous -->
      <h3>Miscellaneous</h3>
      <label>Address: <input v-model="formData.miscellaneous.address" type="text"></label><br>

      <!-- Languages and dialects -->
      <h3>Languages and Dialects</h3>
      <label>Write: <input v-model="formData.languages.write" type="text"></label><br>

      <!-- Certification -->
      <h3>Certification</h3>
      <label>Signed at: <input v-model="formData.certification.signedAt" type="text"></label><br>
      <label>Date: <input v-model="formData.certification.date" type="date"></label><br>
      <label>Left Thumbmark: <input v-model="formData.certification.leftThumbmark" type="text"></label><br>
      <label>Right Thumbmark: <input v-model="formData.certification.rightThumbmark" type="text"></label><br>
      <label>Witness 1: <input v-model="formData.certification.witness1" type="text"></label><br>
      <label>Witness 2: <input v-model="formData.certification.witness2" type="text"></label><br>

      <button type="submit">Submit</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';
  
export default {
  data() {
    return {
      formData: {
        // RCGA Application Form
        name: '',
        nationality: '',
        dob: '',
        passport: '',
        address: '',
        telephone: '',
        email: '',
        occupation: '',
        club: '',
        applicationDate: '',

        // Membership Application Page 1
        lastName: '',
        firstName: '',
        middleName: '',
        suffix: '',
        maritalStatus: '',
        numChildren: 0,
        sex: '',
        height: '',
        weight: '',

        // Membership Application Page 2
        page2LastName: '',
        page2FirstName: '',
        middleInitial: '',
        page2Suffix: '',
        telHome: '',
        telBusiness: '',

        // Membership Application Page 3
        page3LastName: '',
        page3FirstName: '',
        page3MiddleInitial: '',
        page3Suffix: '',
        page3TelHome: '',
        page3TelBusiness: '',

        // Membership Application Page 4
        page4LastName: '',
        page4FirstName: '',
        page4MiddleInitial: '',
        page4Suffix: '',
        page4TelHome: '',
        page4TelBusiness: '',

        // Personal History
        personalHistoryName: '',
        personalHistoryAddress: '',
        personalHistoryAge: null,
        personalHistoryHeight: null,
        personalHistoryWeight: null,
        physicalCondition: '',

        // Marital History
        spouseName: '',
        marriageDetails: '',
        children: '',
        residence: '',
        citizenship: '',

        // Father in Law
        fatherInLawBirth: '',
        fatherInLawAddress: '',
        fatherInLawOccupation: '',
        fatherInLawEmployment: '',
        fatherInLawEducation: '',
        fatherInLawCourses: '',
        fatherInLawEligibility: '',

        // Military History
        militaryHistoryDateEntered: '',
        militaryHistorySourceOfCommission: '',

        // Foreign Countries Visited
        visits: [
          { country: '', purpose: '', date: '' },
          { country: '', purpose: '', date: '' },
          { country: '', purpose: '', date: '' }
        ],

        // Neighbors at Present Residence
        neighbors: {
          address: ''
        },

        // Organization or Social Groups
        organization: {
          membership: ''
        },

        // Miscellaneous
        miscellaneous: {
          address: ''
        },

        // Languages and Dialects
        languages: {
          write: ''
        },

        // Certification
        certification: {
          signedAt: '',
          date: '',
          leftThumbmark: '',
          rightThumbmark: '',
          witness1: '',
          witness2: ''
        }
      }
    }
  },
  methods: {
    async submitForm() {
      try {
        // Send form data to CodeIgniter backend
        const response = await axios.post('/api/passForm', this.form);

        // Assuming the backend responds with a success message
        console.log('Form submitted successfully:', response.data);

        // Reset the form after successful submission (optional)
        this.resetForm();
      } catch (error) {
        console.error('Error submitting form:', error.message);
      }
    },
  }
}
</script>

<style>
/* Basic styling */
.container {
  max-width: 800px;
  margin: 0 auto;
}

.heading {
  text-align: center;
}

.form {
  margin-top: 20px;
}

.section {
  margin-bottom: 20px;
}

/* Input field styling */
input[type="text"],
input[type="number"],
input[type="tel"],
input[type="email"],
select {
  width: 100%;
  padding: 8px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

select {
  cursor: pointer;
}

/* Button styling */
button {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width: 100%;
}

button:hover {
  background-color: #45a049;
}

/* Table styling */
table {
  width: 100%;
  border-collapse: collapse;
}

table th, table td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}

table th {
  background-color: #f2f2f2;
}
</style>