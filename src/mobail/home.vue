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
position: relative;
width: 100%;
// max-width:750px;
// min-width: 320px;
margin: 0 auto;
// border: 1px solid gray;

    }
</style>