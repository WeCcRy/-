<template>
  <div class="login">
  <el-row>
    <el-col :span="8">
      <div  class="logo-wrap">
            <div>
              <img src="../assets/img/logo.png" alt="">
            </div>
            <div class="line"></div>
            <div>
              <span>
              宿舍管理系统
              </span>
            </div>
          </div>
    </el-col>
  </el-row>
    <el-row>
      <el-col :span="24" class="bg-wrap">
        <div class="loginBox">
                <!-- logo区域 -->
                <div class="loginLogo">
                  <img src="../assets/img/SSPUbadge.png" alt />
                </div>
                <!-- 登录表单区域 -->
                <el-form
                  :model="loginForm"
                  :rules="rules"
                  ref="loginFormRef"
                  label-width="0px"
                  class="login_form"
                >
                  <!-- 用户名 -->
                  <el-form-item prop="name">
                    <el-input v-model="loginForm.name" placeholder="请输入工号/学号" prefix-icon="el-icon-s-custom"></el-input>
                  </el-form-item>
                  <!-- 密码 -->
                  <el-form-item prop="password">
                    <el-input
                      v-model="loginForm.password"
                      placeholder="请输入密码"
                      prefix-icon="el-icon-lock"
                      type="password"
                    ></el-input>
                  </el-form-item>
                  <!-- 登录注册按钮 -->
                  <el-form-item class="btns">
                    <el-button type="primary" @click="login">登录</el-button>
                    <el-button type="info" @click="reset">重置</el-button>
                  </el-form-item>
                </el-form>
              </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "login",
  data() {
    return {
      //登录表单数据绑定对象
      loginForm: {
        name: "",
        password: ""
      },
      // 登录表单数据验证规则对象
      rules: {
        name: [
          { required: true, message: "请输入工号/学号", trigger: "blur" },
          { min: 11, max: 11, message: "长度为11个字符", trigger: "blur" }
        ],
        password: [
          { required: true, message: "请输入合法的密码", trigger: "blur" }
        ]
      }
    };
  },
  methods: {
    // 点击重置按钮重置表单
    reset() {
      this.$refs.loginFormRef.resetFields();
    },
    // 点击登录按钮先预校验,校验成功后发起请求,请求成功跳转到首页
    login() {
      let _this = this;
      this.$refs.loginFormRef.validate(valid => {
        // 如果校验失败就返回
        if (!valid) return;
        // 如果校验成功发起请求
        this.$http
          .post("http://localhost/login", this.loginForm)
          .then(function(response) {
            console.log(response.data);
            // 如果状态码为200，代表登录成功，0为失败
            if (response.data.code == "200") {
              // 如果存在该用户,弹出登录成功提示信息
              _this.$message({
                showClose: true,
                message: "登录成功",
                type: "success"
              });
              var userData = JSON.stringify(response.data.data[0]);
              window.sessionStorage.setItem('userData',userData);
              var a1 = response.data.route;
              // 将请求获取到的 路由表 存到 vuex 中
              _this.$store.commit('rolerRouter',a1)
              // console.log(_this.$store.state.routerlist)
              // 跳转到首页
              _this.$router.push('/home');
            }else{
              // 如果不存在该用户,弹出登录失败提示信息
              _this.$message({
                showClose: true,
                message: "请检查您的用户名和密码是否正确",
                type: "error"
              });
              _this.loginForm.name=''
              _this.loginForm.password=''
            }
          })
          .catch(function(error) {
            console.log(error);
          });
      });
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
html,
body {
  width: 100%;
  height: 100%;
}
.login {
  width: 100%;
  height: 100%;
  background-image: url("../assets/img/top-bg.png");
  background-repeat:repeat;
  position: relative;
  overflow: hidden;
}
.login h1 {
  text-align: center;
  color: white;
  font-size: 42px;
  margin-top: 45px;
  letter-spacing: 0.2em;
}
.logo-wrap {
  position: absolute;
  top: 30px;
  left: 30px;
  padding: 6px 0;
  background: rgba(255,255,255,0.7);
  backdrop-filter: blur(3px);
  display: flex;
  justify-content: center;
  align-items: center;
  color: #222;
  line-height: 40px;
  font-size: 28px;
  border-radius: 10px;
  z-index: 100;
}
.logo-wrap .line{
  width: 1px;
  height: 40px;
  background: #888888;
  margin: 0 21px;
}
.bg-wrap{
  display: block;
  margin-top: 200px;
  height: 600px;
  background:url("../assets/img/bg.png") center center no-repeat;
}
.loginBox {
  width: 500px;
  height: 300px;
  border-radius: 10px;
  background: rgba(255, 255, 255, 0.4);
  position: absolute;
  top: 70%;
  left: 50%;
  margin-left: -250px;
  margin-top: -150px;
}
.loginLogo {
  width: 130px;
  height: 130px;
  background: rgba(255, 255, 255, 0.4);
  border-radius: 50%;
  position: absolute;
  top: 0%;
  left: 50%;
  margin-left: -65px;
  margin-top: -65px;
}
.loginLogo img {
  width: 100%;
  height: 100%;
  border-radius: 50%;
}
.btns {
  display: flex;
  justify-content: flex-end;
}
.login_form {
  position: absolute;
  bottom: 0px;
  width: 80%;
  margin-left: 10%;
}
</style>
