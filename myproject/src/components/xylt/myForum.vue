<template>
  <div>
    <!-- 面包屑导航区 -->
    <el-breadcrumb separator-class="el-icon-arrow-right" style="line-height: 40px">
      <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>校园论坛</el-breadcrumb-item>
      <el-breadcrumb-item>我的论坛</el-breadcrumb-item>
      <el-button type="primary" round @click="addDialogVisible=true">内容发布</el-button>
    </el-breadcrumb>

    <div class="forum-list">
      <forumComp
          v-for="topic in forumTopics"
          :key="topic.topicId"
          :topic="topic"
          @reload-data="oneQuest"
      />
    </div>
    <!-- 分页区域 -->
    <el-pagination
        @current-change="handleCurrentChange"
        :current-page="pagenum"
        layout="total, prev, pager, next"
        :total="total"
    ></el-pagination>
    <!-- 添加用户的对话框 -->
    <el-dialog title="发布话题" :visible.sync="addDialogVisible" width="50%" @close="addDialogClosed">
      <!-- 内容主体区 -->
      <el-form :model="addForm" ref="addFormRef" label-width="80px">
        <el-form-item label="学号" prop="hostId">
          <el-input v-model="addForm.hostId" disabled></el-input>
        </el-form-item>
        <el-form-item label="姓名" prop="hostName">
          <el-input v-model="addForm.hostName" disabled></el-input>
        </el-form-item>
        <el-form-item label="标题" prop="topic">
          <el-input v-model="addForm.topic"></el-input>
        </el-form-item>
        <el-form-item label="类型" prop="type">
        <el-select v-model="addForm.type" placeholder="请选择文章类型">
          <el-option label="信息交流" value="0"></el-option>
          <el-option label="个人求助" value="1"></el-option>
        </el-select>
        </el-form-item>
        <el-form-item label="内容" prop="content">
        <el-input
            v-model="addForm.content"
            style="width: 80%"
            :autosize="{ minRows: 5, maxRows: 10 }"
            type="textarea"
            placeholder="请输入内容"
        />
        </el-form-item>
      </el-form>
      <!-- 底部按钮区 -->
      <span slot="footer" class="dialog-footer">
          <el-button @click="addDialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="addTopic">确 定</el-button>
        </span>
    </el-dialog>
  </div>
</template>

<script>
import forumComp from './forumComp';
import { nanoid } from 'nanoid';
export default {
  name: 'myForum',
  components: {
    forumComp,
  },
  data() {
    return {
      forumTopics: [
      ],
      pagenum:1,
      total:0,
      addDialogVisible:false,
      addForm:{
        hostId:'',
        hostName:'',
        topicId:'',
        topic:'',
        type:'',
        content:''
      }
    };
  },
  created() {
    this.oneQuest();
    const value = window.sessionStorage.getItem('userData');
    const userData = JSON.parse(value); // 将字符串解析成 JSON 对象
    this.$data.addForm.hostId = userData.uname;
    this.$data.addForm.hostName = userData.name;
  },
  methods:{
    oneQuest() {
      var _this = this;
      this.$http
          .post("http://localhost/myForum/search", {pagenum:this.pagenum})
          .then(function(response) {
            console.log(response.data);
            if (response.data.code == 200) {
              _this.forumTopics = response.data.data;
              _this.total = response.data.total;
            }
          });
    },
    handleCurrentChange(newPage) {
      console.log(newPage);
      this.pagenum = newPage;
      this.oneQuest();
    },
    addDialogClosed() {
      this.$refs.addFormRef.resetFields();
    },
    addTopic(){
      this.addForm.topicId=nanoid(12);
      var _this = this;
      this.$http
          .post("http://localhost/myForum/addTopic", {addForm:this.addForm})
          .then(function(response) {
            if (response.data.code == 200) {
              _this.$message({
                showClose: true,
                message: "发布成功",
                type: "success"
              });
            }else{
              _this.$message({
                showClose: true,
                message: "发布失败",
                type: "error"
              });
            }
          });
      this.addDialogVisible=false;
      this.oneQuest();
    }
  }
};
</script>

<style scoped>
.forum-list {
  margin-top: 10px;
  /*width: 70%;*/
  height: 80vh; /* 设置容器高度为视口高度的 80% */
  overflow-y: auto; /* 添加纵向溢出滚动条 */
  overflow-x: hidden; /* 隐藏横向溢出内容 */
}
</style>
