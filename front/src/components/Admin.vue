<!-- src/components/Sidebar.vue -->
<template>
    <v-app>
      <v-navigation-drawer app v-model="drawer">
        <v-list>
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
        </v-list>
      </v-navigation-drawer>
  
      <v-app-bar app>
        <v-toolbar-title>Admin Dashboard</v-toolbar-title>
      </v-app-bar>
  
      <v-main>
        <v-container>
          <router-view></router-view>
        </v-container>
      </v-main>
    </v-app>
  </template>
  
  <script>
  import users from '../components/users.vue';
  import ApplicantsData from '../components/ApplicantsData.vue';
  
  export default {
    data() {
      return {
        drawer: true, // Use v-model for two-way binding
        items: [
          { text: 'Dashboard', icon: 'mdi-view-dashboard', route: '' },
          { text: 'Users', icon: 'mdi-page-1', route: '/users' },
          { text: 'Applicants data', icon: 'mdi-page-2', route: '/ApplicantsData' }, // Fix the closing quote here
          // Add more pages as needed
        ],
      };
    },
    methods: {
      navigateTo(route) {
        this.$router.push(route);
        this.drawer = false; // Close the drawer after navigating
      },
    },
  };
  </script>
  
  <style>
  /* Add your component-specific styles here */
  </style>
  