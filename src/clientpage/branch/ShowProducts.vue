<template>
  <div class="productdeital">
      <div class="client_content">
        <el-form v-model="formdata">
          <h1><span>产品展示</span></h1>
        <el-row class="row">
          <el-col :span="12" class="col1">
            <div class="box">
              <img :src="formdata.url" width="550px" height="350px">
            </div>
          </el-col>
          <el-col :span="12" class="col2">
            <div class="describe">
              <h3>{{formdata.title}}</h3>
              <p>{{formdata.content}}</p>
            </div>
          </el-col>
        </el-row>
         <h1><span>产品描述</span></h1>
          <div class="productimg">
            <ul>
              <li v-for="(item,index) in formdata.productimglist" :key="index">
                <img :src="item.plurl" width="578px" height="600px">
              </li>
            </ul>
          </div>
        </el-form>
      </div>
  </div>
</template>
<script>
import {mapState} from'vuex'
export default {
  data(){
    return{
      formdata:JSON.parse(this.$route.query.item),
    }
    
  },
  created(){
      this.getimglist()
    },
  methods:{
    getimglist(){
      // let bb = this.b.productlist
      // bb = JSON.parse(bb)
      console.log(this.formdata.productimglist)
    }
  },
  computed:{
    ...mapState([ 'b'])
  }
}
</script>
<style lang="scss" scoped>
.client_content{
  background: #ffffff;
  h1{
    line-height: 30px;
    font-weight: normal;
    padding: 20px;
    box-shadow: 0 1px rgb(241, 240, 240);
    margin-bottom: 15px;
    span{
      font-size: 20px;
      color: #585F69;
    }
  }
  .row{
    padding: 20px;
    .col1{
      .box{
        text-align: center;
        padding: 10px;
      }
      
    }
    .col2{
      .describe{
        padding: 40px;
        h3{
          text-align: left;
          color: #555;
          font-size: 25px;
          line-height: 40px;
          padding-bottom: 15px;
          font-weight: normal;
        }
         p{
           text-align: left;
            color: #555;
            font-size: 16px;
            line-height: 30px;
         }
      }
    }
  }
  .productimg{
    padding: 20px;
    ul{
      padding: 0px;
      margin: 0px;
      display: flex;
      flex-direction: row;
      flex-wrap: wrap;
      li{
        height: 600px;
        width: 579px;
      }
    }
  }
}
</style>
