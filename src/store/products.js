module.exports = {
    state: {
        productlist:'[]'
    },
    actions: {
        saveproductlist({ commit }, savedata){
            commit('saveproducts',savedata)
        }
    },
    mutations: {
        saveproducts(state, savedata){
            state.productlist = savedata
        }
    },
   
};
