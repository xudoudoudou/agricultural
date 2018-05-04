<template>
    <div class="add-article">
        <el-form ref="form" :model="data" label-width="80px">
            <el-form-item label="文章概要" prop="description">
                <el-input type="textarea" v-model="data.description"></el-input>
            </el-form-item>
            <el-form-item label="文章内容" prop="content">
                <el-input  v-model="data.content"></el-input>
            </el-form-item>
            <el-form-item label="文章标题" prop="title">
                <el-input v-model="data.title"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button @click="saveArticle">提交</el-button>
            </el-form-item>         
        </el-form>
        <el-table stripe border style="width:100%;margin-top:10px" :data="table_data.data">
                <el-table-column type="selection" width="55"></el-table-column>
                <el-table-column
                    show-overflow-tooltip
                    v-for="item in table_data.columns"
                    :label="item.name"
                    :key="item.key"
                    :prop="item.key"
                    :min-width="item.minWidth" :width="item.width">
                </el-table-column>
            </el-table>
    </div>
</template>
<script>
import {ajax,storage} from 'utils';
import common from 'common';
export default {
  data(){
    return{
      page_grade:common.page_grade,
        data:{
            description:'',
            content:'',
            title:'',
        },
        table_data: {
            columns: [
                {"key": "title", "name": "文章标题", minWidth: 150},
                {"key": "passed", "name": "状态", width: 80},
                {"key": "create_time", "name": "发表时间", minWidth:120},
            ],
            total: 0,
            data: []
        },
    }
  },
  mounted() {
            this.ajaxData();
  },
  methods:{
    saveArticle(){
       ajax.call(this, '/testaa', this.data, (data, err) => {
            if (!err) {
                this.$message({
                    message: '保存成功',
                    type: 'success'
                });
            }else{
                console.log(err);
            }
        })
    },
    ajaxData(){
         ajax.call(this, '/listArticle', this.data, (obj, err) => {
            if (!err) {
                this.table_data.data = obj.data;
            }
        });
    }
  }
}
</script>

