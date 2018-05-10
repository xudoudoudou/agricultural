<template>
<div>
    <el-upload
    action="/api/upFile"
    list-type="picture-card"
    :on-preview="handlePictureCardPreview"
    :on-success="handleAvatarSuccess"
    :on-remove="handleRemove">
    <i class="el-icon-plus"></i>
    </el-upload>
    <img width="100%" :src="dialogImageUrl" alt="">
    
</div>
</template>
<script type="text/javascript">
  export default {
    data() {
      return {
        imageUrl: '',
        dialogImageUrl: '',
      };
    },
    methods: {
        handleAvatarSuccess(res, file) {
        this.imageUrl = URL.createObjectURL(file.raw);
        console.log('--',res)
      },
       handleRemove(file, fileList) {
        console.log(file, fileList);
      },
      handlePictureCardPreview(file) {
        this.dialogImageUrl = file.url;
        this.dialogVisible = true;
      }
      
    }
  }
</script>

<style scoped>
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
</style>
