<template>
  <div class="client_content">
    <div class="company">
      <el-form v-model="companydata">
        <div class="company_title">
          <h1><span>{{companydata.company}}</span></h1>
        </div>
        <el-row class="row">
          <el-col>
            <div class="bg-purple">
              <span style="font-size:16px;height:30px;"><em><strong style="border-left:2px solid red;padding-left:10px">公司简介</strong></em></span>
              <p>{{companydata.profile}}</p>        
            </div>
          </el-col>        
        </el-row>
        <div class="company_box">
          <p style="font-size:16px;height:30px;"><em><strong style="border-left:2px solid red;padding-left:10px">组织结构</strong></em></p>
               <el-table
                :data="tableData"
                style="width: 100%"
                border
                >
                <el-table-column
                  prop="date"
                  label="领导人员"
                  width="180">
                </el-table-column>
                <el-table-column
                  prop="name"
                  label="姓名"
                  width="180">
                </el-table-column>
                <el-table-column
                  prop="address"
                  label="职位">
                </el-table-column>
              </el-table>
          <p style="font-size:16px;height:30px;margin-top:30px"><em><strong style="border-left:2px solid red;padding-left:10px">工商信息</strong></em></p>
          <table border="1" bordercolor="fff" >
            <tbody>
              <tr>
                <td class="td1">法人名称：</td>
                <td class="td2">{{companydata.company}}</td>
              </tr>
              <tr>
                <td class="td1">经营范围:</td>
                <td class="td2">{{companydata.operation}}</td>
              </tr>
              <tr>
                <td class="td1">发证机关：</td>
                <td class="td2">{{companydata.organ}}</td>
              </tr>
              <tr>
                <td class="td1">核准日期：</td>
                <td class="td2">{{companydata.establishment}}</td>
              </tr>
              <tr>
                <td class="td1">经营状态：</td>
                <td class="td2">{{companydata.operationStateL}}</td>
              </tr>
              <tr>
                <td class="td1">经营执照：</td>
                <td class="td2">{{companydata.license}}</td>
              </tr>
              <tr>
                <td class="td1">成立时间：</td>
                <td class="td2">{{companydata.establishment}}</td>
              </tr>
              <tr>
                <td class="td1">注册资本：</td>
                <td class="td2">{{companydata.Registered}}</td>
              </tr>
              <tr>
                <td class="td1">所属分类：</td>
                <td class="td2">{{companydata.companytype}}</td>
              </tr>
              <tr>
                <td class="td1">所属城市：</td>
                <td class="td2">{{companydata.companycity}}</td>
              </tr>
              <tr>
                <td class="td1">类型：</td>
                <td class="td2">{{companydata.type}}</td>
              </tr>
              <tr>
                <td class="td1">顺企编码：</td>
                <td class="td2">{{companydata.code}}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </el-form>
    </div>
  </div>
</template>
<script>
import companyData from '../data/companydata';
import {ajax,storage} from 'utils';
import common from 'common';
export default {
  data(){
    return{
      tableData: [{
            date: '自然人股东',
            name: '刘湘东',
            address: '执行董事兼总经理'
          }, {
            date: '公司领导',
            name: '陈田元',
            address: '监事'
          }],
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
    this.getcompany()
  },
  methods:{
    getcompany(){
       this.companydata=Object.assign({},companyData)
    },
    getcompanydata(){
      ajax.call(this, '/companydata', this.companydata, (obj, err) => {                   
          if (!err) {
              let data=obj.data
              data.map(i=>{
                  this.companydata=i
                  return i
              })
              console.log('obj',data)                      
          }
      });
    }
  },
  mounted(){
    this.getcompanydata()
  }
}
</script>
<style lang="scss" scoped>
.client_content{
  .company{
    background: #fff;
    .company_title{
      background:url('../../assets/img/title2.jpg') no-repeat;
      background-position:100px -120px;
      background-size: cover ;
      height: 130px;
      padding: 50px;
      border-bottom:1px solid gainsboro; 
      h1{
        line-height: 20px;
        font-weight: normal;
        position: relative;
        padding: 5px;
        span{        
          font-size: 20px;
          color: #222;
        }
      }
      
    }
    .row{
      padding:15px 50px;
      .bg-purple{
        padding-right:40px; 
        p{
          text-indent: 2em;
          font-family: "Microsoft YaHei";
          font-size: 16px;
          line-height: 32px;
          color: #888;
          word-wrap:break-word;  
          word-break:break-all;
        }
      }
    }
    .company_box{
      padding:15px 50px;
      table{
        width: 100%;
        line-height: 50px;
        text-align: left;
        border-color:rgb(226, 222, 222);
        border-collapse: collapse;
        .td1{
          width: 150px;
          padding-left: 10px;
          background: rgb(254, 248, 248);
        }
        .td2{
          padding-left: 15px;
          word-wrap:break-word;  
          word-break:break-all;
        }
        
      }
      
    }
    
  }
}
</style>
