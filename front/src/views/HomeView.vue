<template>
  <div class="philippine-coast-guard-auxiliary">
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
            <p><strong>Date:</strong> {{ newsItem.date }}</p>
          </li>
        </ul>
      </section>

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
    </div>
  </div>
</template>

<script>
export default {
  name: 'PhilippineCoastGuardAuxiliary',
  data() {
    return {
      news: [
        { id: 1, title: 'Coast Guard Rescues Fishermen', content: 'Philippine Coast Guard rescued 20 fishermen stranded at sea.', date: '2024-03-04' },
        { id: 2, title: 'New Coast Guard Training Program', content: 'Philippine Coast Guard launches a new training program for maritime security.', date: '2024-03-03' },
        // Add more news items here
      ],
      updates: [
        { id: 1, title: 'Coast Guard Implements New Safety Measures', content: 'The Philippine Coast Guard has implemented new safety measures to enhance maritime security.', date: '2024-03-02' },
        { id: 2, title: 'Coast Guard Conducts Search and Rescue Exercise', content: 'Philippine Coast Guard conducts a search and rescue exercise in collaboration with neighboring countries.', date: '2024-03-01' },
        // Add more updates here
      ]
    };
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
