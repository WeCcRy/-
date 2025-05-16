<template>
  <el-card class="card">
    <!-- 标签栏 -->
    <div>
      <el-text class="title">评论</el-text>
      <div style="display: flex;margin-bottom: 10px;">
        <el-input v-model="comment" style="margin-top: 10px;height: 35px;" placeholder="在这里回复" />
        <el-button @click="makeComment" type="primary"
                   style="margin-top: 10px;margin-bottom: 10px;margin-left: 10px;">回复</el-button>
      </div>
      <div class="scrollable-container" ref="commentContainer" @scroll="handleScroll">
        <div v-for="item in comments" class="con" :key="item.id">
          <!-- 父评论 -->
          <div style="display:flex;align-items: center;justify-content: center;">
            {{ item.host }}
            <template>
              <el-button style="margin-left: 5px;" size="small"  slot="reference" @click="articleReply(item)">回复</el-button>
            </template>
            <div class="flex-grow" />时间: {{ item.date }}
          </div>
          <div style="margin-top: 15px;">{{ item.content }}</div>
          <!-- 子评论 -->
          <div v-for="sub in item.subreply" class="subCon" :key="sub.id">
            <div style="display:flex;align-items: center;justify-content: center;">
              {{ sub.fromName}}
              <div style="margin-left: 15px;margin-right: 15px;">回复: {{ sub.toName }}</div>
              {{ sub.date }}
              <el-button style="margin-left: 5px;" size="small"  slot="reference" @click="ReplyReply(sub)">回复</el-button>
              <div class="flex-grow" />
            </div>
            <div style="margin-top: 15px;">{{ sub.reply }}</div>
          </div>
        </div>
        <div v-if="loading" class="loading">加载中...</div>
        <div v-if="!hasMoreComments" class="no-more-comments">没有更多评论了</div>
      </div>
    </div>
    <!-- 回复对话框 -->
    <el-dialog title="回复" :visible.sync="firstReplyVisible" width="50%" @close="commentReplyclosed">
      <!-- 内容主体区 -->
      <el-form :model="firstReply" ref="firstReplyRef" label-width="100px">
        <el-form-item label="回复用户" prop="toName">
          <el-input v-model="firstReply.toName"  disabled></el-input>
        </el-form-item>
        <el-form-item label="针对内容" prop="content" >
          <el-input v-model="firstReply.content" disabled></el-input>
        </el-form-item>
        <el-form-item label="回复内容" prop="reply">
          <el-input
              v-model="firstReply.reply"
              style="width: 80%"
              :autosize="{ minRows: 5, maxRows: 10 }"
              type="textarea"
          ></el-input>
        </el-form-item>
      </el-form>
      <!-- 底部按钮区 -->
      <span slot="footer" class="dialog-footer">
          <el-button @click="firstReplyVisible = false">取 消</el-button>
          <el-button type="primary" @click="addReply">确 定</el-button>
        </span>
    </el-dialog>

    <!-- 二级回复对话框 -->
    <el-dialog title="回复" :visible.sync="firstReplyVisible" width="50%" @close="commentReplyclosed">
      <!-- 内容主体区 -->
      <el-form :model="firstReply" ref="firstReplyRef" label-width="100px">
        <el-form-item label="回复用户" prop="toName">
          <el-input v-model="firstReply.toName"  disabled></el-input>
        </el-form-item>
        <el-form-item label="针对内容" prop="content" >
          <el-input v-model="firstReply.content" disabled></el-input>
        </el-form-item>
        <el-form-item label="回复内容" prop="reply">
          <el-input
              v-model="firstReply.reply"
              style="width: 80%"
              :autosize="{ minRows: 5, maxRows: 10 }"
              type="textarea"
          ></el-input>
        </el-form-item>
      </el-form>
      <!-- 底部按钮区 -->
      <span slot="footer" class="dialog-footer">
          <el-button @click="firstReplyVisible = false">取 消</el-button>
          <el-button type="primary" @click="addReply">确 定</el-button>
        </span>
    </el-dialog>
  </el-card>
</template>

