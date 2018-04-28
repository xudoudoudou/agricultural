<template>
  <div class="callm">
    <div class="client_content">
      <h1><span>联系我们</span></h1>
      <el-form v-model="contact">
        <el-row class="row">
          <el-col :span="16" class="col1">
            <div class="grid-content">
              <p><span class="calltitle"><strong>公司地址:</strong></span><span>{{contact.addres}}</span></p>
              <p><span class="calltitle"><strong>联系人:</strong></span><span>{{contact.caller}}</span></p>
              <p><span class="calltitle"><strong>联系电话:</strong></span><span>{{contact.phone}}</span></p>
              <p><span class="calltitle"><strong>电子邮件:</strong></span><span>{{contact.email}}</span></p>
              <p class="img_line">
                <span class="calltitle"><strong>在线QQ:</strong></span>
                <span>
                  <a href="tencent://message/?uin=1578771331&Site=&Menu=yes">
                    <img title="点击这里给我发消息" style="margin-top:5px" class="qqimg" :src="contact.qqurl" width="90px" height="30px">
                  </a>
                </span>
              </p>
              <p><span class="calltitle"><strong>邮政编码:</strong></span><span>{{contact.ems}}</span></p> 
            </div>   
          </el-col>
          <el-col :span="8" class="col2">
                <p><strong>企业二维码</strong></p>
                <div id="qs"></div>
            </el-col>
        </el-row>
        <el-row class="row1">
          <el-col :span="24">
            <div class="grid-content">
              <img :src="contact.mapurl">
            </div>
            </el-col>
        </el-row>
      </el-form>
    </div>
  </div>
</template>
<script>
import QRCode from 'qrcodejs2'  
export default {
 
  data(){
    return{
      contact:{
        addres:'湖南省祁东县太和堂镇江口水库管理所',
        caller:'刘湘东(经理)',
        phone:18386293533,
        email:'1578771331@qq.com',
        ems:421000,
        qqurl:require('../../assets/img/qq.gif'),
        mapurl:require('../../assets/img/map.jpg')
      }
    }
  },
  methods:{
   getqs(){
     let qssss=new QRCode('qs',{
       width:150,
       height:150,
       text:'http://localhost:3000/client.html#/call'
     })
     console.log('qs',qssss)
   }
  },
  created(){
  },
  mounted(){
    this.getqs()
  },
}
</script>
<style lang="scss" scoped>
.img_line{
  display: flex;
}

.client_content{
  background: url('../../assets/img/callbg.jpg') no-repeat;
  background-size: cover;
  padding:50px 150px;
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
  .row{
    background: rgba(255, 255, 255, 0.3);
    border-radius: 50px;
    .col1{  
      border-right: 1px dashed gainsboro;
      .grid-content{
        margin: 80px 100px;
        line-height: 40px;
        font-size: 16px;
        p{
          span{
            display: inline-block;
            height: 40px;
          }
          .calltitle{
            margin: 0 5px;
            width: 100px;
          } 
        }
      }
    }
    .col2{
      margin: 80px 0px;
      p{
        text-align: center;
        font-size: 16px;
        line-height: 40px;
      }
      #qs{
        width: 153px;
        margin: 0 auto;
      }
    }
    
  }
  .row1{
    background: rgba(255, 255, 255, 0.3);
    border-radius: 50px;
    margin-top: 10px;
    text-align: center;
    padding: 10px;
    .grid-content{
      height: 400px;
      img{
      margin-top: 25px;
      height: 350px;
      width: 860px;
    }
    }
    
  }
}
</style>
