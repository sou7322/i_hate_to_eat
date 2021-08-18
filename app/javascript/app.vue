<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue';
import VueRouter from 'vue-router';

import TopPage from './components/top/TopPage.vue';
import RegisterPage from './components/register/RegisterPage.vue';

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
})

Vue.use(VueRouter)

export default {
  router
}
</script>

<style scoped>

</style>
