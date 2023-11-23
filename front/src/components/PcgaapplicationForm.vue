<template>
    <div id="app">
      <div class="card">
        <form @submit.prevent="submitForm" class="form">
          <h1>PCGA APPLICATION FORM</h1>
          <div class="form-group">
            <label>Name of Applicant:</label>
            <input v-model="form.name" type="text" />
          </div>
          <div class="form-group">
            <label>Nationality:</label>
            <input v-model="form.nationality" type="text" />
          </div>
          <div class="form-group">
            <label>Date of Birth:</label>
            <input v-model="form.dob" type="date" />
          </div>
          <div class="form-group">
            <label>Passport No.:</label>
            <input v-model="form.passport" type="text" />
          </div>
          <div class="form-group">
            <label>Address:</label>
            <input v-model="form.address" type="text" />
          </div>
          <div class="form-group">
            <label>Telephone:</label>
            <input v-model="form.telephone" type="tel" />
          </div>
          <div class="form-group">
            <label>Email:</label>
            <input v-model="form.email" type="email" />
          </div>
          <div class="form-group">
            <label>Occupation:</label>
            <input v-model="form.occupation" type="text" />
          </div>
          <div class="form-group">
            <label>Name of Club:</label>
            <input v-model="form.club" type="text" />
          </div>
          <div class="form-group">
            <label>Date of Application:</label>
            <input v-model="form.applicationDate" type="date" />
          </div>
          <button type="submit">Submit</button>
        </form>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        form: {
          name: '',
          nationality: '',
          dob: '',
          passport: '',
          address: '',
          telephone: '',
          email: '',
          occupation: '',
          club: '',
          applicationDate: ''
        }
      };
    },
    methods: {
      submitForm() {
        console.log(this.form);
      }
    }
  };
  </script>
  
  <style scoped>
  .card {
    max-width: 600px;
    margin: auto;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    padding: 20px;
    min-height:900px
  }
  
  h1 {
    color: #333;
    text-align: center;
  }
  
  .form {
    display: flex;
    flex-direction: column;
  }
  
  .form-group {
    margin-bottom: 20px;
  }
  
  label {
    color: #555;
    font-weight: bold;
  }
  
  input {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
  }
  
  button {
    background-color: #4caf50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 10px;
  }
  
  button:hover {
    background-color: #45a049;
  }
  
  </style>
  