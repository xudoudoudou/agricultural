<template>
  <div class="productdeital">
      <div class="client_content">        
          <h1><span>产品描述</span></h1>
        <el-row class="row">
            <el-col :span="24">
             <div>{{formdata.title}}</div>
              <div class="sidebar_content" v-loading="loading">
                  <div class="article_content" v-html="formdata.content">文章内容</div>
              </div>
              <div class="sidebar_foot">
                  <p class="left">上一条：<span v-if="!formdata.next.title">已经没有上一条数据</span>
                      <a @click="getActiveContent(formdata.next.id)" href="javascript:void 0">{{formdata.next.title}}</a>
                  </p>
                  <p class="right">下一条：<span v-if="!formdata.prev.title">已经没有下一条数据</span>
                      <a @click="getActiveContent(formdata.prev.id)" href="javascript:void 0">{{formdata.prev.title}}</a>
                  </p>
              </div>
          </el-col>
        </el-row>
      </div>
  </div>
</template>
<script>
import {mapState} from'vuex'
    import {ajax,storage} from 'utils';
    import common from 'common';
export default {
  data(){
    return{
      page_grade:common.page_grade,     
      loading:false,
      formdata:{
            title:'',
            content:'',
            prev:{id:0,title:''},
            next:{id:0,title:''}
        }
    }
    
  },
  mounted(){
    this.getActiveContent(this.$route.query.id)
  },
  created(){
    },
     watch: {
    // 监测路由变化
      '$route': 'getActiveContent'
    },
  methods:{
    getActiveContent(id){
        this.loading = !0;
        ajax.call(this, '/getproductById', {id}, (obj, err) => {
            this.loading = !1;
            Object.getOwnPropertyNames(this.formdata).forEach(key => {
                this.$set(this.formdata,key,obj[key]);
            });
        })
    },
  },
  computed:{
    ...mapState([ 'b'])
  }
}
</script>
<style lang="scss" scoped>
.sidebar_foot{
  margin-top:10px;
  padding:0px 5px;
  height:30px;
  line-height: 25px;
  box-shadow: 0 1px grey;
  .left{float:left}
  .right{float:right}
}
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
