import { createRouter as createRouter, createWebHistory } from 'vue-router'
import { useStore } from 'vuex'

// Import components

import LoginView from '../views/LoginView.vue';
import LogoutView from '../views/LogoutView.vue';
import RegisterView from '../views/RegisterView.vue';
import PlantDetailsView from '../views/PlantDetailsView.vue';
import PlantSearchView from '../views/PlantSearchView.vue';
import MyGardenView from '../views/MyGardenView.vue';
import HomePageView from '../views/HomePageView.vue';
import NotFoundView from '../views/NotFoundView.vue';
import RecommendationWizard from '../components/RecommendationWizard.vue';


/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */
const routes = [
  {
    path: '/',
    name: 'home',
    component: HomePageView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: '/search',
    name: 'plantSearch',
    component: PlantSearchView,
    meta: {
      requiresAuth: false
    }
  },

  {
    path: '/garden',
    name: 'garden',
    component: MyGardenView,
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/plants/:id',
    name: 'plantDetails',
    component: PlantDetailsView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/login",
    name: "login",
    component: LoginView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/logout",
    name: "logout",
    component: LogoutView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/register",
    name: "register",
    component: RegisterView,
    meta: {
      requiresAuth: false
    }
  },

  {
    path: '/wizard',
    name: 'wizard',
    component: RecommendationWizard,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/notfound",
    name: "notFound",
    component: NotFoundView,
    meta: {
      requiresAuth: false
    }
  },

  {
    path: '/:pathMatch(.*)*',
    name: 'notFound',
    component: NotFoundView,
    meta: {
      requiresAuth: false
    }
  }
];

// Create the router
const router = createRouter({
  history: createWebHistory(),
  routes: routes
});

router.beforeEach((to,from,next) => {

  // Get the Vuex store
  const store = useStore();

  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    return {name: "login"};
  }
  if (store.state.token !== '' && to.name === 'login') {
    next({name:'plantSearch'});
  }else {
    next();
  } 
});

export default router;
