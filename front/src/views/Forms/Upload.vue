<template>
  <div class="file-upload-container">
    <div class="upload-introduction">
      <h2>Upload Requirements</h2>
      <p>Please upload the necessary files for your application. Supported file types include images (JPEG, PNG, GIF) and documents (PDF, DOCX).</p>
    </div>
    
    <div class="upload-section" v-for="(file, key) in files" :key="key">
      <label :for="key" class="file-input-label">
        <span>{{ file.label }}</span>
        <input :id="key" type="file" @change="handleFileChange($event, key)" class="file-input">
        <i class="fas fa-upload"></i>
      </label>
      <span v-if="file.file" class="file-name">{{ file.file.name }}</span>
      <button v-if="file.file" @click="removeFile(key)" class="remove-button">
        <i class="fas fa-times"></i>
      </button>
    </div>

    <button @click="uploadFiles" class="upload-button">Upload Files</button>

    <p v-if="error" class="error-message">{{ error }}</p>
    <p v-if="success" class="success-message">Files uploaded successfully!</p>
  </div>
</template>
<script>
import axios from 'axios';

export default {
  data: () => {
    return {
      files: {
        birthCertificate: { label: 'Birth Certificate', file: null },
        validId: { label: 'Valid ID', file: null },
        nso: { label: 'NSO Document', file: null },
      },
      error: '',
      success: false,
    };
  },
  methods: {
    handleFileChange(event, fileType) {
      this.files[fileType].file = event.target.files[0];
    },
    removeFile(fileType) {
      this.files[fileType].file = null;
    },
    uploadFiles() {
      let formData = new FormData();
      for (let key in this.files) {
        if (this.files[key].file) {
          formData.append(key, this.files[key].file);
        }
      }

      axios.post('/api/upload', formData, {
        headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization': this.getAuthToken(),
        },
      })
      .then(response => {
        this.success = true;
        this.error = '';
        this.$router.push({ name: 'NavBar' });
        // Reset form after successful upload
        this.resetForm();
      })
      .catch(error => {
        this.success = false;
        this.error = error.response?.data?.errors || 'An error occurred.';
      });
    },
    resetForm() {
      // Reset all file inputs and success state
      for (let key in this.files) {
        this.files[key].file = null;
      }
      this.success = false;
    },
    getCookie(name) {
      const value = `; ${document.cookie}`;
      const parts = value.split(`; ${name}=`);
      if (parts.length === 2) {
        return parts.pop().split(';').shift();
      }
      return null;
    },
    getAuthToken() {
      return this.getCookie('auth_token');
    },
  },
}
</script>


<style scoped>
.file-upload-container {
  max-width: 800px;
  margin: 40px auto;
  padding: 30px;
  border: 1px solid #ddd;
  border-radius: 10px;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.upload-introduction {
  margin-bottom: 20px;
}

.upload-introduction h2 {
  font-size: 24px;
  margin-bottom: 10px;
  color: #333;
}

.upload-introduction p {
  font-size: 16px;
  color: #666;
}

.upload-section {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.file-input-label {
  position: relative;
  overflow: hidden;
  margin-right: 10px;
  border: 2px solid #4CAF50;
  border-radius: 5px;
  background-color: #4CAF50;
  color: #fff;
  padding: 8px 16px;
  cursor: pointer;
}

.file-input {
  position: absolute;
  left: 0;
  top: 0;
  opacity: 0;
  cursor: pointer;
}

.file-input-label i {
  font-size: 18px;
  margin-left: 10px;
}

.remove-button {
  background-color: #ff5252;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  padding: 5px 10px;
  font-size: 16px;
}

.remove-button:hover {
  background-color: #ff3737;
}

.upload-button {
  background-color: #4CAF50;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.upload-button:hover {
  background-color: #45a049;
}

.error-message {
  color: red;
  margin-top: 10px;
}

.success-message {
  color: green;
  margin-top: 10px;
}

.file-name {
  margin-right: 10px;
  font-size: 16px;
}
</style>