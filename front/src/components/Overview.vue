<!-- views/Overview.vue -->

<template>
  <section class="overview">
    <h2>PCGA Overview</h2>

    <form>
      <div class="overview-content">
        <!-- Display relevant information about the PCGA -->
        <v-card class="info-card">
          <v-card-title>
            <h3>Members</h3>
          </v-card-title>
          <v-card-text>
            <p>Total Members: {{ memberCount }}</p>
          </v-card-text>
        </v-card>

        <v-card class="info-card">
          <v-card-title>
            <h3>Active Alerts</h3>
          </v-card-title>
          <v-card-text>
            <p>Total Active Alerts: {{ activeAlertsCount }}</p>
          </v-card-text>
        </v-card>

        <v-card class="info-card">
          <v-card-title>
            <h3>Revenue</h3>
          </v-card-title>
          <v-card-text>
            <p>Total Revenue: ${{ totalRevenue }}</p>
          </v-card-text>
        </v-card>

        <v-card class="info-card">
          <v-card-title>
            <h3>Projects</h3>
          </v-card-title>
          <v-card-text>
            <p>Total Projects: {{ totalProjects }}</p>
          </v-card-text>
        </v-card>

        <!-- Add more information cards as needed -->
      </div>
    </form>
  </section>
</template>

<script>
export default {
  data() {
    return {
      // Placeholder data, you can replace this with actual data from your API
      memberCount: 500,
      activeAlertsCount: 10,
      totalRevenue: 1000000, // Placeholder value, replace with actual data
      totalProjects: 20, // Placeholder value, replace with actual data
      // Add more data properties as needed
    };
  },
};
</script>

<style scoped>
/* Add your component styles here */
.overview {
  padding: 20px;
}

.overview-content {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}

.info-card {
  max-width: 300px;
  margin: 10px;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.info-card h3 {
  color: #3f51b5;
}

.info-card p {
  margin: 0;
}
</style>
