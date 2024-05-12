<template>
    <div class="privacy-policy">
      <h2 class="privacy-policy__title">Privacy Policy</h2>
  
      <div class="privacy-policy__content">
        <section class="privacy-policy__section">
          <h3 class="privacy-policy__section-title">Data Collection</h3>
          <p>We collect personal information like name, email address, and demographics when you register for an account. We strive to be transparent about the data we collect and use it only for the purposes you expect.</p>
        </section>
  
        <section class="privacy-policy__section">
          <h3 class="privacy-policy__section-title">Use of Information</h3>
          <p>We use your information to personalize your experience, improve our website, and send periodic emails (with clear opt-out options). We respect your privacy and ensure your information is used responsibly.</p>
        </section>
  
        <section class="privacy-policy__section">
          <h3 class="privacy-policy__section-title">Data Protection</h3>
          <p>We take your privacy seriously and implement a variety of industry-standard security measures to protect your personal information. This includes secure storage, encryption, and access controls.</p>
        </section>
  
        <section class="privacy-policy__section">
          <h3 class="privacy-policy__section-title">Sharing of Information</h3>
          <p>We do not sell, trade, or transfer your personal information to third parties without your consent. We may share information with trusted partners who help us operate our services, but only under strict agreements that protect your privacy.</p>
        </section>
  
        <section class="privacy-policy__section">
          <h3 class="privacy-policy__section-title">Third Party Links</h3>
          <p>Our website may include links to third-party products or services. These third-party sites have separate and independent privacy policies. We recommend reviewing their policies before using their services.</p>
        </section>
  
        <section class="privacy-policy__section">
          <h3 class="privacy-policy__section-title">Changes to Privacy Policy</h3>
          <p>We will notify you of any changes to our privacy policy by posting them here. Your continued use of our services after such changes constitutes your acceptance of the revised policy.</p>
        </section>
  
        <section class="privacy-policy__section">
          <h3 class="privacy-policy__section-title">Contact Us</h3>
          <p>If you have any questions regarding this privacy policy, you may contact us using the information below:</p>
          <div class="privacy-policy__contact">
            <p class="privacy-policy__contact-organization">Philippine Coast Guard Auxiliary</p>
            <p class="privacy-policy__contact-person">Contact Person: Noemi Joy F. Alfante</p>
            <p class="privacy-policy__contact-phone">Phone: 0975 563 3517</p>
          </div>
        </section>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'PrivacyPolicy'
  };
  </script>
  
  <style scoped>
.privacy-policy {
  /* Adjust padding and max-width for desired layout */
  padding: 2rem 1rem; /* Reduced padding */
  max-width: 100%; /* Allow the policy to expand to the full width */
  margin: 0 auto; /* Center the policy */
  font-family: sans-serif; /* Modern font */
  line-height: 1.6; /* Readable line spacing */
}
  
  .privacy-policy__title {
    font-size: 1.8rem; /* Adjust heading size */
    font-weight: bold;
    margin-bottom: 1.5rem;
    color: #333; /* Darker primary color */
  }
  
  .privacy-policy__content {
    display: flex; /* Flexbox for column layout */
    flex-direction: column;
    gap: 1.5rem; /* Spacing between sections */
  }
  
  .privacy-policy__section {
    /* Highlight sections subtly */
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    padding-bottom: 1rem;
  }
  
  .privacy-policy__section-title {
  font-size: 1.4rem; /* Subheading size */
  font-weight: bold;
  margin-bottom: 0.5rem;
  color: #333; /* Darker primary color */
}

.privacy-policy__section p {
  color: #666; /* Lighter text color for readability */
}

.privacy-policy__contact {
  display: flex; /* Flexbox for contact info layout */
  flex-direction: column;
  gap: 0.5rem; /* Spacing between contact details */
}

.privacy-policy__contact-organization,
.privacy-policy__contact-person,
.privacy-policy__contact-phone {
  font-weight: normal; /* Lighter weight for contact details */
}
</style>