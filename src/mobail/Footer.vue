<template>
  <div class="footer">
    <div class="grid-content">
      <p><span class="calltitle"><strong>公司地址:</strong></span><span>{{contact.addres}}</span></p>
      <p><span class="calltitle"><strong>联系人:</strong></span><span>{{contact.caller}}</span></p>
      <p><span class="calltitle"><strong>联系电话:</strong></span><span>{{contact.phone}}</span></p>
      <p><span class="calltitle"><strong>电子邮件:</strong></span><span>{{contact.email}}</span></p>
      <p><span class="calltitle"><strong>邮政编码:</strong></span><span>{{contact.ems}}</span></p> 
    </div>      
    <div id="qs"></div>
    <p class="img"><strong>官方网站</strong></p>
    <p class="bottom">Copyright © 湖南祖源农业发展有限责任公司</p>
  </div>
</template>
<script>
import QRCode from 'qrcodejs2'
export default {
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
     
    }
  },
  methods:{
    getqs(){
     let qssss=new QRCode('qs',{
       width:100,
       height:100,
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
  mounted(){
    this.getqs()
    this.getcompanydata()

  },
}
</script>
<style scoped lang="scss">
.footer{
  padding: 0 5px;
  background: rgb(110, 109, 109);
  
  .grid-content{
    p{
      color: white;
      word-wrap: break-word;
      word-wrap: break-all;
      font-size: 13px;
      line-height: 25px;
      margin: 0px;
      span{
        display: inline-block;
      }
      .calltitle{
         width: 64px;
      }
    }
  }
  #qs{text-align: center;width: 100px;margin: 0 auto;}
  .img{
    color: white;
    text-align: center;
    margin:0px;
  }
 .bottom{
   text-align: center;
   color: white;
   font-size: 13px;
   line-height: 30px;
   margin:0px;
 }  
}
</style>