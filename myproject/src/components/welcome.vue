<template>
  <div>
    <el-card>
      <div class="logo">
        <img src="../assets/img/SSPUbadge.png" alt="logo" />
        <h1>厚生、厚德、厚技</h1>
      </div>
      <!-- 轮播图 -->
      <el-carousel height="400px" type="card" :interval="2000">
        <el-carousel-item>
          <img src="../assets/img/home.png" alt />
        </el-carousel-item>
        <el-carousel-item>
          <img src="../assets/img/home2.png" alt />
        </el-carousel-item>
        <el-carousel-item>
          <img src="../assets/img/home3.png" alt />
        </el-carousel-item>
      </el-carousel>
      <h2 class="welcome">欢迎您！使用上海第二工业大学宿舍管理系统</h2>
    </el-card>
    <el-dialog title="入住登记" :visible.sync="DialogVisible" width="50%" @close="DialogVisible=false" :show-close="false" :close-on-press-escape="false" :close-on-click-modal="false">
      <!-- 内容主体区 -->
      <div style="font-weight: bold;font-size: 26px">
        <div>你好，来自<span class="keyword">{{userData.banji}}</span>的同学<span class="keyword">{{userData.name}}</span>，您的学号为<span class="keyword">{{userData.uname}}</span></div>
        给您分配的楼宇号为<span class="keyword">{{userData.lynumber}}</span>，请挑选宿舍号
      </div>
      <!-- 分配宿舍 -->
      <el-table
          :data="sslist"
          style="width: 100%"
          stripe
          border
          :row-key="getRowKeys">
<!--          :expand-row-keys="expands"-->
        <!-- @expand-change="expandchange" -->
        <!-- 展开列 -->
        <el-table-column type="expand">
          <template slot-scope="scope">
            <!-- {{scope.row}} -->
            <h3 v-text="lynumber+'  '+scope.row.sushe +'号宿舍人员名单'" style="text-align:center"></h3>
            <el-table :data="scope.row.child" stripe border>
              <el-table-column type="index" width="30px"></el-table-column>
              <el-table-column prop="name" label="姓名" width="60px"></el-table-column>
              <el-table-column prop="uname" label="学号"></el-table-column>
              <el-table-column prop="tel" label="电话"></el-table-column>
              <el-table-column prop="fdy" label="辅导员" width="60px"></el-table-column>
              <el-table-column prop="fdytel" label="辅导员电话"></el-table-column>
              <el-table-column prop="xueyuan" label="学院"></el-table-column>
              <el-table-column prop="banji" label="班级"></el-table-column>
            </el-table>
          </template>
        </el-table-column>
        <el-table-column prop="sushe" label="宿舍号"></el-table-column>
        <el-table-column prop="members" label="宿舍成员"></el-table-column>
        <el-table-column prop="member" label="状态">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.isFull==0">未满</el-tag>
            <el-tag type="danger" v-else>已满</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="350px">
          <template slot-scope="scope">
            <!-- 添加学生按钮 -->
            <el-tooltip effect="dark" content="分配" placement="top" :enterable="false" >
              <el-button
                  type="warning"
                  icon="el-icon-plus"
                  size="mini"
                  @click="allocateUser(scope.row.sushe)"
                  v-if="scope.row.isFull==0 ? true:false">
