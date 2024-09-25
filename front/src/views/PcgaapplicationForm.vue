<template>  <nav class="navbar">
  <div class="nav-left">
    <router-link to="/Home" class="logo-link">
        <img src="img/PCGA-removebg-preview.png " alt="Coast Guard Logo" class="coast-guard-logo" />
      <span class="app-title">PCGA</span>
    </router-link>
  </div>
  <div class="nav-right">
    <router-link to="/Navbar" class="header-button">Home</router-link>
    <router-link to="/Transparency" class="header-button">Transparency Seal</router-link>
    <router-link to="/Disctricts" class="header-button">Coast Guard Districts</router-link>
    <router-link to="/PcgaapplicationForm" class="header-button">Apply Online</router-link>
    <v-btn text @click="loginOrLogout" class="logout-btn">{{ isLoggedIn ? 'Logout' : 'Logout' }}</v-btn>
  </div>
</nav>
    <div class="spacer"></div>
    <div class="form-container">
    <form @submit.prevent="submitForm" class="multi-step-form">
      <div v-if="currentStep === 1" class="step-container">
        <h2 class="step-title">Step 1: Personal Information</h2>
        <div class="form-section">
    <h2>Section 1: Personal Information</h2>
    <label>Type of Application:</label>

    <br>
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
    </div>
  </div>
      <div v-if="currentStep === 2" class="step-container">
        <div class="form-section">
    <h2>Section 2: Educational Background</h2>
    <label>College/Post Grad/Special:</label>
    <input type="text" v-model="educationInfo.college">
    <label>Name of School:</label>
    <input type="text" v-model="educationInfo.schoolName">
    <label>Degrees Obtained:</label>
    <input type="text" v-model="educationInfo.degreesObtained">
    <label>Inclusive Dates:</label>
    <input type="text" v-model="educationInfo.inclusiveDates">
    <label>Year Graduated:</label>
    <input type="text" v-model="educationInfo.yearGraduated">
    <br></div>
      </div>
      <div v-if="currentStep === 3" class="step-container">
        <div class="form-section">
    <h2>Section 3: Employment Occupational Background</h2>
    <label>Employed / Own Business:</label>
    <input type="text" v-model="employmentInfo.employmentStatus">
    <label>Company:</label>
    <input type="text" v-model="employmentInfo.company">
    <label>Nature of Office:</label>
    <input type="text" v-model="employmentInfo.natureOfOffice">
    <label>Past or Current Government Position (if applicable):</label>
    <input type="text" v-model="employmentInfo.pastOrCurrentGovernmentPosition">
    <label>Highest Appointment/Elected Office:</label>
    <input type="text" v-model="employmentInfo.highestAppointmentOrElectedOffice">
    <br>
   </div>
      </div>
      <!-- Add the remaining steps with their respective fields -->
      <div v-if="currentStep === 4" class="step-container">
        <h2 class="step-title">Step 4: Step Four</h2>
        <div class="form-section">
    <h2>Section 4: Additional Data</h2>
    <label>Professional Licenses:</label>
    <input type="text" v-model="additionalData.professionalLicenses">
    <label>Special Training:</label>
    <input type="text" v-model="additionalData.specialTraining">
    <label>Special Interests/Skills:</label>
    <input type="text" v-model="additionalData.specialInterestsOrSkills">
    <br>
    <label>Height:</label>
    <input type="text" v-model="additionalData.height">
    <label>Weight:</label>
    <input type="text" v-model="additionalData.weight">
    <label>Color of Eyes:</label>
    <input type="text" v-model="additionalData.colorOfEyes">
    <label>Color of Hair:</label>
    <input type="text" v-model="additionalData.colorOfHair">
    <label>Scars or Marks and Other Distinguishing Features:</label>
    <input type="text" v-model="additionalData.scarsOrMarks">
    <label>SSS/GSIS No.:</label>
    <input type="text" v-model="additionalData.sssGsisNo">
    <label>Date of Birth:</label>
    <input type="date" v-model="additionalData.dateOfBirth">
    <br>
    <label>Citizenship:</label>
    <input type="text" v-model="additionalData.citizenship">
    <label>Religion:</label>
    <input type="text" v-model="additionalData.religion">
    <label>Blood Type:</label>
    <input type="text" v-model="additionalData.bloodType">
    <label>Tel. No. (Home):</label>
    <input type="text" v-model="additionalData.telNoHome">
    <label>Tel. No. (Business):</label>
    <input type="text" v-model="additionalData.telNoBusiness">
    <br>
    <label>Mobile Phone:</label>
    <input type="text" v-model="additionalData.mobilePhone">
    <label>Email 1:</label>
    <input type="email" v-model="additionalData.email1">
    <label>Email 2:</label>
    <input type="email" v-model="additionalData.email2">
    <br>
    <label>Fax No.:</label>
    <input type="text" v-model="additionalData.faxNo">
    <label>ACR No. (if Alien):</label>
    <input type="text" v-model="additionalData.acrNo">
    <label>Passport No./Expiry Date:</label>
    <input type="text" v-model="additionalData.passport">
    <br>
    <label>Type of Visa Issued:</label>
    <input type="text" v-model="additionalData.visaType">
    <label>TIN No.:</label>
    <input type="text" v-model="additionalData.tinNo">
   </div>
      </div>
      <div v-if="currentStep === 5" class="step-container">
        <h2 class="step-title">Step 5: Step Five</h2>
        <div class="form-section">
    <h2>Section 5: Emergency Contact Information</h2>
    <label>Last Name:</label>
    <input type="text" v-model="emergencyContact.lastName">
    <label>First Name:</label>
    <input type="text" v-model="emergencyContact.firstName">
    <label>Middle Initial:</label>
    <input type="text" v-model="emergencyContact.middleInitial">
    <label>Suffix:</label>
    <input type="text" v-model="emergencyContact.suffix">
    <br>
    <label>Relationship:</label>
    <input type="text" v-model="emergencyContact.relationship">
    <label>Address:</label>
    <input type="text" v-model="emergencyContact.address">
    <label>Tel No. (Home):</label>
    <input type="text" v-model="emergencyContact.telNoHome">
    <label>Tel No. (Business):</label>
    <input type="text" v-model="emergencyContact.telNoBusiness">
    <label>Mobile Phone:</label>
    <input type="text" v-model="emergencyContact.mobilePhone">
    <br>
   </div>
      </div>
      <div v-if="currentStep === 6" class="step-container">
        <h2 class="step-title">Step 6: Step Six</h2>
        <div class="form-section">
    <h2>Section 6: Readiness Input</h2>
    <label>Functions You Want to be Involved In:</label>
    <input type="text" v-model="readinessInput.functionsInvolved">
    <label>Purpose in Joining the PCGA:</label>
    <input type="text" v-model="readinessInput.purpose">
    <label>Are You Willing to be Trained?</label>
    <input type="radio" value="Yes" v-model="readinessInput.willingToBeTrained"> Yes
    <input type="radio" value="No" v-model="readinessInput.willingToBeTrained"> No
    <br>
    <label>Are You Willing to Travel Outside Your Home Area?</label>
    <input type="radio" value="Yes" v-model="readinessInput.willingToTravel"> Yes
    <input type="radio" value="No" v-model="readinessInput.willingToTravel"> No
    <br>
    <label>Are You Available on Call 24 hrs?</label>
    <input type="radio" value="Yes" v-model="readinessInput.available24Hrs"> Yes
    <input type="radio" value="No" v-model="readinessInput.available24Hrs"> No
    <span v-if="!readinessInput.available24Hrs">
      (If No, Provide Days/Advance Notice Needed)
      <input type="text" v-model="readinessInput.daysAdvanceNotice">
    </span>
    <br>
    </div>
      </div>
      <div v-if="currentStep === 7" class="step-container">
        <h2 class="step-title">Step 7: Step Seven</h2>
        <div class="form-section">
    <h2>Section 7: Organizations</h2>
    <label>Organization:</label>
    <input type="text" v-model="organizations.organization">
    <label>Place Date of Membership:</label>
    <input type="text" v-model="organizations.placeDateOfMembership">
    <label>Position Held:</label>
    <input type="text" v-model="organizations.positionHeld">
    <br>
    </div>>
      </div>
      <div v-if="currentStep === 8" class="step-container">
        <h2 class="step-title">Step 8: Step Eight</h2>
        <div class="form-section">
    <h2>Section 8: Required Clearance and Requirements</h2>
    <label>NBI Clearance:</label>
    <input type="text" v-model="clearanceRequirements.nbiClearance">
    <label>Police Clearance:</label>
    <input type="text" v-model="clearanceRequirements.policeClearance">
    <label>Barangay Clearance:</label>
    <input type="text" v-model="clearanceRequirements.barangayClearance">
    <label>Orientation Seminar Certificate (Copy):</label>
    <input type="text" v-model="clearanceRequirements.orientationSeminarCertificate">
    <br>
      </div>
      </div>
      <div v-if="currentStep === 9" class="step-container">
        <h2 class="step-title">Step 9: Step Nine</h2>
        <div class="form-section">
    <h2>Section 9: Applicant's Statement and Signature</h2>
