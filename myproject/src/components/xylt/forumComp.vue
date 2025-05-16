<!-- forumComp.vue -->
<template>
  <div class="forum-post">
    <el-row class="post-header">
      <el-col :span="5" :offset="1">
        <el-text>发布用户：{{ topic.host }}</el-text>
      </el-col>
      <el-col :span="6">
        <el-text>发布日期：{{ topic.date }}</el-text>
      </el-col>
      <el-col :span="8">
        <el-text class="tag-label">分类:</el-text>
        <el-tag type="primary" class="tag" v-if="topic.type==0">信息交流</el-tag>
        <el-tag type="warning" class="tag" v-if="topic.type==1">个人求助</el-tag>
      </el-col>
      <el-col :span="4">
        <el-button type="danger" icon="el-icon-delete" circle v-if="userState!=2" @click="topicDelete(topic.topicId)"></el-button>
      </el-col>
    </el-row>
    <el-card class="post-card" @click.native="jumpTarget(topic.topicId)">
      <el-row>
        <el-col :span="20">
          <div class="post-title">{{ topic.topic }}</div>
<!--          若多行数据则只显示第一行-->
          <div class="post-content">{{ topic.content}}</div>
        </el-col>
      </el-row>
    </el-card>
    <el-divider />
  </div>
</template>

<script>
export default {
  name: 'forumComp',
  props: {
    topic: {
      type: Object,
      required: true,
    },
  },
  data(){
    return{
      userState:'2', // 控制删除按钮是否显示，只有超级、普通管理员可以看到
      visible:false, // 删除按钮弹出框
    }
},
  created() {
    const value = window.sessionStorage.getItem('userData');
    const userData = JSON.parse(value); // 将字符串解析成 JSON 对象
    this.$data.userState = userData.roler;
    if(this.topic.content.length>20){
      this.topic.content=this.topic.content.split("\n")[0].substr(0,20)+"...";
    }
  },
  methods:{
    topicDelete(id){
      var _this=this;
      this.$http
          .post("http://localhost/myForum/deleteTopic",{topicId: id})
          .then(function(response) {
            if (response.data.code == 200) {
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
    },
    jumpTarget(id){
      this.$router.push({path:'/topicDetail',query: {id}})
    }
  }
};
</script>

<style scoped>
.forum-post {
  margin-bottom: 20px;
}

.post-header {
  align-items: center;
  line-height: 30px;
}

.post-card {
  width: 90%;
  border-radius: 6px;
  cursor: pointer;
}

.post-title {
  font-size: 16px;
  font-weight: bold;
}

.post-content {
  font-size: 14px;
  margin-top: 10px;
}

.post-stats {
  margin-top: 10px;
  align-items: center;
}

.stats-item {
  font-size: 13px;
  display: flex;
  align-items: center;
}

.stats-item i {
  margin-right: 5px;
}

.tag-label {
  margin-right: 10px;
}

.tag {
  margin-right: 5px;
}

.post-image {
  height: 120px;
  border-radius: 7px;
}

</style>
