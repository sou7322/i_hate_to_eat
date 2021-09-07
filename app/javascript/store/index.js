import Vue from 'vue';
import Vuex from 'vuex';
import createPersistedState from 'vuex-persistedstate';

import flashMessage from './modules/flashMessage';
import authUser from './modules/authUser';
import bmrParams from './modules/bmrParams';
import pfcBalance from './modules/pfcBalance';

Vue.use(Vuex);

const store = new Vuex.Store({
  modules: {
    flashMessage,
    authUser,
    bmrParams,
    pfcBalance
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