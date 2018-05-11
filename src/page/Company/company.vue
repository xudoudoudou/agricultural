<template>
    <div>
        <el-button type="primary" @click="edit">编辑</el-button>
        <el-form :inline="true"  class="form" label-position="left"  label-width="80px" :model="companydata">
            <el-form-item label="公司名称:" prop="company">
                <el-input  v-model="companydata.company" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="公司法人:" prop="legal">
                <el-input v-model="companydata.legal" :disabled="disabled"></el-input>
            </el-form-item>          
            <el-form-item label="发证机关:" prop="organ">
                <el-input v-model="companydata.organ" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="营业执照:" prop="license">
                <el-input v-model="companydata.license" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="成立日期:" prop="establishment">
                <el-input v-model="companydata.establishment" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="注册资本:" prop="Registered">
                <el-input v-model="companydata.Registered" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="公司类型:" prop="companytype">
                <el-input v-model="companydata.companytype" :disabled="disabled"></el-input>
            </el-form-item>                
            <el-form-item label="经营状态:" prop="operationStateL">
                <el-input v-model="companydata.operationStateL" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="所属城市:" prop="companycity">
                <el-input v-model="companydata.companycity" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="公司性质:" prop="type">
                <el-input v-model="companydata.type" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="顺企编码:" prop="code">
                <el-input v-model="companydata.code" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="股东人:" prop="Shareholder">
                <el-input v-model="companydata.Shareholder" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="股东职位:" prop="post">
                <el-input v-model="companydata.post" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="监事人:" prop="Supervisorperson">
                <el-input v-model="companydata.Supervisorperson" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="监事职位:" prop="Supervisor">
                <el-input v-model="companydata.Supervisor" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="公司地址:" prop="addres">
                <el-input v-model="companydata.addres" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="联系人:" prop="caller">
                <el-input v-model="companydata.caller" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="联系电话:" prop="phone">
                <el-input v-model="companydata.phone" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="邮箱:" prop="email">
                <el-input v-model="companydata.email" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="邮编:" prop="ems">
                <el-input v-model="companydata.ems" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="网站地址:" prop="weburl">
                <el-input v-model="companydata.weburl" :disabled="disabled"></el-input>
            </el-form-item>
            <el-form-item label="公司简介:" prop="profile" >
                <textarea style="width:1210px; font-size:15px;line-height:25px; height:200px; border-radius:4px; " v-model="companydata.profile" :disabled="disabled"></textarea>
            </el-form-item>
            <el-form-item label="经营范围:" prop="operation">
                <textarea style="width:1210px; font-size:15px;line-height:25px; height:100px; border-radius:4px; " v-model="companydata.operation" :disabled="disabled"></textarea>
            </el-form-item>       
        </el-form>
        <el-button :disabled="disabled1" type="primary" @click="submitForm">提交</el-button>
    </div>
</template>
<script type="text/javascript">
    import {ajax,storage} from 'utils';
    import common from 'common';
 export default {
    data() {
        return {
            disabled:true,
            disabled1:true,
             companydata:{
                company:'',//公司名称
                profile:'',//公司简介
                legal:'',//公司法人
                operation:'',//经营范围
                organ:'',//发证机关
                license:'',//营业执照号
                establishment:'',//公司成立日期
                Registered:'',//注册资本
                companytype:'',//公司类型
                operationStateL:'',//经营状态
                companycity:'',//所属城市
                type:'',//公司性质
                code:'',//顺企编码
                Shareholder:'',//股东人=法人
                post:'',//股东职位
                Supervisorperson:'',//监事人
                Supervisor:'',//职位监视
                addres:'',
                caller:'',
                phone:0,
                email:'',
                ems:0,
                weburl:''
            },
        }
    },
    methods:{
        submitForm(){
            ajax.call(this, '/editcompanydata', this.companydata, (obj, err) => {                   
                if (!err) {
                    this.$message({
                        message: '保存成功',
                        type: 'success'
                    });
                }
                this.disabled=true
                this.disabled1=true
                this.company()
            });
            
        },
        edit(){
            this.disabled=false
            this.disabled1=false
        },
        //获取公司信息
        company(){
            ajax.call(this, '/companydata', this.companydata, (obj, err) => {                   
                if (!err) {
                    let data=obj.data
                    data.map(i=>{
                        this.companydata=i
                        return i
                    })
                    console.log('obj',data)                      
                }
            });
        },
        //编辑信息
        
    },
    mounted() {
        this.company()
    },
    
  }
</script>
<style lang="scss" scoped>
.form{
    width:1300px;
    .el-form-item{
        .el-input{
            width:340px;
        }
       
    }
}
</style>