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
            <h2>Admin Panel</h2>
  
            <!-- Update Philippine Coast Guard Information -->
            <div class="update-info">
              <h3>Update Philippine Coast Guard Information</h3>
              <form @submit.prevent="updateCoastGuardInfo">
                <label for="info">Information:</label>
                <textarea id="info" v-model="coastGuardInfo" rows="4" cols="50"></textarea>
                <button type="submit">Update Information</button>
              </form>
            </div>
  
            <!-- Add or Upload News -->
            <div class="add-news">
              <h3>Add or Upload News</h3>
              <form @submit.prevent="addNews">
                <label for="headline">Headline:</label>
                <input type="text" id="headline" v-model="headline" required>
                <label for="content">Content:</label>
                <textarea id="content" v-model="content" rows="4" cols="50" required></textarea>
                <label for="image">Image:</label>
                <input type="file" id="image" @change="handleImageUpload" accept="image/*" required>
                <div class="image-preview" v-if="imageData">
                  <img :src="imageData" alt="Image Preview">
                </div>
                <button type="submit">Add News</button>
              </form>
            </div>
          </div>
        </v-container>
      </v-main>
    </div>
  </template>
  
  <script>
  import { ref } from 'vue';
  
  export default {
    name: 'AdminPanel',
    data() {
      return {
        drawer: true,
        hoverDelay: null,
        items: [
          { text: 'Dashboard', icon: 'mdi-view-dashboard', symbol: '$', route: '/Admin' },
          { text: 'Users', icon: 'mdi-account', symbol: 'U', route: '/users' },
          { text: 'Applicants data', icon: 'mdi-account-multiple', symbol: 'A', route: '/ApplicantsData' },
          { text: 'Procurement', icon: 'mdi-cart', route: '/ProcurementManagement' },
          { text: 'Updates and News Management', icon: 'mdi-newspaper', route: '/updates' },
          { text: 'Services Management', icon: 'mdi-cogs', route: '/ManageDistrict' }
        ],
        coastGuardInfo: '',
        headline: '',
        content: '',
        imageData: null
      };
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
      updateCoastGuardInfo() {
        // Code to update Philippine Coast Guard information
        console.log('Updated Coast Guard Information:', this.coastGuardInfo);
      },
      addNews() {
        if (!this.headline || !this.content || !this.imageData) {
          alert('Please fill in all fields.');
          return;
        }
        // Code to add or upload news
        console.log('Added News:', {
          headline: this.headline,
          content: this.content,
          image: this.imageData
        });
        // Clear form fields after submission
        this.headline = '';
        this.content = '';
        this.imageData = null;
      },
      handleImageUpload(event) {
        const file = event.target.files[0];
        // Check if file is an image
        if (!file || !file.type.startsWith('image/')) {
          alert('Please upload an image file.');
          return;
        }
        // Code to handle image upload
        // Example: You can use FileReader to read the file data and convert it to base64
        const reader = new FileReader();
        reader.onload = () => {
          this.imageData = reader.result;
        };
        reader.readAsDataURL(file);
      }
    }
  };
  </script>
  
  <style scoped>
  .admin-panel {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    font-family: Arial, sans-serif;
  }
  
  .admin-panel h2 {
    margin-bottom: 20px;
  }
  
  .update-info,
  .add-news {
    margin-bottom: 40px;
  }
  
  label {
    display: block;
    margin-bottom: 5px;
  }
  
  input[type="text"],
  textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  
  button {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
  
  button:hover {
    background-color: #0056b3;
  }
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
  .image-preview img {
    max-width: 100%;
    max-height: 200px;
    margin-top: 10px;
  }
  </style>
  