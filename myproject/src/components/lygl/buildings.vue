<template>
  <div>
    <!-- 面包屑导航区 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>楼宇管理</el-breadcrumb-item>
      <el-breadcrumb-item>楼宇列表</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- 搜索选项卡片视图区 -->
    <el-card>
      <el-form label-width="60px">
        <el-row>
          <!-- 楼宇号下拉选框 -->
          <el-col :span="8">
            <el-form-item label="楼宇号">
              <el-select v-model="lynumber" placeholder="请选择楼宇号" clearable>
                <el-option
                  v-for="item in lyNamelist"
                  :key="item.id"
                  :label="item.lynumber"
                  :value="item.lynumber"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <!-- 要搜索人的姓名 -->
          <!-- 搜索按钮 -->
          <el-col :span="6">
            <el-button type="primary" icon="el-icon-search" @click="search">搜索</el-button>
          </el-col>
        </el-row>
      </el-form>
    </el-card>
    <!-- 楼宇列表卡片视图区 -->
    <el-card>
      <!-- 列表数据 -->
      <el-table :data="lylist" stripe border>
        <el-table-column type="index"></el-table-column>
        <el-table-column label="楼宇号" prop="lynumber"></el-table-column>
        <el-table-column label="负责人" prop="leader"></el-table-column>
        <el-table-column label="性别" prop="sex"></el-table-column>
        <el-table-column label="联系电话" prop="tel"></el-table-column>
        <el-table-column label="操作" width="200px">
          <template slot-scope="scope">
            <!-- 编辑按钮 -->
            <el-tooltip effect="dark" content="编辑" placement="top" :enterable="false">
              <el-button
                type="warning"
                icon="el-icon-edit"
                size="mini"
                @click="showEditDialog(scope.row)"
              ></el-button>
            </el-tooltip>
            <!-- 删除按钮 -->
            <el-tooltip effect="dark" content="删除" placement="top" :enterable="false">
              <el-button
                type="danger"
                icon="el-icon-delete"
                size="mini"
                @click="removelyInfoById(scope.row.id)"
              ></el-button>
            </el-tooltip>
          </template>
        </el-table-column>
      </el-table>
      <!-- 分页 -->
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="queryInfo.pagenum"
        :page-sizes="[1, 2, 5, 10]"
        :page-size="queryInfo.pagesize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
      <!-- 添加楼宇的对话框 -->
      <el-dialog title="添加楼宇" :visible.sync="addDialogVisible" width="50%" @close="addDialogClosed">
        <!-- 内容主体区 -->
        <el-form :model="addForm" ref="addFormRef" :rules="addFormRules" label-width="80px">
          <el-form-item label="楼宇号" prop="lynumber">
            <el-input v-model="addForm.lynumber"></el-input>
          </el-form-item>
          <el-form-item label="负责人" prop="leader">
            <el-input v-model="addForm.leader"></el-input>
          </el-form-item>
          <el-form-item label="性别" prop="sex">
            <el-select v-model="addForm.sex" placeholder="请选择性别">
              <el-option label="男" value="男"></el-option>
              <el-option label="女" value="女"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="联系电话" prop="tel">
            <el-input v-model="addForm.tel"></el-input>
          </el-form-item>
        </el-form>
        <!-- 底部按钮区 -->
        <span slot="footer" class="dialog-footer">
          <el-button @click="addDialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="addUser">确 定</el-button>
        </span>
      </el-dialog>
      <!-- 查看/编辑楼宇信息的对话框 -->
      <el-dialog
        title="查看/编辑楼宇详细信息"
        :visible.sync="editdialogVisible"
        width="50%"
        @close="editDialogClosed"
      >
        <!-- 内容主体 -->
        <el-form :model="editForm" ref="editFormRef" :rules="editFormRules" label-width="120px">
          <el-form-item label="楼宇号" prop="lynumber">
            <el-input v-model="editForm.lynumber" disabled></el-input>
          </el-form-item>
          <el-form-item label="楼宇负责人" prop="leader">
            <el-input v-model="editForm.leader" clearable></el-input>
          </el-form-item>
          <el-form-item label="性别" prop="sex">
            <el-input v-model="editForm.sex" clearable></el-input>
          </el-form-item>
          <el-form-item label="联系电话" prop="tel">
            <el-input v-model="editForm.tel" clearable></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="editdialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="editUserInfo">确 定</el-button>
        </span>
      </el-dialog>
    </el-card>
  </div>
