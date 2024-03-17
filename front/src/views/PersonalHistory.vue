<template>
    <div class="form-container">
      <!-- Section 1: Personal Details -->
      <h2>Personal Details</h2>
      <label for="lastName">Last Name:</label>
      <input type="text" id="lastName" v-model="formData.personalDetails.lastName">
      <label for="firstName">First Name:</label>
      <input type="text" id="firstName" v-model="formData.personalDetails.firstName">
      <label for="middleName">Middle Name:</label>
      <input type="text" id="middleName" v-model="formData.personalDetails.middleName">
      <label for="rank">Rank:</label>
      <input type="text" id="rank" v-model="formData.personalDetails.rank">
      <label for="PCGSN">PCGSN:</label>
      <input type="text" id="PCGSN" v-model="formData.personalDetails.PCGSN">
      <label for="branchOfService">Branch/Service:</label>
      <input type="text" id="branchOfService" v-model="formData.personalDetails.branchOfService">
      <label for="jobAssignment">Present/Job Assignment:</label>
      <input type="text" id="jobAssignment" v-model="formData.personalDetails.jobAssignment">
      <label for="businessAddress">Business or Duty Address:</label>
      <input type="text" id="businessAddress" v-model="formData.personalDetails.businessAddress">
      <label for="homeAddress">Home Address (include st. and Nr):</label>
      <input type="text" id="homeAddress" v-model="formData.personalDetails.homeAddress">
      <label for="birthdate">Birth Date:</label>
      <input type="date" id="birthdate" v-model="formData.personalDetails.birthDate">
      <label for="placeOfBirth">Place of Birth:</label>
      <input type="text" id="placeOfBirth" v-model="formData.personalDetails.placeOfBirth">
      <label for="changeInName">Change in Name (if by court action give details):</label>
      <input type="text" id="changeInName" v-model="formData.personalDetails.changeInName">
      <label for="nicknames">Nicknames:</label>
      <input type="text" id="nicknames" v-model="formData.personalDetails.nicknames">
      <label for="nationality">Nationality:</label>
      <input type="text" id="nationality" v-model="formData.personalDetails.nationality">
      <label for="TIN">TIN (Tax Identification Number):</label>
      <input type="text" id="TIN" v-model="formData.personalDetails.TIN">
      <label for="nationalRegistrationCard">National Registration Card:</label>
      <input type="text" id="nationalRegistrationCard" v-model="formData.personalDetails.nationalRegistrationCard">
      <label for="religion">Religion:</label>
      <input type="text" id="religion" v-model="formData.personalDetails.religion">
      <label for="bloodType">Blood Type:</label>
      <input type="text" id="bloodType" v-model="formData.personalDetails.bloodType">
  
      <!-- Section 2: Personal Characteristics -->
      <h2>Personal Characteristics</h2>
      <label for="sex">Sex:</label>
      <input type="text" id="sex" v-model="formData.personalCharacteristics.sex">
      <label for="age">Age:</label>
      <input type="number" id="age" v-model="formData.personalCharacteristics.age">
      <label for="height">Height (cms):</label>
      <input type="number" id="height" v-model="formData.personalCharacteristics.height">
      <label for="weight">Weight (kgs):</label>
      <input type="number" id="weight" v-model="formData.personalCharacteristics.weight">
      <label for="build">Build (Heavy, Medium, Light):</label>
      <input type="text" id="build" v-model="formData.personalCharacteristics.build">
      <label for="complexion">Complexion (Dark, Fair, Light):</label>
      <input type="text" id="complexion" v-model="formData.personalCharacteristics.complexion">
      <label for="eyeColor">Color of Eyes:</label>
      <input type="text" id="eyeColor" v-model="formData.personalCharacteristics.eyeColor">
      <label for="hairColor">Color of Hair:</label>
      <input type="text" id="hairColor" v-model="formData.personalCharacteristics.hairColor">
      <label for="scars">Scars or Marks and Other Distinguishing Features:</label>
      <textarea id="scars" v-model="formData.personalCharacteristics.scars"></textarea>
  
      <!-- Section 3: Marital History -->
      <h2>Marital History</h2>
      <label for="maritalStatus">Marital Status:</label>
      <input type="text" id="maritalStatus" v-model="formData.maritalHistory.maritalStatus">
      <label for="spouseName">Name of Spouse (Full Name):</label>
      <input type="text" id="spouseName" v-model="formData.maritalHistory.spouseName">
      <label for="dateOfMarriage">Date and Place of Marriage:</label>
      <input type="text" id="dateOfMarriage" v-model="formData.maritalHistory.dateOfMarriage">
      <label for="spouseOccupation">Occupation and Place of Employment:</label>
      <input type="text" id="spouseOccupation" v-model="formData.maritalHistory.spouseOccupation">
  
      <!-- Section 4: Family History -->
      <h2>Family History</h2>
      <label for="fatherName">Father's Name:</label>
      <input type="text" id="fatherName" v-model="formData.familyHistory.fatherName">
      <label for="fatherDOB">Father's Date of Birth:</label>
      <input type="text" id="fatherDOB" v-model="formData.familyHistory.fatherDOB">
      <label for="fatherAddress">Father's Address:</label>
      <input type="text" id="fatherAddress" v-model="formData.familyHistory.fatherAddress">
      <label for="fatherOccupation">Father's Occupation and Place of Employment:</label>
      <input type="text" id="fatherOccupation" v-model="formData.familyHistory.fatherOccupation">
      <label for="fatherCitizenship">Father's Citizenship:</label>
      <input type="text" id="fatherCitizenship" v-model="formData.familyHistory.fatherCitizenship">
      <label for="motherName">Mother's Name:</label>
      <input type="text" id="motherName" v-model="formData.familyHistory.motherName">
      <label for="motherDOB">Mother's Date and Place of Birth:</label>
      <input type="text" id="motherDOB" v-model="formData.familyHistory.motherDOB">
      <label for="motherAddress">Mother's Address:</label>
      <input type="text" id="motherAddress" v-model="formData.familyHistory.motherAddress">
      <label for="motherOccupation">Mother's Occupation and Place of Employment:</label>
      <input type="text" id="motherOccupation" v-model="formData.familyHistory.motherOccupation">
      <label for="motherCitizenship">Mother's Citizenship:</label>
      <input type="text" id="motherCitizenship" v-model="formData.familyHistory.motherCitizenship">
      <label for="siblings">Brothers and Sisters (Names, Address, Occupation):</label>
      <textarea id="siblings" v-model="formData.familyHistory.siblings"></textarea>
      <label for="stepParent">Step-Parent or Guardian:</label>
      <input type="text" id="stepParent" v-model="formData.familyHistory.stepParent">
      <label for="stepParentAddress">Step-Parent's Address:</label>
      <input type="text" id="stepParentAddress" v-model="formData.familyHistory.stepParentAddress">
      <label for="stepParentOccupation">Step-Parent's Occupation and Place of Employment:</label>
      <input type="text" id="stepParentOccupation" v-model="formData.familyHistory.stepParentOccupation">
      <label for="stepParentCitizenship">Step-Parent's Citizenship:</label>
      <input type="text" id="stepParentCitizenship" v-model="formData.familyHistory.stepParentCitizenship">
  
      <!-- Section 5: Educational Background -->
      <h2>Educational Background</h2>
      <label for="elementary">Elementary:</label>
      <input type="text" id="elementary" v-model="formData.educationalBackground.elementary">
      <label for="college">College:</label>
      <input type="text" id="college" v-model="formData.educationalBackground.college">
      <label for="postGraduate">Post Graduate:</label>
      <input type="text" id="postGraduate" v-model="formData.educationalBackground.postGraduate">
      <label for="otherSchools">Other Schools Attended (School, Course, Location, Date of Attendance, Year Graduated):</label>
      <textarea id="otherSchools" v-model="formData.educationalBackground.otherSchools"></textarea>
      <label for="civilServiceEligibility">Civil Service Eligibility:</label>
      <input type="text" id="civilServiceEligibility" v-model="formData.educationalBackground.civilServiceEligibility">
  
      <!-- Section 6: Military History -->
      <h2>Military History</h2>
      <label for="enlistmentDate">Date of Enlistment in the AFP:</label>
      <input type="date" id="enlistmentDate" v-model="formData.militaryHistory.enlistmentDate">
      <label for="commissionDate">Date of Commission:</label>
      <input type="date" id="commissionDate" v-model="formData.militaryHistory.commissionDate">
      <label for="sourceOfCommission">Source of Commission:</label>
      <input type="text" id="sourceOfCommission" v-model="formData.militaryHistory.sourceOfCommission">
      <label for="importantUnitAssignment">Important Unit Assignments Since Enlistment:</label>
      <textarea id="importantUnitAssignment" v-model="formData.militaryHistory.importantUnitAssignment"></textarea>
      <label for="militarySchools">Military Schools Attended (Name, Location, Date of Attendance, Nature of Training, Rating):</label>
      <textarea id="militarySchools" v-model="formData.militaryHistory.militarySchools"></textarea>
      <label for="decorationsAndAwards">Decorations and Awards or Commendations Received:</label>
      <textarea id="decorationsAndAwards" v-model="formData.militaryHistory.decorationsAndAwards"></textarea>
  
      <!-- Section 7: Place of Residence Since Birth -->
      <h2>Place of Residence Since Birth</h2>
      <label for="residenceHistory">Inclusive Dates, Place, and Address:</label>
      <textarea id="residenceHistory" v-model="formData.residenceHistory"></textarea>
  
      <!-- Section 8: Employment -->
      <h2>Employment</h2>
      <label for="employmentHistory">Inclusive Dates, Type of Employment, Name/Address of Employment, Reason of Leaving:</label>
      <textarea id="employmentHistory" v-model="employmentHistory"></textarea>
      <label for="dismissalOrResignation">Have you ever been dismissed or forced to resign from a position? (Yes/No) If yes, explain:</label>
      <textarea id="dismissalOrResignation" v-model="dismissalOrResignation"></textarea>
      <label for="foreignCountriesVisited">Foreign Countries Visited (Date, Countries Visited, Purpose of Visit):</label>
      <textarea id="foreignCountriesVisited" v-model="foreignCountriesVisited"></textarea>
  
      <!-- Section 9: Credit Reputation -->
      <h2>Credit Reputation</h2>
      <label for="salaryDependency">Are you entirely dependent on your salary? (Yes/No) If no, state other sources of income:</label>
      <textarea id="salaryDependency" v-model="salaryDependency"></textarea>
      <label for="bankAccounts">Name and Address of Banks or Other Credit Institutions with which you have accounts/loans:</label>
      <textarea id="bankAccounts" v-model="bankAccounts"></textarea>
      <label for="assetsAndLiabilitiesStatement">Have you filed a statement of your assets and liabilities with any government agency? (Yes/No) If so, what agency?</label>
      <textarea id="assetsAndLiabilitiesStatement" v-model="assetsAndLiabilitiesStatement"></textarea>
      <label for="incomeTaxReturnFiled">Have you ever filed your last income tax return?</label>
      <textarea id="incomeTaxReturnFiled" v-model="incomeTaxReturnFiled"></textarea>
      <label for="creditReferences">Three credit references in the Philippines (Name and Address):</label>
      <textarea id="creditReferences" v-model="creditReferences"></textarea>
  
      <!-- Section 10: Arrest Record and Conduct -->
      <h2>Arrest Record and Conduct</h2>
      <label for="arrestRecord">Have you ever been investigated/arrested, indicted or convicted for any violation of law? (Yes/No) If so, state name of court, nature of offence and disposition of case:</label>
      <textarea id="arrestRecord" v-model="arrestRecord"></textarea>
      <label for="familyArrestRecord">Has any member of your family ever been investigated/arrested, indicted or convicted for any violation of law? If so, state name of court, nature of the case and disposition of case:</label>
      <textarea id="familyArrestRecord" v-model="familyArrestRecord"></textarea>
      <label for="administrativeCase">Have you ever been charged in any administrative case?</label>
      <textarea id="administrativeCase" v-model="administrativeCase"></textarea>
      <label for="pd1081Detention">Have you ever been arrested or detained pursuant to the provision of PD 1081 and its implementation order (GO, PO, LOI)? (Yes/No) If so, state the nature of the case and the place of your detention:</label>
      <textarea id="pd1081Detention" v-model="pd1081Detention"></textarea>
      <label for="intoxicantsUsage">Do you use intoxicating liquor or narcotics? If so, to what extent?</label>
      <textarea id="intoxicantsUsage" v-model="intoxicantsUsage"></textarea>
  
      <!-- Section 11: General Reputation -->
      <h2>General Reputation</h2>
      <label for="characterReferences">5 Character References (Not Relatives) Known Three Years or Longer (Name and Business Address/Residence):</label>
      <textarea id="characterReferences" v-model="characterReferences"></textarea>
      <label for="neighbors">List of Three Neighbors at Your Present Residence (Name and Business Address/Residence):</label>
      <textarea id="neighbors" v-model="neighbors"></textarea>
  
      <!-- Section 12: Organizations -->
      <h2>Organizations</h2>
      <label for="organizations">List of Organizations or Social Groups Which You Have Been a Member (Organization, Address, Date of Membership & Position Held):</label>
      <textarea id="organizations" v-model="organizations"></textarea>
  
      <!-- Section 13: Miscellaneous -->
      <h2>Miscellaneous</h2>
      <label for="hobbies">Hobbies, Sports, and Pastimes:</label>
      <textarea id="hobbies" v-model="hobbies"></textarea>
      <label for="languageDialect">Language or Dialect (Indicate Ability as Fluent, Fair, or Poor - Speak, Read, and Write):</label>
      <textarea id="languageDialect" v-model="languageDialect"></textarea>
      <label for="lieDetectionTest">Are you willing to undergo periodic lie detection tests?</label>
      <textarea id="lieDetectionTest" v-model="lieDetectionTest"></textarea>
      <button @click="submitForm">Submit</button>
  </div>
