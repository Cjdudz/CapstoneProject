import { createRouter, createWebHistory } from 'vue-router';
import HomeView from '../views/HomeView.vue';
import LoginComponent from '../views/LoginComponent.vue'; // Corrected import statement
import RegisterComponent from '../views/RegisterComponent.vue';
import Home from '../views/Home.vue';
import OnlineApplicationForm from '../views/OnlineApplicationForm.vue';
import Chatcomponent from '../views/Chatcomponent.vue'; // Corrected import statement
import ApplicantList from '../views/ApplicantList.vue';

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView,
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
    component: LoginComponent, // Corrected component name
  },
  {
    path: '/RegisterComponent',
    name: 'register',
    component: RegisterComponent,
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue'),
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
