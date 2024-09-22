// main.js or similar entry point file

import { createApp } from 'vue'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import App from './App.vue'
import router from './router'
import vuetify from './plugins/vuetify'
import { loadFonts } from './plugins/webfontloader'
import axios from 'axios'

// Register FontAwesomeIcon globally
createApp(App)
  .component('font-awesome-icon', FontAwesomeIcon)
  .use(router)
  .use(vuetify)
  .mount('#app')

// Set base URL for axios
axios.defaults.baseURL = "http://backend.test";

// Load fonts
loadFonts();
