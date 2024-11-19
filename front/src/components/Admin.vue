<template>
  <div class="admin-panel-container" :class="{ 'sidebar-open': drawer }">
    <nav class="sidebar">
      <div class="sidebar-header">
        <h2 class="sidebar-title">Admin Panel</h2>
        <button @click="toggleDrawer" class="sidebar-toggle">
          <i class="fas fa-times"></i>
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

    <div class="main-content">
      <header class="main-header">
        <button @click="toggleDrawer" class="sidebar-toggle-mobile">
          <i class="fas fa-bars"></i>
        </button>
        <h1 class="main-title">PCGA Admin Dashboard</h1>
      </header>

      <div class="dashboard-content">
        <section class="overview">
          <h2>PCGA Overview</h2>

          <div class="info-card">
            <h3>Total Members</h3>
            <p>{{ memberCount }} Members</p>
          </div>

          <div class="chart-container">
            <h3>Age Distribution of Members</h3>
            <canvas ref="ageChartRef"></canvas>
          </div>

          <div class="chart-container">
            <h3>Total Members Over Time</h3>
            <canvas ref="membersChartRef"></canvas>
          </div>
        </section>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted, nextTick, onBeforeUnmount } from 'vue';
import Chart from 'chart.js/auto';
import { useRouter } from 'vue-router';

