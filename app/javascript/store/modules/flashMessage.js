const state = {
  type: 'success',
  message: ''
};

const mutations = {
  setMessage (state, { type, message, timeout }) {
    state.type = type;
    state.message = message;

    if (typeof timeout === 'undefined') {
      timeout = 3000;
    };

    setTimeout(() => {
      state.type = 'success';
      state.message = '';
    },
    timeout);
  }
};

export default {
  namespaced: true,
  state,
  mutations
};
