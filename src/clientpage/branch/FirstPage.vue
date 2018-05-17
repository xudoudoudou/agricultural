<template>
  <div >
     <el-carousel :interval="5000" arrow="always" style="height:420px">
        <el-carousel-item style="height:420px" v-for="(item,index) in imglist" :key="index">
          <div class="tabimg" v-html="item" height="420px" width="100%"></div>
          <!-- <img :src="item.imgurl" height="350px" width="100%"> -->
        </el-carousel-item>
      </el-carousel>
      <div class="cclient_content">
        <p style="text-align:center; border-bottom:1px solid gainsboro;font-size:19px;color:grey;padding:10px 0">我们的服务</p>
        <div class="services">
          <ul v-loading="loading">
            <li v-for="(item,index) in showdata1" :key="index">
              <img src='' v-lazy="item.article_extend" width="250px" height="150px">
              <div>
                <p>{{item.title}}</p>
                <p>{{item.maincontent}}</p>
              </div>
            </li>
          </ul>
        </div>
        <p style="text-align:center; border-bottom:1px solid gainsboro;font-size:19px;color:grey;padding:10px 0">我们的产品</p>
        <div class="products">
          <ul>
            <li v-for="(item,index) in productlist" v-if="index<4" :key="index" @click="showproducts(item)">
              <img src='' v-lazy="item.article_extend" width="100%" height="150px">
              <div style="background:#fff;height:125px">
                <p>{{item.title}}</p>
                <p>{{item.maincontent}}</p>
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
      loading:false,
      productlist:[],
      data:{},
       imglist:[],
      showdata1:[
        {
          id:0,
          article_extend:require('../../assets/img/tab1.jpg'),
          title:'服务宗旨服务宗',
          content:'以地球反反复复反反复复反反复复反反复复分极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。以地球极低度开发方式。黑糯米等优质农产品，以公司+基地+农户合作模式，已形成较大规模原生态农产品种植基地。'
        },
      ],
    }
  },
  mounted() {
      this.ajaxData();
      this.ajaxData1();
      this.getimgtablist()
  },
  methods:{
    //获取轮播图图片
     getimgtablist(){
       this.axios.post('/clientablist',{
          data: this.data
        }).then((res) => {
          let data=res.data.data.data
            let abr=[]
            data.filter(i=>{
              if(i.id==30){
                abr.push(i) 
                abr.map(j=>{
                  let imgdata=j.content
                  let strs=imgdata.split(">")
                  let arr=[]
                  for(let o=0;o<strs.length-1;o++){
                    let fn='>'
                    let img=strs[o]
                      img=strs[o]+fn
                      arr.push(img)
                  }
                  this.imglist=arr
                })
              }                   
            })
        }).catch((err) => {
          console.log(err)
        })
    },
    showproducts(item){
      this.$router.push({
        path:'/product/list',
        query:{
          id:item.id
        }         
      })
    },
    ajaxData(){
      this.loading=true
      this.axios.post('/listClient',{data:this.data}).then((res)=>{
        this.loading=false
        let data=res.data.data.data
        let temp=[]
        this.showdata1= data.filter((i)=>{
              let img=JSON.parse(i.article_extend).pic
                  if(i.sort_name=="服务列表"&& i.passed==0){
                        temp.push(i)
                  }                  
                  temp.map((j)=>{
                    if(j.id==i.id){
                      return j.article_extend=img
                    }
                    
                  }) 
              return i.sort_name=="服务列表"&& i.passed==0              
            })
        }).catch((err) => {
          console.log(err)
        })
    },
    ajaxData1(){
      this.loading=true
       this.axios.post('/listProduct',{data:this.data}).then((res)=>{
         this.loading=false
         let data=res.data.data.data
         this.productlist=data
          this.productlist.map((i)=>{
            let img=JSON.parse(i.article_extend).pic
            i.article_extend=img
            return i    
          })  
        }).catch((err) => {
          console.log(err)
        })
      
    }
      
  },
  watch:{
    
  },
  computed: {
      
  },
}
</script>
<style lang="scss" scoped>
.f_content{
  color: gainsboro

}
.cclient_content{
  width: 1200px;
  margin: 0 auto;
  .services{
    ul{
      padding: 0px;
      margin: 10px;
      display: flex;
      flex-wrap:wrap;
      align-items: flex-start;
      li{
        margin-right: 7px;
        width: 385px;
        height: 280px;
        padding: 10px;
        margin-top:5px;
        text-align: center;
        p{
          word-wrap:break-word;  
          word-break:break-all;
        }
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
        margin-right: 10px;
        width: 285px;
        padding: 10px;
        margin-top:5px;
        height: 300px;       
        p{margin: 0 10px;
          word-wrap:break-word;  
          word-break:break-all;
        } 
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


