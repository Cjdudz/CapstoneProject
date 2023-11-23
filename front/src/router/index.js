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
import MembershipapplicationPAge1 from '@/views/MembershipapplicationPAge1.vue'
import MembershipapplicationPAge2 from '@/views/MembershipapplicationPAge2.vue'
import MembershipapplicationPAge5 from '@/views/MembershipapplicationPAge5.vue'
import MembershipapplicationPAge4 from '@/views/MembershipapplicationPAge4.vue'
import Personalhistory from '@/views/Personalhistory.vue'
import Maritalhistory from '@/views/Maritalhistory.vue'
import MilitaryHistory from '@/views/MilitaryHistory.vue'
import CountryVisited from '@/views/CountryVisited.vue'
import Neighbors from '@/views/Neighbors.vue'
import LastpageApplication from '@/views/LastpageApplication.vue'
import PcgaapplicationForm from '@/views/PcgaapplicationForm.vue'
const routes = [
 
  {
    
    path: '/',
    name: 'home',
    component: HomeView,
  },
  {path:'/CountryVisited', component:CountryVisited},
  { path: '/Overview', component: Overview },
  { path: '/MembershipapplicationPAge5', component: MembershipapplicationPAge5},
  { path: '/MembershipapplicationPAge2', component: MembershipapplicationPAge2 },
  { path: '/MembershipapplicationPAge1', component: MembershipapplicationPAge1 },
  { path: '/MembershipapplicationPAge4', component: MembershipapplicationPAge4 },
  { path: '/MilitaryHistory', component: MilitaryHistory },
  { path: '/Personalhistory', component: Personalhistory },
  { path: '/Maritalhistory', component: Maritalhistory },
  { path: '/Neighbors', component: Neighbors },
  { path: '/PcgaapplicationForm', component: PcgaapplicationForm },
  { path: '/LastpageApplication', component: LastpageApplication },
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
