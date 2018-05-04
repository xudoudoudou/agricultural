<template>
  <div class="tourism">
    <div class="client_content">
      <el-carousel indicator-position="outside" class="tourism_tab">
        <el-carousel-item v-for="(item,index) in bannerlist" :key="index">
          <img :src="item.bannerurl" width="100%">
        </el-carousel-item>
      </el-carousel>
      <p class="title">——假期休闲聚会好场所——</p>
      <div class="tourism_content">
          <el-row :gutter="10">
            <el-col :span="6">
              <div class="project">
                <p>活动项目</p>
                <ul>
                  <li v-for="(item,index) in project"  :class="{ 'choose' : index == navCur }" :key="index" @click="handlenav(index,item)">
                    <i class="el-icon-d-arrow-right"></i>
                    <span>{{item.projectname}}</span>
                  </li>
                </ul>
                <p>咨询更多</p>
                <ul>
                  <li>
                    <span>联系人</span>:刘湘东                  
                  </li>
                  <li>
                    <span>电话</span>:18386293533                  
                  </li>
                  <li>
                    <span>邮件</span>:1578771331@qq.com 
                  </li>
                </ul>

              </div>
              <div></div>
            </el-col>
            <el-col :span="18">
              <div class="showproject">
                <p class="imgfloor">图片墙</p>
                <div v-for="(item,index) in project" v-if="index == navCur" :key="item.value">
                  <p class="project_name">{{item.projectname}}</p>
                  <div class="project_describle">
                    <p>{{item.content}}</p>
                    <ul>
                      <li v-for="(img,imgindex) in item.urls" :key="imgindex">
                        <img :src="img.url" width="340px" height="300px">
                      </li>
                    </ul>  
                  </div>
                </div>
              </div>
            </el-col>
          </el-row>
      </div>
    </div>
  </div>
