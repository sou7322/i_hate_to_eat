import Vue from 'vue';
import VueRouter from 'vue-router';

import TopPage from '../components/pages/top/TopPage.vue';
import RegisterPage from '../components/pages/register/RegisterPage.vue';

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
    }
  ]
});

export default router;
