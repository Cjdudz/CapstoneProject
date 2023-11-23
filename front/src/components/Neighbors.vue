Neigbors 
<template>
  <div id="app">
    <form>
      <h1>List down three (3) neighbors at your present residence</h1>
      <label>Business Address/Residence: <input type="text" v-model="neighbors.address"></label>
      <!-- Add other fields here -->

      <h1>Organization or social groups</h1>
      <label>Member Membership & Position: <input type="text" v-model="organization.membership"></label>
      <!-- Add other fields here -->

      <h1>Miscellaneous</h1>
      <label>Address: <input type="text" v-model="miscellaneous.address"></label>
      <!-- Add other fields here -->

      <h1>Languages and dialects</h1>
      <label>Write: <input type="text" v-model="languages.write"></label>
      <!-- Add other fields here -->
    </form>
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      neighbors: {
        address: '',
        // Add other fields here
      },
      organization: {
        membership: '',
        // Add other fields here
      },
      miscellaneous: {
        address: '',
        // Add other fields here
      },
      languages: {
        write: '',
        // Add other fields here
      }
      // Add other fields here
    }
  }
}
</script>
