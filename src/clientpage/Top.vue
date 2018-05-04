<template>
  <div class="top">
      <div class="toptop">
        <img :src="imgurl" width="200px" height="80px">
        <div>
          <el-menu :default-active="activeIndex" class="topmenu" mode="horizontal" @select="handleSelect">
              <el-menu-item index="1" class="menu_item" ><router-link to="/cn" tag="li" >网站首页</router-link></el-menu-item>
              <el-menu-item index="2" class="menu_item"><router-link to="/about" tag="li" >关于我们</router-link></el-menu-item>
              <el-menu-item index="3" class="menu_item"><router-link to="/tourism" tag="li" >乡村旅游</router-link></el-menu-item>
              <el-menu-item index="4" class="menu_item"><router-link to="/product" tag="li" >产品展示</router-link></el-menu-item>
              <el-menu-item index="5" class="menu_item"><router-link to="/call" tag="li" >联系我们</router-link></el-menu-item>
          </el-menu> 
        </div>
      </div>
      <div class="bread" v-if="ishow">
        <div class="client_content">
           <el-breadcrumb separator=">" class="breadcrumb">
              <div class="item">
                <el-breadcrumb-item v-for="(item,index) in breadlist" :key="index" :to="item.path" >{{item.name}}</el-breadcrumb-item>
              </div>
            </el-breadcrumb>
        </div>
      </div>
                
  </div>
</template>
<script>
export default {
  data() {
    return {
      breadlist:'',
      ishow:false,
      activeIndex: "1",
      imgurl: require("../assets/img/logo.jpg")
    };
  },

  methods: {
    handleSelect(key, keyPath) {     
      if(key=='1'){
        this.ishow=false
      }else if(key=='2'||key=='3'||key=='4'||key=='5'){
        this.ishow=true   
      }
    },
   getlist(){
     if(this.$route.path=='/cn'){
        this.ishow=false      
      }
      this.breadlist=this.$route.matched
      this.$route.matched.forEach((i, index) => {
        i.name === '首页' ? i.path = '/' : this.$route.path
      })
     
      
   }
    
   
  },
  computed:{
    
  },
  created() {
    this.getlist()
  },
  watch:{
   $route(){
      this.getlist()
    }
  }
};
</script>
<style scoped lang="scss">
.top {
  // background: #fff;
  
  margin-bottom: 0px;
  width: 100%;
  .bread{
    background: rgb(245, 246, 246);
    .client_content{
      .breadcrumb{
        font-family: Arial, Helvetica, sans-serif;
        font-size: 16px;
        background: linear-gradient( rgb(204, 202, 202),rgb(221, 219, 219), rgb(255, 255, 255));
        background: -webkit-linear-gradient( rgb(204, 202, 202),rgb(221, 219, 219), rgb(255, 255, 255));
        background: -o-linear-gradient( rgb(204, 202, 202),rgb(221, 219, 219), rgb(255, 255, 255)); /* Opera 11.1 - 12.0 */
        background: -moz-linear-gradient( rgb(204, 202, 202),rgb(221, 219, 219), rgb(255, 255, 255)); /* Firefox 3.6 - 15 */
        color: #687073;
        font-size: 14px;
        font-weight: normal;
        height: 30px;
        line-height: 30px;
        padding-left:10px;
        .item{
          float: right;
          margin-right: 30px;
        }
        
      }
    }
  }
  
  .toptop {
    width: 1200px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    padding: 10px 0;
    .topmenu {
      margin-right: 10px;
      background: #fff;
      .menu_item {
        height: 40px;
        text-align: center;
        line-height: 40px;
        font-size: 16px;
        width: 100px;
        padding: 0px;
        font-family: 微软雅黑;
        border: 1px solid #ffffff;

          li{
            height: 40px;
          }
        &:hover {
          background: #ffffff;
          color: rgb(117, 247, 117);
        }
      }
    }
  }
}
</style>