export default {
  name: 'AdminPanel',
  setup() {
    const drawer = ref(false);
    const router = useRouter();
    const items = [
      { text: 'Dashboard', icon: 'fa-tachometer-alt', route: '/Admin' },
      { text: 'Users', icon: 'fa-users', route: '/users' },
      { text: 'Applicants data', icon: 'fa-file-alt', route: '/fetchfile' },
      { text: 'Updates and News Management', icon: 'fa-newspaper', route: '/Updates&news' },
      { text: 'District Management', icon: 'fa-map-marker-alt', route: '/ManageDistrict' },
      { text: 'Available Updates', icon: 'fa-bell', route: '/Availableupdates' },
      { text: 'Add Content', icon: 'fa-plus-circle', route: '/add-content' },
    ];

    const memberCount = ref(0);
    const ageChartRef = ref(null);
    const membersChartRef = ref(null);
    const ageChartInstance = ref(null);
    const membersChartInstance = ref(null);

    const toggleDrawer = () => {
      drawer.value = !drawer.value;
    };

    const navigateTo = (route) => {
      router.push(route);
      drawer.value = false;
    };

    const logout = () => {
      localStorage.removeItem('authToken');
      sessionStorage.removeItem('authToken');
      document.cookie = 'authToken=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
      router.push('/logincomponent');
    };

    const fetchOverviewData = () => {
      return new Promise((resolve) => {
        setTimeout(() => {
          resolve({
            memberCount: 1000,
            ageChartData: {
              labels: ["21-25", "26-30", "31-35", "36-40", "41+"],
              ages: [100, 200, 150, 80, 50],
            },
            membersTimelineData: {
              labels: ["January", "February", "March", "April", "May"],
              counts: [800, 850, 900, 950, 1000],
            },
          });
        }, 1000);
      });
    };

    const updateAgeChart = (ageChartData) => {
      if (ageChartInstance.value) {
        ageChartInstance.value.destroy();
      }
      const ctx = ageChartRef.value.getContext('2d');
      ageChartInstance.value = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ageChartData.labels,
          datasets: [{
            label: 'Members by Age Group',
            data: ageChartData.ages,
            backgroundColor: [
              'rgba(255, 99, 132, 0.7)',
              'rgba(54, 162, 235, 0.7)',
              'rgba(255, 206, 86, 0.7)',
              'rgba(75, 192, 192, 0.7)',
              'rgba(153, 102, 255, 0.7)',
            ],
            borderColor: [
              'rgba(255, 99, 132, 1)',
              'rgba(54, 162, 235, 1)',
              'rgba(255, 206, 86, 1)',
              'rgba(75, 192, 192, 1)',
              'rgba(153, 102, 255, 1)',
            ],
            borderWidth: 1,
          }],
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          scales: {
            y: {
              beginAtZero: true
            }
          }
        },
      });
    };

    const updateMembersChart = (membersTimelineData) => {
      if (membersChartInstance.value) {
        membersChartInstance.value.destroy();
      }
      const ctx = membersChartRef.value.getContext('2d');
      membersChartInstance.value = new Chart(ctx, {
        type: 'line',
        data: {
          labels: membersTimelineData.labels,
          datasets: [{
            label: 'Total Members Over Time',
            data: membersTimelineData.counts,
            fill: false,
            borderColor: 'rgb(75, 192, 192)',
            tension: 0.1
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      });
    };

    const handleResize = () => {
      if (window.innerWidth > 768 && drawer.value) {
        drawer.value = false;
      }
    };

    onMounted(async () => {
      const data = await fetchOverviewData();
      memberCount.value = data.memberCount;
      
      await nextTick();
      
      updateAgeChart(data.ageChartData);
      updateMembersChart(data.membersTimelineData);

      window.addEventListener('resize', handleResize);
    });

    onBeforeUnmount(() => {
      window.removeEventListener('resize', handleResize);
    });

    return {
      drawer,
      items,
      memberCount,
      navigateTo,
      logout,
      ageChartRef,
      membersChartRef,
      toggleDrawer
    };
  },
};
</script>

<style scoped>
.admin-panel-container {
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
  position: fixed;
  top: 0;
  left: 0;
  bottom: 0;
  z-index: 1000;
  transform: translateX(-100%);
}

.sidebar-open .sidebar {
  transform: translateX(0);
}

.sidebar-header {
  padding: 1.5rem;
  background-color: #0d47a1;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.sidebar-title {
  font-size: 1.5rem;
  font-weight: bold;
  margin: 0;
}

.sidebar-toggle {
  background: none;
  border: none;
  color: white;
  font-size: 1.5rem;
  cursor: pointer;
}

.sidebar-menu {
  list-style-type: none;
  padding: 0;
  margin: 0;
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
  padding: 1rem;
  transition: margin-left 0.3s ease;
}

.sidebar-open .main-content {
  margin-left: 280px;
}

.main-header {
  display: flex;
  align-items: center;
  margin-bottom: 1rem;
  background-color: #ffffff;
  padding: 1rem;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.sidebar-toggle-mobile {
  background: none;
  border: none;
  font-size: 1.5rem;
  margin-right: 1rem;
  cursor: pointer;
}

.main-title {
  font-size: 1.5rem;
  color: #1a237e;
  margin: 0;
}

.dashboard-content {
  background-color: #ffffff;
  border-radius: 8px;
  padding: 1rem;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.overview {
  display: flex;
  flex-direction: column;
}

.overview h2 {
  font-size: 1.75rem;
  margin-bottom: 1rem;
  color: #1a237e;
}

.info-card {
  background-color: #e8eaf6;
  padding: 1rem;
  border-radius: 8px;
  margin-bottom: 1rem;
}

.info-card h3 {
  margin: 0;
  font-size: 1.25rem;
}

.info-card p {
  font-size: 1.5rem;
  margin: 0.5rem 0 0;
}

.chart-container {
  margin-bottom: 1rem;
  height: 300px;
  position: relative;
}

@media (min-width: 769px) {
  .sidebar {
    transform: translateX(0);
  }

  .sidebar-toggle {
    display: none;
  }

  .sidebar-toggle-mobile {
    display: none;
  }

  .main-content {
    margin-left: 280px;
  }

  .sidebar-open .main-content {
    margin-left: 280px;
  }

  .main-header {
    margin-bottom: 2rem;
  }

  .main-title {
    font-size: 2rem;
  }

  .dashboard-content {
    padding: 2rem;
  }

  .info-card {
    margin-bottom: 2rem;
  }

  .chart-container {
    margin-bottom: 2rem;
  }
}

@media (max-width: 768px) {
  .admin-panel-container {
    flex-direction: column;
  }

  .sidebar {
    width: 100%;
    height: 100%;
  }

  .main-content {
    margin-left: 0;
  }

  .sidebar-open .main-content {
    margin-left: 0;
  }
}
</style>