<template>
    <div id="app">
      <form class="neighbor-form">
        <h1>Neighbors</h1>
        <div class="form-section">
          <h2>Present Residence</h2>
          <label for="neighbor-address">Business Address/Residence:</label>
          <input type="text" id="neighbor-address" v-model="neighbors.address" placeholder="Enter address">
          <!-- Add other fields here -->
        </div>
  
        <h1>Organization or Social Groups</h1>
        <div class="form-section">
          <label for="organization-membership">Member Membership & Position:</label>
          <input type="text" id="organization-membership" v-model="organization.membership" placeholder="Enter membership details">
          <!-- Add other fields here -->
        </div>
  
        <h1>Miscellaneous</h1>
        <div class="form-section">
          <label for="miscellaneous-address">Address:</label>
          <input type="text" id="miscellaneous-address" v-model="miscellaneous.address" placeholder="Enter address">
          <!-- Add other fields here -->
        </div>
  
        <h1>Languages and Dialects</h1>
        <div class="form-section">
          <label for="languages-write">Write:</label>
          <input type="text" id="languages-write" v-model="languages.write" placeholder="Enter language proficiency">
          <!-- Add other fields here -->
        </div>
        <!-- Add other sections here -->
  
        <!-- Submit button -->
        <button type="submit">Submit</button>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    name: 'App',
    data() {
      return {
        neighbors: {
          address: '',
          // Add other fields here
        },
        organization: {
          membership: '',
          // Add other fields here
        },
        miscellaneous: {
          address: '',
          // Add other fields here
        },
        languages: {
          write: '',
          // Add other fields here
        }
        // Add other fields here
      };
    },
  };
  </script>
  
  <style scoped>
  #app {
    font-family: 'Arial', sans-serif;
    text-align: center;
  }
  
  .neighbor-form {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f8f8f8;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
  
  .form-section {
    margin-bottom: 20px;
  }
  
  h1 {
    color: #2a4e6c;
  }
  
  h2 {
    color: #2a4e6c;
    margin-top: 16px;
  }
  
  label {
    display: block;
    margin-bottom: 8px;
    color: #333;
  }
  
  input {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
    outline: none;
  }
  
  button {
    background-color: #4caf50;
    color: white;
    padding: 10px 20px;
    font-size: 16px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  
  button:hover {
    background-color: #45a049;
  }
  </style>
  