</template>
<script>
import axios from 'axios';
export default {
    data() {
  return {
    formData: {
      personalDetails: {
        lastName: '',
        firstName: '',
        middleName: '',
        rank: '',
        PCGSN: '',
        branchOfService: '',
        jobAssignment: '',
        businessAddress: '',
        homeAddress: '',
        birthDate: '',
        placeOfBirth: '',
        changeInName: '',
        nicknames: '',
        nationality: '',
        TIN: '',
        nationalRegistrationCard: '',
        religion: '',
        bloodType: ''
      },
      personalCharacteristics: {
        sex: '',
        age: '',
        height: '',
        weight: '',
        build: '',
        complexion: '',
        eyeColor: '',
        hairColor: '',
        scars: ''
      },
      maritalHistory: {
        maritalStatus: '',
        spouseName: '',
        dateOfMarriage: '',
        spouseOccupation: ''
      },
      familyHistory: {
        fatherName: '',
        fatherDOB: '',
        fatherAddress: '',
        fatherOccupation: '',
        fatherCitizenship: '',
        motherName: '',
        motherDOB: '',
        motherAddress: '',
        motherOccupation: '',
        motherCitizenship: '',
        siblings: '',
        stepParent: '',
        stepParentAddress: '',
        stepParentOccupation: '',
        stepParentCitizenship: ''
      },
      educationalBackground: {
        elementary: '',
        college: '',
        postGraduate: '',
        otherSchools: '',
        civilServiceEligibility: ''
      },
      militaryHistory: {
        enlistmentDate: '',
        commissionDate: '',
        sourceOfCommission: '',
        importantUnitAssignment: '',
        militarySchools: '',
        decorationsAndAwards: ''
      },
      residenceHistory: '',
      employmentHistory: '',
      dismissalOrResignation: '',
      foreignCountriesVisited: '',
      salaryDependency: '',
      bankAccounts: '',
      assetsAndLiabilitiesStatement: '',
      incomeTaxReturnFiled: '',
      creditReferences: '',
      arrestRecord: '',
      familyArrestRecord: '',
      administrativeCase: '',
      pd1081Detention: '',
      intoxicantsUsage: '',
      characterReferences: '',
      neighbors: '',
      organizations: '',
      hobbies: '',
      languageDialect: '',
      lieDetectionTest: ''
    }
  };
},
  methods: {
    async submitForm() {
      try {
        // Send form data to CodeIgniter backend
        const response = await axios.post('/api/SubmitPersonalForm', this.form);

        // Assuming the backend responds with a success message
        console.log('Form submitted successfully:', response.data);

        // Reset the form after successful submission (optional)
        this.resetForm();
      } catch (error) {
        console.error('Error submitting form:', error.message);
      }
    },
    clearForm() {
      this.formData = {
        personalDetails: {
          lastName: '',
          firstName: '',
          middleName: '',
          rank: '',
          PCGSN: '',
          branchOfService: '',
          jobAssignment: '',
          businessAddress: '',
          homeAddress: '',
          birthDate: '',
          placeOfBirth: '',
          changeInName: '',
          nicknames: '',
          nationality: '',
          TIN: '',
          nationalRegistrationCard: '',
          religion: '',
          bloodType: ''
        },
        personalCharacteristics: {
          sex: '',
          age: '',
          height: '',
          weight: '',
          build: '',
          complexion: '',
          eyeColor: '',
          hairColor: '',
          scars: ''
        },
        maritalHistory: {
          maritalStatus: '',
          spouseName: '',
          dateOfMarriage: '',
          spouseOccupation: ''
        },
        familyHistory: {
          fatherName: '',
          fatherDOB: '',
          fatherAddress: '',
          fatherOccupation: '',
          fatherCitizenship: '',
          motherName: '',
          motherDOB: '',
          motherAddress: '',
          motherOccupation: '',
          motherCitizenship: '',
          siblings: '',
          stepParent: '',
          stepParentAddress: '',
          stepParentOccupation: '',
          stepParentCitizenship: ''
        },
        educationalBackground: {
          elementary: '',
          college: '',
          postGraduate: '',
          otherSchools: '',
          civilServiceEligibility: ''
        },
        militaryHistory: {
          enlistmentDate: '',
          commissionDate: '',
          sourceOfCommission: '',
          importantUnitAssignment: '',
          militarySchools: '',
          decorationsAndAwards: ''
        },
        residenceHistory: '',
        employmentHistory: '',
        dismissalOrResignation: '',
        foreignCountriesVisited: '',
        salaryDependency: '',
        bankAccounts: '',
        assetsAndLiabilitiesStatement: '',
        incomeTaxReturnFiled: '',
        creditReferences: '',
        arrestRecord: '',
        familyArrestRecord: '',
        administrativeCase: '',
        pd1081Detention: '',
        intoxicantsUsage: '',
        characterReferences: '',
        neighbors: '',
        organizations: '',
        hobbies: '',
        languageDialect: '',
        lieDetectionTest: ''
      };
    }
  }
};
</script>


  
<style>
  /* Form Container Styles */
  .form-container {
    font-family: Arial, sans-serif;
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }

  /* Section Heading Styles */
  h2 {
    margin-top: 20px;
    margin-bottom: 10px;
    font-size: 1.5rem;
    color: #333;
  }

  /* Label Styles */
  label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    color: #555;
  }

  /* Input Styles */
  input[type="text"],
  input[type="number"],
  input[type="date"],
  textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1rem;
    transition: border-color 0.3s ease;
  }

  input[type="text"]:focus,
  input[type="number"]:focus,
  input[type="date"]:focus,
  textarea:focus {
    outline: none;
    border-color: #007bff;
  }

  /* Textarea Styles */
  textarea {
    resize: vertical;
  }

  /* Button Styles */
  button {
    display: block;
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: #fff;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  button:hover {
    background-color: #0056b3;
  }
</style>
