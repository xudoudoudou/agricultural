<template>
  <div class="product">
    <div class="client_content" >
      <div class="products">
        <h1><span>产品展示</span></h1>
          <ul>
            <li v-for="(item,index) in showdata1" :key="index" @click="showproducts(item)">
              <img :src='item.article_extend' width="100%" height="150px">
              <div class="pcontent">
                <p>{{item.title}}</p>
                <p>{{item.maincontent}}</p>
              </div>
            </li>
          </ul>
            <el-pagination
              @current-change="handleCurrentChange"
              :current-page="search_data.page"
              :page-size="search_data.pageSize"
              layout="total, prev, pager, next,jumper"
              :total="search_data.total">
            </el-pagination>
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
      search_data: {
          page: 1,
          pageSize:9,
          total:0,
      },
      showdata1:[
        {
          id:0,
          article_extend:require('../../assets/img/zt.jpg'),
          title:'竹筒酒，醇香美味，回味无穷',
          maincontent:'以地球极低度开发方式。生产以原生态老挝香米、黑糯米等优质农产品，以公司+基地+农户合作模式，已形成较大规模原生态农产品种植基地。',
        },
      ]
    }
  },
  computed: {
   
  },
  created(){
  },
  mounted() {
      this.ajaxData();
  },
  methods:{
    handleCurrentChange(page){
      if(page !== this.search_data.page){
          this.search_data.page = page;
          this.ajaxData();
      }
    },
    showproducts(item){
        this.$router.push({
          path:'/product/list',
          query:{
            id:item.id,
          }  
        })
    },
     ajaxData(){
       this.axios.post('/listProduct',this.search_data).then((res)=>{
          let data=res.data.data.data
           this.showdata1= data               
                this.showdata1.map(i=>{
                  let img=JSON.parse(i.article_extend).pic
                  return i.article_extend=img    
                })
              this.search_data.total = res.data.data.total;
                this.search_data.page =res.data.data.page;
                
        }).catch((err) => {
          console.log('sss',err)
        })
    }
  },
} 
</script>
<style lang="scss" scoped>         
.client_content{
  background: #ffffff;
}
.el-pagination{
    margin:10px 0;
    text-align: center;
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
        .showimg{
          // width: 279px;    
          overflow:hidden;
          height:150px; 
          img{
            width:200px;
          }
        }
        .pcontent{
          background: #f5f5f5 ;
          text-align: center;
          height: 125px;         
          box-shadow: 0px 3px rgb(228, 225, 225);
        }
        
        p{margin: 0 10px;} 
        p:nth-child(2){
          font-size: 13px;
           line-height: 25px;
           word-wrap:break-word;  
          word-break:break-all;
        }
        &:nth-child(4n){
          margin-right: 0px
        }
      }
    }
  }
</style>
