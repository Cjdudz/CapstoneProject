<template>
    <div>
      <!-- Navigation Bar -->
      <nav class="navbar">
        <div class="logo">
          <img src="/img/PCGA.png" alt="Coast Guard Logo" class="coast-guard-logo" />
        </div>
        <div class="nav-links">
          <router-link to="/" class="nav-link" exact>Home</router-link> 
          <router-link to="/Home" class="nav-link">About</router-link>
          <router-link to="/Contacts" class="nav-link">Contact</router-link>
          <router-link to="/logincomponent" class="nav-link">Login</router-link>
        </div>
      </nav>
  
      <!-- Contact List -->
      <div class="contact-list">
        <h1>Contact List</h1>
        <ul>
          <li v-for="(contact, index) in contacts" :key="index" class="contact-item">
            <strong>{{ contact.name }}</strong>
            <p>Email: {{ contact.email }}</p>
            <p>Phone: {{ contact.phone }}</p>
          </li>
        </ul>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'LandingPage',
    data() {
      return {
        contacts: [
          { name: "Michael Johnson", email: "michael@example.com", phone: "123-456-7890" },
          { name: "Emily Brown", email: "emily@example.com", phone: "987-654-3210" },
          { name: "David Martinez", email: "david@example.com", phone: "555-555-5555" }
          // Add more contacts as needed
        ]
      };
    }
  };
  </script>
  
  <style scoped>
 
/* Navigation Bar Styles */
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #2c3e50; /* Dark blue background */
  color: #fff;
}

.logo img {
  height: 50px; /* Adjust logo image height */
}

.search-bar {
  display: flex;
  align-items: center;
  margin-right: 20px;
}

.search-input {
  padding: 5px 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
}

.search-btn {
  background-color: #3498db; /* Light blue color */
  color: #fff;
  border: none;
  padding: 5px 10px;
  border-radius: 5px;
  cursor: pointer;
}

.nav-links {
  display: flex;
  list-style: none; /* Remove default bullet points */
  padding: 0; /* Remove default padding */
  margin: 0; /* Remove default margin */
}

.nav-link {
  color: #fff;
  margin-left: 20px;
  text-decoration: none;
  font-weight: bold;
  transition: all 0.3s ease;
  text-transform: uppercase; /* Make navigation text uppercase */
}

.nav-link:hover {
  text-decoration: underline;
}

.nav-link.active {
  color: #3498db; /* Light blue color for active link */
}
.contact-list-container {
  margin-top: 20px;
  padding: 0 20px;
}

.contact-list {
  font-family: Arial, sans-serif;
}

.contact-list h1 {
  font-size: 24px;
  color: #333;
  margin-bottom: 20px;
}

.contact-item {
  background-color: #fff;
  border-radius: 5px;
  padding: 15px;
  margin-bottom: 15px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.contact-item strong {
  color: #333;
  font-weight: bold;
}

.contact-item p {
  margin: 5px 0;
  color: #666;
}
  </style>
  