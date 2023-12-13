import { createRouter, createWebHistory } from 'vue-router';
const routes = [
  {
    path: '/Helloworld',
    name: 'home',
    component: () => import('@/views/HomeView.vue'),
  },
  {
    path: '/',
    name: 'NavBar',
    component: () => import('@/views/NavBar.vue'),
  },
  {
    path: '/Overview',
    component: () => import('@/views/Overview.vue'),
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
    path: '/ApplicantList',
    name: 'ApplicantList',
    component: () => import('@/views/ApplicantList.vue'),
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
