import { createRouter, createWebHistory } from 'vue-router';

const requireAuth = (to, from, next) => {
  if (localStorage.getItem('token')) {
    next('/');
  } else {
    next();
  }
};

const routes = [
  {
    path: '/Helloworld',
    name: 'home',
    component: () => import('@/views/HomeView.vue'),
  },
  {
    path: '/Addcontent',
    component: () => import('@/views/Changecontent.vue'),
  },
  {
    path: '/Tryform',
    name: 'tryform',
    component: () => import('@/views/Tryform.vue'),
  },
  {
    path: '/Fileupload',
    name: 'Fileupload',
    component: () => import('@/views/Forms/Fileupload.vue'),
  },
  {
    path: '/Upload',
    name: 'Upload',
    component: () => import('@/views/Forms/Upload.vue'),
  },
  {
    path: '/Terms',
    name: 'home',
    component: () => import('@/views/Terms.vue'),
    beforeEnter: requireAuth,
  },
  {
    path: '/PersonalInfo',
    name: 'home',
    component: () => import('@/views/Forms/PersonalInfo.vue'),
    beforeEnter: requireAuth,
  },
  {
    path: '/Contacts',
    name: 'Contacts',
    component: () => import('@/views/Contacts.vue'),
  },
  {
    path: '/LandingApp',
    name: 'LandingApp',
    component: () => import('@/views/LandingApp.vue'),
  },
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
    path: '/privacy',
    name: 'privacy',
    component: () => import('@/views/privacy.vue'),
  },
  {
    path: '/Availableupdates',
    name: 'Availableupdates',
    component: () => import('@/views/Availableupdates.vue'),
  },
  {
    path: '/Additional',
    name: 'Additional',
    component: () => import('@/views/Forms/Additional.vue'),
    beforeEnter: requireAuth,
  },
  {
    path: '/',
    component: () => import('@/views/Landingpage.vue'),
  },
  {
    path: '/EducationalBackground',
    component: () => import('@/views/Forms/EducationalBackground.vue'),
    beforeEnter: requireAuth,
  },
  {
    path: '/Formtemplate',
    component: () => import('@/views/Forms/Formtemplate.vue'),
  },
  {
    path: '/Employment',
    component: () => import('@/views/Forms/Employment.vue'),
    beforeEnter: requireAuth,
  },
{
    path: '/Readiness',
    component: () => import('@/views/Forms/Readiness.vue'),
    beforeEnter: requireAuth,
  },
  {
    path: '/Emergency',
    component: () => import('@/views/Forms/Emergency.vue'),
    beforeEnter: requireAuth,
  },
  {
    path: '/IdentificationCard',
    component: () => import('@/views/Forms/IdentificationCard.vue'),
    beforeEnter: requireAuth,
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
    beforeEnter: requireAuth,
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