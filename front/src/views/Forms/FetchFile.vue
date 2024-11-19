<template>
  <div class="admin-panel-container">
    <nav class="sidebar" :class="{ 'sidebar-open': drawer }">
      <div class="sidebar-header">
        <h2 class="sidebar-title">Admin Panel</h2>
        <button @click="drawer = !drawer" class="sidebar-toggle">
          <i class="fas fa-bars"></i>
        </button>
      </div>
      <ul class="sidebar-menu">
        <li v-for="(item, index) in items" :key="index">
          <router-link :to="item.route" :class="{ 'active': $route.path === item.route }">
            <i :class="['fas', item.icon]"></i>
            <span>{{ item.text }}</span>
          </router-link>
        </li>
      </ul>
      <button @click="logout" class="logout-btn">
        <i class="fas fa-sign-out-alt"></i>
        <span>Logout</span>
      </button>
    </nav>

    <div class="main-content">
      <header class="main-header">
        <button @click="drawer = !drawer" class="sidebar-toggle-mobile">
          <i class="fas fa-bars"></i>
        </button>
        <h1 class="main-title">PCGA Admin Dashboard</h1>
      </header>

      <div class="applicant-management">
        <h2 class="section-title">Applicant Management</h2>
        <form @submit.prevent="fetchApplicantData" class="search-form">
          <div class="form-group">
            <label for="applicantId">Enter Applicant ID:</label>
            <input
              type="text"
              id="applicantId"
              v-model="applicantId"
              required
              :disabled="loading"
              @keyup.enter="fetchApplicantData"
            >
          </div>
          <button type="submit" :disabled="loading" class="fetch-btn">
            <i class="fas fa-search"></i> Fetch Data
          </button>
        </form>

        <div v-if="loading" class="loading-indicator">
          <div class="progress-bar"></div>
          <p>Loading applicant data...</p>
        </div>

        <div v-if="error" class="error-message">
          {{ error }}
        </div>

        <div v-if="applicantData" class="applicant-data">
          <div class="personal-info">
            <h3>Personal Information</h3>
            <div class="info-grid">
              <div v-for="(value, key) in applicantData.personalInfo" :key="key" class="info-item">
                <span class="info-label">{{ formatFieldName(key) }}:</span>
                <span class="info-value">{{ value }}</span>
              </div>
            </div>
          </div>

          <div class="data-sections">
            <div class="tab-buttons">
              <button
                v-for="(section, key) in applicantData"
                :key="key"
                v-if="key !== 'personalInfo'"
                @click="activeTab = key"
                :class="{ 'active': activeTab === key }"
                class="tab-btn"
              >
                {{ formatSectionTitle(key) }}
              </button>
            </div>

            <div v-for="(section, key) in applicantData" :key="key" v-if="key !== 'personalInfo'" class="tab-content">
              <div v-if="activeTab === key">
                <h3>{{ formatSectionTitle(key) }}</h3>
                <table v-if="section && Object.keys(section).length" class="data-table">
                  <thead>
                    <tr>
                      <th v-for="header in getHeaders(section)" :key="header.value">{{ header.text }}</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td v-for="header in getHeaders(section)" :key="header.value">{{ section[header.value] }}</td>
                    </tr>
                  </tbody>
                </table>
                <p v-else class="no-data">No data available for this section</p>
              </div>
            </div>
          </div>

          <div class="action-buttons">
            <button @click="showConfirmDialog('reject')" :disabled="actionLoading" class="reject-btn">
              <i class="fas fa-times-circle"></i> Reject
            </button>
            <button @click="showConfirmDialog('accept')" :disabled="actionLoading" class="accept-btn">
              <i class="fas fa-check-circle"></i> Accept
            </button>
          </div>
        </div>

        <div v-if="!loading && !error && !applicantData" class="no-data-message">
          No applicant data available. Please enter an Applicant ID and click "Fetch Data".
        </div>
      </div>
    </div>

    <div v-if="confirmDialog" class="modal">
      <div class="modal-content">
        <h2>Confirm Action</h2>
        <p>Are you sure you want to {{ confirmAction }} this applicant?</p>
        <div class="modal-actions">
          <button @click="confirmDialog = false" class="cancel-btn">Cancel</button>
          <button
            @click="confirmAction === 'accept' ? acceptApplicant() : rejectApplicant()"
            :class="confirmAction === 'accept' ? 'accept-btn' : 'reject-btn'"
          >
            Confirm
          </button>
        </div>
      </div>
    </div>

    <div v-if="snackbar.show" :class="['snackbar', snackbar.color]">
      {{ snackbar.text }}
      <button @click="snackbar.show = false" class="close-btn">
        <i class="fas fa-times"></i>
      </button>
    </div>

    <div v-if="fileDialog.show" class="modal">
      <div class="modal-content">
        <h2>Uploaded Files</h2>
        <ul class="file-list">
          <li v-for="file in fileDialog.files" :key="file.name" class="file-item">
            <i class="fas fa-file-alt"></i>
            <span class="file-name">{{ file.name }}</span>
            <span class="file-size">{{ file.size }}</span>
          </li>
        </ul>
        <button @click="fileDialog.show = false" class="close-btn">Close</button>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, reactive } from 'vue';
