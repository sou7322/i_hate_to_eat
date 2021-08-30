import Vue from 'vue';
import Vuex from 'vuex';
import createPersistedState from 'vuex-persistedstate';

import flashMessage from './modules/flashMessage';
import authUser from './modules/authUser';

Vue.use(Vuex);

const store = new Vuex.Store({
  modules: {
    flashMessage,
    authUser
  },

  plugins: [createPersistedState({
    key: 'iHateToEat',
    paths: [
      'authUser.userId',
      'authUser.isLoggedIn'
    ],
    storage: window.localStorage
  })]
});

export default store;