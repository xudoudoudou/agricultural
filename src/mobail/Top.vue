<template>
  <div class="mobail">
    <div class="mobail_top" >
      <van-icon name="wap-nav" @click="shownav">
      </van-icon>
      <img :src="imgurl">
    </div>
    <div class="nav" id="nav" v-if="showmenu" @touchmove.prevent>
      <ul>
        <router-link to="/mcn" tag="li"><p class="choose" @click="clickli($event)">网站首页</p></router-link>
        <router-link to="/mabout" tag="li"><p @click="clickli($event)">关于我们</p></router-link>
        <router-link to="/mtourism" tag="li"><p @click="clickli($event)">乡村旅游</p></router-link>
        <router-link to="/mproduct" tag="li"><p @click="clickli($event)">产品展示</p></router-link>
        <router-link to="/mcall" tag="li"><p @click="clickli($event)">联系我们</p></router-link>
      </ul>
    </div>
    <div class="zhezhao" id="zhezhao"></div> 
      <van-swipe :autoplay="3000" >
        <van-swipe-item v-for="(item, index) in imglist" :key="index">
          <div class="apptabimg" v-html="item"></div>
          <!-- <img :src="image.url" width="100%" height="140px"/> -->
        </van-swipe-item>
    </van-swipe>  
  </div>
</template>
<script>
export default {
  data() {
    return {
      panelShow: true,
      showmenu:false,
      breadlist:'',
      activeIndex: "1",
      imgurl: require("../assets/img/mlogo.jpg"),
       imglist: [
        {url:require('../assets/img/tab1.jpg')},
        {url:require('../assets/img/tab4.jpg')},
        {url:require('../assets/img/tab5.jpg')},
      ]
    };
  },

  methods: {
    colse(){
      //关闭nav弹窗
      document.addEventListener('click', (e) => {
        var sp = document.getElementById("nav");
        if(sp){
          if(!sp.contains(event.target)){            //这句是说如果我们点击到了id为nav以外的body区域
          this.showmenu = false;
          zhezhao.style.display="none";
          }
        }
      
      })     
    },
    clickli(e){
      //给nav添加点击后样式
      let li=document.querySelector('.nav li p')
      let getli=document.querySelectorAll('.nav li p')
        if(e.target.tagName=='P'){
          getli.forEach(i=>{
            i.className=''
          })
          e.target.className ='choose'
        }
       
      
      
    },
    shownav(){
      var zhezhao=document.getElementById("zhezhao");
      zhezhao.style.display="block";
      this.showmenu=true 
    },
    handleSelect(key, keyPath) {
    },
   getlist(){
     if(this.$route.path=='/cn'){
        this.ishow=false      
      }
      this.breadlist=this.$route.matched
      this.$route.matched.forEach((i, index) => {
        i.name === '首页' ? i.path = '/' : this.$route.path
      })
     
      
   },
   getimgtablist(){
       this.axios.post('/clientablist',{
          data: this.data
        }).then((res) => {
          let data=res.data.data.data
            let abr=[]
            data.filter(i=>{
              if(i.id==30){
                abr.push(i) 
                abr.map(j=>{
                  let imgdata=j.content
                  let strs=imgdata.split(">")
                  let arr=[]
                  for(let o=0;o<strs.length-1;o++){
                    let fn='>'
                    let img=strs[o]
                      img=strs[o]+fn
                      arr.push(img)
                  }
                  this.imglist=arr
                })
              }                   
            })
        }).catch((err) => {
          console.log(err)
        })
    },
       
  },
  mounted(){
   this.getimgtablist()
},  
  computed:{
    
  },
  created() {
    this.colse()

  },
  watch:{
  }
};
</script>
<style scoped lang="scss">
.zhezhao 
{ 
 width:100%; 
 height:100%; 
 background-color:#000; 
 filter:alpha(opacity=50); 
 -moz-opacity:0.3; 
 opacity:0.3; 
 position:absolute; 
 left:0px; 
 top:0px; 
 display:none; 
 z-index:9; 
} 
.mobail_top{
  height: 40px;
  padding: 10px 0px 0px  0px;
  border-bottom: 1px solid rgb(228, 227, 227); 
  .van-icon{
    padding: 0px;
    margin-left: 10px;
     line-height: 35px;
     padding: 0px;
     width:9%;
     color: rgb(163, 161, 161);
     text-align: center;
     font-size: 30px;
  }
  img{
    height: 35px;
    width:280px;
    position: absolute;
    left: 0px;
    right: 0px;
    margin:  auto;
  }
}
.van-swipe{
  height: 140px;
  .van-swipe-item{
      width:100%;
       height: 140px;
  }
}
.nav{
    position:fixed;
    left:0;
    top:0;
    width:50%;
    height:100%;
    z-index:10;
    background: rgba(255, 255, 255, 0.9);
    animation: move 0.7s;
    animation-iteration-count:1;
    @keyframes move
      {
      from {left:-50%;}
      to {left:0;}
      }
    ul{ 
      .choose{        
        background: gainsboro;
        color: rgb(28, 32, 250);
      }   
      li{
        padding: 0px;
        height: 40px;
        color: #666;
        border-bottom: 1px solid rgb(206, 207, 206);
        p{
          padding: 0 15px ;
          margin: 0px;
          line-height: 40px;
          font-size: 16px;
          font-family: "微软雅黑",microsoft yahei;
          color: #666;
        }
      }
    }
    
}

</style>


