<template>
  <div id="app">
    <form>
      <h1>MA - 2009 Page 4 of 4 INSTRUCTIONS MEMBERSHIP APPLICATION</h1>
      <h2>GENERAL</h2>
      <div class="form-group">
        <label>Everyone requesting membership in the Philippine Coast Guard Auxiliary shall complete this form:</label>
        <textarea v-model="general" class="form-textarea"></textarea>
      </div>
      <h2>SECTION I - BASIC DATA OF APPLICANT</h2>
      <div class="form-group">
        <label>To be completed by applicant:</label>
        <textarea v-model="sectionI" class="form-textarea"></textarea>
      </div>
      <h2>SECTION II - APPLICANT'S QUALIFICATIONS</h2>
      <div class="form-group">
        <label>To be completed by:</label>
        <input v-model="sectionII" class="form-input">
      </div>
      <button type="submit" class="submit-button">Submit</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      general: '',
      sectionI: '',
      sectionII: ''
    };
  }
};
</script>

<style scoped>
  #app {
    font-family: 'Arial', sans-serif;
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
  }

  form {
    margin-top: 20px;
    width: auto;
  }

  h1, h2 {
    color: #333;
    margin-bottom: 20px;
  }

  .form-group {
    margin-bottom: 20px;
  }

  label {
    display: block;
    margin-bottom: 5px;
    color: #555;
  }

  .form-textarea,
  .form-input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    color: #333;
  }

  .form-textarea {
    resize: vertical;
  }

  .submit-button {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
  }

  .submit-button:hover {
    background-color: #45a049;
  }
</style>
