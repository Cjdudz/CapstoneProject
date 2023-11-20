<!-- UserTable.vue -->

<template>
    <div>
      <h2>User Table</h2>
      <table class="user-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(user, index) in users" :key="index">
            <td>{{ user.id }}</td>
            <td>{{ user.name }}</td>
            <td>{{ user.email }}</td>
            <td>{{ user.role }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        users: [
          { id: 1, name: 'Admin User', email: 'admin@example.com', role: 'admin' },
          { id: 2, name: 'Staff User', email: 'staff@example.com', role: 'staff' },
          { id: 3, name: 'Regular User', email: 'user@example.com', role: 'user' },
          // Add more users as needed
        ],
      };
    },
  };
  </script>
  
  <style scoped>
  /* Add your styling here if needed */
  
  .user-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
  }
  
  .user-table th, .user-table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
  }
  
  .user-table th {
    background-color: #f2f2f2;
  }
  
  </style>
  