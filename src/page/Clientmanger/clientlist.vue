<template>
    <div>
          <el-form ref="form" :model="productdata" label-width="80px">
            <el-form-item label="产品标题" prop="content">
                <el-input  v-model="productdata.title"></el-input>
            </el-form-item>
             <el-form-item label="产品内容" prop="content">
                <el-input type="textarea" v-model="productdata.content"></el-input>
            </el-form-item>
            <el-form-item label="产品图片" prop="title">
                <el-input v-model="productdata.img"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button @click="addlist">提交</el-button>
            </el-form-item>         
          </el-form>
        <el-row class="grid-table">
            <el-button type="success" :disabled="grade.passedArticle" @click='passedArticle(null,1)'>批量通过</el-button>
            <el-button type="warning" :disabled="grade.passedArticle" @click='passedArticle(null,0)'>批量审核</el-button>
            <el-button type="danger" :disabled="grade.deleteArticle" @click='deleteArticle()'>批量删除</el-button>
            <el-table stripe border style="width:100%;margin-top:10px" :data="table_data.data0" @selection-change="handleSelectionChange">
                <el-table-column type="selection" :selectable="selectable" width="55"></el-table-column>
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
            <el-pagination
                @current-change="handleCurrentChange"
                :current-page="search_data.page"
                :page-size="search_data.pageSize"
                layout="total, prev, pager, next,jumper"
                :total="table_data.total">
            </el-pagination>
        </el-row>
    </div>
