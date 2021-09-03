import Vue from 'vue';
import VueRouter from 'vue-router';

import TopPage from '../components/pages/TopPage';
import RegisterPage from '../components/pages/RegisterPage';
import HomePage from '../components/pages/HomePage';
import MyPage from '../components/pages/MyPage';

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
    },
    {
      path: '/mypage',
      component: MyPage,
      name: 'MyPage'
    }
  ]
});

export default router;