<label for="conviction">I affirm that I have ___ have not___ been convicted of a violation of any laws of the Republic of the Philippines, classified as a major misdemeanor or a felony. (If convicted, state specifics including date, city and state, offense, disposition, and comments and attach it here).</label>
<div id="conviction">
  <input type="radio" id="yesConviction" value="Yes" v-model="applicantStatement.convictionStatus">
  <label for="yesConviction">Yes</label>
  <input type="radio" id="noConviction" value="No" v-model="applicantStatement.convictionStatus">
  <label for="noConviction">No</label>
</div>
<input type="text" v-model="applicantStatement.convictionDetails">
    <br>


    <label for="photo">2x2 Photo:</label>
    <input type="file" id="photo" accept="image/*" @change="handlePhotoUpload">
    <br>
</div>
      </div>
      <div v-if="currentStep === 10" class="step-container">
        <h2 class="step-title">Step 10: Step Ten</h2>
        div class="form-section">
<h2>Section 10: Squadron Director Endorsement</h2>
<label>Applicant is:</label>
<input type="radio" value="Accepted" v-model="squadronEndorsement.applicantStatus"> Accepted
<input type="radio" value="Not Accepted" v-model="squadronEndorsement.applicantStatus"> Not Accepted

<!-- Reason for not accepted -->
<textarea v-if="squadronEndorsement.applicantStatus === 'Not Accepted'" placeholder="Reason why not accepted" v-model="squadronEndorsement.reasonForNotAccepted"></textarea>

