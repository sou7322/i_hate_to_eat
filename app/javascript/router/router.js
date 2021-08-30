import Vue from 'vue';
import VueRouter from 'vue-router';

import TopPage from '../components/pages/top/TopPage';
import RegisterPage from '../components/pages/register/RegisterPage';
import HomePage from '../components/pages/home/HomePage';

Vue.use(VueRouter);

const router = new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      component: TopPage,
      name: 'TopPage'
    },
    {
      path: '/register',
      component: RegisterPage,
      name: 'RegisterPage'
    },
    {
      path: '/home',
      component: HomePage,
      name: 'HomePage'
    }
  ]
});

export default router;
