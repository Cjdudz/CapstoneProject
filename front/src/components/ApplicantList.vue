<template>
  <div class="applicants-container">
    <h2>Applicants List</h2>
    <ul>
      <li v-for="applicant in applicants" :key="applicant.id">{{ applicant.fullName }}</li>
    </ul>
  </div>
</template>

<script>
export default {
  props: {
    applicants: {
      type: Array,
      default: () => [
        { id: 1, fullName: 'John Doe' },
        { id: 2, fullName: 'Jane Doe' },
        { id: 3, fullName: 'Bob Smith' },
        // Add more example data as needed
      ],
    },
  },
};
</script>

<style scoped>
.applicants-container {
  position: fixed; /* Fixed position to keep it in place */
  top: 50%; /* Position at the vertical center */
  right: 0; /* Position from the right */
  transform: translate(0, -50%); /* Center the container vertically */
  padding: 20px;
  background-color: #f0f0f0;
  border: 1px solid #ccc;
  width: 200px; /* Adjust the width as needed */
  text-align: center; /* Center text within the container */
}

/* Add your styling for the applicant list if needed */
.applicants-container ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.applicants-container li {
  margin-bottom: 10px;
}
</style>
