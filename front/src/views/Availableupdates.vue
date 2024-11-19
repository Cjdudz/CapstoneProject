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

      <div class="updates-container">
        <h1 class="updates-heading">Updates</h1>
        <ul class="updates-list">
          <li v-for="update in updates" :key="update.id" class="update-item">
            <div v-if="!update.editing" class="update-details">
              <h3 class="update-title">{{ update.title }}</h3>
              <p class="update-content">{{ update.content }}</p>
            </div>
            <div v-else class="edit-form">
              <form @submit.prevent="updateUpdate(update)">
                <input type="text" v-model="update.updatedTitle" placeholder="Enter title" class="update-input">
                <input type="text" v-model="update.updatedContent" placeholder="Enter content" class="update-input">
                <div class="button-group">
                  <button type="submit" class="update-button">Update</button>
                  <button @click="cancelEdit(update)" class="cancel-button">Cancel</button>
                </div>
              </form>
            </div>
            <div class="update-dropdown">
              <button @click="toggleDropdown(update.id)" class="dropdown-button">Actions</button>
              <ul v-if="activeDropdown === update.id" class="dropdown-menu">
                <li><button @click="editUpdate(update)" class="dropdown-item">Edit</button></li>
                <li><button @click="deleteUpdate(update.id)" class="dropdown-item">Delete</button></li>
              </ul>
            </div>
          </li>
        </ul>
        <form @submit.prevent="createUpdate" class="create-form">
          <input type="text" v-model="newUpdate.title" placeholder="Enter title" class="update-input">
          <input type="text" v-model="newUpdate.content" placeholder="Enter content" class="update-input">
          <button type="submit" class="create-button">Create Update</button>
        </form>
        <div v-if="errorMessage" class="error">{{ errorMessage }}</div>
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
      updates: [],
      newUpdate: {
        title: '',
        content: ''
      },
      activeDropdown: null,
      errorMessage: ''
    };
  },
  created() {
    this.fetchUpdates();
  },
  methods: {
    async fetchUpdates() {
      try {
        const response = await axios.get('/api/showupdate');
        this.updates = response.data;
      } catch (error) {
        console.error('Error fetching updates:', error);
        this.errorMessage = 'Failed to fetch updates.';
      }
    },
    async createUpdate() {
      try {
        const response = await axios.post('/api/Updates', this.newUpdate);
        this.updates.push(response.data);
        this.newUpdate.title = '';
        this.newUpdate.content = '';
      } catch (error) {
        console.error('Error creating update:', error);
        this.errorMessage = 'Failed to create update.';
      }
    },
    async editUpdate(update) {
      update.editing = true;
      update.updatedTitle = update.title;
      update.updatedContent = update.content;
      this.toggleDropdown(null);
    },
    async updateUpdate(update) {
      try {
        await axios.put(`/api/UpdateNews/${update.id}`, { 
          title: update.updatedTitle,
          content: update.updatedContent
        });
        update.title = update.updatedTitle;
        update.content = update.updatedContent;
        update.editing = false;
      } catch (error) {
        console.error('Error updating update:', error);
        this.errorMessage = 'Failed to update update.';
      }
    },
    cancelEdit(update) {
      update.editing = false;
      this.toggleDropdown(null);
    },
    async deleteUpdate(id) {
      try {
        await axios.delete(`/api/deletenews/${id}`);
        this.updates = this.updates.filter(update => update.id !== id);
      } catch (error) {
        console.error('Error deleting update:', error);
        this.errorMessage = 'Failed to delete update.';
      }
    },
    toggleDropdown(id) {
      this.activeDropdown = (this.activeDropdown === id) ? null : id;
    },
    navigateTo(route) {
      this.$router.push(route);
      this.drawer = false;
    },
    logout() {
      console.log('Logout button clicked');
      this.$router.push('/LoginComponent');
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

.updates-container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  background-color: #f7f7f7;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.updates-heading {
  font-size: 24px;
  margin-bottom: 20px;
  color: #333;
}

.updates-list {
  list-style-type: none;
  padding: 0;
}

.update-item {
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  padding: 20px;
  margin-bottom: 20px;
}

.update-details {
  margin-bottom: 10px;
}

.update-title {
  font-size: 20px;
  margin-bottom: 5px;
  color: #333;
}

.update-content {
  color: #666;
}

.edit-form {
  margin-top: 10px;
}

.update-input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-bottom: 10px;
}

.button-group {
  display: flex;
  align-items: center;
}

.update-button,
.cancel-button,
.create-button,
.edit-button,
.delete-button {
  padding: 10px 20px;
  margin-right: 10px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.update-button,
.edit-button {
  background-color: #4caf50;
  color: #fff;
}

.cancel-button,
.delete-button {
  background-color: #f44336;
  color: #fff;
}

.create-button {
  background-color: #2196f3;
  color: #fff;
}

.error {
  color: #f44336;
  margin-top: 10px;
}

.update-dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-button {
  background-color: #4caf50;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  padding: 10px 20px;
}

.dropdown-menu {
  position: absolute;
  background-color: #fff;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  list-style-type: none;
  padding: 0;
  border-radius: 5px;
}

.dropdown-item {
  color: #333;
  padding: 10px 20px;
  text-decoration: none;
  display: block;
}

.dropdown-item:hover {
  background-color: #f2f2f2;
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
}
</style>