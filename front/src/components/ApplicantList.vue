  <!-- ApplicantManagement.vue -->
  <template>
    <div>
      <h2>Applicant Management</h2>
      <div v-if="applicants.length > 0">
        <h3>Applicants</h3>
        <ul>
          <li v-for="applicant in applicants" :key="applicant.id">
            {{ applicant.name }} - {{ applicant.email }}
          </li>
        </ul>
      </div>

      <div v-if="interviews.length > 0">
        <h3>Interviews</h3>
        <ul>
          <li v-for="interview in interviews" :key="interview.id">
            {{ interview.applicant_name }} - {{ interview.appointment_date }}
          </li>
        </ul>
      </div>
    </div>
  </template>

  <script>
  import axios from 'axios';

  export default {
    data() {
      return {
        applicants: [],
        interviews: [],
      };
    },
    mounted() {
      // Fetch applicants and interviews on component mount
      this.fetchApplicants();
      this.fetchInterviews();
    },
    methods: {
  async fetchApplicantsAndInterviews() {
    try {
      const response = await axios.get('/rcga/getApplicantsAndInterviews'); // Update the endpoint
      if ('applicants' in response.data && 'interviews' in response.data) {
        this.applicants = response.data.applicants;
        this.interviews = response.data.interviews;
      } else {
        console.error('Invalid response structure:', response.data);
      }
    } catch (error) {
      console.error('Error fetching applicants and interviews:', error);
    }
  },
},}
  </script>
<style>
.error-message {
  color: red;
  margin-top: 10px;
}
</style>
