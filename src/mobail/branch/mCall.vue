<template>
  <div class="callm">
    <h2 style="text-align:center;margin:5px 0px; font-size:26px;color: #FF9900;">联系我们</h2>
    <div class="grid-content">
      <p><span class="calltitle"><strong>公司地址:</strong></span><span>{{contact.addres}}</span></p>
      <p><span class="calltitle"><strong>联系人:</strong></span><span>{{contact.caller}}</span></p>
      <p><span class="calltitle"><strong>联系电话:</strong></span><span>{{contact.phone}}</span></p>
      <p><span class="calltitle"><strong>电子邮件:</strong></span><span>{{contact.email}}</span></p>
      <p class="img_line">
        <span class="calltitle"><strong>在线QQ:</strong></span>
        <span>
          <a href="tencent://message/?uin=1578771331&Site=&Menu=yes">
            <img title="点击这里给我发消息" class="qqimg" :src="qqurl" width="70px" height="25px">
          </a>
        </span>
      </p>
      <p><span class="calltitle"><strong>邮政编码:</strong></span><span>{{contact.ems}}</span></p> 
    </div>   
    <!-- <div class="grid-content">
      <img :src="mapurl">
    </div> -->
  </div>
</template>
<script>
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
    this.getcompanydata()

  },
}
</script>
<style lang="scss" scoped>
.callm{
  padding: 5px;
  color: #666;
  .grid-content{
    p{
      word-wrap: break-word;
      word-wrap: break-all;
      font-size: 14px;
      line-height: 30px;
      margin: 0px;
      span{
        display: inline-block;
      }
      .calltitle{
         width: 64px;

      }
    }
  }
}
.img_line{
  display: flex;
}
</style>
