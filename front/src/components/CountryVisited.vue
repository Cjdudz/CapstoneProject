
Visited 
<template>
  <div id="app">
    <form>
      <h1>Foreign Countries Visited</h1>
      <table>
        <tr>
          <th>Country Visited</th>
          <th>Purpose of Visit</th>
          <th>Date</th>
        </tr>
        <tr v-for="(visit, index) in visits" :key="index">
          <td><input type="text" v-model="visit.country"></td>
          <td><input type="text" v-model="visit.purpose"></td>
          <td><input type="date" v-model="visit.date"></td>
        </tr>
      </table>
      <!-- Add other fields here -->
    </form>
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      visits: [
        { country: '', purpose: '', date: '' },
        // Add more objects for more rows
      ],
      // Add other fields here
    }
  }
}
</script>
