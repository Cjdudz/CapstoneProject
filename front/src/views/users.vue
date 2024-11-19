<template>
  <div class="user-management">
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

    <main class="main-content">
      <header class="main-header">
        <button @click="drawer = !drawer" class="sidebar-toggle-mobile">
          <i class="fas fa-bars"></i>
        </button>
        <h1 class="main-title">User Management</h1>
      </header>

      <div class="user-list">
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>Role</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="user in users" :key="user.id">
              <td>{{ user.id }}</td>
              <td>
                <div class="user-info">
                  <img :src="user.avatar || `https://ui-avatars.com/api/?name=${encodeURIComponent(user.username)}&background=random`" :alt="user.username" class="user-avatar">
                  <span>{{ user.username }}</span>
                </div>
              </td>
              <td>{{ user.role }}</td>
              <td>
                <button @click="editUser(user)" class="edit-btn">
                  <i class="fas fa-edit"></i> Edit
                </button>
                <button @click="deleteUser(user)" class="delete-btn">
                  <i class="fas fa-trash-alt"></i> Delete
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </main>

    <transition name="fade">
      <div v-if="editMode" class="modal-overlay">
        <div class="modal">
          <h2 class="modal-title">Edit User</h2>
          <form @submit.prevent="updateUser">
            <div class="form-group">
              <label for="username">Username:</label>
              <input type="text" id="username" v-model="editedUserName" required>
            </div>
            <div class="form-group">
              <label for="role">Role:</label>
              <input type="text" id="role" v-model="editedUserRole" required>
            </div>
            <div class="form-actions">
              <button type="submit" class="update-btn">Update User</button>
              <button type="button" @click="cancelEdit" class="cancel-btn">Cancel</button>
            </div>
          </form>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
import axios from 'axios';

export default {
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
      users: [],
      editMode: false,
      editedUserId: null,
      editedUserName: '',
      editedUserRole: '',
    };
  },
  mounted() {
    this.getUsers();
  },
  methods: {
    cancelEdit() {
      console.log('Editing canceled!');
      this.editMode = false;
    },
    editUser(user) {
      this.editMode = true;
      this.editedUserId = user.id;
      this.editedUserName = user.username;
      this.editedUserRole = user.role;
    },
    updateUser() {
      const data = {
        username: this.editedUserName,
        role: this.editedUserRole,
      };
      axios.put(`/api/update_user/${this.editedUserId}`, data)
        .then((response) => {
          this.getUsers();
          this.editMode = false;
          this.editedUserId = null;
          this.editedUserName = '';
          this.editedUserRole = '';
        })
        .catch((error) => {
          console.error('Error updating user:', error);
        });
    },
    getUsers() {
      axios.get('/api/users')
        .then((response) => {
          this.users = response.data;
        });
    },
    deleteUser(user) {
      axios.delete(`/api/delete/${user.id}`)
        .then((response) => {
          this.getUsers();
        })
        .catch((error) => {
          console.error('Error deleting user:', error);
        });
    },
    onMouseEnter() {
      this.drawer = true;
    },
    onMouseLeave() {
      this.drawer = false;
    },
    logout() {
      console.log('Logout button clicked');
      this.$router.push('/LoginComponent');
    },
    navigateTo(route) {
      this.$router.push(route);
      this.drawer = false;
    },
  },
};
</script>

<style scoped>
.user-management {
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

.user-list table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0 0.5rem;
  background-color: transparent;
}

.user-list th,
.user-list td {
  padding: 1rem;
  text-align: left;
  background-color: #ffffff;
}

.user-list th {
  background-color: #3f51b5;
  color: #ffffff;
  font-weight: bold;
  text-transform: uppercase;
}

.user-list tr:nth-child(even) td {
  background-color: #e8eaf6;
}

.user-info {
  display: flex;
  align-items: center;
}

.user-avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  margin-right: 0.75rem;
  object-fit: cover;
}

.edit-btn,
.delete-btn {
  padding: 0.5rem 1rem;
  margin: 0 0.25rem;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.2s;
  font-weight: bold;
}

.edit-btn {
  background-color: #4caf50;
  color: #ffffff;
}

.edit-btn:hover {
  background-color: #45a049;
}

.delete-btn {
  background-color: #f44336;
  color: #ffffff;
}

.delete-btn:hover {
  background-color: #d32f2f;
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
  padding: 2rem;
  border-radius: 8px;
  width: 100%;
  max-width: 400px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.modal-title {
  font-size: 1.5rem;
  margin-bottom: 1.5rem;
  color: #1a237e;
}

.form-group {
  margin-bottom: 1.5rem;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
  color: #333333;
  font-weight: bold;
}

.form-group input {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #cccccc;
  border-radius: 4px;
  font-size: 1rem;
}

.form-actions {
  display: flex;
  justify-content: flex-end;
  gap: 1rem;
}

.update-btn,
.cancel-btn {
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.2s;
  font-weight: bold;
}

.update-btn {
  background-color: #4caf50;
  color: #ffffff;
}

.update-btn:hover {
  background-color: #45a049;
}

.cancel-btn {
  background-color: #9e9e9e;
  color: #ffffff;
}

.cancel-btn:hover {
  background-color: #757575;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
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

  .user-list th,
  .user-list td {
    padding: 0.75rem;
  }

  .edit-btn,
  .delete-btn {
    padding: 0.4rem 0.8rem;
    font-size: 0.9rem;
  }
}
</style>