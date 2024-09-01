<template>
    <v-app>
      <!-- Admin Navigation Drawer -->
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
  
      <!-- Admin App Bar -->
      <v-app-bar app>
        <div @mouseenter="onMouseEnter" @mouseleave="onMouseLeave">
          <v-app-bar-nav-icon v-if="!drawer"></v-app-bar-nav-icon>
        </div>
        <v-toolbar-title class="custom-title">PCGA</v-toolbar-title>
      </v-app-bar>
  
      <!-- Main Content (Updates Container) -->
      <v-main>
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
      </v-main>
    </v-app>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        drawer: true,
        hoverDelay: null,
        items: [
  { text: 'Dashboard', icon: 'mdi-view-dashboard', symbol: '$', route: '/Admin' },
  { text: 'Users', icon: 'mdi-account', symbol: 'U', route: '/users' },
  { text: 'Applicants data', icon: 'mdi-account-multiple', symbol: 'A', route: '/ApplicantsData' },
  { text: 'Updates and News Management', icon: 'mdi-newspaper', route: '/Updates&news' },
  { text: 'District Management', icon: 'mdi-cogs', route: '/ManageDistrict' },
  { text: 'Available Updates', icon: 'mdi-update', route: '/Availableupdates' },
  { text: 'Add Content', icon: 'mdi-plus', route: '/add-content' },
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
        this.toggleDropdown(null); // Close dropdown after edit
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
        this.toggleDropdown(null); // Close dropdown after cancel
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
      }
    }
  };
  </script>
  
  <style scoped>
  /* Styles for Updates Container */
  .updates-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f7f7f7;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }
  
  /* Rest of the styles remain unchanged */
  </style>
  
  
  <style scoped>
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

/* Dropdown styles */
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

  /* Main Content Styles */
  .overview {
    margin-top: 20px;
    text-align: center;
  }

  .info-card {
    cursor: pointer;
    margin: 10px;
    padding: 20px;
    border-radius: 10px;
    transition: background-color 0.3s ease-in-out;
  }

  .info-card:hover {
    background-color: #7986cb; /* Lighter blue on hover */
  }

  .selected-card {
    background-color: #303f9f; /* Darker blue for selected card */
  }

  .chart-container {
    margin-top: 20px;
  }

  /* Logout Button Styles */
  .v-btn {
    color: #ffffff; /* White button text color */
  }

  /* Global Styles */
  body {
    font-family: 'Roboto', sans-serif; /* Default font family */
    background-color: #fafafa; /* Light gray background color */
  }
</style>
