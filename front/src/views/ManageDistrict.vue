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
  { text: 'Add Content', icon: 'mdi-plus', route: '/add-content' },
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
          <v-list-item-action>
            <v-btn icon @click="logout">
              <v-icon>mdi-logout</v-icon>
            </v-btn>
          </v-list-item-action>
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
          <v-row>
            <v-col v-for="(district, index) in coastGuardDistricts" :key="index" cols="12" md="6">
              <v-card>
                <v-card-title>{{ district.name }}</v-card-title>
                <v-card-subtitle>{{ district.description }}</v-card-subtitle>
                <v-card-actions>
                  <v-btn small @click="editDistrict(index)" color="primary">Edit</v-btn>
                  <v-btn small @click="deleteDistrict(index)" color="red">Delete</v-btn>
                </v-card-actions>
              </v-card>
            </v-col>
          </v-row>

          <v-divider class="my-5"></v-divider>

          <h3>Add New District</h3>
          <v-form @submit.prevent="addDistrict">
            <v-text-field
              label="District Name"
              v-model.trim="newDistrict.name"
              required
              class="mb-3"
            ></v-text-field>
            <v-text-field
              label="District Description"
              v-model.trim="newDistrict.description"
              required
              class="mb-3"
            ></v-text-field>
            <v-btn type="submit" color="success">Add District</v-btn>
          </v-form>

          <!-- Edit District Modal -->
          <v-dialog v-model="isEditModalOpen" persistent max-width="600px">
            <v-card>
              <v-card-title>Edit District</v-card-title>
              <v-card-text>
                <v-form>
                  <v-text-field
                    label="District Name"
                    v-model.trim="editedDistrict.name"
                    required
                  ></v-text-field>
                  <v-text-field
                    label="District Description"
                    v-model.trim="editedDistrict.description"
                  ></v-text-field>
                </v-form>
              </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn text @click="closeEditModal">Cancel</v-btn>
                <v-btn text color="primary" @click="saveEditedDistrict">Save</v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </div>
      </v-container>
    </v-main>
  </div>
</template>

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

.v-card {
  margin-bottom: 16px;
}

.v-btn {
  margin-right: 8px;
}

.v-divider {
  margin-top: 32px;
  margin-bottom: 32px;
}

</style>