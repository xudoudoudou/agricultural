<template>
  <div class="first">
    <div style="border-bottom:1px solid rgb(187,187,187);margin-top:20px"></div>
   <div class="mproduct">
      <h2 style="text-align:center;margin:5px 0px;font-size:26px;color: #FF9900;">产品中心</h2>
      <ul>
        <li v-for="(item,index) in productlist" v-if="index<4" :key="index" @click="showproducts(item)">
          <img :src='item.article_extend'>
          <div class="mcontent">
            <p>{{item.title}}</p>
            <p>{{item.maincontent}}</p>
          </div>
        </li>
      </ul>
   </div>
   <div style="border-bottom:1px solid rgb(187,187,187);margin:20px 0px 10px 0px;"></div>
    <div class="about">
      <h2 style="text-align:center;margin:5px 0px; font-size:26px;color: #FF9900;">关于我们</h2>
      <strong style="font-size: 17.6px; color:rgb(102, 102, 102); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);">{{companydata.company}}</strong>
      <p class="p2">{{companydata.introdction}}</p>
    </div>

    <!-- <div style="border-bottom:1px solid rgb(187,187,187);margin-bottom:10px;"></div> -->
  </div>
</template>
<script>
import common from 'common';
export default {
  data(){
    return{
      loading:false,
      productlist:[],
      data:{},
      imglist:[],
      companydata:{
        company:'',//公司名称
        introdction:'',//公司简介
      },
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
      this.ajaxData1();
      this.getimgtablist();
      this.getcompanydata()
  },
  methods:{
    getcompanydata(){
       this.axios.post('/companydata',{
          companydata: this.companydata
        }).then((res) => {
          let data=res.data.data.data
          data.map(i=>{
              this.companydata=i
              return i
          })
        }).catch((err) => {
          console.log(err)
        })
    },
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
.first{
  padding:0px 4px;
}
.mproduct{
  ul{
    display: flex;
    flex-wrap:wrap;
    align-items: flex-start;
    li:nth-child(2n+1){
        margin-right: 1px
      }
    li{
      width:49.8%;
      margin-bottom: 5px;
      box-shadow: 0px 3px rgb(192, 188, 188);
      img{
        width:100%;
        height: 100px;
        
      }
      .mcontent{
        background: rgb(247, 245, 245);
        border: 1px solid white;
        // box-shadow: 0px -4px rgb(218, 215, 215);
        p{
          word-wrap:break-word;  
          word-break:break-all;
          margin: 0px;
          color: #666666;
          padding:3px 8px;
           
        }
        p:nth-child(1){
          font-size: 17px;
           line-height: 22px;
           margin-bottom: 2px;
          
        }
        p:nth-child(2){
          font-size: 13px;
           line-height: 17px;
        }
      }
    }
    
  }
}
.about{
  text-align: center;
  p{
    word-wrap:break-word;  
    word-break:break-all;
    margin: 0px;   
  }

  .p2{
    margin: 10px 0;
    font-size: 17px;
    line-height: 22px;
    color: rgb(102, 102, 102);
  }
  
}
</style>


