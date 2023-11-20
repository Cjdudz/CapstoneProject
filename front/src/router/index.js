import { createRouter, createWebHistory } from 'vue-router';
import HomeView from '../views/HomeView.vue';
import LoginComponent from '../views/LoginComponent.vue';
import RegisterComponent from '../views/RegisterComponent.vue';
import Home from '../views/Home.vue';
import OnlineApplicationForm from '../views/OnlineApplicationForm.vue';
import Chatcomponent from '../views/Chatcomponent.vue';
import ApplicantList from '../views/ApplicantList.vue';
import Admin from '../views/Admin.vue'; // Corrected import statement
import users from '../views/users.vue';
import ApplicantsData from '../views/ApplicantsData.vue';
import Overview from '@/views/Overview.vue'

const routes = [
 
  {
    
    path: '/',
    name: 'home',
    component: HomeView,
  },
  { path: '/Overview', component: Overview },
  {
    path: '/ApplicantsData',
    name: 'ApplicantsData', // Corrected the name
    component: ApplicantsData,
  },
  {
    path: '/users',
    component: users,
  },
  {
    path: '/admin',
    component: Admin,
  },
  {
    path: '/ChatComp',
    name: 'ChatComp',
    component: Chatcomponent,
  },
  {
    path: '/ApplicantList',
    name: 'ApplicantList',
    component: ApplicantList,
  },
  {
    path: '/Home',
    name: 'homeKo',
    component: Home,
  },
  {
    path: '/OnlineApplicationForm',
    component: OnlineApplicationForm,
  },
  {
    path: '/LoginComponent',
    name: 'login',
    component: LoginComponent,
  },
  {
    path: '/RegisterComponent',
    name: 'register',
    component: RegisterComponent,
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
