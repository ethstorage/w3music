import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);
export default new Vuex.Store({
  state: {
    chainConfig: {},
    account: '',
    showDialog: false,
  },
  mutations: {
    chainMutation: (state, payload) => state.chainConfig = payload,
    accountMutation:  (state, payload) => state.account = payload,
    showDialogMutation:  (state, payload) => state.showDialog = payload,
  },
  actions: {
    setChainConfig: ({ commit }, payload) => commit('chainMutation', payload),
    setAccount: ({ commit }, payload) => commit('accountMutation', payload),
    setShowDialog: ({ commit }, payload) => commit('showDialogMutation', payload),
  },
  modules: {
  },
});