</template>
<script>
export default {
    data(){
      return{
        navCur:0,
        project:[
          {
            id:1,
            projectname:'湖边垂钓',
            content:'',
             urls:[
              {
                url:require('../../assets/img/fish1.jpg')
              },
              {
                url:require('../../assets/img/fish2.jpg')
              },
              {
                url:require('../../assets/img/fish3.jpg')
              }
            ]
          },
          {
            id:2,
            projectname:'蔬果采摘',
            content:'久居钢筋混凝土、高楼大厦的您，是否对城市匆忙的生活节奏有些许厌倦呢？如果您渴望体验恬静舒适的田园生活，那么在这个初夏，请跟着我们的步伐，一起到东方有机菜园的万亩农庄，拥抱绿色，重享平和，在山水田园间忘却日常的烦恼。5月17日，上海飞翼科技有限公司向部分会员开展了基地参观体验等活动，让部分会员亲临了我们位于绍兴嵊州的万亩有机农庄。上午，各位会员参观了育种基地、蔬菜大棚区、有机肥料厂、蔬果包装车间、天然水库等区域。 中饭过后，会员们在导游的带领下继续参观了有机果园区。尽管可以在上海买到世界各地的奇珍异果，但在遍山果树的诱惑下，会员们早已按捺不住亲手采摘尝时鲜的急切心情。 当然，了解了蔬菜的生长过程，怎么能不体验一把丰收的喜悦呢？在当天活动尾声，为回馈和答谢会员们的支持与信任，农庄特地开放了小番茄棚和小黄瓜棚，以供会员免费采摘（每人限3斤）目前有机市场鱼龙混杂，不少商家打着有机旗号，卖的却是菜场里的普通蔬菜，正因如此，不少消费者都不敢轻易尝试有机食品。但通过此次近距离体验活动，会员们不仅更加信赖东方有机菜园蔬菜，而且更表示了对农庄日益成长的期待。',
            urls:[
              {
                url:require('../../assets/img/food1.jpg')
              },
              {
                url:require('../../assets/img/food2.jpg')
              }
            ]

          },
          {
            id:3,
            projectname:'农家美食',
             content:'久居钢筋混凝土、高楼大厦的您，是否对城市匆忙的生活节奏有些许厌倦呢？如果您渴望体验恬静舒适的田园生活，那么在这个初夏，请跟着我们的步伐，一起到东方有机菜园的万亩农庄，拥抱绿色，重享平和，在山水田园间忘却日常的烦恼。5月17日，上海飞翼科技有限公司向部分会员开展了基地参观体验等活动，让部分会员亲临了我们位于绍兴嵊州的万亩有机农庄。上午，各位会员参观了育种基地、蔬菜大棚区、有机肥料厂、蔬果包装车间、天然水库等区域。 中饭过后，会员们在导游的带领下继续参观了有机果园区。尽管可以在上海买到世界各地的奇珍异果，但在遍山果树的诱惑下，会员们早已按捺不住亲手采摘尝时鲜的急切心情。 当然，了解了蔬菜的生长过程，怎么能不体验一把丰收的喜悦呢？在当天活动尾声，为回馈和答谢会员们的支持与信任，农庄特地开放了小番茄棚和小黄瓜棚，以供会员免费采摘（每人限3斤）目前有机市场鱼龙混杂，不少商家打着有机旗号，卖的却是菜场里的普通蔬菜，正因如此，不少消费者都不敢轻易尝试有机食品。但通过此次近距离体验活动，会员们不仅更加信赖东方有机菜园蔬菜，而且更表示了对农庄日益成长的期待。',
             urls:[
              {
                url:require('../../assets/img/nong.jpg')
              },
              {
                url:require('../../assets/img/nong1.jpg')
              },
               {
                url:require('../../assets/img/nong2.jpg')
              },
               {
                url:require('../../assets/img/nong3.jpg')
              },
              {
                url:require('../../assets/img/nong3.jpg')
              },
            ]
          },
          {
            id:4,
            projectname:'温室观光'
          },
          {
            id:5,
            projectname:'农庄风光',
            urls:[
              {
                url:require('../../assets/img/scenery.jpg')
              },
            ]
          },
          {
            id:6,
            projectname:'名宿',
            urls:[
              {
                // url:require('../../assets/img/scenery.jpg')
              },
            ]
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
    methods:{
      handlenav(index,item){
        this.navCur=index
        console.log('item',item.urls)
      }
    }
}
</script>
<style lang="scss" scoped>
.client_content{
  padding:20px 60px;
  background: rgb(243, 243, 243);
  .tourism_tab{
    padding: 10px;
    background: white;
  }
  .title{
    text-align: center;
    color: rgb(168, 168, 168);
  }
  // 旅游项目内容
  .tourism_content{
    padding: 10px;
    background: white; 
      .project{
        background: rgb(245, 243, 243);         
        p{
          font-size: 18px;
          line-height: 30px;
          color: #333333;
          font-family: Arial, Helvetica, sans-serif;
          background: #ffffff;
          border-bottom: 1px solid gainsboro;
        }
        ul{
          padding:0px 3px;
          box-shadow:0px -1px rgb(190, 188, 188); 
          .choose{
            background: gainsboro;
          }
          li{
            height: 35px;
            line-height: 35px;
            font-size: 14px;
            word-wrap:break-word;
            border-bottom:1px solid white;
            &:hover{
              color: red;
              text-decoration: underline;
            }
            i{
              font-size:16px;
              margin-right: 5px;
              color: rgb(153, 149, 149);
              transform: scale(0.6,0.5)
            }
          }
        }
      }
      .showproject{
          word-wrap:break-word;
          background: white;
        .imgfloor{
          background: #ffffff;
          border-bottom: 1px solid gainsboro;
          font-size: 18px;
          line-height: 30px;
          color: #333333;
          font-family: Arial, Helvetica, sans-serif;
        }      
        .project_name{
          text-align: center;
        }
        .project_describle{
          p{
            text-indent: 2em;
            line-height: 25px;
            font-size: 14px;            
          }
          ul{
            li{
              float: left;   
            }
            li:nth-child(1){
              width:450px;
              img{
                width:450px;
                height: 600px;
              }
            }
            li:nth-child(n+4){
              // width:450px;
              img{
                width:395px;
                height: 395px;
              }
            }
          }
          
          
        }
        
        
      }
    }  
}
</style>