import { useRouter } from 'vue-router';
import axios from 'axios';

export default {
  name: 'AdminPanel',
  setup() {
    const router = useRouter();
    const drawer = ref(true);
    const items = reactive([
      { text: 'Dashboard', icon: 'fa-tachometer-alt', route: '/admin' },
      { text: 'Users', icon: 'fa-users', route: '/users' },
      { text: 'Applicants data', icon: 'fa-file-alt', route: '/fetchfile' },
      { text: 'Updates and News Management', icon: 'fa-newspaper', route: '/Updates&news' },
      { text: 'District Management', icon: 'fa-map-marker-alt', route: '/managedistrict' },
      { text: 'Available Updates', icon: 'fa-bell', route: '/availableupdates' },
      { text: 'Add Content', icon: 'fa-plus-circle', route: '/add-content' },
    ]);

    const applicantData = ref(null);
    const loading = ref(false);
    const actionLoading = ref(false);
    const error = ref(null);
    const applicantId = ref('');
    const activeTab = ref(null);
    const confirmDialog = ref(false);
    const confirmAction = ref('');
    const snackbar = reactive({
      show: false,
      text: '',
      color: '',
    });
    const fileDialog = reactive({
      show: false,
      files: [],
    });

    const logout = () => {
      // Implement logout logic here
      console.log('Logging out');
      // After logout, redirect to login page
      router.push('/');
    };

    const fetchApplicantData = async () => {
      if (!applicantId.value) {
        error.value = 'Please enter an Applicant ID.';
        return;
      }

      loading.value = true;
      error.value = null;
      applicantData.value = null;

      try {
        const response = await axios.get(`/api/applicant/${applicantId.value}`);
        applicantData.value = response.data;
        activeTab.value = Object.keys(response.data).find(key => key !== 'personalInfo');
      } catch (err) {
        console.error('Error fetching applicant data:', err);
        error.value = 'An error occurred while fetching applicant data. Please try again later.';
      } finally {
        loading.value = false;
      }
    };

    const showConfirmDialog = (action) => {
      confirmAction.value = action;
      confirmDialog.value = true;
    };

    const acceptApplicant = async () => {
      confirmDialog.value = false;
      actionLoading.value = true;
      try {
        const response = await axios.post(`/api/applicant1/${applicantId.value}/accept`);
        showSnackbar('Applicant accepted successfully!', 'success');
        applicantData.value = null;
        applicantId.value = '';
        if (response.data.files && response.data.files.length > 0) {
          fileDialog.files = response.data.files;
          fileDialog.show = true;
        }
      } catch (err) {
        console.error('Error accepting applicant:', err);
        showSnackbar('An error occurred while accepting the applicant. Please try again.', 'error');
      } finally {
        actionLoading.value = false;
      }
    };

    const rejectApplicant = async () => {
      confirmDialog.value = false;
      actionLoading.value = true;
      try {
        const response = await axios.post(`/api/applicant2/${applicantId.value}/reject`);
        showSnackbar('Applicant rejected successfully!', 'success');
        applicantData.value = null;
        applicantId.value = '';
        if (response.data.files && response.data.files.length > 0) {
          fileDialog.files = response.data.files;
          fileDialog.show = true;
        }
      } catch (err) {
        console.error('Error rejecting applicant:', err);
        showSnackbar('An error occurred while rejecting the applicant. Please try again.', 'error');
      } finally {
        actionLoading.value = false;
      }
    };

    const showSnackbar = (text, color) => {
      snackbar.text = text;
      snackbar.color = color;
      snackbar.show = true;
      setTimeout(() => {
        snackbar.show = false;
      }, 3000);
    };

    const formatSectionTitle = (key) => {
      return key.replace(/([A-Z])/g, ' $1').trim();
    };

    const formatFieldName = (field) => {
      return field.charAt(0).toUpperCase() + field.slice(1).replace(/([A-Z])/g, ' $1').toLowerCase().trim();
    };

    const getHeaders = (section) => {
      return Object.keys(section).map(key => ({
        text: formatFieldName(key),
        value: key,
      }));
    };

    return {
      drawer,
      items,
      applicantData,
      loading,
      actionLoading,
      error,
      applicantId,
      activeTab,
      confirmDialog,
      confirmAction,
      snackbar,
      fileDialog,
      logout,
      fetchApplicantData,
      showConfirmDialog,
      acceptApplicant,
      rejectApplicant,
      formatSectionTitle,
      formatFieldName,
      getHeaders,
    };
  },
};
</script>

