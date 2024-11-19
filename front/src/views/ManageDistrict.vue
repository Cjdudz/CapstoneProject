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
          <a @click="navigateTo(item.route)" :class="{ 'active': $route.path === item.route }">
            <i :class="['fas', item.icon]"></i>
            <span>{{ item.text }}</span>
          </a>
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
        <h1 class="main-title">PCGA</h1>
      </header>

      <div class="admin-panel">
        <h2>Coast Guard Districts</h2>
        <div class="district-list">
          <div v-for="(district, index) in coastGuardDistricts" :key="index" class="district-card">
            <h3>{{ district.name }}</h3>
            <p>{{ district.description }}</p>
            <div class="district-actions">
              <button @click="editDistrict(index)" class="edit-btn">Edit</button>
              <button @click="deleteDistrict(index)" class="delete-btn">Delete</button>
            </div>
          </div>
        </div>

        <div class="add-district">
          <h3>Add New District</h3>
          <form @submit.prevent="addDistrict">
            <div class="form-group">
              <label for="districtName">District Name:</label>
              <input type="text" id="districtName" v-model.trim="newDistrict.name" required>
            </div>
            <div class="form-group">
              <label for="districtDescription">District Description:</label>
              <textarea id="districtDescription" v-model.trim="newDistrict.description" required></textarea>
            </div>
            <button type="submit" class="add-btn">Add District</button>
          </form>
        </div>

        <div v-if="isEditModalOpen" class="modal-overlay">
          <div class="modal">
            <h2>Edit District</h2>
            <form @submit.prevent="saveEditedDistrict">
              <div class="form-group">
                <label for="editDistrictName">District Name:</label>
                <input type="text" id="editDistrictName" v-model.trim="editedDistrict.name" required>
              </div>
              <div class="form-group">
                <label for="editDistrictDescription">District Description:</label>
                <textarea id="editDistrictDescription" v-model.trim="editedDistrict.description" required></textarea>
              </div>
              <div class="modal-actions">
                <button type="button" @click="closeEditModal" class="cancel-btn">Cancel</button>
                <button type="submit" class="save-btn">Save</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'AdminPanel',
  data() {
    return {
      drawer: true,
      items: [
        { text: 'Dashboard', icon: 'fa-tachometer-alt', route: '/Admin' },
        { text: 'Users', icon: 'fa-users', route: '/users' },
        { text: 'Applicants data', icon: 'fa-file-alt', route: '/fetchfile' },
        { text: 'Updates and News Management', icon: 'fa-newspaper', route: '/Updates&news' },
        { text: 'District Management', icon: 'fa-map-marker-alt', route: '/ManageDistrict' },
        { text: 'Available Updates', icon: 'fa-bell', route: '/Availableupdates' },
        { text: 'Add Content', icon: 'fa-plus-circle', route: '/add-content' },
      ],
      coastGuardDistricts: [],
      newDistrict: { name: '', description: '' },
      editedDistrict: { name: '', description: '' },
      isEditModalOpen: false,
      editedDistrictIndex: null
    };
  },
  mounted() {
    this.loadDistricts();
  },
  methods: {
    navigateTo(route) {
      this.$router.push(route);
      this.drawer = false;
    },
    logout() {
      console.log('Logout button clicked');
      this.$router.push('/LoginComponent');
    },
    async loadDistricts() {
      try {
        const response = await axios.get('/api/ShowDistricts');
        this.coastGuardDistricts = response.data;
      } catch (error) {
        console.error('Error loading districts:', error);
      }
    },
    editDistrict(index) {
      this.editedDistrict = { ...this.coastGuardDistricts[index] };
      this.editedDistrictIndex = index;
      this.isEditModalOpen = true;
    },
    closeEditModal() {
      this.isEditModalOpen = false;
    },
    async saveEditedDistrict() {
      if (this.editedDistrict.name.trim() !== '') {
        try {
          await axios.put(`/api/UpdateDistrict/${this.coastGuardDistricts[this.editedDistrictIndex].id}`, this.editedDistrict);
          await this.loadDistricts();
          this.closeEditModal();
        } catch (error) {
          console.error('Error saving edited district:', error);
        }
      }
    },
    async deleteDistrict(index) {
      if (confirm('Are you sure you want to delete this district?')) {
        try {
          await axios.delete(`/api/DeleteDistrict/${this.coastGuardDistricts[index].id}`);
          await this.loadDistricts();
        } catch (error) {
          console.error('Error deleting district:', error);
        }
      }
    },
    async addDistrict() {
      if (this.newDistrict.name.trim() !== '') {
        try {
          await axios.post('/api/CreateDistrict', this.newDistrict);
          await this.loadDistricts();
          this.newDistrict = { name: '', description: '' };
        } catch (error) {
          console.error('Error adding district:', error);
        }
      }
    }
  }
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
.sidebar-menu li a.active {
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

.admin-panel {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

.admin-panel h2 {
  margin-bottom: 20px;
  color: #1a237e;
}

.district-list {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 20px;
  margin-bottom: 40px;
}

.district-card {
  background-color: #ffffff;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.district-card h3 {
  margin-top: 0;
  color: #1a237e;
}

.district-actions {
  display: flex;
  justify-content: flex-end;
  margin-top: 15px;
}

.edit-btn,
.delete-btn,
.add-btn,
.save-btn,
.cancel-btn {
  padding: 8px 16px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
  transition: background-color 0.2s;
}

.edit-btn {
  background-color: #4caf50;
  color: #ffffff;
  margin-right: 8px;
}

.delete-btn {
  background-color: #f44336;
  color: #ffffff;
}

.add-btn,
.save-btn {
  background-color: #2196f3;
  color: #ffffff;
}

.cancel-btn {
  background-color: #9e9e9e;
  color: #ffffff;
  margin-right: 8px;
}

.edit-btn:hover,
.delete-btn:hover,
.add-btn:hover,
.save-btn:hover,
.cancel-btn:hover {
  opacity: 0.9;
}

.add-district {
  background-color: #ffffff;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.add-district h3 {
  margin-top: 0;
  color: #1a237e;
}

.form-group {
  margin-bottom: 15px;
}

.form-group label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
  color: #333333;
}

.form-group input,
.form-group textarea {
  width: 100%;
  padding: 8px;
  border: 1px solid #cccccc;
  border-radius: 4px;
  font-size: 14px;
}

.modal-overlay {
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

.modal {
  background-color: #ffffff;
  border-radius: 8px;
  padding: 20px;
  width: 100%;
  max-width: 500px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.modal h2 {
  margin-top: 0;
  color: #1a237e;
}

.modal-actions {
  display: flex;
  justify-content: flex-end;
  margin-top: 20px;
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

  .district-list {
    grid-template-columns: 1fr;
  }
}
</style>