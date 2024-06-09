<template>
    <div class="file-upload-container">
      <div class="upload-requirements">
        <div class="upload-requirement">
          <h3>Birth Certificate</h3>
          <p>Please upload your birth certificate in PDF or image format.</p>
          <label for="file-input-birth-certificate" class="file-input-label">
            <span>Choose File</span>
            <input id="file-input-birth-certificate" type="file" @change="handleFileUpload('birthCertificate')" class="file-input">
          </label>
          <span v-if="files.birthCertificate" class="file-name">{{ files.birthCertificate.name }}</span>
          <button @click="uploadBirthCertificate" class="upload-button" :disabled="uploading.birthCertificate">
            <span v-if="uploading.birthCertificate">Uploading...</span>
            <span v-else>Upload</span>
          </button>
          <div v-if="uploading.birthCertificate" class="loading-spinner"></div>
        </div>
        <div class="upload-requirement">
          <h3>Visa</h3>
          <p>Please upload your visa in PDF or image format.</p>
          <label for="file-input-visa" class="file-input-label">
            <span>Choose File</span>
            <input id="file-input-visa" type="file" @change="handleFileUpload('visa')" class="file-input">
          </label>
          <span v-if="files.visa" class="file-name">{{ files.visa.name }}</span>
          <button @click="uploadVisa" class="upload-button" :disabled="uploading.visa">
            <span v-if="uploading.visa">Uploading...</span>
            <span v-else>Upload</span>
          </button>
          <div v-if="uploading.visa" class="loading-spinner"></div>
        </div>
        <div class="upload-requirement">
          <h3>Passport</h3>
          <p>Please upload your passport in PDF or image format.</p>
          <label for="file-input-passport" class="file-input-label">
            <span>Choose File</span>
            <input id="file-input-passport" type="file" @change="handleFileUpload('passport')" class="file-input">
          </label>
          <span v-if="files.passport" class="file-name">{{ files.passport.name }}</span>
          <button @click="uploadPassport" class="upload-button" :disabled="uploading.passport">
            <span v-if="uploading.passport">Uploading...</span>
            <span v-else>Upload</span>
          </button>
          <div v-if="uploading.passport" class="loading-spinner"></div>
        </div>
        <div class="upload-requirement">
          <h3>Driver's License</h3>
          <p>Please upload your driver's license in PDF or image format.</p>
          <label for="file-input-drivers-license" class="file-input-label">
            <span>Choose File</span>
            <input id="file-input-drivers-license" type="file" @change="handleFileUpload('driversLicense')" class="file-input">
          </label>
          <span v-if="files.driversLicense" class="file-name">{{ files.driversLicense.name }}</span>
          <button @click="uploadDriversLicense" class="upload-button" :disabled="uploading.driversLicense">
            <span v-if="uploading.driversLicense">Uploading...</span>
            <span v-else>Upload</span>
          </button>
          <div v-if="uploading.driversLicense" class="loading-spinner"></div>
        </div>
      </div>
      <p v-if="error" class="error-message">{{ error }}</p>
      <p v-if="success" class="success-message">File uploaded successfully!</p>
      <div class="uploaded-files-container">
        <h3>Uploaded Files</h3>
        <ul class="uploaded-files-list">
          <li v-for="(file, index) in uploadedFiles" :key="index" class="uploaded-file-item">
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
        files: {
          birthCertificate: null,
          visa: null,
          passport: null,
          driversLicense: null
        },
        error: '',
        success: false,
        uploadedFiles: [],
        uploading: {
          birthCertificate: false,
          visa: false,
          passport: false,
          driversLicense: false
        }
      };
    },
    methods: {
      handleFileUpload(type) {
        this.$set(this.files, type, event.target.files[0]);
      },
      uploadBirthCertificate() {
        const file = this.files.birthCertificate;
        if (!file) {
          this.error = 'Please select a file.';
          return;
        }
  
        this.uploading.birthCertificate = true;
  
        let formData = new FormData();
        formData.append('userfile', file);
  
        axios.post('/api/upload/birthCertificate', formData, {
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
        })
        .finally(() => {
          this.uploading.birthCertificate = false;
        });
      },
      uploadVisa() {
        const file = this.files.visa;
        if (!file) {
          this.error = 'Please select a file.';
          return;
        }
  
        this.uploading.visa = true;
  
        let formData = new FormData();
        formData.append('userfile', file);
  
        axios.post('/api/upload/visa', formData, {
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
        })
        .finally(() => {
          this.uploading.visa = false;
        });
      },
      uploadPassport() {
        const file = this.files.passport;
        if (!file) {
          this.error = 'Please select a file.';
          return;
        }
  
        this.uploading.passport = true;
  
        let formData = new FormData();
        formData.append('userfile', file);
  
        axios.post('/api/upload/passport', formData, {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
        })
        .then(response => {
          this.success = true;
          this.error = '';
          this.fetchFiles();
        })
        .catch(error =>
  this.success = false;
this.error = error.response.data.errors || 'An error occurred.';
})
.finally(() => {
this.uploading.passport = false;
});
},
uploadDriversLicense() {
const file = this.files.driversLicense;
if (!file) {
this.error = 'Please select a file.';
return;
}

this.uploading.driversLicense = true;

let formData = new FormData();
formData.append('userfile', file);

axios.post('/api/upload/driversLicense', formData, {
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
})
.finally(() => {
this.uploading.driversLicense = false;
});
},
fetchFiles() {
axios.get('/api/files')
.then(response => {
  this.uploadedFiles = response.data.map(file => ({
    name: file.name,
    url: '/uploads/' + file.name
  }));
})
.catch(error => {
  this.error = 'Failed to fetch files.';
  console.error(error);
});
},
downloadFile(filename) {
axios.get('/api/download/' + filename, {
responseType: 'blob'
})
.then(response => {
const url = window.URL.createObjectURL(new Blob([response.data]));
const link = document.createElement('a');
link.href = url;
link.setAttribute('download', filename);
document.body.appendChild(link);
link.click();
document.body.removeChild(link);
})
.catch(error => {
console.error(error);
});
}
},
created() {
this.fetchFiles();
}
}
</script>