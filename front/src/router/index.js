import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import Login from '../views/LoginComponent.vue'
import RegisterComponent from '../views/RegisterComponent.vue'
import Home from '../components/Home.vue'


const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/Home',
    name: 'home',
    component: Home
  },
  {
    path: '/LoginComponent',
    name: 'login',
    component: Login
  },
  {
    path: '/RegisterComponent',
    name:'register',
    component: RegisterComponent
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router