<style scoped>
.admin-panel-container {
  display: flex;
  min-height: 100vh;
  font-family: 'Roboto', sans-serif;
  background-color: #f0f4f8;
}

.sidebar {
  width: 280px;
  background-color: #1a237e;
  color: #ffffff;
  transition: transform 0.3s ease;
  overflow-y: auto;
}

.sidebar-header {
  padding: 1.5rem;
  background-color: #0d47a1;
}

.sidebar-title {
  font-size: 1.5rem;
  font-weight: bold;
}

.sidebar-toggle {
  display: none;
}

.sidebar-menu {
  list-style-type: none;
  padding: 0;
}

.sidebar-menu li a {
  display: flex;
  align-items: center;
  padding: 1rem 1.5rem;
  color: #ffffff;
  text-decoration: none;
  transition: background-color 0.2s;
  cursor: pointer;
}

.sidebar-menu li a:hover,
.sidebar-menu li a.active,
.sidebar-menu li a.router-link-active {
  background-color: #283593;
}

.sidebar-menu li a i {
  margin-right: 0.75rem;
  font-size: 1.25rem;
  width: 1.5rem;
  text-align: center;
}

.logout-btn {
  display: flex;
  align-items: center;
  width: 100%;
  padding: 1rem 1.5rem;
  background-color: #c62828;
  color: #ffffff;
  border: none;
  cursor: pointer;
  transition: background-color 0.2s;
}

.logout-btn:hover {
  background-color: #b71c1c;
}

.logout-btn i {
  margin-right: 0.75rem;
  font-size: 1.25rem;
}

.main-content {
  flex: 1;
  padding: 2rem;
  overflow-y: auto;
}

