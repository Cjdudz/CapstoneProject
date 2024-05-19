<template>
  <div>
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

          <!-- List of existing news articles -->
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
      </v-container>
    </v-main>
  </div>
</template>

<script>
import axios from 'axios';

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
        { text: 'Updates and News Management', icon: 'mdi-newspaper', route: '/Updates&news' },
        { text: 'District Management', icon: 'mdi-cogs', route: '/ManageDistrict' },
        { text: 'Available Updates', icon: 'mdi-update', route: '/Availableupdates' },
      ],
      title: '',
      content: '',
      imageData: null,
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
.admin-panel {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  font-family: Arial, sans-serif;
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

/* Global Styles */
body {
  font-family: 'Roboto', sans-serif; /* Default font family */
  background-color: #fafafa; /* Light gray background color */
}
</style>
