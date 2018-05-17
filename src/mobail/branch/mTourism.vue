<template>
  <div class="mtourism">
    <ul class="menu">
      <p @click="showmenu">村庄旅游<img :src="iscirclie ? imgurl:imgurl1"></p>
      <div id="list" >
        <li v-for="(item,index) in project1" :key="index" @click="chooseli(index,item)" :class="{choose:index==navCur}">{{item.title}}</li>
      </div>
    </ul>
    <p style="margin:5px 5px;height:22px;line-height:22px;">
    <span style="color:#757575; "><img style="margin-right:7px;position:relative;top:3px;" src="../../assets/home.png">您当前的位置：<router-link to='/mtourism'>村庄旅游</router-link></span>  
    </p> 
    <ul class="menulist">
      <li v-for="(item,index) in project" :key="index" @click="chooseli(null,item)">
        <img :src='item.article_extend'>
        <div class="mcontent">
          <p>{{item.title}}</p>
        </div>
      </li>
    </ul>
    <van-pagination 
      v-model="search_data.page"
      :items-per-page="search_data.pageSize"
      :total-items="search_data.total" 
      :show-page-size="3" 
      force-ellipses
      @change="changepage"
    />
      <!-- <p class="title">——假期休闲聚会好场所——</p> -->
  </div>
</template>
<script>
    import {ajax,storage} from 'utils';
    import common from 'common';
