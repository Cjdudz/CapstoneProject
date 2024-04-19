<template>
  <div class="philippine-coast-guard-auxiliary">
    <header>
      <h1>Philippine Coast Guard Auxiliary</h1>
      <p>Welcome to the Philippine Coast Guard Auxiliary website!</p>
    </header>

    <div class="divider"></div>

    <section class="content-wrapper">
      <!-- News Section -->
      <section class="news-section">
        <h2>News</h2>
        <ul class="news-list">
          <li v-for="news in news" :key="news.id" class="news-item">
            <h3>{{ news.title }}</h3>
            <p>{{ news.content }}</p>
            <p><strong>Date:</strong> {{ news.date }}</p>
          </li>
        </ul>
      </section>

      <!-- Updates Section -->
      <section class="updates-section">
        <h2>Updates</h2>
        <ul class="updates-list">
          <li v-for="updateItem in updates" :key="updateItem.id" class="update-item">
            <h3>{{ updateItem.title }}</h3>
            <p>{{ updateItem.content }}</p>
            <p><strong>Date:</strong> {{ updateItem.date }}</p>
          </li>
        </ul>
      </section>
    </section>

    <!-- Additional Information Section -->
    <section class="additional-info">
      <h2>About PCGA</h2>
      <p>The Philippine Coast Guard Auxiliary (PCGA) is an organization composed of civilian volunteers who support the Philippine Coast Guard (PCG) in various maritime activities.</p>
      <h2>Membership Information</h2>
      <p>To become a member of PCGA, individuals need to fulfill certain requirements and undergo training. Membership benefits include opportunities to contribute to maritime safety and security.</p>
      <h2>Training Programs</h2>
      <p>PCGA offers various training programs to equip members with the skills and knowledge necessary for maritime operations. These programs cover areas such as search and rescue, maritime law enforcement, and disaster response.</p>
      <h2>Contact Information</h2>
      <p>For inquiries and membership applications, please contact PCGA headquarters:</p>
      <ul>
        <li>Address: [PCGA Headquarters Address]</li>
        <li>Phone: [PCGA Contact Number]</li>
        <li>Email: [PCGA Email Address]</li>
      </ul>
    </section>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'PhilippineCoastGuardAuxiliary',
  data() {
    return {
      news: [],
      updates: [],
    };
  },
  mounted() {
    // Fetch news from API endpoint
    fetch('/api/news')
      .then(response => response.json())
      .then(data => {
        // Assuming the API response contains 'news' and 'updates' arrays
        this.news = data.news;
        this.updates = data.updates;
      })
      .catch(error => {
        console.error('Error fetching news:', error);
      });
  },
};
</script>

<style scoped>
/* Base styles */
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
}

.philippine-coast-guard-auxiliary {
  max-width: 1024px; /* Adjust for larger screens if needed */
  margin: 0 auto;
  padding: 20px;
  background-color: #fff; /* Light background */
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Header */
header {
  text-align: center;
  margin-bottom: 20px;
}

h1 {
  font-size: 2em;
  margin-bottom: 10px;
  color: #17a2b8; /* Accent color */
}

p {
  color: #333; /* Gray for text */
  line-height: 1.5;
}

/* Divider */
.divider {
  border-bottom: 1px solid #ddd; /* Lighter divider */
  margin: 10px 0 20px;
}

/* Content Wrapper */
.content-wrapper {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  margin-bottom: 20px;
}

/* News and Updates Sections */
.news-section,
.updates-section {
  flex-basis: 48%;
  background-color: #f5f5f5; /* Light gray background */
  border-radius: 5px; /* Subtler border */
  padding: 20px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  margin-bottom: 15px; /* Reduced spacing */
}

h2 {
  color: #17a2b8; /* Accent color for headings */
  margin-bottom: 15px;
}

.additional-info {
  flex-basis: 100%; /* Full width for additional information section */
}

.additional-info h2 {
  color: #17a2b8; /* Accent color */
  margin-top: 30px; /* Add some space above each heading */
}

.additional-info p {
  margin-bottom: 15px; /* Add space between paragraphs */
}

.additional-info ul {
  list-style-type: none; /* Remove bullet points */
  padding: 0;
}

.additional-info ul li {
  margin-bottom: 5px; /* Add space between list items */
}
</style>
