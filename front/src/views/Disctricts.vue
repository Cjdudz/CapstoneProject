<!-- App.vue -->
<template>
    <div id="app">
      <header>
        <h1>Philippine Coast Guard Auxiliary Districts</h1>
      </header>
      <main>
        <div v-if="loading" class="loading">Loading...</div>
        <div v-else class="districts">
          <div v-for="district in districts" :key="district.id" class="card">
            <h2>{{ district.name }}</h2>
            <p>{{ district.description }}</p>
            <p>Contact: {{ district.contact }}</p>
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
        districts: [],
        loading: true
      };
    },
    mounted() {
      // Fetch districts from API
      fetch("https://api.example.com/pcga/districts")
        .then(response => response.json())
        .then(data => {
          this.districts = data;
          this.loading = false;
        })
        .catch(error => {
          console.error("Error fetching districts:", error);
          this.loading = false;
        });
    }
  };
  </script>
  
  <style>
  #app {
    font-family: Arial, sans-serif;
    text-align: center;
    padding: 20px;
  }
  
  header {
    background-color: #007bff;
    color: #fff;
    padding: 20px 0;
  }
  
  h1 {
    margin: 0;
  }
  
  main {
    margin-top: 20px;
  }
  
  .loading {
    font-style: italic;
  }
  
  .districts {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
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
  
  footer {
    margin-top: 20px;
    color: #666;
  }
  </style>
  