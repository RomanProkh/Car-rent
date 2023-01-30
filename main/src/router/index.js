import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../components/HomeView.vue'


const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../components/AboutView.vue')
  },
  {
    path: '/contactUs',
    name: 'contactUs',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../components/contactUsView.vue')
  },
  {
    path: '/signIn',
    name: 'signIn',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../components/contactUsView.vue')
},
  {
    path: '/car-results',
    name: 'carResults',
    component: () => import(/* webpackChunkName: "carResults" */ '../components/CarResultsView.vue'),
    props: true,
  },
  {
    path: '/order',
    name: 'order',
    component: () => import(/* webpackChunkName: "order" */ '../components/OrderView.vue'),
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
