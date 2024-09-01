<template>
  <v-app>
    <!-- Navigation Drawer -->
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

    <!-- App Bar -->
    <v-app-bar app>
      <div @mouseenter="onMouseEnter" @mouseleave="onMouseLeave">
        <v-app-bar-nav-icon v-if="!drawer"></v-app-bar-nav-icon>
      </div>
      <v-toolbar-title class="custom-title">PCGA</v-toolbar-title>
    </v-app-bar>

    <!-- Main Content -->
    <v-main>
      <v-container>
        <!-- CRUD Operations Section -->
        <v-row>
          <!-- Add Content Form -->
          <v-col cols="12" md="6">
            <v-card class="crud-card">
              <v-card-title>Add New Item</v-card-title>
              <v-form @submit.prevent="addItem">
                <v-text-field v-model="newItem.name" label="Item Name" required></v-text-field>
                <v-text-field v-model="newItem.description" label="Description" required></v-text-field>
                <v-btn type="submit" color="primary">Add Item</v-btn>
              </v-form>
            </v-card>
          </v-col>

          <!-- Display Content List -->
          <v-col cols="12" md="6">
            <v-card class="crud-card">
              <v-card-title>Items List</v-card-title>
              <v-list>
                <v-list-item-group v-for="(item, index) in itemsList" :key="index">
                  <v-list-item>
                    <v-list-item-content>
                      <v-list-item-title>{{ item.name }}</v-list-item-title>
                      <v-list-item-subtitle>{{ item.description }}</v-list-item-subtitle>
                    </v-list-item-content>
                    <v-list-item-action>
                      <v-btn @click="editItem(item)" icon>
                        <v-icon>mdi-pencil</v-icon>
                      </v-btn>
                      <v-btn @click="deleteItem(item.id)" icon>
                        <v-icon>mdi-delete</v-icon>
                      </v-btn>
                    </v-list-item-action>
                  </v-list-item>
                </v-list-item-group>
              </v-list>
            </v-card>
          </v-col>
        </v-row>

        <!-- Edit Content Form -->
        <v-dialog v-model="editDialog" max-width="500px">
          <v-card>
            <v-card-title>Edit Item</v-card-title>
            <v-form @submit.prevent="updateItem">
              <v-text-field v-model="selectedItem.name" label="Item Name" required></v-text-field>
              <v-text-field v-model="selectedItem.description" label="Description" required></v-text-field>
              <v-card-actions>
                <v-btn @click="editDialog = false">Cancel</v-btn>
                <v-btn type="submit" color="primary">Save Changes</v-btn>
              </v-card-actions>
            </v-form>
          </v-card>
        </v-dialog>
      </v-container>
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
        { text: 'Add Content', icon: 'mdi-plus', route: '/Addcontent' },
      ],
      newItem: {
        name: '',
        description: ''
      },
      itemsList: [], // Replace with your data source
      selectedItem: null,
      editDialog: false,
    };
  },
  mounted() {
    this.fetchItems();
  },
  methods: {
    fetchItems() {
      // Fetch items from your API or data source
      axios.get('/api/items')
        .then(response => {
          this.itemsList = response.data;
        })
        .catch(error => {
          console.error('Error fetching items:', error);
        });
    },
    addItem() {
      if (this.newItem.name && this.newItem.description) {
        // Add the new item to the list
        axios.post('/api/items', this.newItem)
          .then(response => {
            this.itemsList.push(response.data);
            this.newItem.name = '';
            this.newItem.description = '';
          })
          .catch(error => {
            console.error('Error adding item:', error);
          });
      }
    },
    editItem(item) {
      this.selectedItem = { ...item };
      this.editDialog = true;
    },
    updateItem() {
      axios.put(`/api/items/${this.selectedItem.id}`, this.selectedItem)
        .then(() => {
          const index = this.itemsList.findIndex(item => item.id === this.selectedItem.id);
          if (index !== -1) {
            this.itemsList.splice(index, 1, { ...this.selectedItem });
            this.editDialog = false;
          }
        })
        .catch(error => {
          console.error('Error updating item:', error);
        });
    },
    deleteItem(id) {
      axios.delete(`/api/items/${id}`)
        .then(() => {
          const index = this.itemsList.findIndex(item => item.id === id);
          if (index !== -1) {
            this.itemsList.splice(index, 1);
          }
        })
        .catch(error => {
          console.error('Error deleting item:', error);
        });
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
      // Clear the authentication token from session storage
      sessionStorage.removeItem('token');

      // Clear the authentication token from HttpOnly cookie
      document.cookie = 'token=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/; secure; HttpOnly';

      // Redirect the user to the login page
      this.$router.push('/');
    },
  },
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

  /* CRUD Card Styles */
  .crud-card {
    margin-top: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  }

  .crud-card .v-card-title {
    font-weight: bold;
  }

  .crud-card .v-form {
    padding: 20px;
  }

  .crud-card .v-text-field {
    margin-bottom: 20px;
  }

  .crud-card .v-btn {
    display: block;
    margin-top: 10px;
  }

  /* List Item Styles */
  .v-list-item {
    border-bottom: 1px solid #e0e0e0; /* Light gray border between items */
  }

  .v-list-item-content {
    flex: 1;
  }

  .v-list-item-action {
    margin-left: auto;
  }

  /* Dialog Styles */
  .v-dialog {
    padding: 20px;
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
