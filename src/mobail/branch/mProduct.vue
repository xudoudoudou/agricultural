<template>
  <div class="product">
    <ul class="menu">
      <p @click="showmenu">产品中心<img :src="iscirclie ? imgurl:imgurl1"></p>
      <div id="list" >
        <li v-for="(item,index) in showdata0" :key="index" @click="showproducts(index,item)" :class="{choose:index==navCur}">{{item.title}}</li>
      </div>
    </ul>
     <p style="margin:5px 5px;height:22px;line-height:22px;">
        <span style="color:#757575;font-size:14px "><img style="margin-right:7px;position:relative;top:3px;" src="../../assets/home.png">您当前的位置：<router-link to='/mproduct' style="font-size:14px">产品展示</router-link></span> 
      </p>
    <ul class="menulist">
      <li v-for="(item,index) in showdata1" :key="index" @click="showproducts(null,item)">
        <img src='' v-lazy="item.article_extend" >
        <div class="mcontent">
          <p>{{item.title}}</p>
        </div>
      </li>
    </ul>
    <van-pagination 
      v-model="search_data.page"
      :items-per-page="search_data.pageSize"
      :total-items="search_data.total" 
      :show-page-size="3" 
      force-ellipses
      @change="changepage"
    />
  </div>

</template>
<script>
export default {
  data(){
    return{
      navCur:0,
      iscirclie:true,
      currentPage:1,
      imgurl:require('../../assets/down-circle-o.png'),
      imgurl1:require('../../assets/up-circle-o.png'),
      dat:{},
      search_data: {
          page: 1,
          pageSize:6,
          total:0,
      },
      showdata0:[],
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
      this.showdata();
  },
  methods:{
     showdata(){
         this.axios.post('/listClient',{data:this.data}).then((res)=>{
          let data=res.data.data.data
          let temp=[]
          this.showdata0= data.filter((i)=>{
              if(i.sort_name=='产品列表'&& i.passed==0){
                
                temp.push(i)
              }
              return i.sort_name=="产品列表"&&i.passed==0
            })
        }).catch((err) => {
          console.log(err)
        })
      },
    showmenu(){
        let getli=document.getElementById('list')
         if(getli.style.display=='block'){
           getli.style.display='none'
           this.iscirclie=true
         }else{
           getli.style.display='block'
           this.iscirclie=false
         }
      },
      changepage(page){
        this.search_data.page = page;
        this.ajaxData();
      },
    showproducts(index,item){
      this.navCur=index
        this.$router.push({
          path:'/product/list',
          query:{
            id:item.id,
          }  
        })
    },
     ajaxData(){
      this.axios.post('/applistProduct',this.search_data).then((res)=>{
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
.menu{
  margin-top: 15px;
  p{
  padding: 0px 10px 0px 5px;
  margin:0px;
  background: #FF9900;;
  font-size: 15px;
  color:white;
  line-height: 38px;
  height: 38px;
    img{
      width: 20px;
      height: 20px;
      border-radius: 180px;
      background:white;
      float: right;
      position: relative;
      top:9px;
    }
  }
  div{
    display: none;
    li{
      padding-left: 10px;
      border-bottom: 1px solid white;
      height: 25px;
      line-height: 25px;
      font-size: 13px;
      color: #2b2b2b;
      background: rgb(235, 235, 235);
      
    }
    .choose{
      color: orange;
    }
  }
  
}
.menulist{
    padding: 5px;
    display: flex;
    flex-wrap:wrap;
    align-items: flex-start;
    li:nth-child(2n+1){
        margin-right: 10px
      }
    li{
      width:48.3%;
      margin-bottom: 5px;
      box-shadow: 0px 3px rgb(192, 188, 188);
      img{
        width:100%;
        height: 2.2rem;
        display: block;
        
      }
      .mcontent{
        background: rgb(247, 245, 245);
        border: 1px solid white;
        p{
          word-wrap:break-word;  
          word-break:break-all;
          margin: 0px;
          padding:3px 8px;
          text-align: center;
           
        }
        p:nth-child(1){
          font-size: 15px;
           line-height: 20px;
           margin-bottom: 2px; 
          color: #000;        
        }      
      }
    }
    
  }
  .van-pagination {
    margin: 5px;
  }
</style>
