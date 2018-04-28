<template>
<div class="home">
    <Top></Top>
    <div class="content">
        <router-view/>
    </div>
    <Footer></Footer>
</div>

</template>
<script>
import Top from './Top'
import Footer from './Footer'
export default {
  data(){
      return{}
  },
  methods:{
      list(){
      }
  },
  created(){
  },
  components:{
      Footer,
      Top,
  }

}
</script>
<style scoped lang="scss">
.home{
    width: 100%;
    height: 100%;
    .content{
        background: rgb(245, 246, 246);
    }
}
</style>

