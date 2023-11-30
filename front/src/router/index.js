import { createRouter, createWebHistory } from 'vue-router';
const routes = [
  {
    path: '/',
    name: 'home',
    component: () => import('@/views/HomeView.vue'),
  },
  {
    path: '/CountryVisited',
    component: () => import('@/views/CountryVisited.vue'),
  },
  {
    path: '/Overview',
    component: () => import('@/views/Overview.vue'),
  },
  {
    path: '/MembershipapplicationPAge5',
    component: () => import('@/views/MembershipapplicationPAge5.vue'),
  },
  {
    path: '/MembershipapplicationPAge2',
    component: () => import('@/views/MembershipapplicationPAge2.vue'),
  },
  {
    path: '/MembershipapplicationPAge1',
    component: () => import('@/views/MembershipapplicationPAge1.vue'),
  },
  {
    path: '/MembershipapplicationPAge4',
    component: () => import('@/views/MembershipapplicationPAge4.vue'),
  },
  {
    path: '/MilitaryHistory',
    component: () => import('@/views/MilitaryHistory.vue'),
  },
  {
    path: '/Personalhistory',
    component: () => import('@/views/Personalhistory.vue'),
  },
  {
    path: '/Maritalhistory',
    component: () => import('@/views/Maritalhistory.vue'),
  },
  {
    path: '/Neighbors',
    component: () => import('@/views/Neighbors.vue'),
  },
  {
    path: '/PcgaapplicationForm',
    component: () => import('@/views/PcgaapplicationForm.vue'),
  },
  {
    path: '/LastpageApplication',
    component: () => import('@/views/LastpageApplication.vue'),
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
    path: '/ChatComp',
    name: 'ChatComp',
    component: () => import('@/views/Chatcomponent.vue'),
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
    path: '/OnlineApplicationForm',
    component: () => import('@/views/OnlineApplicationForm.vue'),
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
