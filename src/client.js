import 'babel-polyfill';
import Vue from 'vue';
import App from './App';
import ElementUI from 'element-ui';
import '../static/style.css';
import './assets/css/common.css'
import 'element-ui/lib/theme-default/index.css';
import Vuex from 'vuex';

Vue.use(Vuex);
import store from './store/';//本地存储
import {storage} from 'utils';

Vue.use(ElementUI);
Vue.config.productionTip = false
import router from './Croutes.js';

//页面顶部进度条

new Vue({
    router,
    store,
    'render': h => h(App)
}).$mount('#app');
