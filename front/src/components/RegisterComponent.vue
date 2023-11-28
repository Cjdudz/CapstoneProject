<template>
  <div class="container">
    <div class="login-container">
      <v-sheet width="300" class="mx-auto">
        <v-form @submit.prevent="register">
          <div v-if="message === 'error'">Invalid response</div>
          <v-text-field v-model="username" label="Username" required></v-text-field>
          <v-text-field v-model="password" label="Password" type="password" required></v-text-field>
          <v-text-field v-model="passwordConfirm" label="Password Confirm" type="password" required></v-text-field>
          <div v-if="message === 'passwordMismatch'">Passwords do not match</div>
          <div v-if="message === 'registrationFailed'">Registration failed. Please try again.</div>
          <v-btn type="submit" block class="mt-2">Submit</v-btn>
        </v-form>
      </v-sheet>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
data() {
  return {
    username: '',
    password: '',
    passwordConfirm: '',
    message: '',
  };
},
methods: {
  async register() {
    if (this.password === this.passwordConfirm) {
      try {
        const response = await axios.post("api/register", {
          username: this.username,
          password: this.password
        });

        if (response.data.msg === 'okay') {
          alert("Registered successfully");
          this.$router.push('/LoginComponent');
        } else {
          this.message = 'registrationFailed';
        }
      } catch (error) {
        console.error("Error during registration:", error);
        this.message = 'error';
      }
    } else {
      this.message = "passwordMismatch";
    }
  }
}
};
</script>