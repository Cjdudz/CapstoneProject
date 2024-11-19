    <template>
        <div class="feedback-list">
        <h2>Feedback List</h2>
        <div v-if="loading">Loading...</div>
        <div v-else-if="error">{{ error }}</div>
        <ul v-else>
            <li v-for="item in feedbackList" :key="item.id" class="feedback-item">
            <h3>{{ item.name }}</h3>
            <p><strong>Email:</strong> {{ item.email }}</p>
            <p><strong>Message:</strong> {{ item.message }}</p>
            <p><strong>Submitted:</strong> {{ formatDate(item.created_at) }}</p>
            </li>
        </ul>
        </div>
    </template>
    
    <script>
    import axios from 'axios';
    
    export default {
        data() {
        return {
            feedbackList: [],
            loading: true,
            error: null
        };
        },
        methods: {
        async fetchFeedback() {
            try {
            const response = await axios.get('/api/Showfeedback');
            if (response.data.status === 'success') {
                this.feedbackList = response.data.data;
            } else {
                throw new Error('Failed to fetch feedback');
            }
            } catch (error) {
            console.error('Error:', error);
            this.error = 'An error occurred while fetching feedback. Please try again later.';
            } finally {
            this.loading = false;
            }
        },
        formatDate(dateString) {
            const options = { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' };
            return new Date(dateString).toLocaleDateString(undefined, options);
        }
        },
        mounted() {
        this.fetchFeedback();
        }
    };
    </script>
    
    <style scoped>
    .feedback-list {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
    }
    
    h2 {
        text-align: center;
        margin-bottom: 20px;
    }
    
    ul {
        list-style-type: none;
        padding: 0;
    }
    
    .feedback-item {
        background-color: #f0f8ff;
        border: 1px solid #d1e8ff;
        border-radius: 5px;
        padding: 15px;
        margin-bottom: 15px;
    }
    
    h3 {
        margin-top: 0;
        color: #2c3e50;
    }
    
    p {
        margin: 5px 0;
    }
    
    strong {
        color: #3498db;
    }
    </style>