<!--                  @click="addStudent(scope.row.sushe,scope.row.sex,scope.row.lynumber)"-->
              </el-button>
            </el-tooltip>
          </template>
        </el-table-column>
      </el-table>
      <!-- 分页 -->
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="queryInfo.pagenum"
          :page-sizes="[1, 4, 8, 16]"
          :page-size="queryInfo.pagesize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
      ></el-pagination>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      sslist:[],
      total:0,
      lynumber:'',
      queryInfo:{
        pagenum:1,
        pagesize:8,
      },
      userData:{},
      DialogVisible:false
    };
  },
  methods: {
    // 点击搜索按钮发起请求
    search() {
      var _this = this;
      // 点击搜索按钮发起请求，得到搜索后的数据
      this.$http
          .post("http://localhost/dormList/search", {
            lynumber: this.userData.lynumber,
            pagenum: this.queryInfo.pagenum,
            pagesize: this.queryInfo.pagesize
          })
          .then(function(response) {
            console.log(response.data);
            if (response.data.code == 200) {
              _this.sslist = response.data.data;
              _this.total = response.data.pagetotal;
            } else {
              _this.$notify({
                title: "警告",
                message: "抱歉，没有找到任何信息，您可以重新尝试一下",
                type: "warning"
              });
            }
          });
    },
    // 监听pageSize改变的事件
    handleSizeChange(newSize) {
      this.queryInfo.pagesize = newSize;
      var _this = this;
      this.$http
          .post("http://localhost/dormList/search", {
            lynumber: this.userData.lynumber,
            sushe: this.userData.sushe,
            pagenum: this.queryInfo.pagenum,
            pagesize: newSize
          })
          .then(function(response) {
            console.log(response.data);
            if (response.data.code == 200) {
              _this.sslist = response.data.data;
              _this.total = response.data.pagetotal;
            }
          });
    },
    // 监听页码值改变的事件
    handleCurrentChange(newPage) {
      this.queryInfo.pagenum = newPage;
      var _this = this;
      this.$http
          .post("http://localhost/dormList/search", {
            lynumber: this.userData.lynumber,
            sushe: this.userData.sushe,
            pagenum: newPage,
            pagesize: this.queryInfo.pagesize
          })
          .then(function(response) {
            console.log(response.data);
            if (response.data.code == 200) {
              _this.sslist = response.data.data;
              _this.total = response.data.pagetotal;
            }
          });
    },
    //获取row的key值
    getRowKeys(row) {
      return row.id;
    },
    // 分配宿舍
    async allocateUser(sushe){
      var _this = this;
      // 弹框询问用户是否删除数据
      const cofirmResult = await this.$confirm(
          "确定将选择该宿舍么?",
          "提示",
          {
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            type: "warning"
          }
      ).catch(err => err);
      // 如果用户确认删除，则返回字符串 confirm
      // 如果取消删除，则返回字符串 cancel
      // console.log(cofirmResult)
      if (cofirmResult !== "confirm") {
        return this.$message({
          showClose: true,
          message: "已取消分配",
          type: "info"
        });
      }
      this.$http
          .post("http://localhost/dormList/addUser", {
            uname: this.userData.uname,
            lynumber:this.userData.lynumber,
            sushe
          })
          .then(function(response) {
            console.log(response.data);
            if (response.data.code == 200) {
              _this.$http
                  .post("http://localhost/login", {
                    name: _this.userData.uname,
                    password: _this.userData.pass,
                  })
                  .then(function(response) {
                    // 如果状态码为200，代表登录成功，0为失败
                    if (response.data.code == "200") {
                      _this.DialogVisible=false;
                      // 如果存在该用户,弹出登录成功提示信息
                      _this.$message({
                        showClose: true,
                        message: "分配成功",
                        type: "success"
                      });
                      var userData = JSON.stringify(response.data.data[0]);
                      window.sessionStorage.setItem('userData',userData);
                      var a1 = response.data.route;
                      // 将请求获取到的 路由表 存到 vuex 中
                      _this.$store.commit('rolerRouter',a1)
                      // 跳转到首页
                      _this.$router.push('/home');
                    }
                  })
            }
          });
      console.log("确认了删除");
    }
  },
  created() {
    const value = window.sessionStorage.getItem('userData');
    this.$data.userData = JSON.parse(value); // 将字符串解析成 JSON 对象
    if(this.$data.userData.roler==2&&!this.$data.userData.sushe){
      this.$data.DialogVisible=true;
    }
    var _this=this;
    // 获取河南1号楼的所有宿舍信息
    this.$http
        .post("http://localhost/dormList/search", {
          lynumber: this.userData.lynumber,
          sushe:'',
          pagenum: this.queryInfo.pagenum,
          pagesize: this.queryInfo.pagesize
        })
        .then(function(response) {
          console.log(response.data);
          if (response.data.code == 200) {
            _this.sslist = response.data.data;
            _this.total = response.data.pagetotal;
          }
        });
  }
};
</script>

<style lang="css" scoped>
.el-carousel__item img {
  height: 100%;
  width: 100%;
}
.welcome {
  text-align: center;
  margin: 40px 0px;
}
.logo {
  height: 60px;
  display: flex;
  align-items: center;
  margin-bottom: 20px;
  text-align: center;
}
.logo img {
  height: 100%;
}
.logo h1 {
  display: inline-block;
  margin-left: 20px;
}
.keyword{
  color: red;
}
</style>
