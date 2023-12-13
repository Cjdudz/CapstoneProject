<template>
  <v-container>
    <v-form @submit.prevent="submitForm">
      <v-row>
        <v-col>
          <v-h1>{{ certificationText }}</v-h1>
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-file-input label="Signed at:" v-model="signedAt" accept="image/*"></v-file-input>
        </v-col>
        <v-col>
          <v-text-field label="Date:" type="date" v-model="date"></v-text-field>
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-file-input label="Left Thumbmark:" v-model="leftThumbmark" accept="image/*"></v-file-input>
        </v-col>
        <v-col>
          <v-file-input label="Right Thumbmark:" v-model="rightThumbmark" accept="image/*"></v-file-input>
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-file-input label="Witness 1:" v-model="witness1" accept="image/*"></v-file-input>
        </v-col>
        <v-col>
          <v-file-input label="Witness 2:" v-model="witness2" accept="image/*"></v-file-input>
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-btn type="submit">Submit</v-btn>
        </v-col>
      </v-row>
    </v-form>
  </v-container>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      signedAt: null,
      date: '',
      leftThumbmark: null,
      rightThumbmark: null,
      witness1: null,
      witness2: null,
      certificationText:
        "I certify that the foregoing answers are true and correct to the best of my knowledge and belief and I agree that any misstatement or omission may be cause for denial of my application for clearance.",
    };
  },
  methods: {
    submitForm() {
      const formData = new FormData();
      formData.append('signedAt', this.signedAt);
      formData.append('date', this.date);
      formData.append('leftThumbmark', this.leftThumbmark);
      formData.append('rightThumbmark', this.rightThumbmark);
      formData.append('witness1', this.witness1);
      formData.append('witness2', this.witness2);

      // In a real application, replace the URL with your backend endpoint
      axios
        .post('https://jsonplaceholder.typicode.com/posts', formData)
        .then((response) => {
          console.log('Form submitted successfully:', response.data);
          // Reset form fields if needed
          this.resetForm();
          this.$router.push('/');
        })
        .catch((error) => {
          console.error('Error submitting form:', error);
        });
    },
    resetForm() {
      this.signedAt = null;
      this.date = '';
      this.leftThumbmark = null;
      this.rightThumbmark = null;
      this.witness1 = null;
      this.witness2 = null;
    },
  },
};
</script>

<style scoped>
/* Add your styles here */

/* Example styling for better presentation */
.v-container {
  max-width: 600px;
  margin: auto;
}

.v-h1 {
  font-size: 24px;
  margin-bottom: 16px;
}

.v-file-input {
  margin-bottom: 16px;
}

.v-text-field {
  width: 100%;
  margin-bottom: 16px;
}

.v-btn {
  margin-top: 16px;
  width: 100%;
  background-color: #4caf50;
  color: white;
}
</style>