.main-header {
  display: flex;
  align-items: center;
  margin-bottom: 2rem;
  background-color: #ffffff;
  padding: 1rem;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.sidebar-toggle-mobile {
  display: none;
}

.main-title {
  font-size: 2rem;
  color: #1a237e;
  margin: 0;
}

.applicant-management {
  background-color: #ffffff;
  border-radius: 8px;
  padding: 2rem;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.section-title {
  
  font-size: 1.5rem;
  color: #1a237e;
  margin-bottom: 1.5rem;
}

.search-form {
  display: flex;
  gap: 1rem;
  margin-bottom: 2rem;
}

.form-group {
  flex: 1;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
}

.form-group input {
  width: 100%;
  padding: 0.5rem;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.fetch-btn {
  padding: 0.5rem 1rem;
  background-color: #1a237e;
  color: #ffffff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.fetch-btn:hover {
  background-color: #283593;
}

.loading-indicator {
  text-align: center;
  margin: 2rem 0;
}

.progress-bar {
  width: 100%;
  height: 4px;
  background-color: #e0e0e0;
  border-radius: 2px;
  overflow: hidden;
}

.progress-bar::after {
  content: '';
  display: block;
  width: 30%;
  height: 100%;
  background-color: #1a237e;
  animation: loading 1.5s infinite;
}

@keyframes loading {
  0% {
    transform: translateX(-100%);
  }
  100% {
    transform: translateX(300%);
  }
}

.error-message {
  background-color: #ffebee;
  color: #c62828;
  padding: 1rem;
  border-radius: 4px;
  margin-bottom: 1rem;
}

.applicant-data {
  margin-top: 2rem;
}

.personal-info {
  background-color: #e8eaf6;
  padding: 1rem;
  border-radius: 4px;
  margin-bottom: 2rem;
}

.info-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 1rem;
}

.info-item {
  background-color: #ffffff;
  padding: 0.5rem;
  border-radius: 4px;
}

.info-label {
  font-weight: bold;
  color: #1a237e;
}

.data-sections {
  margin-top: 2rem;
}

.tab-buttons {
  display: flex;
  gap: 0.5rem;
  margin-bottom: 1rem;
}

.tab-btn {
  padding: 0.5rem 1rem;
  background-color: #e8eaf6;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.tab-btn.active {
  background-color: #1a237e;
  color: #ffffff;
}

.tab-content {
  background-color: #ffffff;
  padding: 1rem;
  border-radius: 4px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.data-table {
  width: 100%;
  border-collapse: collapse;
}

.data-table th,
.data-table td {
  padding: 0.5rem;
  text-align: left;
  border-bottom: 1px solid #e0e0e0;
}

.data-table th {
  background-color: #e8eaf6;
  font-weight: bold;
  color: #1a237e;
}

.no-data {
  text-align: center;
  color: #757575;
  font-style: italic;
}

.action-buttons {
  display: flex;
  justify-content: flex-end;
  gap: 1rem;
  margin-top: 2rem;
}

.reject-btn,
.accept-btn {
  padding: 0.5rem 1rem;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.reject-btn {
  background-color: #c62828;
  color: #ffffff;
}

.reject-btn:hover {
  background-color: #b71c1c;
}

.accept-btn {
  background-color: #2e7d32;
  color: #ffffff;
}

.accept-btn:hover {
  background-color: #1b5e20;
}

.modal {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.modal-content {
  background-color: #ffffff;
  padding: 2rem;
  border-radius: 8px;
  max-width: 500px;
  width: 100%;
}

.modal-actions {
  display: flex;
  justify-content: flex-end;
  gap: 1rem;
  margin-top: 1rem;
}

.snackbar {
  position: fixed;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  padding: 1rem;
  border-radius: 4px;
  color: #ffffff;
  z-index: 1000;
}

.snackbar.success {
  background-color: #43a047;
}

.snackbar.error {
  background-color: #e53935;
}

.close-btn {
  background: none;
  border: none;
  color: #ffffff;
  cursor: pointer;
  margin-left: 1rem;
}

.file-list {
  list-style-type: none;
  padding: 0;
}

.file-item {
  display: flex;
  align-items: center;
  padding: 0.5rem;
  border-bottom: 1px solid #e0e0e0;
}

.file-item i {
  margin-right: 0.5rem;
  color: #1a237e;
}

.file-name {
  flex: 1;
}

.file-size {
  color: #757575;
  font-size: 0.875rem;
}

@media (max-width: 768px) {
  .sidebar {
    position: fixed;
    top: 0;
    left: 0;
    bottom: 0;
    z-index: 1000;
    transform: translateX(-100%);
  }

  .sidebar-open {
    transform: translateX(0);
  }

  .sidebar-toggle,
  .sidebar-toggle-mobile {
    display: block;
    background: none;
    border: none;
    color: #ffffff;
    font-size: 1.5rem;
    cursor: pointer;
  }

  .sidebar-toggle-mobile {
    color: #1a237e;
    margin-right: 1rem;
  }

  .main-content {
    padding: 1rem;
  }

  .main-title {
    font-size: 1.5rem;
  }

  .search-form {
    flex-direction: column;
  }

  .info-grid {
    grid-template-columns: 1fr;
  }

  .tab-buttons {
    flex-wrap: wrap;
  }
}
</style>