<label>Date:</label>
<input type="date" v-model="squadronEndorsement.date2">
<br>
      </div>
      <div v-if="currentStep === 11" class="step-container">
        <h2 class="step-title">Step 11: Final Step</h2>
        <div class="form-field">
          <label for="field1" class="form-label">Field 1:</label>
          <input type="text" id="field1" v-model="formData.field1" class="form-input" required>
        </div>
        <div class="form-field">
          <label for="field2" class="form-label">Field 2:</label>
          <input type="text" id="field2" v-model="formData.field2" class="form-input" required>
        </div>
        <!-- Add more fields as needed -->
      </div>
      <div class="button-container">
        <button type="button" @click="prevStep" :disabled="currentStep === 1">Previous</button>
        <button type="button" @click="nextStep" :disabled="currentStep === 11">Next</button>
        <button type="submit" v-if="currentStep === 11">Submit</button>
      </div>
    </form>
  </div>
</template><script>
import axios from 'axios'

export default {
  data() {
    return {
      currentStep: 1,
      formData: {
        field1: '',
        field2: '',
      },
      personalInfo: {
        typeOfApplication: '',
        lastName: '',
        firstName: '',
        middleName: '',
        suffix: '',
        gender: '',
        otherNamesUsed: '',
        homeAddress: '',
        maritalStatus: ''
      },
      educationInfo: {
        college: '',
        schoolName: '',
        degreesObtained: '',
        inclusiveDates: '',
        yearGraduated: ''
      },
      employmentInfo: {
        employmentStatus: '',
        company: '',
        natureOfOffice: '',
        pastOrCurrentGovernmentPosition: '',
        highestAppointmentOrElectedOffice: ''
      },
      additionalData: {
        professionalLicenses: '',
        specialTraining: '',
        specialInterestsOrSkills: '',
        height: '',
        weight: '',
        colorOfEyes: '',
        colorOfHair: '',
        scarsOrMarks: '',
        sssGsisNo: '',
        dateOfBirth: '',
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
        passportNo: '',
        typeOfVisa: '',
        tinNo: ''
      },
      emergencyContact: {
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
      readinessInput: {
        functionsInvolved: '',
        purpose: '',
        willingToBeTrained: '',
        willingToTravel: '',
        available24Hrs: '',
        daysAdvanceNotice: ''
      },
      organizations: {
        organization: '',
        placeDateOfMembership: '',
        positionHeld: ''
      },
      clearanceRequirements: {
        nbiClearance: '',
        policeClearance: '',
        barangayClearance: '',
        orientationSeminarCertificate: ''
      },
      applicantStatement: {
        convictionDetails: '',
        sponsorName: '',
        date1: '',
        applicantName: '',
        thumbprints: '',
        photo: ''
      },
      squadronEndorsement: {
        applicantStatus: '',
        signature: '',
        date2: ''
      },
      majorInstructions: {
        instructions: ''
      }
    }
  },
  methods: {
    nextStep() {
      this.currentStep++
    },
    prevStep() {
      this.currentStep--
    },
    async submitForm() {
      try {
        // Send form data to CodeIgniter backend
        const response = await axios.post('/api/submitForm', this.form);

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

    handlePhotoUpload(event) {
      // Handle photo upload here
      console.log(event.target.files[0])
    },
    loginOrLogout() {
      // Implement login or logout functionality here
    }
  }
}
</script>



    <style scoped>.multi-step-form {
      width: 80%;
      margin: 0 auto;
    }
    
    .step-container {
      margin-bottom: 20px;
    }
    
    .step-title {
      margin-bottom: 10px;
    }
    
    .form-section {
      margin-bottom: 20px;
    }
    .form-section input {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-bottom: 10px;
  width: 100%; /* Make inputs full width */
}
    .form-section label {
      display: block;
      margin-bottom: 5px;
    }
    
    .form-section select {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-bottom: 10px;
  width: 100%; /* Make select full width */
}
    .form-section textarea {
      width: 100%;
      padding: 8px;
      margin-top: 5px;
      border-radius: 5px;
      border: 1px solid #ccc;
    }
    
    .button-container {
      margin-top: 20px;
      text-align: center;
    }
    
    .button-container button {
  background-color: #4CAF50; /* Green color */
  color: white;
  border: none;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 5px; /* Add rounded corners */
}
    .button-container button:disabled {
      background-color: #ccc;
      cursor: not-allowed;
    }
/* Field Grouping */
.form-section fieldset {
  border: 1px solid #ddd;
  padding: 15px;
  margin-bottom: 15px;
  border-radius: 4px;
}

.form-section fieldset legend {
  padding: 5px;
  font-weight: bold;
}

/* Label Placement */
.form-section label {
  display: block;
  margin-bottom: 5px;
}

/* Error States */
.form-section .error {
  color: red;
  font-size: smaller;
}

/* Input Validation (Basic Example) */
.form-section input[required]:invalid {
  border-color: red;
}

/* Placeholder Text */
.form-section input::-webkit-input-placeholder { /* Chrome, Safari, etc. */
  color: #ccc;
}

.form-section input:-moz-placeholder { /* Firefox */
  color: #ccc;
}
.form-section input::-moz-placeholder { /* Firefox (newer) */
  color: #ccc;
}

/* Progress Indicator (Example using a progress bar) */
.progress-container {
  width: 100%;
  height: 10px;
  background-color: #ddd;
  border-radius: 5px;
  margin-bottom: 15px;
}

.progress {
  height: 100%;
  background-color: #4CAF50; /* Green color */
  border-radius: 5px;
}

/* Aesthetics and Branding */
body {
  font-family: Arial, sans-serif; /* Choose a preferred font family */
}

.button-container button {
  background-color: #4CAF50; /* Green color (adjust to your brand) */
  color: white;
  border: none;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 5px;
  transition: background-color 0.2s ease-in-out; /* Add hover effect */
}

.button-container button:hover {
  background-color: #3e8e41; /* Darker green on hover */
}

.form-section input,
.form-section select {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-bottom: 10px;
  width: 100%;
  font-size: 14px; /* Adjust font size for readability */
}
/* Navbar styles */
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #2c3e50;
  color: #fff;
  z-index: 1000; /* Ensure it's above other elements */
}

/* Nav Left styles */
.nav-left {
  display: flex;
  align-items: center;
}

/* Nav Right styles */
.nav-right {
  display: flex;
  align-items: center;
  gap: 20px; /* Add some space between buttons */
}

/* Logo link styles */
.logo-link {
  text-decoration: none;
  color: #fff;
}

/* Coast Guard Logo styles */
.coast-guard-logo {
  height: 50px;
  margin-right: 10px;
}

/* App Title styles */
.app-title {
  font-size: 1.8em;
  font-weight: bold;
}

/* Header button styles */
.header-button {
  color: #fff;
  text-decoration: none;
  font-weight: bold;  
  transition: color 0.3s ease;
}

.header-button:hover {
  color: #f39c12; /* Change color on hover */
}

/* Logout button styles */
.logout-btn {
  color: #fff;
  background-color: transparent;
  border: none;
  cursor: pointer;
  font-weight: bold;
  transition: color 0.3s ease;
}

.logout-btn:hover {
  color: #f39c12; /* Change color on hover */
}

.spacer {
  height: 100px; /* Adjust the height for desired spacing */
}

/* Additional CSS for responsiveness */
@media only screen and (max-width: 768px) {
  .nav-right {
    display: none; /* Hide right-side navigation links on small screens */
  }

  .nav-left {
    margin-right: auto; /* Push logo to the left on small screens */
  }

  .navbar {
    padding: 10px; /* Adjust padding for smaller screens */
  }

  .nav-left .app-title {
    font-size: 1.4em; /* Decrease font size for smaller screens */
  }

  .nav-left .coast-guard-logo {
    height: 40px; /* Decrease logo size for smaller screens */
  }

  .spacer {
    height: 60px; /* Adjust spacing for smaller screens */
  }

  .form-container {
    width: 90%; /* Make form container width 90% on small screens */
    margin: 20px auto; /* Adjust margin for smaller screens */
  }

  .step-container {
    margin-bottom: 20px; /* Adjust margin for smaller screens */
  }

  .step-title {
    font-size: 16px; /* Decrease font size for smaller screens */
  }

  .form-input {
    padding: 8px; /* Adjust padding for smaller screens */
  }

  .button-container {
    flex-direction: column; /* Stack buttons vertically on smaller screens */
  }

  button {
    width: 100%; /* Make buttons full width on smaller screens */
  }
}

    </style>