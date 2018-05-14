<template>
  <div class="callm">
    <div class="client_content" style="height: 100%;">
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
                    <img title="点击这里给我发消息" style="margin-top:5px" class="qqimg" :src="qqurl" width="90px" height="30px">
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
              <img :src="mapurl">
              <!-- <baidu-map @ready="handler" :scroll-wheel-zoom="true" :center="center" :zoom="zoom" class="bm-view" ak="z7NKYlBQqiCUZiFbBvSkHGjHSRPRGXjn">
              </baidu-map> -->
            </div>
            </el-col>
        </el-row>
      </el-form>
    </div>
  </div>
</template>
<script>
import QRCode from 'qrcodejs2'
import {BaiduMap} from 'vue-baidu-map'
import common from 'common';

export default {
  components: {
     BaiduMap,
  },
  data(){
    return{
      contact:{
        addres:'湖南省祁东县太和堂镇江口水库管理所11',
        caller:'刘湘东(经理)',
        phone:18386293533,
        email:'1578771331@qq.com',
        ems:421000,       
        weburl:'www.baidu.com'
      },
      center: {lng: 0, lat: 0},
      zoom: 3,
      qqurl:require('../../assets/img/qq.gif'),
      mapurl:require('../../assets/img/map.jpg'),
    }
  },
  methods:{
    handler ({BMap, map}) {
      console.log(BMap, map)
      this.center.lng = 111.986897
      this.center.lat = 27.083536
      this.zoom = 15
    },
   getqs(){
     let qssss=new QRCode('qs',{
       width:150,
       height:150,
       text:this.contact.weburl
     })
    },
    getcompanydata(){
      this.axios.post('/companydata',{
        contact: this.contact
      }).then((res) => {
        let data=res.data.data.data
        data.map(i=>{
            this.contact=i
            return i
        })
      }).catch((err) => {
        console.log(err)
      })
    }
  },
  created(){
    
  },
  mounted(){
    this.getqs()
    this.getcompanydata()

  },
}
</script>
<style lang="scss" scoped>
.bm-view {
  width: 100%;
  height: 300px;
}
.img_line{
  display: flex;
}

.client_content{
  background: url('../../assets/img/map2.jpg') no-repeat;
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
          // border:1px solid red;
          // word-wrap:break-word;  
          // word-break:break-all;
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
