<template>
    <div class="add-article">
    <el-form v-if="dialogVisible" ref="form" :model="data" :rules="rules" label-width="80px">
        <el-form-item label="图片分类" prop="name">
            <el-input v-model="data.name" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="上传图片" prop="pic">
            <el-input v-model="data.pic"></el-input>
                <up-file ref="upload" :upload="{}" @successUpload="successUpload"></up-file> 
                <el-button @click="upImg" :disabled="grade.upFile">上传图片</el-button>
        </el-form-item>
        <el-form-item label="图片展示" prop="content">
            <VueEditor :content="data.content" :height="500" :auto-height="false" @change="changeContent"></VueEditor>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" :disabled="grade.updateArticle||loading" @click="saveArticle()">保存</el-button> 
        </el-form-item>
    </el-form>
        <el-table stripe border style="width:100%;margin-top:10px" :data="table_data.data">
            <el-table-column
                show-overflow-tooltip
                v-for="item in table_data.columns"
                :label="item.name"
                :key="item.key"
                :prop="item.key"
                :formatter="columnFormatter"
                :min-width="item.minWidth" :width="item.width">
            </el-table-column>
        </el-table>
    </div>
</template>
<script type="text/javascript">
    import {ajax,storage} from 'utils';
    import common from 'common';
    import components from 'components';
    module.exports = {
        data() {
            return {
                page_grade:common.page_grade,
                grade:{
                    upFile: !0
                },
                dialogVisible:false,
                loading:false,
                userInfo:{},
                errPic:require('@/assets/error.png'),
                table_data: {
                    columns: [
                        {"key": "name", "name": "展示区域", width:240},
                        {"key": "user_name", "name": "上传者", width: 120},
                        {"key": "create_time", "name": "发表时间",width: 240 },
                        {"key": "operations", "name": "操作", minWidth:80}
                    ],
                    data: []
                },
                
                data: {
                    id:'',
                    pic: '',
                    content: '',
                    name:'',
                    user_name:''
                },
                rules: {
                    content: {
                        required: true, message: '文章内容不能为空'
                    }
                },
               
            }
        },
        methods: {
             handleClose(done) {
                this.$confirm('确认关闭？')
                .then(_ => {
                    done();
                })
            },         
            createButton(h, row, code, text){
                let self = this;
                let dis = false;
                let user = this.userInfo;
                if(code === 'edit'){
                    dis = user.id !== row.user_id ? true : this.grade.updateArticle;
                }
                return h('el-button', {
                    props: {size: 'small',disabled:dis},
                    on: {
                        click(){
                            self.healColumnClick(code, row)
                        }
                    }
                },[text])
            },
            //格式化输出内容
            columnFormatter(row, column){
                let self = this;
                let key = column.property;
                let str = row[key]||'';
                let h = this.$createElement;
                if(key === 'create_time'){
                    str = str.replace(/[^-\d].+/,'');
                }else if(key === 'operations'){
                    return h('div',[
                        this.createButton(h,row,'edit','编辑'),                   
                    ]);
                }
                return str;
            },
            // 处理列、按钮点击
            healColumnClick(code, row){
                if(code ==='edit'){
                    this.editimg(row,row.id)
                }
            },
            editimg(row){
                this.dialogVisible=true
                this.data={}
                this.data=Object.assign({},row)
            },
            saveArticle(){
                this.data.article_extend = JSON.stringify({pic:this.data.pic});
                ajax.call(this, '/updateimg',this.data, (data, err) => {
                    this.loading = false;
                    if (!err) {
                        this.$message({
                            message: '保存成功',
                            type: 'success'
                        });
                      this.dialogVisible=false
                    }
                    this.getimgtablist()
                })
            },
            getimgtablist(){
                ajax.call(this, '/getimgtablist', this.data, (obj, err) => {                   
                    if (!err) {
                        this.table_data.data = obj.data;                        
                    }
                });
            },
            formatTooltip(v){
                return common.user_type[v];
            },
            changeContent(v){
                this.data.content = v;
                this.$refs.form.validateField('content');
            },
            upImg(){
                this.$refs.upload.SelectFile();
            },
            successUpload(data){
                this.data.pic = data.filename;
                this.data.content += '<img src="'+data.filename+'" />';
                
            }
        },
        mounted() {
            this.getimgtablist()
            storage.get('userInfo',obj=>{
                this.data.user_name = obj.userInfo.user_name;
            });
        },
        watch: {
        },
        mixins:[common.mixin],
        components
    }
</script>
<style lang="less">
    .add-article {
        .el-input,.el-textarea__inner,.el-slider {
            max-width:60%
        }
        .el-cascader{
            width:100%;
            max-width:60%;
            .el-input{
                width:100%
            }
        }
    }
</style>
