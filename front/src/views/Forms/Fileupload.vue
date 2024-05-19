<template>
  <div class="file-upload-container">
    <div class="upload-introduction">
      <h2>Upload Requirements</h2>
      <p>Please upload the necessary files for your application. Supported file types include images (JPEG, PNG, GIF) and documents (PDF, DOCX).</p>
    </div>
    <div class="upload-section">
      <label for="file-input" class="file-input-label">
        <span>Choose File</span>
        <input id="file-input" type="file" @change="handleFileUpload" class="file-input">
      </label>
      <span v-if="file" class="file-name">{{ file.name }}</span>
      <button @click="uploadFile" class="upload-button">Upload</button>
    </div>
    <p v-if="error" class="error-message">{{ error }}</p>
    <p v-if="success" class="success-message">File uploaded successfully!</p>
    <div class="uploaded-files-container">
      <h3>Uploaded Files</h3>
      <ul class="uploaded-files-list">
        <li v-for="(file, index) in files" :key="index" class="uploaded-file-item">
          <a :href="file.url" class="file-link" :download="file.name">{{ file.name }}</a>
          <button @click="downloadFile(file.name)" class="download-button">Download</button>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      file: null,
      error: '',
      success: false,
      files: []
    };
  },
  methods: {
    handleFileUpload(event) {
      this.file = event.target.files[0];
    },
    uploadFile() {
      let formData = new FormData();
      formData.append('userfile', this.file);

      axios.post('/api/upload', formData, {
        headers: {
          'Content-Type': 'multipart/form-data'
        }
      })
      .then(response => {
        this.success = true;
        this.error = '';
        this.fetchFiles();
      })
      .catch(error => {
        this.success = false;
        this.error = error.response.data.errors || 'An error occurred.';
      });
    },
    fetchFiles() {
      axios.get('/api/files')
        .then(response => {
          this.files = response.data.map(file => ({
            name: file.name,
            url: '/uploads/' + file.name  // Adjust base URL if necessary
          }));
        })
        .catch(error => {
          this.error = 'Failed to fetch files.';
          console.error(error); // Log error for debugging
        });
    },
    downloadFile(filename) {
      axios.get('/api/download/' + filename, {
        responseType: 'blob' // Important for downloading binary files
      })
      .then(response => {
        const url = window.URL.createObjectURL(new Blob([response.data]));
        const link = document.createElement('a');
        link.href = url;
        link.setAttribute('download', filename);
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link); // Clean up after download
      })
      .catch(error => {
        console.error(error);
        // Handle error appropriately, e.g., show an error message
      });
    }
  },
  created() {
    this.fetchFiles();
  }
}
</script>

<style scoped>
.file-upload-container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 5px;
  background-color: #fff;
}

.upload-introduction {
  margin-bottom: 20px;
}

.upload-introduction h2 {
  font-size: 24px;
  margin-bottom: 10px;
}

.upload-introduction p {
  font-size: 16px;
}

.upload-section {
  display: flex;
  align-items: center;
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

.uploaded-files-container {
  margin-top: 30px;
}

.uploaded-files-list {
  list-style-type: none;
  padding: 0;
}

.uploaded-file-item {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.file-link {
  text-decoration: none;
  color: #0366d6;
  margin-right: 10px;
}

.download-button {
  background-color: #0366d6;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 5px 10px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.download-button:hover {
  background-color: #0056b3;
}

.file-name {
  margin-right: 10px;
  font-size: 16px;
}
</style>
