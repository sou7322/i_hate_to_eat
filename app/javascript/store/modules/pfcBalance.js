const state = {
  percentage_protein: '',
  percentage_fat: '',
  percentage_carbohydrate: ''
};

const mutations = {
  updateP(state, p) {
    state.percentage_protein = p;
  },
  updateF(state, f) {
    state.percentage_fat = f;
  },
  updateC(state, c) {
    state.percentage_carbohydrate = c;
  }
};

const actions = {
  setAttributes(context, attr) {
    context.commit('updateP', attr.pctP);
    context.commit('updateF', attr.pctF);
    context.commit('updateC', attr.pctC);
  }
};

export default {
  namespaced: true,
  state,
  mutations,
  actions
};