<script>
import { nanoid } from 'nanoid';
import moment from "moment";
export default {
  name: "topicComment",
  props: {
    topicDetail: {
      type: Object,
      required: true,
    },
  },
  data(){
    return{
      topicId:'',
      comment:'',
      firstReplyVisible:false,
      comments : [],
      firstReply:{
        commentId:"",
        content:"",
        replyId:"",
        reply:"",
        fromId:"",
        fromName:"",
        toId:"",
        toName:"",
      },
      loading:false,
      hasMoreComments: true
    }
  },
  methods:{
    // 获取评论
    async getComments(topicId, page, pageSize){
      if (!this.hasMoreComments) return; // 如果没有更多数据了，直接返回
      try {
        this.loading = true; // 开始加载
        let response = await this.$http.post("http://localhost/myForum/getComment", {topicId, page, pageSize});
        let data = response.data;
        if (data.code === 200) {
          if (data.hasMore == false&&this.hasMoreComments==true) {
            console.log("拉取")
            this.comments = this.comments.concat(data.data);
            this.hasMoreComments = false; // 没有更多数据了
            console.log(this.comments.length)
          } else {
            this.comments = this.comments.concat(data.data);
          }
        } else {
          this.$message.error("获取评论失败");
        }
      } catch (error) {
        console.error("Error fetching comments:", error);
        this.$message.error("获取评论失败");
      } finally {
        this.loading = false; // 结束加载
      }
    },
    // 添加评论
    makeComment(){
      this.comment=this.comment.trim();
      if(this.comment.length>0){
        const value = window.sessionStorage.getItem('userData');
        const data=JSON.parse(value);
        let obj={
          commentId:nanoid(10),
          topicId:this.topicId,
          content:this.comment,
          hostId:data.uname,
          host:data.name,
          date: moment().format('YYYY-MM-DD HH:mm:ss'),
        }
        var _this=this;
        this.$http
            .post("http://localhost/myForum/addComment", obj)
            .then(function(response) {
              if (response.data.code == 200) {
                _this.comment=""
                _this.comments=[]
                // 重新获取评论列表
                _this.hasMoreComments=true;
                _this.getComments(_this.topicId, 1, 10);
                console.log("评论")
                return _this.$message({
                  showClose: true,
                  message: response.data.msg,
                  type: "success"
                })
              } else {
                return _this.$message({
                  showClose: true,
                  message: response.data.msg,
                  type: "error"
                })
              }
            });
      } else {
        this.$message({
          showClose: true,
          message: "请输入内容",
          type: "error"
        });
      }
    },
    // 添加文章回复
    articleReply(item){
      this.firstReply.toId=item.hostId;
      this.firstReply.toName=item.host;
      this.firstReply.commentId=item.commentId;
      this.firstReply.content=item.content;
      this.firstReplyVisible=true;
    },
    commentReplyclosed(){
      this.$refs.firstReplyRef.resetFields();
    },
    // 添加回复的回复
    ReplyReply(sub){
      this.firstReply.toId=sub.fromId;
      this.firstReply.toName=sub.fromName;
      this.firstReply.commentId=sub.commentId;
      this.firstReply.content=sub.reply;
      this.firstReplyVisible=true;
    },
    addReply(){
      let from=JSON.parse(window.sessionStorage.getItem("userData"))
      this.firstReply.fromId=from.uname;
      this.firstReply.fromName=from.name;
      this.firstReply.replyId=nanoid(10);
      var _this=this;
      this.comments=[];
      this.$http
          .post("http://localhost/myForum/addCommentRely", this.firstReply)
          .then(function(response) {
            if (response.data.code == 200) {
              _this.comments=[]
              _this.firstReplyVisible=false;
              // 重新获取评论列表
              _this.hasMoreComments=true;
              _this.getComments(_this.topicId, 1, 10);
              return _this.$message({
                showClose: true,
                message: response.data.msg,
                type: "success"
              })
            } else {
              return _this.$message({
                showClose: true,
                message: response.data.msg,
                type: "error"
              })
            }
          });
    },
    // 监听滚动事件，实现分页加载评论
    handleScroll(){
      if(this.hasMoreComments==true) {
        console.log("滚动")
        const commentContainer = this.$refs.commentContainer;
        // 判断是否滚动到底部
        if (commentContainer.scrollTop + commentContainer.clientHeight >= commentContainer.scrollHeight && !this.loading && this.hasMoreComments) {
          // 加载下一页评论
          this.getComments(this.topicDetail.topicId, Math.floor(this.comments.length / 10 + 1), 10);
        }
      }
    },
  },
  created() {
    this.topicId=this.$route.query.id;
    this.getComments(this.topicId, 1, 10);
  }
}
</script>

<style scoped>
.flex-grow {
  flex-grow: 1;
}

.card {
  margin-top: 10px;
}

.scrollable-container {
  height: 500px; /* 设置固定高度 */
  overflow-y: auto; /* 启用垂直滚动条 */
}

.con {
  padding-top: 10px;
  padding-left: 10px;
  padding-right: 10px;
  padding-bottom: 10px;
  margin-bottom: 15px;
  background-color: rgb(248, 248, 248);
  border-radius: 10px;
}

.subCon {
  border-left: 4px solid rgb(217, 217, 217);
  margin-left: 20px;
  margin-top: 15px;
  padding-left: 10px;
}

.title {
  font-size: 18px;
  font-weight: bolder;
  color: #000;
  padding-left: 16px;
}

.text {
  font-size: 14px;
  color: #000;
  margin-right: 10px;
}

.iconfont {
  font-size: 25px;
}

.tagLine {
  margin-left: 16px;
  margin-bottom: 10px;
}

.tag {
  margin-right: 5px;
  margin-bottom: 5px;
}

.loading {
  text-align: center;
  margin-top: 10px;
}

.no-more-comments {
  text-align: center;
  margin-top: 10px;
  color: gray;
}
</style>
