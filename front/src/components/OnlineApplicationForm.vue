<template>
  <div class="card">
    <h2>Online Application Form</h2>

    <form @submit.prevent="submitForm" class="form">
      <!-- Name field -->
      <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" v-model="formData.name" required />
      </div>

      <!-- Email field -->
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" v-model="formData.email" required />
      </div>

      <!-- Address field -->
      <div class="form-group">
        Address
      </div>

      <!-- City field -->
      <div class="form-group">
        <label for="city">City:</label>
        <input type="text" id="city" v-model="formData.city" required />
      </div>

      <!-- Province field -->
      <div class="form-group">
        <label for="province">Province:</label>
        <input type="text" id="province" v-model="formData.province" required />
      </div>

      <!-- Phone field -->
      <div class="form-group">
        <label for="phone">Phone:</label>
        <input
          type="tel"
          id="phone"
          v-model="formData.phone"
          pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
        />
      </div>

      <!-- Date of Birth field -->
      <div class="form-group">
        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" v-model="formData.dob" />
      </div>
<!-- Course field -->
<div class="form-group">
  <label for="course">Course:</label>
  <input type="text" id="course" v-model="formData.course" required />
</div>

      <!-- Submit button -->
      <button type="submit" class="submit-btn">Submit</button>
    </form>

    <!-- Display form submission message -->
    <div v-if="formSubmissionMessage" class="submission-message">
      {{ formSubmissionMessage }}
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      formData: {
        name: '',
        email: '',
        city: '',
        province: '',
        phone: '',
        course: '',
        dob: '',
        // Add more form fields here
      },
      formSubmissionMessage: '',
    };
  },
  methods: {
    submitForm() {
      // Perform form submission logic
      // Simulate success for demonstration purposes
      this.formSubmissionMessage = 'Form submitted successfully!';
      console.log('Form submitted!', this.formData);
      // You can send the form data to your server or perform other actions.
    },
  },
};
</script>

<style scoped>
/* Component-specific styles */
.card {
  max-width: 400px;
  margin: auto;
  background-color: #fff;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
  padding: 20px;
}

h2 {
  color: #333;
}

.form {
  display: flex;
  flex-direction: column;
}

.form-group {
  margin-bottom: 15px;
}

label {
  color: #555;
  margin-bottom: 5px;
}

input {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

button {
  background-color: #4caf50;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #45a049;
}

.submission-message {
  margin-top: 10px;
  color: #4caf50;
}
</style>
