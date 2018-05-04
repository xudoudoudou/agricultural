<template>
  <div class="product">
    <div class="client_content">
      <div class="products">
        <h1><span>产品展示</span></h1>
          <ul>
            <li v-for="(item,index) in showdata1" :key="index" @click="showproducts(item)">
              <img :src='item.url' width="100%" height="150px">
              <div class="pcontent">
                <p>{{item.title}}</p>
                <p>{{item.content}}</p>
              </div>
            </li>
          </ul>
        </div>
    </div>
   
  </div>

</template>
<script>
import {ajax,storage} from 'utils';
import common from 'common';
export default {
  data(){
    return{
      data:{
        // title:'',
        // content:''
      },
      showdata1:[
        {
          id:0,
          url:require('../../assets/img/zt.jpg'),
          title:'竹筒酒，醇香美味，回味无穷',
          content:'以地球极低度开发方式。生产以原生态老挝香米、黑糯米等优质农产品，以公司+基地+农户合作模式，已形成较大规模原生态农产品种植基地。',
          productimglist:[
            {plurl:require('../../assets/img/zhutong.jpg')},
            {plurl:require('../../assets/img/zhutong1.jpg')},
            {plurl:require('../../assets/img/zhutong2.jpg')}
          ]
        },
        {
          id:1,
          url:require('../../assets/img/tab2.jpg'),
          title:'服务宗旨',
          content:'以地球极低度开发的生态环原生态老挝香米、黑糯米等优较大规模原生态农产品种植基地。'
        },
        {
          id:2,
          url:require('../../assets/img/tab3.jpg'),
          title:'服务宗旨',
          content:'以地球极施化肥，主施生物肥等原生态种植方式。生产以原生态老挝香米、黑糯米农户合作模式，已形成较大规模原生态农产品种植基地。'
        },
        {
          id:3,
          url:require('../../assets/img/ege.jpg'),
          title:'服务宗旨',
          content:'以地球极低度开发的生态环原生态老挝香米、黑糯米等优较大规模原生态农产品种植基地。'
        },
        {
          id:5,
          url:require('../../assets/img/tab1.jpg'),
          title:'服务宗旨',
          content:'以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。生产以原生态老挝香米、黑糯米等优质农产品，以公司+基地+农户合作模式，已形成较大规模原生态农产品种植基地。'
        },
        {
          id:6,
          url:require('../../assets/img/tab2.jpg'),
          title:'服务宗旨',
          content:'以地球极低度开发的生态环原生态老挝香米、黑糯米等优较大规模原生态农产品种植基地。'
        },
        {
          id:7,
          url:require('../../assets/img/tab3.jpg'),
          title:'服务宗旨',
          content:'以地球极施化肥，主施生物肥等原生态种植方式。生产以原生态老挝香米、黑糯米农户合作模式，已形成较大规模原生态农产品种植基地。'
        },
        {
          id:8,
          url:require('../../assets/img/tab2.jpg'),
          title:'服务宗旨',
          content:'以地球极低度开发的生态环原生态老挝香米、黑糯米等优较大规模原生态农产品种植基地。'
        },
      ]
    }
  },
  computed: {
   
  },
  created(){
    this.getproductlist()
  },
  mounted() {
      this.ajaxData();
  },
  methods:{
    getproductlist(){
      // let savedata=this.showdata1
      // this.$store.dispatch('saveproductlist',JSON.stringify(this.showdata1))
      
     
    },
    showproducts(item){
      item = JSON.stringify(item)
        this.$router.push({
          path:'/product/list',
          query:{
            item:item
          }
          
        })
    },
    //listClient
     ajaxData(){
      ajax.call(this, '/listClient', this.data, (obj, err) => {
        let temp=[]
          if (!err) { 
               this.showdata1= obj.data.filter((i)=>{
                  if(i.sort_name=='产品列表'){
                    temp.push(i)
                  }
                  return i.sort_name=="产品列表"
                })
           
          }
          //存储所有的产品列表
          // localStorage.setItem('productlist',JSON.stringify(temp))
          // console.log('--------',temp)
      });
    }
  },
} 
</script>
<style lang="scss" scoped>
  
            
.client_content{
  background: #ffffff;
}
.products{
  width: 900px;
  margin: 0 auto;
    h1{
      line-height: 30px;
      font-weight: normal;
      position: relative;
      padding: 5px;
      text-align: center;
      margin-bottom: 15px;
      span{
        font-size: 30px;
        color: rgb(141, 138, 138);
      }
    }
     ul{
      padding: 0px;
      display: flex;
      flex-wrap:wrap;
      align-items: flex-start;
      cursor: pointer;
      li{
        margin-right: 0px;
        width: 299px;
        padding: 10px;
        margin-top:10px;
        .pcontent{
          background: #f5f5f5 ;
          text-align: center;
          height: 140px;
          box-shadow: 0px 3px rgb(228, 225, 225);
        }
        p{margin: 0 10px;} 
        p:nth-child(2){
          font-size: 13px;
           line-height: 25px;
           height: 100px;
           display: -webkit-box !important;
           overflow:hidden;
          white-space:normal;
           text-overflow:ellipsis;
          word-break: break-all;  
          -webkit-box-orient: vertical;  
          -webkit-line-clamp: 3; 
           
        }
        &:nth-child(4n){
          margin-right: 0px
        }
      }
    }
  }
</style>
