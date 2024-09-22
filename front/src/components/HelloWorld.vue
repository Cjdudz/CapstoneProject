<template>
  <header>
    <h1>Philippine Coast Guard Auxiliary</h1>
    <p>Welcome to the Philippine Coast Guard Auxiliary website!</p>
  </header>

  <div class="divider"></div> <!-- Divider between welcome message and news -->

  <div class="content-wrapper">
    <section class="news-section">
      <h2>News</h2>
      <ul class="news-list">
        <li v-for="newsItem in news" :key="newsItem.id" class="news-item">
          <h3>{{ newsItem.title }}</h3>
          <p>{{ newsItem.content }}</p>
          <p><strong>Date:</strong> {{ formatDate(newsItem.created_at) }}</p>
        </li>
      </ul>
    </section>

    <section class="updates-section">
      <h2>Updates</h2>
      <ul class="updates-list">
        <li v-for="updateItem in updates" :key="updateItem.id" class="update-item">
          <h3>{{ updateItem.title }}</h3>
          <p>{{ updateItem.content }}</p>
          <p><strong>Date:</strong> {{ formatDate(updateItem.created_at) }}</p>
        </li>
      </ul>
    </section>
  </div>
</template>
<script>
import axios from 'axios';

export default {
  data() {
    return {
      news: [],
      updates: [],
    };
  },
  mounted() {
    this.fetchNews();
    this.fetchUpdates(); // Call fetchUpdates() when the component is mounted
  },
  methods: { formatDate(dateString) {
    const date = new Date(dateString);

    // Format the date options
    const options = {
      year: 'numeric',
      month: 'long',
      day: 'numeric',
      hour: 'numeric',
      minute: 'numeric',
      hour12: true, // Ensures 12-hour format
    };

    // Use Intl.DateTimeFormat for localized formatting
    return new Intl.DateTimeFormat('en-US', options).format(date);
  },
    fetchNews() {
      axios.get('/api/ShowNews')
        .then(response => {
          this.news = response.data;
        })
        .catch(error => {
          console.error('Error fetching news:', error);
        });
    },
    fetchUpdates() {
      axios.get('/api/showupdate')
        .then(response => {
          this.updates = response.data;
        })
        .catch(error => {
          console.error('Error fetching updates:', error);
        });
    }
  }
};
</script>

<style scoped>
  .philippine-coast-guard-auxiliary {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }

  header {
    text-align: center;
    margin-bottom: 20px;
  }

  .divider {
    border-bottom: 2px solid #ccc;
    margin-bottom: 20px;
  }

  .content-wrapper {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
  }

  .news-section, .updates-section {
    flex-basis: 48%;
    background-color: #fff;
    border-radius: 10px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  }

  .news-item, .update-item {
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 5px;
    margin-bottom: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out;
  }

  .news-item:hover, .update-item:hover {
    transform: translateY(-5px);
  }

  h2 {
    color: #333;
  }

  h3 {
    margin-bottom: 10px;
    color: #007bff;
  }

  p {
    margin-bottom: 10px;
  }

  .news-list, .updates-list {
    list-style-type: none;
    padding: 0;
  }
</style>
