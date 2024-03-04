<template>
    <div>
      <header>
        <h1>PCGA Procurement</h1>
      </header>
      <main>
        <div v-if="loading" class="loading">Loading...</div>
        <div v-else>
          <div v-for="(section, index) in procurementSections" :key="index">
            <h2>{{ section.title }}</h2>
            <div v-if="section.items.length === 0">No items available</div>
            <div v-else>
              <div v-for="item in section.items" :key="item.id" class="card">
                <h3>{{ item.title }}</h3>
                <p>{{ item.description }}</p>
                <p>Published Date: {{ item.publishedDate }}</p>
                <p>Contact: {{ item.contact }}</p>
              </div>
            </div>
          </div>
        </div>
      </main>
      <footer>
        <p>&copy; 2024 PCGA</p>
      </footer>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        loading: true,
        procurementSections: [
          { title: "Reports", items: [] },
          { title: "Bidding Opportunities", items: [] },
          { title: "Bidding Documents", items: [] },
          { title: "Supplemental/Bid Bulletin", items: [] },
          { title: "Minutes of Pre-Bid Conference & Bid Opening", items: [] },
          { title: "Notice of Awards", items: [] },
          { title: "Notice to Proceed", items: [] },
          { title: "Notice of Postponement", items: [] },
          { title: "Notice of Resumption", items: [] }
        ]
      };
    },
    mounted() {
      Promise.all(
        this.procurementSections.map(section => {
          return fetch(`https://api.example.com/pcga/${section.title.toLowerCase().replace(/ /g, '-')}`)
            .then(response => response.json())
            .then(data => {
              section.items = data;
            })
            .catch(error => {
              console.error(`Error fetching ${section.title}:`, error);
            });
        })
      )
      .finally(() => {
        this.loading = false;
      });
    }
  };
  </script>
  
  <style>
  h1 {
    margin-bottom: 20px;
  }
  
  header {
    background-color: #007bff;
    color: #fff;
    padding: 20px 0;
  }
  
  h2 {
    margin-top: 30px;
  }
  
  .card {
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 20px;
    margin: 10px;
    width: 300px;
    background-color: #f9f9f9;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }
  
  h3 {
    margin-top: 0;
  }
  
  p {
    margin-bottom: 10px;
  }
  
  .loading {
    font-style: italic;
  }
  
  footer {
    margin-top: 20px;
    color: #666;
  }
  </style>
  