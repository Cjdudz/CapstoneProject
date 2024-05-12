<template>
    <div class="terms-of-service" :class="{ 'accepted': termsAccepted }">
        <h2>Terms of Service</h2>
    
        <section v-for="section in termsData" :key="section.title">
            <h3>{{ section.title }}</h3>
            <p v-html="section.content"></p>
        </section>
    
        <template v-if="!termsAccepted">
            <button @click="acceptTerms" :aria-labelledby="termsTitle" @focus="focusButton">Accept Terms</button>
            <span v-if="loadingTerms">Loading Terms...</span>
            <span v-if="errorFetchingTerms">Error fetching terms. Please try again later.</span>
        </template>
        <p v-if="termsAccepted">
            <span class="success-message">Thank you for accepting the Terms of Service.</span>
            <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                <path fill="green" d="M173.868 215.868C166.6 228.707 166.6 246.482 173.868 260.32L298.2 432.652c11.879 11.879 29.573 11.879 41.452 0L486.132 368.132c11.879-11.879 11.879-29.573 0-41.452L173.868 215.868zM100.132 256c0-70.7 57.43-128 128-128s128 57.3 128 128c0 70.7-57.43 128-128 128s-128-57.3-128-128z" />
            </svg>
        </p>
    </div>
</template>
  
<script>
export default {
    name: 'TermsOfService',
    data() {
        return {
            termsAccepted: false,
            termsData: [
                { title: '1. Acceptance of Terms', content: 'By accessing or using the service, you agree to be bound by these terms.' },
                { title: '2. Description of Service', content: 'Our service provides a platform for users to interact with content, communicate with other users, and engage in various activities.' },
                { title: '3. User Conduct', content: 'You agree not to engage in any activity that violates any law or infringes on the rights of others, including but not limited to spamming, hacking, or distributing malware.' },
                { title: '4. Privacy', content: 'Your privacy is important to us. Please read our Privacy Policy to understand how we collect, use, and disclose your information.' },
                { title: '5. Intellectual Property', content: 'All content provided on this service, including text, graphics, logos, and images, is the property of the service provider and is protected by intellectual property laws.' },
                { title: '6. Limitation of Liability', content: 'We shall not be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with your use of the service, including but not limited to loss of data, loss of revenue, or loss of profits.' },
                { title: '7. Governing Law', content: 'These terms shall be governed by and construed in accordance with the laws of your jurisdiction.' },
                { title: '8. Contact Us', content: 'If you have any questions about these terms, please contact us at support@example.com.' },
            ],
            loadingTerms: false,
            errorFetchingTerms: false,
        };
    },
    methods: {
        acceptTerms() {
            this.termsAccepted = true;
            // Optionally, emit an event here to notify the parent component
            // this.$emit('termsAccepted');
        },
        focusButton() {
            // Add any additional logic for focusing the button, e.g., scrolling to it
        },
    },
    computed: {
        termsTitle() {
            return 'Terms of Service heading'; // Replace with actual heading text for ARIA attribute
        },
    },
};
</script>
<style scoped>
.terms-of-service.accepted {
  opacity: 0.7; /* Subtle dimming effect */
}

.terms-of-service h2,
.terms-of-service h3 {
  color: #444;
  margin-bottom: 10px; /* Adjusted margin */
}

.terms-of-service section {
  margin-bottom: 15px; /* Adjusted margin */
  border-bottom: 1px solid #ddd; /* Add subtle border for separation */
  padding-bottom: 10px;
}

.terms-of-service p {
  /* Consistent line-height */
}

.terms-of-service button {
  /* Modernized button style (incorporating best aspects) */
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 10px 20px; /* Adjusted padding */
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  border-radius: 4px;
  transition: background-color 0.2s ease-in-out;
}

.terms-of-service button:focus {
  outline: 2px solid #4CAF50; /* Green outline on focus */
}

.terms-of-service button:hover {
  background-color: #45a049; /* Consistent hover effect */
}

/* Success message and icon */
.success-message {
  color: green;
  font-weight: bold;
  margin-bottom: 5px;
}

.checkmark {
  display: none; /* Initially hide checkmark */
}

.terms-of-service.accepted .checkmark {
  display: inline-block; /* Show checkmark on acceptance */
  width: 20px;
  height: 20px;
  fill: green;
}

/* Optional accordion styles (replace with your preferred accordion library) */
.terms-of-service section.collapsed {
  max-height: 0; /* Hide content for collapsed sections */
  overflow: hidden; /* Prevent content overflow */
  transition: max-height 0.3s ease-in-out;
}

.terms-of-service section h3 {
  cursor: pointer; /* Indicate clickability for toggling */
}

.terms-of-service section h3:after {
  font-family: FontAwesome, sans-serif; /* Replace with your icon font */
  float: right;
  margin-left: 5px;
  transition: transform 0.3s ease-in-out;
}

.terms-of-service section.collapsed h3:after {
  transform: rotate(180deg); /* Up arrow for opened sections */
}
</style>