export default {
    data(){
      return{
        iscirclie:true,
        data:{},
        navCur:0,
         activeNames: ['0'],
        imgurl:require('../../assets/down-circle-o.png'),
         imgurl1:require('../../assets/up-circle-o.png'),
         search_data: {
            page: 1,
            pageSize:6,
            total:0,
          },
          project1:[],
        project:[
          {
            id:1,
            title:'湖边垂钓',
            content:'',            
          },
          {
            id:2,
            title:'蔬果采摘',
            content:'久居钢筋混凝土、高楼大厦的您，是否对城市匆忙的生活节奏有些许厌倦呢？如果您渴望体验恬静舒适的田园生活，那么在这个初夏，请跟着我们的步伐，一起到东方有机菜园的万亩农庄，拥抱绿色，重享平和，在山水田园间忘却日常的烦恼。5月17日，上海飞翼科技有限公司向部分会员开展了基地参观体验等活动，让部分会员亲临了我们位于绍兴嵊州的万亩有机农庄。上午，各位会员参观了育种基地、蔬菜大棚区、有机肥料厂、蔬果包装车间、天然水库等区域。 中饭过后，会员们在导游的带领下继续参观了有机果园区。尽管可以在上海买到世界各地的奇珍异果，但在遍山果树的诱惑下，会员们早已按捺不住亲手采摘尝时鲜的急切心情。 当然，了解了蔬菜的生长过程，怎么能不体验一把丰收的喜悦呢？在当天活动尾声，为回馈和答谢会员们的支持与信任，农庄特地开放了小番茄棚和小黄瓜棚，以供会员免费采摘（每人限3斤）目前有机市场鱼龙混杂，不少商家打着有机旗号，卖的却是菜场里的普通蔬菜，正因如此，不少消费者都不敢轻易尝试有机食品。但通过此次近距离体验活动，会员们不仅更加信赖东方有机菜园蔬菜，而且更表示了对农庄日益成长的期待。',
          },
          {
            id:3,
            title:'农家美食',
             content:'久居钢筋混凝土、高楼大厦的您，是否对城市匆忙的生活节奏有些许厌倦呢？如果您渴望体验恬静舒适的田园生活，那么在这个初夏，请跟着我们的步伐，一起到东方有机菜园的万亩农庄，拥抱绿色，重享平和，在山水田园间忘却日常的烦恼。5月17日，上海飞翼科技有限公司向部分会员开展了基地参观体验等活动，让部分会员亲临了我们位于绍兴嵊州的万亩有机农庄。上午，各位会员参观了育种基地、蔬菜大棚区、有机肥料厂、蔬果包装车间、天然水库等区域。 中饭过后，会员们在导游的带领下继续参观了有机果园区。尽管可以在上海买到世界各地的奇珍异果，但在遍山果树的诱惑下，会员们早已按捺不住亲手采摘尝时鲜的急切心情。 当然，了解了蔬菜的生长过程，怎么能不体验一把丰收的喜悦呢？在当天活动尾声，为回馈和答谢会员们的支持与信任，农庄特地开放了小番茄棚和小黄瓜棚，以供会员免费采摘（每人限3斤）目前有机市场鱼龙混杂，不少商家打着有机旗号，卖的却是菜场里的普通蔬菜，正因如此，不少消费者都不敢轻易尝试有机食品。但通过此次近距离体验活动，会员们不仅更加信赖东方有机菜园蔬菜，而且更表示了对农庄日益成长的期待。',           
          },
          {
            id:4,
            title:'温室观光'
          },
          {
            id:5,
            title:'农庄风光',
          },
          {
            id:6,
            title:'名宿',
          },
        ],
        bannerlist:[
          {
            id:1,
            bannerurl:require('../../assets/img/banner1.jpg')
          },
          {
            id:2,
            bannerurl:require('../../assets/img/banner2.jpg')
          },
          {
            id:3,
            bannerurl:require('../../assets/img/banner3.jpg')
          },
        ]
      }
    },
    mounted() {
      this.ajaxData();
      this.getproject1()
  },
    methods:{
      getproject1(){
         this.axios.post('/listClient',{data:this.data}).then((res)=>{
          let data=res.data.data.data
          let temp=[]
          this.project1= data.filter((i)=>{
              if(i.sort_name=='旅游列表'&& i.passed==0){
                
                temp.push(i)
              }
              return i.sort_name=="旅游列表"&&i.passed==0
            })
        }).catch((err) => {
          console.log(err)
        })
      },
      changepage(page){
        this.search_data.page = page;
        this.ajaxData();
      },
      chooseli(index,item){
        console.log('===',item)
        this.navCur=index
        this.$router.push({
          path:'/mtourism/mshowtou',
          query:{
            id:item.id
          }
        })
      },
      showmenu(){
        let getli=document.getElementById('list')
         if(getli.style.display=='block'){
           getli.style.display='none'
           this.iscirclie=true
         }else{
           getli.style.display='block'
           this.iscirclie=false
         }
      },
      handlenav(index,item){
        this.navCur=index
      },
      ajaxData(){
        this.axios.post('/apptoulist',this.search_data).then((res)=>{
          let data=res.data.data.data
            this.project= data               
                this.project.map(i=>{
                  let img=JSON.parse(i.article_extend).pic
                  return i.article_extend=img    
                })
              this.search_data.total = res.data.data.total;
                this.search_data.page =res.data.data.page;
                
        }).catch((err) => {
          console.log('sss',err)
        })
      },
      
    }
}
</script>
<style lang="scss" scoped>
.menu{
  margin-top: 15px;
  p{
  padding: 0px 10px 0px 5px;
  margin:0px;
  background: #FF9900;;
  font-size: 15px;
  color:white;
  line-height: 38px;
  height: 38px;
    img{
      width: 20px;
      height: 20px;
      border-radius: 180px;
      background:white;
      float: right;
      position: relative;
      top:9px;
    }
  }
  div{
    display: none;
    li{
      padding-left: 10px;
      border-bottom: 1px solid white;
      height: 25px;
      line-height: 25px;
      font-size: 13px;
      color: #2b2b2b;
      background: rgb(235, 235, 235);
      
    }
    .choose{
      color: orange;
    }
  }
  
}
.menulist{
    padding: 5px;
    display: flex;
    flex-wrap:wrap;
    align-items: flex-start;
    li:nth-child(2n+1){
        margin-right: 10px
      }
    li{
      width:48.3%;
      margin-bottom: 5px;
      box-shadow: 0px 3px rgb(192, 188, 188);
      img{
        width:100%;
        height: 100px;
        
      }
      .mcontent{
        background: rgb(247, 245, 245);
        border: 1px solid white;
        p{
          word-wrap:break-word;  
          word-break:break-all;
          margin: 0px;
          padding:3px 8px;
          text-align: center;
           
        }
        p:nth-child(1){
          font-size: 15px;
           line-height: 20px;
           margin-bottom: 2px; 
          color: #000;        
        }      
      }
    }
    
  }
   .van-pagination {
    margin: 5px;
  }
</style>
