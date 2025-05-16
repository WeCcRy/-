<template>
  <div class="bg">
    <!-- 面包屑导航区 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>个人中心</el-breadcrumb-item>
      <el-breadcrumb-item>个人信息</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- 卡片视图区 -->
    <el-card>
      <el-form :model="userForm" ref="userFormRef" label-width="80px">
        <el-row>
          <el-col :span="6">
            <el-form-item label="姓名" prop="name">
              <el-input v-model="userForm.name" clearable disabled></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="性别" prop="sex">
              <el-input v-model="userForm.sex" clearable disabled></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="学号" prop="uname">
              <el-input v-model="userForm.uname" clearable disabled></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="学院" prop="xueyuan">
              <el-input v-model="userForm.xueyuan" clearable disabled></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="6">
            <el-form-item label="班级" prop="banji">
              <el-input v-model="userForm.banji" clearable disabled></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="联系电话" prop="tel">
              <el-input v-model="userForm.tel" clearable :disabled="editable"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="所在楼宇" prop="lynumber">
              <el-input v-model="userForm.lynumber" clearable disabled></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="宿舍号" prop="sushe">
              <el-input v-model="userForm.sushe" clearable disabled></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="10">
            <el-form-item label="密码" prop="pass">
              <el-input
                v-model="userForm.pass"
                show-password
                clearable
                :disabled="editable"
                placeholder="请输入新密码"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <!-- 修改 -->
        <el-row type="flex" justify="end">
          <el-button type="warning" @click="editUserinfo">修改信息</el-button>
          <el-button type="success" :disabled="editable" @click="submit">提交</el-button>
          <el-button type="primary" :disabled="editable" @click="cancel">取消</el-button>
        </el-row>
      </el-form>
    </el-card>
    <el-card v-if="access">
      <el-row>
        <!-- 左侧内容 -->
        <el-col :span="12">
          <div slot="header" class="clearfix">
            <span>电费信息</span>
          </div>
          <div style="display: flex; align-items: center;">
            <!-- 电费的 icon -->
            <div style="flex: 1;">
              <img src="../../assets/img/dianfei.png" alt="电费" style="width: 125px; height: 125px;">
            </div>
            <!-- 右侧信息 -->
            <div style="flex: 3;font-size: 20px;font-weight: bold;line-height: 40px" >
              <!-- 使用对象包装返回的数据 -->
              <p>本期电费：{{ electricityInfo.dianfei }}</p>
              <p>统计日期：{{ electricityInfo.date }}</p>
              <p>缴费状态：{{ electricityInfo.status }}</p>
            </div>
          </div>
        </el-col>
        <!-- 右侧内容 -->
        <el-col :span="12">
          <div slot="header" class="clearfix">
            <span>宿舍评分</span>
          </div>
          <div style="display: flex; align-items: center;">
            <!-- 电费的 icon -->
            <div style="flex: 1;">
              <img src="../../assets/img/rate.png" alt="宿舍评分" style="width: 125px; height: 125px;">
            </div>
            <!-- 右侧信息 -->
            <div style="flex: 3;font-size: 20px;font-weight: bold;line-height: 40px" >
              <!-- 使用对象包装返回的数据 -->
              <p>本期评分：{{ pinfen.rate }}</p>
              <p>评分日期：{{ pinfen.date }}</p>
              <p style="color: red;font-size: 12px">详情请见统计中心-宿舍评分</p>
            </div>
          </div>
        </el-col>
      </el-row>
    </el-card>

  </div>
</template>

<script>
export default {
  data() {
    return {
      // 用户个人信息表单
      userForm: {},
      // 控制提交按钮是否可以点击以及输入框的编辑
      editable: true,
      // 是否显示电费和宿舍评分
      access:1,
      // 电费
      electricityInfo: {
        dianfei: '',
        date: '',
        status: ''
      },
      pinfen:{
        rate:'',
        date:'',
      }
    };
  },
  methods: {
    // 修改按钮点击事件
    editUserinfo() {
      this.editable = false;
    },
    // 提交按钮事件
    submit() {
      var _this = this;
      // 发起数据请求
      this.$http
        .post("http://localhost/login/update", this.userForm)
        .then(function(response) {
          console.log(response.data);
          if (response.data.code == "200") {
            // 如果更新成功,弹出更新成功提示信息
            _this.$message({
              showClose: true,
              message: "数据修改成功",
              type: "success"
            });
            var userData = JSON.stringify(response.data.newResult[0]);
            window.sessionStorage.setItem("userData", userData);
            _this.editable = true;
          }else{
            // 如果更新失败,弹出更新失败提示信息
            _this.$message({
              showClose: true,
              message: "数据修改失败",
              type: "error"
            });
          }
        });
      // alert("提交成功");
    },
    // 取消按钮事件
    cancel() {
      this.userForm = JSON.parse(window.sessionStorage.getItem("userData"));
      this.editable = true;
    }
  },
  created() {
    this.userForm = JSON.parse(window.sessionStorage.getItem("userData"));
    this.access = this.userForm.roler == 2 ? 1 : 0;
    var _this = this;
    // 发起数据请求
    if (_this.access){
    this.$http
        .post("http://localhost/personal/dianfei", this.userForm)
        .then(function (response) {
          console.log(response.data.data[0]);
          if (response.data.code == "200") {
            // 如果更新成功,弹出更新成功提示信息
            var userData = response.data.data[0];
            userData.dianfei = userData.dianfei + "元";
            if (userData.status == 0) {
              userData.status = "未缴费";
            } else {
              userData.status = "已缴费";
            }
            userData.date = userData.date.substring(0, 10);
            _this.electricityInfo = userData;
          } else {
            // 如果更新失败,弹出更新失败提示信息
            _this.$message({
              showClose: true,
              message: "数据获取失败",
              type: "error"
            });
          }
        });
    this.$http
        .post("http://localhost/personal/pinfen", this.userForm)
        .then(function(response) {
          console.log(response.data.data[0]);
          if (response.data.code == "200") {
            // 如果更新成功,弹出更新成功提示信息
            var userData = response.data.data[0];
            _this.pinfen={
              rate:userData.total,
              date:userData.time
            }
          }else{
            // 如果更新失败,弹出更新失败提示信息
            _this.$message({
              showClose: true,
              message: "数据获取失败",
              type: "error"
            });
          }
        });
  }}
};
</script>

<style lang="css" scoped>
</style>
