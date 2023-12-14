<template>
    <div>
      <!-- Navigation Bar -->
      <nav class="navbar">
        <div class="logo">
          <h1>Coast Guard</h1>
        </div>
        <div class="nav-links">
          <router-link to="/LoginComponent">Login</router-link>
          <router-link to="/RegisterComponent">Register</router-link>
        </div>
      </nav>
  
      <!-- Landing Page Content -->
      <div class="landing-page">
        <header>
          <h1 class="artistic-heading">Ensuring Safety at Sea</h1>
        </header>
  
        <!-- Mission Section -->
        <div class="card">
          <section class="mission-section">
            <h2>Our Mission</h2>
            <p>
              The Coast Guard's mission is to ensure the safety, security, and
              environmental stewardship of our nation's waters. We are committed to
              protecting life, property, and the maritime environment.
            </p>
          </section>
        </div>
  
        <!-- Services Section -->
        <div class="card">
          <section class="services-section">
            <h2>Services</h2>
            <ul>
              <li>Search and Rescue</li>
              <li>Maritime Law Enforcement</li>
              <li>Environmental Protection</li>
              <li>Port Security</li>
            </ul>
          </section>
        </div>
  
        <!-- Contact Section -->
        <div class="card">
          <section class="contact-section">
            <h2>Contact Us</h2>
            <p>
              In case of emergency, please call 911. For non-emergency inquiries and information, you can reach us at:
            </p>
            <address>
              <p>Coast Guard Headquarters</p>
              <p>123 Seafront Avenue</p>
              <p>City, Country</p>
              <p>Email: info@coastguard.gov</p>
              <p>Phone: (123) 456-7890</p>
            </address>
          </section>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'LandingPage',
  };
  </script>
  
  <style scoped>
  /* Navigation Bar Styles */
  .navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px;
    background-color: #2c3e50; /* Dark blue background */
    color: #fff;
  }
  
  .nav-links {
    display: flex;
  }
  
  .nav-links a {
    color: #fff;
    margin-left: 15px;
    text-decoration: none;
    font-weight: bold;
  }
  
  .nav-links a:hover {
    text-decoration: underline;
  }
  
  /* Landing Page Styles */
  .landing-page {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    font-family: 'Raleway', sans-serif; /* Google Font: Raleway */
    background-color: #ecf0f1; /* Light grey background */
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    gap: 20px;
  }
  
  .card {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }
  
  header {
    text-align: center;
    margin-bottom: 20px;
  }
  
  .artistic-heading {
    font-size: 3em;
    color: #3498db; /* Light blue color */
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
  }
  
  .mission-section,
  .services-section,
  .contact-section {
    margin-bottom: 30px;
  }
  
  h2 {
    font-size: 2em;
    color: #3498db;
    margin-bottom: 10px;
  }
  
  ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
  }
  
  li {
    margin-bottom: 5px;
    font-size: 1.2em;
  }
  
  address {
    font-style: normal;
    margin-top: 10px;
  }
  </style>
  