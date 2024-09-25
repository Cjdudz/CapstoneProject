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
      <select v-model="personalInfo.ColorOfEyes">
        <option value="Brown">Brown</option>
        <option value="Blue">Blue</option>
        <option value="Green">Green</option>
        <option value="Hazel">Hazel</option>
        <option value="Amber">Amber</option>
        <option value="Heterochromia">Heterochromia</option>
      </select>
     <label>Color of Hair:</label>
      <select v-model="personalInfo.ColorOfHair">
        <option value="">Select</option>
        <optgroup label="Natural Hair Colors">
          <option value="Black">Black</option>
          <option value="Jet Black">Jet Black</option>
          <option value="Soft Black">Soft Black</option>
          <option value="Ebony">Ebony</option>
          <option value="Brown">Brown</option>
          <option value="Light Brown">Light Brown</option>
          <option value="Medium Brown">Medium Brown</option>
          <option value="Dark Brown">Dark Brown</option>
          <option value="Chestnut Brown">Chestnut Brown</option>
          <option value="Chocolate Brown">Chocolate Brown</option>
          <option value="Blonde">Blonde</option>
          <option value="Platinum Blonde">Platinum Blonde</option>
          <option value="Ash Blonde">Ash Blonde</option>
          <option value="Golden Blonde">Golden Blonde</option>
          <option value="Strawberry Blonde">Strawberry Blonde</option>
          <option value="Dirty Blonde">Dirty Blonde</option>
          <option value="Red">Red</option>
          <option value="Ginger">Ginger</option>
          <option value="Auburn">Auburn</option>
          <option value="Copper">Copper</option>
          <option value="Deep Red">Deep Red</option>
          <option value="Gray">Gray</option>
          <option value="Silver">Silver</option>
          <option value="White">White</option>
          <option value="Salt and Pepper">Salt and Pepper</option>
        </optgroup>
        <optgroup label="Dyed/Artificial Hair Colors">
          <option value="Bright and Unnatural Colors">Bright and Unnatural Colors</option>
          <option value="Blue">Blue</option>
          <option value="Green">Green</option>
          <option value="Pink">Pink</option>
          <option value="Purple">Purple</option>
          <option value="Teal">Teal</option>
          <option value="Turquoise">Turquoise</option>
          <option value="Lavender">Lavender</option>
          <option value="Neon Colors (e.g., Neon Pink, Neon Green)">Neon Colors (e.g., Neon Pink, Neon Green)</option>
          <option value="Pastel Colors">Pastel Colors</option>
          <option value="Pastel Pink">Pastel Pink</option>
          <option value="Pastel Blue">Pastel Blue</option>
          <option value="Pastel Purple">Pastel Purple</option>
          <option value="Mint Green">Mint Green</option>
          <option value="Peach">Peach</option>
          <option value="Ombre/Balayage">Ombre/Balayage</option>
          <option value="Dark to Light Fade (e.g., Black to Blonde)">Dark to Light Fade (e.g., Black to Blonde)</option>
          <option value="Bright to Dark Fade (e.g., Purple to Blue)">Bright to Dark Fade (e.g., Purple to Blue)</option>
          <option value="Highlights and Lowlights">Highlights and Lowlights</option>
          <option value="Blonde Highlights">Blonde Highlights</option>
          <option value="Red Highlights">Red Highlights</option>
          <option value="Caramel Lowlights">Caramel Lowlights</option>
          <option value="Ashy Highlights">Ashy Highlights</option>
          <option value="Mixed Colors">Mixed Colors</option>
          <option value="Two-Tone">Two-Tone</option>
          <option value="Half and Half (e.g., Half Black, Half White)">Half and Half (e.g., Half Black, Half White)</option>
          <option value="Split Dye (e.g., Half Blue, Half Pink)">Split Dye (e.g., Half Blue, Half Pink)</option>
          <option value="Rainbow">Rainbow</option>
          <option value="Multi-colored Streaks">Multi-colored Streaks</option>
          <option value="Full Spectrum Hair">Full Spectrum Hair</option>
        </optgroup>
      </select>
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
    async submitForm() {
      try {
        // Send form data to CodeIgniter backend
        const response = await axios.post('/api/submitAll', this.personalInfo);

        // Assuming the backend responds with a success message
        console.log('Form submitted successfully:', response.data);   
        this.$emit('next');
        // Reset the form after successful submission
        this.resetForm();
      } catch (error) {
        console.error('Error submitting form:', error.message);
      }
    },
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