<template>
  <div>
    <v-navigation-drawer app v-model="drawer">
      <v-list>
        <!-- Navigation items -->
        <v-list-item v-for="(item, index) in items" :key="index" link>
          <v-list-item-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title @click="navigateTo(item.route)">
              {{ item.text }}
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <!-- Logout Button -->
        <v-list-item>
          <v-row>
            <v-col>
              <v-list-item-action>
                <v-btn icon @click="logout">
                  <v-icon>mdi-logout</v-icon>
                </v-btn>
              </v-list-item-action>
            </v-col>
          </v-row>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app>
      <div @mouseenter="onMouseEnter" @mouseleave="onMouseLeave">
        <v-app-bar-nav-icon v-if="!drawer"></v-app-bar-nav-icon>
      </div>
      <v-toolbar-title class="custom-title">PCGA</v-toolbar-title>
    </v-app-bar>

    <v-main>
      <v-container>
        <!-- Admin Panel Content -->
        <div class="admin-panel">
          <h2>Coast Guard Districts</h2>
          <ul class="district-list">
            <li v-for="(district, index) in coastGuardDistricts" :key="index" class="district-item">
              <span class="district-name">{{ district.name }}</span>
              <span class="district-name">{{ district.description }}</span>
              <button @click="editDistrict(index)" class="edit-btn">Edit</button>
              <button @click="deleteDistrict(index)" class="delete-btn">Delete</button>
            </li>
          </ul>

          <h3>Add New District</h3>
          <form @submit.prevent="addDistrict" class="add-district-form">
            <label for="newDistrictName">District Name:</label>
            <input type="text" id="newDistrictName" v-model.trim="newDistrict.name" required class="input-field">
            <label for="newDistrictDescription">District Description:</label>
            <input type="text" id="newDistrictDescription" v-model.trim="newDistrict.description" class="input-field">
            <button type="submit" class="submit-btn">Add District</button>
          </form>

          <!-- Edit District Modal -->
          <div v-if="isEditModalOpen" class="modal">
            <div class="modal-content">
              <span class="close" @click="closeEditModal">&times;</span>
              <h3>Edit District</h3>
              <label for="editDistrictName">District Name:</label>
              <input type="text" id="editDistrictName" v-model.trim="editedDistrict.name" required class="input-field">
              <label for="editDistrictDescription">District Description:</label>
              <input type="text" id="editDistrictDescription" v-model.trim="editedDistrict.description" class="input-field">
              <button @click="saveEditedDistrict" class="submit-btn">Save</button>
            </div>
          </div>
        </div>
      </v-container>
    </v-main>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      drawer: true,
      items: [
      { text: 'Dashboard', icon: 'mdi-view-dashboard', symbol: '$', route: '/Admin' },
  { text: 'Users', icon: 'mdi-account', symbol: 'U', route: '/users' },
  { text: 'Applicants data', icon: 'mdi-account-multiple', symbol: 'A', route: '/ApplicantsData' },
  { text: 'Updates and News Management', icon: 'mdi-newspaper', route: '/Updates&news' },
  { text: 'District Management', icon: 'mdi-cogs', route: '/ManageDistrict' },
  { text: 'Available Updates', icon: 'mdi-update', route: '/Availableupdates' },
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
    onMouseEnter() {
      this.hoverDelay = setTimeout(() => {
        this.drawer = true;
      }, 200);
    },
    onMouseLeave() {
      clearTimeout(this.hoverDelay);
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
      this.openEditModal();
    },
    openEditModal() {
      this.isEditModalOpen = true;
    },
    closeEditModal() {
      this.isEditModalOpen = false;
    },
    async saveEditedDistrict() {
      if (this.editedDistrict.name.trim() !== '') {
        try {
          await axios.put(`/api/UpdateDistrict/${this.coastGuardDistricts[this.editedDistrictIndex].id}`, this.editedDistrict);
          this.loadDistricts();
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
          this.loadDistricts();
        } catch (error) {
          console.error('Error deleting district:', error);
        }
      }
    },
    async addDistrict() {
      if (this.newDistrict.name.trim() !== '') {
        try {
          await axios.post('/api/CreateDistrict', this.newDistrict);
          this.loadDistricts();
          this.newDistrict = { name: '', description: '' }; // Clear input fields after adding
        } catch (error) {
          console.error('Error adding district:', error);
        }
      }
    }
  }
};
</script>

<style scoped>
/* Navigation Drawer Styles */
.v-navigation-drawer {
  background-color: #1a237e; /* Dark blue background color */
  color: white;
}

.v-list-item {
  border-bottom: 1px solid #3949ab; /* Dark blue border between items */
}

.v-list-item-title {
  color: white;
  font-weight: bold;
}

/* App Bar Styles */
.v-app-bar {
  background-color: #283593; /* Darker blue app bar */
  color: white;
}

.custom-title {
  font-family: 'Pacifico', cursive; /* Custom font for the title */
  font-size: 24px;
}

/* Admin Panel Styles */
.admin-panel {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

.district-list {
  list-style: none;
  padding: 0;
}

.district-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid #ddd;
  padding: 10px 0;
}

.district-name {
  flex: 1;
}

.edit-btn,
.delete-btn {
  background-color: #007bff;
  color: #fff;
  border: none;
  padding: 5px 10px;
  border-radius: 5px;
  cursor: pointer;
}

.add-district-form {
  margin-top: 20px;
}

.input-field {
  width: 100%;
  padding: 8px;
  margin-bottom: 10px;
}

.submit-btn {
  background-color: #28a745;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}

.modal {
  display: block;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 60%;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
}
</style>