</template>

<script>
export default {
  data() {
    // 添加手机号的验证规则
    var checkPhone = (rule, value, cb) => {
      // 验证手机号的正则表达式
      // const regPhone = /^(0|86|17951)?(13[0-9]|15[0123456789]|17[678]|18[0-9]|14[57])[0-9]{8}$/
      const regPhone = /^[1][3,4,5,7,8][0-9]{9}$/;
      if (regPhone.test(value)) {
        return cb();
      }
      cb(new Error("请输入合法的手机号"));
    };
    return {
      // 楼宇全部信息列表
      lylist: [],
      // 楼宇名字列表
      lyNamelist: [],
      // select 选中的楼宇号
      lynumber: "",
      // 要搜索人的姓名
      userName: "",
      queryInfo: {
        // 搜索关键字
        query: "",
        // 当前页数
        pagenum: 1,
        // 当前页每页显示多少条数据
        pagesize: 5
      },
      // 总页数
      total: 0,
      // 控制添加楼宇的对话框的显示与隐藏
      addDialogVisible: false,
      // 添加楼宇的表单数据
      addForm: {
        lynumber: "",
        leader: "",
        sex: "",
        tel: ""
      },
      addexl:[],
      // 添加表单的验证规则对象
      addFormRules: {
        lynumber: [
          { required: true, message: "请输入楼宇号", trigger: "blur" }
        ],
        leader: [
          { required: true, message: "请输入负责人姓名", trigger: "blur" }
        ],
        sex: [{ required: true, message: "请选择性别", trigger: "blur" }],
        tel: [
          { required: true, message: "请输入联系电话", trigger: "blur" },
          { validator: checkPhone, trigger: "blur" }
        ]
      },
      // 控制编辑的对话框的显示与隐藏
      editdialogVisible: false,
      // 编辑楼宇的表单数据
      editForm: {
        id: "",
        lynumber: "",
        leader: "",
        sex: "",
        tel: ""
      },
      // 编辑表单的验证规则对象
      editFormRules: {
        leader: [
          { required: true, message: "请输入负责人姓名", trigger: "blur" }
        ],
        tel: [
          { required: true, message: "请输入联系电话", trigger: "blur" },
          { validator: checkPhone, trigger: "blur" }
        ]
      }
    };
  },
  methods: {
    // 监听pageSize每页显示多少条数据改变的事件
    handleSizeChange(newSize) {
      console.log(newSize);
      this.queryInfo.pagesize = newSize;
      var _this = this;
      this.$http
        .post("http://localhost/buildings", {
          pagenum: this.queryInfo.pagenum,
          pagesize: newSize
        })
        .then(function(response) {
          console.log(response.data);
          if (response.data.code == 200) {
            _this.lylist = response.data.data;
            _this.total = response.data.total;
          }
        });
    },
    // 监听页码值改变的事件
    handleCurrentChange(newPage) {
      // console.log(newPage);
      this.queryInfo.pagenum = newPage;
      var _this = this;
      this.$http
        .post("http://localhost/buildings", {
          pagenum: newPage,
          pagesize: this.queryInfo.pagesize
        })
        .then(function(response) {
          console.log(response.data);
          if (response.data.code == 200) {
            _this.lylist = response.data.data;
            _this.total = response.data.total;
          }
        });
    },
    // 监听楼宇对话框的关闭事件
    addDialogClosed() {
      this.$refs.addFormRef.resetFields();
    },
    // 添加楼宇对话框确定按钮事件
    addUser() {
      var _this = this;
      this.$refs.addFormRef.validate(valid => {
        console.log(valid);
        if (!valid) return;
        // 如果预校验成功则发起添加用户请求
        this.$http
          .post("http://localhost/buildings/add", this.addForm)
          .then(function(response) {
            console.log(response.data);
            if (response.data.code == 200) {
              _this.$notify({
                title: "成功",
                message: response.data.msg,
                type: "success"
              });
              // 添加成功后重新获取数据
              _this.$http
                .post("http://localhost/buildings", _this.queryInfo)
                .then(function(response) {
                  console.log(response.data);
                  if (response.data.code == 200) {
                    _this.lylist = response.data.data;
                    _this.total = response.data.total;
                  }
                });
              _this.addDialogVisible = false;
            } else {
              _this.$notify({
                title: "失败",
                message: response.data.msg,
                type: "error"
              });
              _this.addDialogVisible = false;
            }
          });
      });
    },
    // 点击编辑按钮展示编辑信息对话框
    showEditDialog(user) {
      var _this = this;
      this.editdialogVisible = true;
      console.log(user);
      // 根据用户id发起请求，得到用户信息
      this.$http
        .post("http://localhost/buildings/show", { id: user.id })
        .then(function(response) {
          console.log(response.data);
          _this.editForm = response.data.data[0];
        });
    },

    // 编辑楼宇对话框确定按钮事件
    editUserInfo() {
      var _this = this;
      this.$refs.editFormRef.validate(valid => {
        console.log(valid);
        if (!valid) return;
        // 如果预校验成功则发起修改用户信息的请求
        this.$http
          .post("http://localhost/buildings/edit", this.editForm)
          .then(function(response) {
            console.log(response.data);
            if (response.data.code == 200) {
              _this.$message({
                showClose: true,
                message: "更新数据成功",
                type: "success"
              });
            }
            if (response.data.code == 100) {
              _this.$message({
                showClose: true,
                message: "与原数据一致",
                type: "info"
              });
            }
            if (response.data.code == 0) {
              _this.$message({
                showClose: true,
                message: "更新数据失败",
                type: "error"
              });
            }
          });
        this.editdialogVisible = false;
      });
    },

    // 监听编辑楼宇信息对话框的关闭事件
    editDialogClosed() {
      // this.$refs.editFormRef.resetFields();
    },

    // 根据id删除对应楼宇信息
    async removelyInfoById(id) {
      // console.log(id);
      var _this = this;
      var _thisPost = this.$http;
      // 弹框询问用户是否删除数据
      const cofirmResult = await this.$confirm(
        "此操作将永久删除该楼宇信息, 是否继续?",
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
          message: "已取消删除",
          type: "info"
        });
      }
      // 如果点击了确认按钮则发起请求删除对应数据
      this.$http
        .post("http://localhost/buildings/delete", {
          id: id,
          pagenum: this.queryInfo.pagenum,
          pagesize: this.queryInfo.pagesize
        })
        .then(function(response) {
          console.log(response.data);
          if (response.data.code == 200) {
            _this.lylist = response.data.newResult;
            _this.total = response.data.total;
            _this.$message({
              showClose: true,
              message: "已删除该楼宇信息",
              type: "error"
            });

            // 删除完再次获取楼宇下拉选择框的全部楼宇的名字
            _thisPost
              .post("http://localhost/buildings/lyname")
              .then(function(response) {
                console.log(response.data);
                if (response.data.code == 200) {
                  _this.lyNamelist = response.data.data;
                }
              });
          }
        });
    },
    // 监听搜索按钮事件
    search() {
      var _this = this;
      // 点击搜索按钮发起请求，得到搜索后的数据
      this.$http
        .post("http://localhost/buildings/search", {
          lynumber: this.lynumber,
          userName: this.userName
        })
        .then(function(response) {
          console.log(response.data);
          if (response.data.code == 200) {
            _this.lylist = response.data.data;
            _this.total=1;
          } else {
            _this.$notify({
              title: "警告",
              message: "抱歉，没有找到任何信息，您可以重新尝试一下",
              type: "warning"
            });
          }
        });
    }
  },
  created() {
    var _this = this;
    // 进入页面发起请求，得到楼宇列表的信息
    this.$http
      .post("http://localhost/buildings", this.queryInfo)
      .then(function(response) {
        console.log(response.data);
        if (response.data.code == 200) {
          _this.lylist = response.data.data;
          _this.total = response.data.total;
        }
      });
    // 获取楼宇下拉选择框的全部楼宇的名字
    this.$http
      .post("http://localhost/buildings/lyname")
      .then(function(response) {
        console.log(response.data);
        if (response.data.code == 200) {
          _this.lyNamelist = response.data.data;
        }
      });
  }
};
</script>

<style lang="css" scoped>
.el-button {
  margin-left: 30px;
}
.cardBg {
  background: red;
}
</style>
