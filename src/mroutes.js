import Vue from 'vue'
import Router from 'vue-router'
import NoFind from 'page/NoFind.vue'
import Home from './mobail/home.vue'
import mFirstPage from './mobail/branch/mFirstPage'
import mAbout from './mobail/branch/mAbout'
import mTourism from './mobail/branch/mTourism'
import mProduct from './mobail/branch/mProduct'
import mCall from './mobail/branch/mCall'
import mShowProducts from './mobail/branch/mShowProducts'
import mshowtou from './mobail/branch/mshowtou'
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
            redirect: '/mcn'
        },
        {
            path: '/mobail',
            name: 'home',
            component: Home,
            children: [
                {
                    path: '/mcn',
                    name:'mFirstPage',
                    component: mFirstPage
                },
                {
                    path: '/mabout',
                    name: '公司信息',
                    component: mAbout
                },
                {
                    path: '/mtourism',
                    name: '村庄旅游',
                    component: mTourism
                },
                {
                    path: '/mtourism/mshowtou',
                    name: '游乐项目',
                    component: mshowtou
                },
                {
                    path: '/mproduct',
                    name: '产品展示',
                    component: mProduct,
                },
                {
                    path: '/product/list',
                    name: '产品介绍',
                    component: mShowProducts
                },
                {
                    path: '/mcall',
                    name: '联系我们',
                    component: mCall
                }
            ]
        },
      
            
   

    ]


})