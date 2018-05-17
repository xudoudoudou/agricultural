<template>
	<div class="hello">
		<top></top>
        <div class="mobail_content">
            <router-view></router-view>
        </div>
        <Footer></Footer>
	</div>
</template>

<script>
import top from './Top'
import Footer from './Footer'
console.log('--',document.documentElement.clientWidth)
	export default {
		name: 'home',
        components:{
            Footer,
            top,
        },
		data() {
			return {
				
			}
		},
		computed: {
			
		},
		methods: {
			 reload(){
            window.location.reload();
            
       },
			
		}
	}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
	.hello{
        height: 100%;
        width: 100%;
        
    }
</style>