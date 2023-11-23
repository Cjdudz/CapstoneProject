<template>
  <div id="app">
    <form>
      <h1>IMA-2009 Page 2 of 4 IMA MEMBERSHIP APPLICATION</h1>
      <h2>SECTION I – PERSONAL INFORMATION</h2>
      <div class="form-group">
        <label>Last Name:</label>
        <input v-model="lastName" class="form-input">
      </div>
      <div class="form-group">
        <label>First Name:</label>
        <input v-model="firstName" class="form-input">
      </div>
      <div class="form-group">
        <label>Middle Initial:</label>
        <input v-model="middleInitial" class="form-input">
      </div>
      <div class="form-group">
        <label>Suffix:</label>
        <input v-model="suffix" class="form-input">
      </div>
      <div class="form-group">
        <label>Tel No. (Home):</label>
        <input v-model="telHome" class="form-input">
      </div>
      <div class="form-group">
        <label>Tel No. (Business):</label>
        <input v-model="telBusiness" class="form-input">
      </div>
      <button type="submit" class="submit-button">Submit</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      lastName: '',
      firstName: '',
      middleInitial: '',
      suffix: '',
      telHome: '',
      telBusiness: ''
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

  .form-input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    color: #333;
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
