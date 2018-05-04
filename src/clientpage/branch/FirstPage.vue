<template>
  <div>
     <el-carousel :interval="5000" arrow="always" style="height:350px">
        <el-carousel-item style="height:350px" v-for="item in imglist" :key="item.imgurl">
          <img :src="item.imgurl" height="350px" width="100%">
        </el-carousel-item>
      </el-carousel>
      <div class="client_content">
        <p style="text-align:center; border-bottom:1px solid gainsboro;font-size:19px;color:grey;padding:10px 0">我们的服务</p>
        <div class="services">
          <ul>
            <li v-for="(item,index) in showdata1" :key="index">
              <img :src='item.url' width="250px" height="150px">
              <div>
                <p>{{item.title}}</p>
                <p>{{item.content}}</p>
              </div>
            </li>
          </ul>
        </div>
        <p style="text-align:center; border-bottom:1px solid gainsboro;font-size:19px;color:grey;padding:10px 0">我们的产品</p>
        <div class="products">
          <ul>
            <li v-for="(item,index) in filterData" :key="index" @click="showproducts(item)">
              <img :src='item.url' width="100%" height="150px">
              <div style="background:#fff">
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
       imglist:[
         {imgurl:require('../../assets/img/tab1.jpg')},
         {imgurl:require('../../assets/img/tab2.jpg')},
         {imgurl:require('../../assets/img/tab3.jpg')},
         {imgurl:require('../../assets/img/tab4.jpg')},
         {imgurl:require('../../assets/img/tab5.jpg')},
      ],
      showdata1:[
        {
          id:0,
          url:require('../../assets/img/tab1.jpg'),
          title:'服务宗旨',
          content:'以地球反反复复反反复复反反复复反反复复分极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。黑糯米等优质农产品，以公司+基地+农户合作模式，已形成较大规模原生态农产品种植基地。'
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
      ],
    }
  },
  mounted() {
      this.ajaxData();
      this.ajaxData1();
  },
  methods:{
    showproducts(item){
      item = JSON.stringify(item)
      this.$router.push({
        path:'/product/list',
        query:{
          item:item
        }         
      })
    },
    ajaxData(){
      ajax.call(this, '/listClient', this.data, (obj, err) => {
        let temp=[]
          if (!err) { 
          this.showdata1= obj.data
              this.showdata1= obj.data.filter((i)=>{
                  if(i.sort_name=='服务列表'){
                    temp.push(i)
                  }
                  return i.sort_name=="服务列表"
                })
          }
      });
    },
    ajaxData1(){
      ajax.call(this, '/listClient', this.data, (obj, err) => {
        console.log('--------',obj)
        let temp=[]
          if (!err) { 
               obj.data.filter((i)=>{
                  if(i.sort_name=='产品列表'){
                    temp.push(i)
                  }
                  return i.sort_name=="产品列表"
                })
           
          }
          //存储所有的产品列表
          localStorage.setItem('productlist',JSON.stringify(temp))
          // console.log('--------',temp)
      });
    }
      
  },
  watch:{
    
  },
  computed: {
    filterData() {
      let showdata1=JSON.parse(localStorage.getItem('productlist'))
      let list=[]
      list=showdata1.filter((i,index)=>{//filter方法是过滤，能满足的条件才能展示出
        return index <4
      })
      return list
  },
      
  },
}
</script>
<style lang="scss" scoped>
.f_content{
  color: gainsboro

}
.client_content{
  .services{
    ul{
      padding: 0px;
      margin: 10px;
      display: flex;
      flex-wrap:wrap;
      align-items: flex-start;
      li{
        // border: 1px solid #575353;
        margin-right: 7px;
        width: 385px;
        height: 300px;
        padding: 10px;
        margin-top:5px;
        text-align: center;
        p:nth-child(2){
          font-size: 13px;
           line-height: 25px;
        }
        &:nth-child(3n){
          margin-right: 0px
        }
          
      }
    }
  }
  .products{
     ul{
      padding: 0px;
      margin: 10px;
      display: flex;
      flex-wrap:wrap;
      align-items: flex-start;
      cursor: pointer;
      li{
        border: 1px solid #575353;
        margin-right: 10px;
        width: 285px;
        padding: 10px;
        margin-top:5px;
        height: 300px;
        p{margin: 0 10px;} 
        p:nth-child(2){
          font-size: 13px;
           line-height: 25px;
           
        }
        &:nth-child(4n){
          margin-right: 0px
        }
      }
    }
  }
}
</style>


