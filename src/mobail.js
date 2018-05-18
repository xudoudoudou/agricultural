import Vue from 'vue';
import App from './App';
import VueRouter from 'vue-router';
import Vuex from 'vuex';
import Vant from 'vant';
import 'vant/lib/vant-css/index.css';
import axios from 'axios';
import './assets/css/common.css';
import './assets/js/rem.js'
import VueLazyload from 'vue-lazyload'

Vue.prototype.axios = axios;

Vue.use(VueLazyload, {
    loading: require('./assets/load.png'),
    error: require('./assets/error(1).png')
});
Vue.use(Vant);
Vue.use(Vuex);
import store from './store/';//本地存储

Vue.use(VueRouter);
import router from './mroutes.js';
new Vue({
    router,
    store,
    'render': h => h(App)
}).$mount('#app');