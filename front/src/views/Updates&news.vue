<template>
  <div class="admin-panel-container">
    <nav class="sidebar" :class="{ 'sidebar-open': drawer }">
      <div class="sidebar-header">
        <h2 class="sidebar-title">Admin Panel</h2>
        <button @click="drawer = !drawer" class="sidebar-toggle">
          <i class="fas fa-bars"></i>
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
        <button @click="drawer = !drawer" class="sidebar-toggle-mobile">
          <i class="fas fa-bars"></i>
        </button>
        <h1 class="main-title">PCGA</h1>
      </header>

      <div class="admin-panel">
        <h2>Admin Panel</h2>

        <div class="add-news">
          <h3>Add or Upload News</h3>
          <form @submit.prevent="addNews">
            <label for="title">Title:</label>
            <input type="text" id="title" v-model="title" required>
            <label for="content">Content:</label>
            <textarea id="content" v-model="content" rows="4" cols="50" required></textarea>
          
            <button type="submit">Add News</button>
          </form>
        </div>

        <div class="news-list">
          <h3>Existing News Articles</h3>
          <ul>
            <li v-for="news in newsList" :key="news.id">
              <h4>{{ news.title }}</h4>
              <p>{{ news.content }}</p>
              <button @click="updateNews(news.id)">Update</button>
              <button @click="deleteNews(news.id)">Delete</button>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'AdminPanel',
  data() {
    return {
      drawer: true,
      items: [
        { text: 'Dashboard', icon: 'fa-tachometer-alt', route: '/Admin' },
        { text: 'Users', icon: 'fa-users', route: '/users' },
        { text: 'Applicants data', icon: 'fa-file-alt', route: '/fetchfile' },
        { text: 'Updates and News Management', icon: 'fa-newspaper', route: '/Updates&news' },
        { text: 'District Management', icon: 'fa-map-marker-alt', route: '/ManageDistrict' },
        { text: 'Available Updates', icon: 'fa-bell', route: '/Availableupdates' },
        { text: 'Add Content', icon: 'fa-plus-circle', route: '/add-content' },
      ],
      title: '',
      content: '',
      newsList: []
    };
  },
  mounted() {
    this.fetchNews();
  },
  methods: {
    navigateTo(route) {
      this.$router.push(route);
      this.drawer = false;
    },
    logout() {
      console.log('Logout button clicked');
      this.$router.push('/LoginComponent');
    },
    addNews() {
      const data = {
        title: this.title,
        content: this.content
      };
      
      axios.post('/api/AddNews', data)
        .then(response => {
          console.log('Added News:', response.data);
          this.title = '';
          this.content = '';
          this.fetchNews();
        })
        .catch(error => {
          console.error('Error adding news:', error);
        });
    },
    fetchNews() {
      axios.get('/api/ShowNews')
        .then(response => {
          this.newsList = response.data;
        })
        .catch(error => {
          console.error('Error fetching news:', error);
        });
    },
    async updateNews(newsId) {
      try {
        const newsToUpdate = this.newsList.find(news => news.id === newsId);
    
        if (!newsToUpdate) {
          console.error('News not found for updating');
          return;
        }
    
        const updatedTitle = prompt('Enter updated title:', newsToUpdate.title);
        const updatedContent = prompt('Enter updated content:', newsToUpdate.content);
    
        const data = {
          title: updatedTitle,
          content: updatedContent
        };
    
        const response = await axios.put(`/api/UpdateNews/${newsId}`, data);
    
        this.fetchNews();
    
        console.log('Updated News:', response.data);
      } catch (error) {
        console.error('Error updating news:', error);
      }
    },
    deleteNews(newsId) {
      axios.delete(`/api/news/${newsId}`)
        .then(response => {
          console.log('Deleted News:', response.data);
          this.fetchNews();
        })
        .catch(error => {
          console.error('Error deleting news:', error);
        });
    }
  }
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
}

.sidebar-header {
  padding: 1.5rem;
  background-color: #0d47a1;
}

.sidebar-title {
  font-size: 1.5rem;
  font-weight: bold;
}

.sidebar-toggle {
  display: none;
}

.sidebar-menu {
  list-style-type: none;
  padding: 0;
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
  padding: 2rem;
  overflow-y: auto;
}

.main-header {
  display: flex;
  align-items: center;
  margin-bottom: 2rem;
  background-color: #ffffff;
  padding: 1rem;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.sidebar-toggle-mobile {
  display: none;
}

.main-title {
  font-size: 2rem;
  color: #1a237e;
  margin: 0;
}

.admin-panel {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

.admin-panel h2 {
  margin-bottom: 20px;
}

.add-news,
.news-list {
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

@media (max-width: 768px) {
  .sidebar {
    position: fixed;
    top: 0;
    left: 0;
    bottom: 0;
    z-index: 1000;
    transform: translateX(-100%);
  }

  .sidebar-open {
    transform: translateX(0);
  }

  .sidebar-toggle,
  .sidebar-toggle-mobile {
    display: block;
    background: none;
    border: none;
    color: #ffffff;
    font-size: 1.5rem;
    cursor: pointer;
  }

  .sidebar-toggle-mobile {
    color: #1a237e;
    margin-right: 1rem;
  }

  .main-content {
    padding: 1rem;
  }

  .main-title {
    font-size: 1.5rem;
  }
}
</style>