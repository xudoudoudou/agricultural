<template>
  <div class="productdeital"> 
    <p style="margin:5px 5px;height:22px;line-height:22px;">
      <span style="color:#757575;font-size:14px ">
        <img style="margin-right:7px;position:relative;top:3px;" src="../../assets/home.png">
        您当前的位置：<router-link to='/mtourism' style="font-size:14px ">村庄旅游></router-link>
        </span>
        <span style="color:#757575;font-size:14px ">{{formdata.title}}</span>  
    </p>     
    <h2>{{formdata.title}}</h2>
      <div class="sidebar_content">
          <div class="apparticle_content" v-html="formdata.content">文章内容</div>
      </div>
      <div class="sidebar_foot">
        <p class="left">上一条：<span v-if="!formdata.next.title">已经没有上一条数据</span>
            <a @click="getActiveContent(formdata.next.id)" href="javascript:void 0">{{formdata.next.title}}</a>
        </p>
        <p class="right">下一条：<span v-if="!formdata.prev.title">已经没有下一条数据</span>
            <a @click="getActiveContent(formdata.prev.id)" href="javascript:void 0">{{formdata.prev.title}}</a>
        </p>
      </div>
  </div>
</template>
<script>
import {mapState} from'vuex'
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
        this.axios.post('/gettouById',{id:id}).then((res)=>{
          let data=res.data.data
          Object.getOwnPropertyNames(this.formdata).forEach(key => {
                this.$set(this.formdata,key,data[key]);
            });
        }).catch((err) => {
          console.log(err)
        })
    },
  },
  computed:{
    ...mapState([ 'b'])
  }
}
</script>
<style lang="scss" scoped>
.productdeital{
  padding: 5px;
  h2{
    color: #555;
    text-align: center;
    font-weight: normal;
    margin:5px 0px;
    font-size: 15px;
  }
  .sidebar_foot{
    min-height: 60px;
    line-height: 25px;
    .left{
      margin: 0px;
      font-size: 14px;
    }
    .right{
      margin: 0px;
      font-size: 14px;
    }
  }
}
</style>
