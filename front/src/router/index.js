import { createRouter, createWebHistory } from 'vue-router';
const routes = [
  {
    path: '/Helloworld',
    name: 'home',
    component: () => import('@/views/HomeView.vue'),
  },
  {
    path: '/Contacts',
    name: 'Contacts',
    component: () => import('@/views/Contacts.vue'),
  },,
  {
    path: '/NavBar',
    name: 'NavBar',
    component: () => import('@/views/NavBar.vue'),
  },
 {
    path: '/ProcurementManagement',
    name: 'ProcurementManagement',
    component: () => import('@/views/ProcurementManagement.vue'),
  },
  {
    path: '/ManageDistrict',
    name: 'ManageDistrict',
    component: () => import('@/views/ManageDistrict.vue'),
  },
  {
    path: '/Updates&news',
    name: 'Updates&news',
    component: () => import('@/views/Updates&news.vue'),
  },
  {
    path: '/Transparency',
    name: 'Transparency',
    component: () => import('@/views/transparency.vue'),
  },
  {
    path: '/Procurement',
    name: 'Procurement',
    component: () => import('@/views/Procurement.vue'),
  },
  {
    path: '/Disctricts',
    name: 'Disctricts',
    component: () => import('@/views/Disctricts.vue'),
  },
  {
    path: '/Availableupdates',
    name: 'Availableupdates',
    component: () => import('@/views/Availableupdates.vue'),
  },
  {
    path: '/',
    component: () => import('@/views/Landingpage.vue'),
  },
 

  {
    path: '/IdentificationCard',
    component: () => import('@/views/IdentificationCard.vue'),
  },
  {
    path: '/PersonalHistory',
    component: () => import('@/views/PersonalHistory.vue'),
  },

  {
    path: '/PcgaapplicationForm',
    component: () => import('@/views/PcgaapplicationForm.vue'),
  },

  {
    path: '/ApplicantsData',
    name: 'ApplicantsData',
    component: () => import('@/views/ApplicantsData.vue'),
  },
  {
    path: '/users',
    component: () => import('@/views/users.vue'),
  },
  {
    path: '/admin',
    component: () => import('@/views/Admin.vue'),
  },
 
  {
    path: '/Userstatus',
    name: 'Userstatus',
    component: () => import('@/views/Userstatus.vue'),
  },
  {
    path: '/Home',
    name: 'homeKo',
    component: () => import('@/views/Home.vue'),
  },

  {
    path: '/LoginComponent',
    name: 'login',
    component: () => import('@/views/LoginComponent.vue'),
  },
  {
    path: '/RegisterComponent',
    name: 'register',
    component: () => import('@/views/RegisterComponent.vue'),
  },
  {
    path: '/about',
    name: 'about',
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue'),
  },
];


const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
