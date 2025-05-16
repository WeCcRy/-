<template>
<div>
  <el-card>
    <el-row style="margin-left: 20px">
      <el-col :span="24">
        <h1 style="padding-bottom: 20px;font-size: 32px">{{ topicDetail.topic }}</h1>
        <div>
          <span style="float: left">发布用户：{{topicDetail.host}}</span>
          <span style="float: right" >发布时间：{{topicDetail.date}}</span>
        </div>
        <el-divider></el-divider>
        <div v-html="topicDetail.content" style="font-size: 20px;line-height: 30px"></div>
      </el-col>
    </el-row>
  </el-card>
  <topic-comment :topicDetail="topicDetail"></topic-comment>
</div>
</template>

<script>
import topicComment from "@/components/xylt/topicComment";
export default {
  name: "topicDetail",
  components:{
    topicComment
  },
  data(){
    return{
      topicDetail:{
        hostId:'',
        hostName:'',
        topicId:'',
        topic:'',
        type:'',
        date:'',
        content:''
      },
      topicId:'',
    }
  },
  created() {
  let topicId=this.$route.query.id;
  var _this=this;
  this.$http
        .post("http://localhost/myForum/topicDetail", {topicId})
        .then(function(response) {
          if (response.data.code == 200) {
            _this.$data.topicDetail=response.data.result[0];
            _this.$data.topicDetail.content=_this.$data.topicDetail.content.replace(/\n/g, '<br>');
          }
        });
  }
}
</script>

<style scoped>

</style>
