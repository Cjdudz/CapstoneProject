<template>
  <section class="overview">
    <h2>PCGA Overview</h2>

    <form>
      <div class="overview-content">
        <v-card class="info-card" @click="viewCard('members')" :class="{ 'selected-card': selectedCard === 'members' }">
          <v-card-title>
            <h3>Members</h3>
          </v-card-title>
          <v-card-text>
            <p>Total Members: {{ memberCount }}</p>
          </v-card-text>
        </v-card>

        <v-card class="info-card" @click="viewCard('alerts')" :class="{ 'selected-card': selectedCard === 'alerts' }">
          <v-card-title>
            <h3>Active Alerts</h3>
          </v-card-title>
          <v-card-text>
            <p>Total Active Alerts: {{ activeAlertsCount }}</p>
          </v-card-text>
        </v-card>

        <v-card class="info-card" @click="viewCard('revenue')" :class="{ 'selected-card': selectedCard === 'revenue' }">
          <v-card-title>
            <h3>Revenue</h3>
          </v-card-title>
          <v-card-text>
            <p>Total Revenue: ${{ totalRevenue }}</p>
          </v-card-text>
        </v-card>

        <v-card class="info-card" @click="viewCard('projects')" :class="{ 'selected-card': selectedCard === 'projects' }">
          <v-card-title>
            <h3>Projects</h3>
          </v-card-title>
          <v-card-text>
            <p>Total Projects: {{ totalProjects }}</p>
          </v-card-text>
        </v-card>

        <div class="chart-container">
          <canvas id="ageChart"></canvas>
        </div>
      </div>
    </form>
  </section>
</template>

<script>
import axios from 'axios';
import Chart from 'chart.js/auto';

export default {
  data() {
    return {
      memberCount: null,
      activeAlertsCount: null,
      totalRevenue: null,
      totalProjects: null,
      selectedCard: null,
    };
  },
  mounted() {
    axios.get('/api/overview')
      .then(response => {
        const data = response.data;
        this.memberCount = data.memberCount;
        this.activeAlertsCount = data.activeAlertsCount;
        this.totalRevenue = data.totalRevenue;
        this.totalProjects = data.totalProjects;

        if (data.ageChartData) {
          this.updateAgeChart(data.ageChartData);
        }
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  },
  methods: {
    updateAgeChart(ageChartData) {
      const ctx = document.getElementById('ageChart').getContext('2d');

      new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ageChartData.labels,
          datasets: [{
            label: 'Applicant Ages',
            data: ageChartData.ages,
            backgroundColor: 'rgba(63, 81, 181, 0.5)',
            borderColor: 'rgba(63, 81, 181, 1)',
            borderWidth: 1,
          }],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
        },
      });
    },
    viewCard(card) {
      this.selectedCard = this.selectedCard === card ? null : card;
    },
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
  max-width: fit-content;
  cursor: pointer;
  transition: background-color 0.3s;
}

.selected-card {
  background-color: #e0e0e0;
}

.chart-container {
  width: 100%;
  max-width: 600px; /* Set the max-width as per your design */
  margin: 20px auto; /* Adjust the margin as per your design */
}

</style>
