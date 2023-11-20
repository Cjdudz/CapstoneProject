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

        <!-- Correct placement of v-row and v-col -->
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
      drawer: true,
      hoverDelay: null, // Variable to store the hover delay timeout
      items: [
        { text: 'Dashboard', icon: 'mdi-view-dashboard', route: '/Overview' },
        { text: 'Users', icon: 'mdi-page-1', route: '/users' },
        { text: 'Applicants data', icon: 'mdi-page-2', route: '/ApplicantsData' },
        // Add more pages as needed
      ],
    };
  },
  methods: {
    navigateTo(route) {
      this.$router.push(route);
      this.drawer = false;
    },
    onMouseEnter() {
      // Add a short delay using setTimeout
      this.hoverDelay = setTimeout(() => {
        this.drawer = true;
      }, 200); // Adjust the delay time as needed
    },
    onMouseLeave() {
      // Clear the timeout to prevent opening the drawer if the user quickly moves the mouse away
      clearTimeout(this.hoverDelay);
    },
    logout() {
      console.log('Logout button clicked');
      this.$router.push('/LoginComponent');
    },
  },
};
</script>

<style scoped>
.custom-title {
  font-size: 24px;
  font-weight: bold;
  cursor: pointer;
  color: #040000;
  margin-left: 20px; /* Adjust margin to separate it from the navigation icon */
}

/* Add additional styles as needed */
</style>
