<template>
  <div class="application-form">
 
    <h1>PCGA Application Form</h1>
    
    <div class="form-section">
    <h2>Section 1: Personal Information</h2>
    <label>Type of Application:</label>
    <select v-model="personalInfo.typeOfApplication">
      <option value="New Enrollment">New Enrollment</option>
      <option value="Re-enrollment">Re-enrollment</option>
      <option value="Transfer of Squadron">Transfer of Squadron</option>
    </select>
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
    <!-- Add the rest of the personal information fields here -->

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

<div class="form-section">
<h2>Section 10: Squadron Director Endorsement</h2>
<label>Applicant is:</label>
<input type="radio" value="Accepted" v-model="squadronEndorsement.applicantStatus"> Accepted
<input type="radio" value="Not Accepted" v-model="squadronEndorsement.applicantStatus"> Not Accepted

<!-- Reason for not accepted -->
<textarea v-if="squadronEndorsement.applicantStatus === 'Not Accepted'" placeholder="Reason why not accepted" v-model="squadronEndorsement.reasonForNotAccepted"></textarea>

<label>Date:</label>
<input type="date" v-model="squadronEndorsement.date">
<br>

<!-- Section 11: Major Instructions -->
<h2>Section 11: Major Instructions</h2>
<!-- Add the major instructions here -->
<br>
</div>
<button @click="submitForm">Submit</button>
</div>
</template>


<script>
import axios from 'axios';

export default {
  data() {
    return {
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
        date: '',
        applicantName: '',
        thumbprints: '',
        photo: ''
      },
      squadronEndorsement: {
        applicantStatus: '',
        signature: '',
        date: ''
      },
      majorInstructions: {
        instructions: ''
      }
    };
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
<style scoped>
/* General styles */
.application-form {
  font-family: 'Roboto', sans-serif;
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  background-color: #f2f5f8;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-title {
  text-align: center;
  font-size: 28px;
  margin-bottom: 20px;
  color: #2c3e50;
}

.form-section {
  background-color: #fff;
  padding: 20px;
  margin-bottom: 20px;
  border-radius: 10px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

/* Input field styles */
input[type="text"],
input[type="date"],
input[type="email"],
textarea {
  width: 100%;
  padding: 12px;
  margin-bottom: 15px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
  font-size: 16px;
  color: #333;
}

/* Radio button styles */
input[type="radio"] {
  margin-right: 5px;
}

/* Submit button styles */
.submit-button {
  display: block;
  width: 100%;
  padding: 15px;
  background-color: #2980b9;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 18px;
  transition: background-color 0.3s;
}

.submit-button:hover {
  background-color: #1c6cad;
}
</style>