</template>
<script type="text/javascript">
    import {ajax,storage} from 'utils';
    import common from 'common';
    module.exports = {
        name: 'list',
        data() {
            return {
                page_grade:common.page_grade,
                grade:{
                    updateArticle: !0,
                    passedArticle: !0,
                    deleteArticle: !0,
                },
                userInfo:{},
                read_type:common.user_type,
                sort_data:[],
                sort_id:[],
                defaultProps: {
                    children: 'children',
                    label: 'sort_name',
                    value: 'id'
                },
                search_data: {
                    title: '',
                    sort_id: '',
                    read_type: '',
                    page: 1,
                    pageSize: 10
                },
                //表格数据
                multipleSelection:[],
                table_data: {
                    columns: [
                        {"key": "title", "name": "产品标题", minWidth: 150},
                        {"key": "content", "name": "产品内容", minWidth: 150},
                        {"key": "sort_name", "name": "分类名称", width: 120},
                        {"key": "user_name", "name": "作者", width: 120},
                        {"key": "passed", "name": "状态", width: 80},
                        {"key": "read_type", "name": "阅读权限", width: 120},
                        {"key": "create_time", "name": "发表时间", minWidth:120},
                        {"key": "operations", "name": "操作", width: 135}
                    ],
                    total: 0,
                    data0: []
                }, 
                loading:false,
                productdata:{
                    title:'',
                    sort_name:'',
                    user_name:'',
                    read_type:'',
                    create_time:'',
                    description:'',
                    content:'',
                    prev:{id:0,title:''},
                    next:{id:0,title:''}
                }
            }
        },
        methods: {
          //新增产品
           addlist(){
            ajax.call(this, '/clientad', this.productdata, (data, err) => {
                if (!err) {
                    this.$message({
                        message: '保存成功',
                        type: 'success'
                    });
                }
              })
              this.productdata={}
              this.ajaxData()
          },
            //删除文章
            deleteArticle(arr){
                if(!arr){
                    if(this.multipleSelection.length){
                        arr = this.multipleSelection;
                    }else{
                        return this.$message("请先选择文章");
                    }
                }
                this.$confirm(`确定要${arr.length>1?'批量删除文章':'删除此文章'}吗？`, '系统提醒', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    ajax.call(this, '/deleteArticle', {ids:arr.map(o=>o.id).join(",")}, (d, err) => {
                        !err && this.ajaxData();
                    })
                }).catch(() => {});
            },
            passedArticle(arr,pass){
                if(!arr){
                    if(this.multipleSelection.length){
                        arr = this.multipleSelection;
                    }else{
                        return this.$message("请先选择文章");
                    }
                }
                ajax.call(this, '/passedArticle', {ids:arr.map(o=>o.id).join(","),passed:pass}, (obj, err) => {
                    if (!err) {
                        arr.forEach(row=>{
                            row.passed = obj.passed;
                        })
                    }
                });
            },
            selectable(row){
                let user = this.userInfo;
                return user.user_type < 3||(!this.grade.deleteArticle||!this.grade.passedArticle) && user.id !== row.user_id;
            },
            add(){
                this.$router.push('/article/add');
            },
            handleSelectionChange(val){
                this.multipleSelection = val;
            },
            createButton(h, row, code, text){
                let self = this;
                let dis = false;
                let user = this.userInfo;
                if(code === 'passed'){
                    dis = this.grade.passedArticle;
                }else if(code === 'edit'){
                    dis = user.user_type > 2 && user.id !== row.user_id ? true : this.grade.updateArticle;
                }else if(code === 'delete'){
                    dis = user.user_type > 2 && user.id !== row.user_id ? true : this.grade.deleteArticle;
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
                }else if(key === 'title'){
                    return h('span',{
                        style:{cursor:'pointer'},
                        on:{
                            click(){
                                self.healColumnClick('view', row);
                            }
                        }
                    },[str]);
                }else if(key === 'passed'){
                    return this.createButton(h,row,key,str === 1?'审核':'通过');
                }else if(key === 'operations'){
                    return h('div',[
                        this.createButton(h,row,'edit','编辑'),
                        this.createButton(h,row,'delete','删除'),
                    ]);
                }else if(key === 'read_type'){
                    str = common.user_type[str]||'未知';
                }
                return str;
            },
            //处理列、按钮点击
            healColumnClick(code, row){
                if(code ==='edit'){
                    this.$router.push('/article/edit/'+row.id);
                }else if(code ==='view'){
                    this.$refs.view.open(!0);
                    this.getActiveContent(row.id);
                }else if(code ==='passed'){
                    this.passedArticle([row],row.passed===1?0:1);
                }else if(code === 'delete'){
                    this.deleteArticle([row]);
                }
            },
            getActiveContent(id){
                this.loading = !0;
                ajax.call(this, '/getArticleById', {id}, (obj, err) => {
                    this.loading = !1;
                    if (err) {
                        this.$refs.view.open(!1);
                    }else{
                        console.log(JSON.stringify(obj));
                        Object.getOwnPropertyNames(this.article).forEach(key => {
                            this.$set(this.article,key,obj[key]);
                        });
                        this.article.create_time = new Date(this.article.create_time).toLocaleDateString();
                        //显示分类
                        const cid = obj.sort_id;
                        let hasFind = false;
                        let cb = (array,a)=>{
                            !hasFind && array && array.forEach(item=>{
                                a = a||[];
                                let _a = [].concat(a);
                                _a.push(item.id);
                                if(item.id === cid){
                                    hasFind = true;
                                    this.sort_id = _a;
                                }else{
                                    cb(item.children,_a);
                                }
                            })
                        };
                        cb(this.sort_data);
                    }
                })
            },
            //ajax请求列表数据
            ajaxData(){
                let p = this.sort_id;
                this.search_data.sort_id = p.length ? p.slice(-1)[0] : '';
                ajax.call(this, '/listClient', this.productdata, (obj, err) => {
                    if (!err) {
                        this.table_data.data0 = obj.data;
                        this.table_data.total = obj.total;
                        this.search_data.page = obj.page;
                    }
                });
            },
            //点击查询
            onSearch() {
                this.ajaxData();
            },
            handleCurrentChange(page){
                if(page !== this.search_data.page){
                    this.search_data.page = page;
                    this.ajaxData();
                }
            },
        },
        mounted() {
            this.ajaxData();
            ajax.call(this, '/listSort', {}, (data, err) => {
                if (!err) {
                    let arr = data.data;
                    arr.sort((a, b) => a.parent_id > b.parent_id ? 1 : -1);
                    for (let i = arr.length; i--;) {
                        if (arr[i].parent_id > 0) {
                            let obj = arr.pop();
                            arr.forEach(item => {
                                if (item.id === obj.parent_id) {
                                    item.children = item.children||[];
                                    item.children.push(obj);
                                }
                            })
                        }
                    }
                    this.sort_data = arr;
                }
            });
        },
        mixins:[common.mixin],
       
    }
</script>
<style lang="less">
    .grid-table{
        // .el-form-item{
        //     display: inline-block;
        //     max-height:240px;
        //     width:~'calc(24% - 10px)';
        //     &:first-child{
        //         .el-input{
        //             margin-right:25px;
        //         }
        //     }
        //     &:last-child{
        //         overflow: hidden;
        //         white-space: nowrap;
        //         vertical-align: bottom;
        //     }
        // }
        .el-pagination{
            margin-top:5px;
            text-align: right;
        }
        .el-cascader--small .el-cascader__label{
            line-height: 40px;
        }
    }
    .sidebar_content{
        .el-row{
            font-size:15px;
            color:#666;
            margin-bottom:8px;
            strong{
                color:#555;
            }
        }
        .article_content{
            font-size: 12px;
            margin-top: 20px;
            padding: 10px;
            background: #f1f1f112;
            border: 1px solid #f9f9f9;
            .no_access{
                color:#999;
                font-size:16px;
            }
        }
    }
    .sidebar_foot p{
        span{
            color:#999;
        }
        a{
            text-decoration: none;
            color:#444;
        }
    }
</style>
