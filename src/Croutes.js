import Vue from 'vue'
import Router from 'vue-router'
import NoFind from 'page/NoFind.vue'
import ClientHome from './clientpage/ClientHome'
import FirstPage from './clientpage/branch/FirstPage'
import About from './clientpage/branch/About'
import Tourism from './clientpage/branch/Tourism'
import Product from './clientpage/branch/Product'
import Call from './clientpage/branch/Call'
import ShowProducts from './clientpage/branch/ShowProducts'

Vue.use(Router)
export default new Router({
    routes: [
        {
            path: '*',
            name: '/404',
            component: NoFind
        }, 
        {
            path: '/',
            redirect: '/cn'
        },
        {
            path: '/clienthome',
            component: ClientHome,
            name:'首页',
            children:[
                {
                    path: '/cn',
                    name:'fff',
                    component: FirstPage  
                },
                {
                    path: '/about',
                    name: '公司信息',
                    component: About
                },
                {
                    path: '/tourism',
                    name: '村庄旅游',
                    component: Tourism
                },
                {
                    path: '/product',
                    name: '产品展示',
                    component: Product,
                },
                {
                    path: '/product/list',
                    name: '产品介绍',
                    meta: { title: '产品介绍' },
                    component: ShowProducts
                },
                
                {
                    path: '/call',
                    name: '联系我们',
                    component: Call
                }
            ]
        },

    ]


})