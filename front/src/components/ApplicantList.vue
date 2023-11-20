<template>
  <div class="applicants-container" :class="{ 'is-fixed': isFixed }">
    
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
  data() {
    return {
      isFixed: true,
    };
  },
  methods: {
    toggleFixedPosition() {
      this.isFixed = !this.isFixed;
    },
  },
};
</script>

<style scoped>
.applicants-container {
  position: fixed;
  top: 50%;
  right: 0;
  transform: translate(0, -50%);
  padding: 20px;
  background-color: #f0f0f0;
  border: 1px solid #ccc;
  width: 200px;
  text-align: center;
  transition: all 0.3s; /* Add transition for a smooth effect */
}


.applicants-container ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.applicants-container li {
  margin-bottom: 10px;
}
</style>
