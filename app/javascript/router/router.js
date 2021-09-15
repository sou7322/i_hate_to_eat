import Vue from 'vue';
import VueRouter from 'vue-router';

import TopPage from '../components/pages/TopPage';
import RegisterPage from '../components/pages/RegisterPage';
import HomePage from '../components/pages/HomePage';
import MyPage from '../components/pages/MyPage';
import FoodIndex from '../components/pages/FoodIndex';
import FoodIndexByCategory from '../components/pages/FoodIndexByCategory';

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
      path: '/search',
      component: FoodIndex,
      name: 'FoodIndex'
    },
    {
      path: '/search/:id(\\d+)',
      component: FoodIndexByCategory,
      name: 'FoodIndexByCategory'
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
