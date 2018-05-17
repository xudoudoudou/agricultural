<template>
  <div class="about">
    <h2 style="text-align:center;margin:5px 0px; font-size:26px;color: #FF9900;">关于我们</h2>
      <div>
        <p style="color:rgb(0,0,0);font-size:16px;text-align:center"> {{companydata.company}} </p>
        <p class="p2" style="color:rgb(139,139,139);font-size:14px;text-align:center;line-height:22px;"> {{companydata.profile}} </p>
      </div>
  </div>
</template>
<script>

import common from 'common';
export default {
  data(){
    return{
      companydata:{
        company:'',//公司名称
        profile:'',//公司简介
        legal:'',//公司法人
        operation:'',//经营范围
        organ:'',//发证机关
        license:'',//营业执照号
        establishment:'',//公司成立日期
        Registered:'',//注册资本
        companytype:'',//公司类型
        operationStateL:'',//经营状态
        companycity:'',//所属城市
        type:'',//公司性质
        code:'',//顺企编码
        Shareholder:'',//股东人=法人
        post:'',//股东职位
        Supervisorperson:'',//监事人
        Supervisor:'',//职位监视
      },
    }
  },
  created(){
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
    }
  },
  mounted(){
    this.getcompanydata()
  }
}
</script>
<style lang="scss" scoped>
.about{
  padding:6px;
}
p{
  word-wrap:break-word;  
  word-break:break-all;
}
</style>
