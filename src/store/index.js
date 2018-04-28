import Vue from 'vue';
import Vuex from 'vuex';
Vue.use(Vuex);
import userInfo from './userInfo'
import products from'./products'
module.exports = new Vuex.Store({
    strict: process.env.NODE_ENV !== 'production',
    modules: {
        a: userInfo,
        b: products
    }
});
