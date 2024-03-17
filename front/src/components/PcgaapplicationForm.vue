<template>
  <div>
    <h1>PCGA Application Form</h1>
    
    <!-- Section 1: Personal Information -->
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
    <!-- Add the rest of the personal information fields here -->

    <!-- Section 2: Educational Background -->
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
    <br>
    <!-- Add the rest of the educational background fields here -->

    <!-- Section 3: Employment Occupational Background -->
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
    <!-- Add the rest of the employment occupational background fields here -->

    <!-- Section 4: Additional Data -->
    <h2>Section 4: Additional Data</h2>
    <label>Professional Licenses:</label>
    <input type="text" v-model="additionalData.professionalLicenses">
    <label>Special Training:</label>
    <input type="text" v-model="additionalData.specialTraining">
    <label>Special Interests/Skills:</label>
    <input type="text" v-model="additionalData.specialInterestsOrSkills">
    <br>
    <!-- Add the rest of the additional data fields here -->

    <!-- Section 5: Emergency Contact Information -->
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
    <!-- Add the rest of the emergency contact information fields here -->

    <!-- Section 6: Readiness Input -->
    <h2>Section 6: Readiness Input</h2>
    <!-- Add the readiness input fields here -->

    <!-- Section 7: Organizations -->
    <h2>Section 7: Organizations</h2>
    <!-- Add the organizations fields here -->

    <!-- Section 8: Required Clearance and Requirements -->
    <h2>Section 8: Required Clearance and Requirements</h2>
    <!-- Add the required clearance and requirements fields here -->

    <!-- Section 9: Applicant's Statement and Signature -->
    <h2>Section 9: Applicant's Statement and Signature</h2>
    <!-- Add the applicant's statement and signature fields here -->

    <!-- Section 10: Squadron Director Endorsement -->
    <h2>Section 10: Squadron Director Endorsement</h2>
    <!-- Add the squadron director endorsement fields here -->

    <!-- Section 11: Major Instructions -->
    <h2>Section 11: Major Instructions</h2>
    <!-- Add the major instructions here -->
    
    <!-- Submit Button -->
    <button @click="submitForm">Submit</button>
  </div>
</template>

<script>
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
        maritalStatus: '',
        spouseName: '',
        numberOfChildren: '',
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
        passportNo: '',
        expiryDate: '',
        typeOfVisa: '',
        tinNo: ''
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
        specialInterestsOrSkills: ''
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
      }
      // Define other sections' data objects similarly
    };
  },
  methods: {
    submitForm() {
      // Handle form submission
      console.log('Form submitted');
    }
  }
}
</script>

<style scoped>
/* Add your CSS styles here */
</style>
