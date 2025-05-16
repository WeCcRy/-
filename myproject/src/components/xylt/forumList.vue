<template>
<div>
  <!-- 面包屑导航区 -->
  <el-breadcrumb separator-class="el-icon-arrow-right" style="line-height: 40px">
    <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
    <el-breadcrumb-item>校园论坛</el-breadcrumb-item>
    <el-breadcrumb-item>我的发布</el-breadcrumb-item>
  </el-breadcrumb>
  <!-- 表格数据区域 -->
  <el-table :data="forumList" stripe border>
    <el-table-column type="index"></el-table-column>
    <el-table-column label="标题" prop="topic"></el-table-column>
    <el-table-column label="发布日期" prop="date"></el-table-column>
    <el-table-column label="操作" id="cz">
      <template slot-scope="scope">
        <!-- 删除按钮 -->
        <el-tooltip effect="dark" content="删除" placement="top" :enterable="false">
          <el-button
              type="danger"
              icon="el-icon-delete"
              size="mini"
              @click="removeTopic(scope.row.topicId)"
          ></el-button>
        </el-tooltip>
      </template>
    </el-table-column>
  </el-table>
  <!-- 分页区域 -->
  <el-pagination
      @current-change="handleCurrentChange"
      :current-page="queryInfo.pageNum"
      :page-size="queryInfo.pageSize"
      layout="prev, pager, next"
      :total="total"
  ></el-pagination>
</div>
</template>

<script>
export default {
  name: "forumList",
  data(){
    return{
      userId:'',
      forumList:[],
      queryInfo:{
        pageNum:1,
        pageSize:10
      },
      total:'',
    }
  },
  methods:{
    topicRequest(){
      // 封装页面加载请求函数
        var _this = this;
        this.$http
            .post("http://localhost/myForum/getForumList", {queryInfo:this.queryInfo,userId:this.userId})
            .then(function(response) {
              console.log(response.data);
              if (response.data.code == 200) {
                _this.forumList = response.data.result;
                _this.total=response.data.total;
              }
            });
    },
    handleCurrentChange(newPage){
      this.queryInfo.pageNume = newPage;
      this.topicRequest();
    },
    removeTopic(id){
      var _this=this;
      this.$http
          .post("http://localhost/myForum/deleteTopic",{topicId: id})
          .then(function(response) {
            if (response.data.code == 200) {
              _this.topicRequest();
              _this.$message({
                showClose: true,
                message: "删除成功",
                type: "success"
              });
              _this.$emit('reload-data');
            }else{
              _this.$message({
                showClose: true,
                message: "删除失败",
                type: "error"
              });
            }
          });
    }
  },
  created() {
    const value = window.sessionStorage.getItem('userData');
    const data=JSON.parse(value);
    this.userId=data.uname;
    this.topicRequest();
  }
}
</script>

<style scoped>

</style>
