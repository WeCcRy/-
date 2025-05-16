<template>
  <div>
    <!-- 面包屑导航区 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>宿舍管理</el-breadcrumb-item>
      <el-breadcrumb-item>宿舍列表</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- 搜索选项 卡片视图区 -->
    <el-card>
      <el-form label-width="60px">
        <el-row>
          <!-- 楼宇号下拉选框 -->
          <el-col :span="6">
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
          <!-- 要搜索的宿舍号 -->
          <el-col :span="6">
            <el-form-item label="宿舍号">
              <el-input v-model="sushe" placeholder="请输入宿舍号" clearable></el-input>
            </el-form-item>
          </el-col>
          <!-- 搜索按钮 -->
          <el-col :span="6">
            <el-button type="primary" icon="el-icon-search" @click="search">搜索</el-button>
          </el-col>
        </el-row>
      </el-form>
    </el-card>
    <!-- 宿舍详细信息展示区域 -->
    <el-card>
      <el-table
        :data="sslist"
        style="width: 100%"
        max-height="600"
        stripe
        border
        :row-key="getRowKeys"
        :expand-row-keys="expands"
      >
        <!-- @expand-change="expandchange" -->
        <!-- 展开列 -->
        <el-table-column type="expand">
          <template slot-scope="scope">
            <!-- {{scope.row}} -->
            <h3 v-text="lynumber+'  '+scope.row.sushe +'号宿舍人员名单'" style="text-align:center"></h3>
            <!-- 每行展开列表格 -->
            <el-table :data="scope.row.child" stripe border>
              <el-table-column type="index" width="30px"></el-table-column>
              <el-table-column prop="name" label="姓名" width="60px"></el-table-column>
              <el-table-column prop="uname" label="学号"></el-table-column>
              <el-table-column prop="tel" label="电话"></el-table-column>
              <el-table-column prop="fdy" label="辅导员" width="60px"></el-table-column>
              <el-table-column prop="fdytel" label="辅导员电话"></el-table-column>
              <el-table-column prop="xueyuan" label="学院"></el-table-column>
              <el-table-column prop="banji" label="班级"></el-table-column>
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
                  <!-- 删除学生按钮 -->
                  <el-tooltip effect="dark" content="删除" placement="top" :enterable="false">
                    <el-button
                      type="danger"
                      icon="el-icon-delete"
                      size="mini"
                      @click="removelyInfoById(scope.row)"
                    ></el-button>
                  </el-tooltip>
                </template>
              </el-table-column>
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
        <el-table-column prop="dianfei" label="本期电费">
          <template slot-scope="scope">
            <span>{{scope.row.dianfei.dianfei}}</span>
            <el-tag type="danger" v-if="scope.row.dianfei.state==0" style="float: right;cursor: pointer;" @click="dianfeiConfirm(scope.row.dianfei.id)">未缴费</el-tag>
            <el-tag type="success" v-if="scope.row.dianfei.state==1" style="float: right">已缴费</el-tag>
            <el-tag  v-if="scope.row.dianfei.state==2" style="float: right">未查询到数据</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="350px">
          <template slot-scope="scope">
            <!-- 评分按钮 -->
            <el-tooltip effect="dark" content="评分" placement="top" :enterable="false">
              <el-button type="primary" icon="el-icon-edit" size="mini" @click="pf(scope.row.sushe)"></el-button>
            </el-tooltip>
            <!-- 电费按钮 -->
            <el-tooltip effect="dark" content="电费" placement="top" :enterable="false">
              <el-button type="info" icon="el-icon-money" size="mini" @click="df(scope.row.sushe)"></el-button>
            </el-tooltip>
            <!-- 查看按钮 -->
            <el-tooltip effect="dark" content="查看" placement="top" :enterable="false">
              <el-button type="success" icon="el-icon-view" size="mini" @click="rowClik(scope.row)"></el-button>
            </el-tooltip>
            <!-- 添加学生按钮 -->
            <el-tooltip effect="dark" content="分配学生" placement="top" :enterable="false">
              <el-button
                type="warning"
                icon="el-icon-plus"
                size="mini"
                v-if="scope.row.isFull==0 ? true:false"
                @click="addStudent(scope.row.sushe,scope.row.sex,scope.row.lynumber)"
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
        :page-sizes="[1, 4, 8, 16]"
        :page-size="queryInfo.pagesize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
      <!-- 分配学生对话框 -->
      <el-dialog title="分配学生" :visible.sync="addDialogVisible" width="50%" @close="addDialogClosed">
        <!-- 内容主体区 -->
        <el-form :model="addForm" ref="addFormRef" :rules="addFormRules" label-width="100px">
          <el-form-item label="学号" prop="uname">
            <el-input v-model="addForm.uname"></el-input>
          </el-form-item>
        </el-form>
        <!-- 底部按钮区 -->
        <span slot="footer" class="dialog-footer">
          <el-button @click="addDialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="addUser">确 定</el-button>
        </span>
      </el-dialog>
      <!-- 评分的对话框 -->
      <el-dialog title="宿舍评分" :visible.sync="pfDialogVisible" width="50%" @close="pfDialogClosed">
        <!-- 内容主体区 -->
        <el-form :model="pfForm" ref="pfFormRef" label-width="80px" :rules="pfRules">
          <el-form-item label="楼宇号" prop="lynumber">
            <el-input v-model="pfForm.lynumber" disabled></el-input>
          </el-form-item>
          <el-form-item label="宿舍号" prop="sushe">
            <el-input v-model="pfForm.sushe" disabled></el-input>
          </el-form-item>
          <el-form-item label="评分时间" prop="sushe">
            <el-input v-model="pfForm.date" disabled></el-input>
          </el-form-item>
          <el-form-item label="被子" prop="beizi">
            <el-input v-model="pfForm.beizi"></el-input>
          </el-form-item>
          <el-form-item label="桌面" prop="zhuomian">
            <el-input v-model="pfForm.zhuomian"></el-input>
          </el-form-item>
          <el-form-item label="鞋子" prop="xiezi">
            <el-input v-model="pfForm.xiezi"></el-input>
          </el-form-item>
          <el-form-item label="地面" prop="dimian">
            <el-input v-model="pfForm.dimian"></el-input>
          </el-form-item>
          <el-form-item label="阳台" prop="yangtai">
            <el-input v-model="pfForm.yangtai"></el-input>
          </el-form-item>
          <el-form-item label="台盆" prop="taipen">
            <el-input v-model="pfForm.taipen"></el-input>
          </el-form-item>
          <el-form-item label="淋浴房" prop="linyufang">
            <el-input v-model="pfForm.linyufang"></el-input>
          </el-form-item>
          <el-form-item label="卫生间" prop="weishengjian">
            <el-input v-model="pfForm.weishengjian"></el-input>
          </el-form-item>
        </el-form>
        <!-- 底部按钮区 -->
        <span slot="footer" class="dialog-footer">
          <el-button @click="pfDialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="pfAdd">确 定</el-button>
        </span>
      </el-dialog>
      <!-- 电费对话框 -->
      <el-dialog title="电费编辑" :visible.sync="dfDialogVisible" width="50%" @close="dfDialogClosed">
        <!-- 内容主体区 -->
        <el-form :model="dfForm" ref="dfFormRef" label-width="80px">
          <el-form-item label="楼宇号" prop="lynumber">
            <el-input v-model="dfForm.lynumber" disabled></el-input>
          </el-form-item>
          <el-form-item label="宿舍号" prop="sushe">
            <el-input v-model="dfForm.sushe" disabled></el-input>
          </el-form-item>
          <el-form-item label="评分时间" prop="sushe">
            <el-input v-model="dfForm.date" disabled></el-input>
          </el-form-item>
          <el-form-item label="电费" prop="dianfei">
            <el-input v-model="dfForm.dianfei"></el-input>
          </el-form-item>
        </el-form>
        <!-- 底部按钮区 -->
        <span slot="footer" class="dialog-footer">
          <el-button @click="dfDialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="dfAdd">确 定</el-button>
        </span>
      </el-dialog>
      <!-- 编辑学生信息的对话框 -->
      <el-dialog
        title="编辑学生信息"
        :visible.sync="editdialogVisible"
        width="50%"
        @close="editDialogClosed"
      >
        <!-- 内容主体 -->
        <el-form :model="editForm" ref="editFormRef" :rules="editFormRules" label-width="120px">
          <el-form-item label="姓名" prop="name">
            <el-input v-model="editForm.name" disabled></el-input>
          </el-form-item>
          <el-form-item label="学号" prop="uname">
            <el-input v-model="editForm.uname" clearable></el-input>
          </el-form-item>
          <el-form-item label="联系电话" prop="tel">
            <el-input v-model="editForm.tel" clearable></el-input>
          </el-form-item>
          <el-form-item label="辅导员" prop="fdy">
            <el-input v-model="editForm.fdy" clearable></el-input>
          </el-form-item>
          <el-form-item label="辅导员电话" prop="fdytel">
            <el-input v-model="editForm.fdytel" clearable></el-input>
          </el-form-item>
          <el-form-item label="学院" prop="xueyuan">
            <el-input v-model="editForm.xueyuan" clearable></el-input>
          </el-form-item>
          <el-form-item label="班级" prop="banji">
            <el-input v-model="editForm.banji" clearable></el-input>
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
      // 学院列表
      xyList:[],
      // select 选中的楼宇号
      lynumber: "河南1号楼",
      // 要搜索的宿舍号
      sushe: "",
      // 楼宇名字列表
      lyNamelist: [],
      // 楼宇列表
      lylist: [],
      // 宿舍列表
      sslist: [],
      // 展开行列表
      expandlist: [],
      queryInfo: {
        // 当前页数
        pagenum: 1,
        // 当前页每页显示多少条数据
        pagesize: 8
      },
      // 总页数
      total: 7,
      // 要展开的行，数值的元素是row的key值
      expands: [],
      // 控制评分的对话框的显示与隐藏
      pfDialogVisible:false,
      // 控制电费的对话框的显示与隐藏
      dfDialogVisible:false,
      pfForm:{
        lynumber:'',
        sushe:'',
        date:'',
        beizi:'',
        zhuomian:'',
        xiezi:'',
        dimian:'',
        yangtai:'',
        taipen:'',
        linyufang:'',
        weishengjian:'',
      },
      dfForm:{
        lynumber:"",
        sushe:"",
        date:"",
        dianfei:""
      },
      //评分数据验证
      pfRules: {
        beizi: [{ required: true, message: '请输入被子评分', trigger: 'blur' }, { validator: this.validateScore(3), trigger: 'blur' }],
        zhuomian: [{ required: true, message: '请输入桌面评分', trigger: 'blur' }, { validator: this.validateScore(3), trigger: 'blur' }],
        xiezi: [{ required: true, message: '请输入鞋子评分', trigger: 'blur' }, { validator: this.validateScore(3), trigger: 'blur' }],
        dimian: [{ required: true, message: '请输入地面评分', trigger: 'blur' }, { validator: this.validateScore(3), trigger: 'blur' }],
        yangtai: [{ required: true, message: '请输入阳台评分', trigger: 'blur' }, { validator: this.validateScore(2), trigger: 'blur' }],
        taipen: [{ required: true, message: '请输入台盆评分', trigger: 'blur' }, { validator: this.validateScore(2), trigger: 'blur' }],
        linyufang: [{ required: true, message: '请输入淋浴房评分', trigger: 'blur' }, { validator: this.validateScore(2), trigger: 'blur' }],
        weishengjian: [{ required: true, message: '请输入卫生间评分', trigger: 'blur' }, { validator: this.validateScore(2), trigger: 'blur' }]
      },
      // 控制分配学生的对话框的显示与隐藏
      addDialogVisible: false,
      // 分配学生的表单数据
      addForm: {
        uname: "",
        lynumber: "",
        sushe: ""
      },
      // 添加表单的验证规则对象
      addFormRules: {
        uname: [
          { required: true, message: "请输入学生学号", trigger: "blur" },
          { min: 11, max: 11, message: "长度为 11 个字符", trigger: "blur" }
        ],
      },
      // 控制编辑的对话框的显示与隐藏
      editdialogVisible: false,
      // 编辑学生信息的表单数据
      editForm: {
        name: "",
        uname: "",
        tel: "",
        fdy: "",
        fdytel: "",
        xueyuan: "",
        banji: ""
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
  // 生命周期函数
  created() {
    var _this = this;
    // 获取所有学院
    this.$http
        .post("http://localhost/studentsList/xyname")
        .then(function(response) {
          if (response.data.code == 200) {
            _this.xyList = response.data.data;
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
    // 获取河南1号楼的所有宿舍信息
    // this.$http
    //   .post("http://localhost/dormList/search", {
    //     lynumber: this.lynumber,
    //     sushe: this.sushe,
    //     pagenum: this.queryInfo.pagenum,
    //     pagesize: this.queryInfo.pagesize
    //   })
    //   .then(function(response) {
    //     console.log(response.data);
    //     if (response.data.code == 200) {
    //       _this.sslist = response.data.data;
    //       _this.total = response.data.pagetotal;
    //     }
    //   });
    this.search();
  },
  methods: {
    // 获取当前时间
    getTime(){
      const now = new Date();
      const year = now.getFullYear();
      const month = (now.getMonth() + 1).toString().padStart(2, '0');
      const day = now.getDate().toString().padStart(2, '0');
      return year+"-"+month+"-"+day;
    },
    // 点击搜索按钮发起请求
    search() {
      var _this = this;
      // 点击搜索按钮发起请求，得到搜索后的数据
      this.$http
        .post("http://localhost/dormList/search", {
          lynumber: this.lynumber,
          sushe: this.sushe,
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
      console.log(newSize);
      this.queryInfo.pagesize = newSize;
      var _this = this;
      this.$http
        .post("http://localhost/dormList/search", {
          lynumber: this.lynumber,
          sushe: this.sushe,
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
      console.log(newPage);
      this.queryInfo.pagenum = newPage;
      var _this = this;
      this.$http
        .post("http://localhost/dormList/search", {
          lynumber: this.lynumber,
          sushe: this.sushe,
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
    // 查看按钮点击事件展开对应行
    rowClik(row) {
      console.log(row.id);
      if (row.id === this.expands[0]) {
        //点击另一行的时候，把expands清空。即可把上一行给关闭，展开当前点击行
        this.expands = [];
      } else {
        this.expands = [];
        this.expands.push(row.id);
      }
    },
    pf(sushe){
      this.pfForm.lynumber=this.lynumber;
      this.pfForm.sushe=sushe;
      // 更新数据
      this.pfForm.date=this.getTime();
      this.pfDialogVisible = true;
    },
    df(sushe){
      this.dfForm.lynumber=this.lynumber;
      this.dfForm.sushe=sushe;
      this.dfForm.date=this.getTime();
      this.dfDialogVisible = true;
    },
    pfDialogClosed(){
      this.$refs.pfFormRef.resetFields();
    },
    dfDialogClosed(){
      this.$refs.dfFormRef.resetFields();
    },
    validateScore(max) {
      return (rule, value, callback) => {
        if (value > max) {
          callback(new Error('评分不得大于' + max));
        } else {
          callback();
        }
      };
    },
    pfAdd() {
      // 首先进行表单验证
      this.$refs.pfFormRef.validate(valid => {
        if (valid) {
          // 表单验证通过，发送 POST 请求
          this.$http
              .post("http://localhost/dormList/pfAdd", this.pfForm)
              .then(response => {
                if (response.data.code == 200) {
                  this.$notify({
                    title: "成功",
                    message: "评分成功",
                    type: "success"
                  });
                  this.pfDialogVisible = false;
                } else {
                  this.$notify({
                    title: "失败",
                    message: "评分失败",
                    type: "error"
                  });
                  this.pfDialogVisible = false;
                }
              })
              .catch(error => {
                console.error("发生错误：", error);
                this.$notify({
                  title: "错误",
                  message: "发生错误，请重试",
                  type: "error"
                });
              });
        } else {
          // 表单验证失败，不发送请求，显示错误提示
          this.$notify({
            title: "错误",
            message: "请输入正确的评分",
            type: "error"
          });
        }
      });
    },
    dfAdd() {
      this.$http
          .post("http://localhost/dormList/dfAdd", this.dfForm)
          .then(response => {
            if (response.data.code == 200) {
              this.$notify({
                title: "成功",
                message: "添加成功",
                type: "success"
              });
              this.dfDialogVisible = false;
            } else {
              this.$notify({
                title: "失败",
                message: "添加失败",
                type: "error"
              });
              this.dfDialogVisible = false;
            }
          })
          .catch(error => {
            console.error("发生错误：", error);
            this.$notify({
              title: "错误",
              message: "发生错误，请重试",
              type: "error"
            });
          });
    },
    // 分配学生按钮添加事件
    addStudent(sushe, sex, lynumber) {
      this.addForm.sex = sex;
      this.addForm.sushe = sushe;
      this.addForm.lynumber = lynumber;
      this.addDialogVisible = true;
    },
    // 监听分配学生对话框的关闭事件
    addDialogClosed() {
      this.$refs.addFormRef.resetFields();
    },
    // 分配学生对话框确定按钮事件
    addUser() {
      this.$refs.addFormRef.validate(valid => {
        if (!valid) return;
        // 如果预校验成功则发起添加用户请求
        // this.studentlist.unshift(this.addForm);
        var _this = this;
        this.$http
          .post("http://localhost/dormList/adduser", this.addForm)
          .then(function(response) {
            console.log(response.data);
            if (response.data.code == 200) {
              _this.$notify({
                title: "成功",
                message: "分配学生成功",
                type: "success"
              });
              // 如果添加成功，重新获取楼宇宿舍信息
              // 获取河南1号楼的所有宿舍信息
              _this.$http
                .post("http://localhost/dormList/search", {
                  lynumber: _this.lynumber,
                  sushe: _this.sushe,
                  pagenum: _this.queryInfo.pagenum,
                  pagesize: _this.queryInfo.pagesize
                })
                .then(function(response) {
                  console.log(response.data);
                  if (response.data.code == 200) {
                    _this.sslist = response.data.data;
                    _this.total = response.data.pagetotal;
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
    // 根据id删除对应学生信息
    async removelyInfoById(data) {
      console.log(data)
      var _this = this;
      // 弹框询问用户是否删除数据
      const cofirmResult = await this.$confirm(
        "确定将该生移出宿舍么?",
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
        .post("http://localhost/dormList/del", {
          id: data.uname,
          lynumber:data.lynumber,
          sushe:data.sushe
        })
        .then(function(response) {
          console.log(response.data);
          if (response.data.code == 200) {
            _this.$http
              .post("http://localhost/dormList/search", {
                lynumber: _this.lynumber,
                sushe: _this.sushe,
                pagenum: _this.queryInfo.pagenum,
                pagesize: _this.queryInfo.pagesize
              })
              .then(function(response) {
                console.log(response.data);
                if (response.data.code == 200) {
                  _this.sslist = response.data.data;
                  _this.total = response.data.pagetotal;
                }
              });
            return _this.$message({
              showClose: true,
              message: "删除成功",
              type: "success"
            });
          }
        });
      console.log("确认了删除");
    },
    // 监听编辑楼宇信息对话框的关闭事件
    editDialogClosed() {
      this.$refs.editFormRef.resetFields();
    },
    // 编辑楼宇对话框确定按钮事件
    editUserInfo() {
      this.$refs.editFormRef.validate(valid => {
        console.log(valid);
        if (!valid) return;
        // 如果预校验成功则发起修改用户信息的请求
        this.editdialogVisible = false;
      });
    },
    // 点击编辑按钮展示编辑信息对话框
    showEditDialog(user) {
      this.editdialogVisible = true;
      console.log(user);
      // 此处不应该这样渲染，应该根据用户id发起请求，得到用户信息后再渲染
      this.editForm.name = user.name;
      this.editForm.uname = user.uname;
      this.editForm.tel = user.tel;
      this.editForm.fdy = user.fdy;
      this.editForm.fdytel = user.fdytel;
      this.editForm.xueyuan = user.xueyuan;
      this.editForm.banji = user.banji;
      // 根据用户id发起请求，得到用户信息
    },
    dianfeiConfirm(id){
      this.$confirm('您确定该宿舍已缴费么', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        console.log(id);
        this.$http
            .post("http://localhost/dormList/dfConfirm",{id})
            .then((response)=> {
              if (response.data.code == 200) {
                this.$message({
                  type: 'success',
                  message: '确定成功!'
                });
                this.search();
              }
            });
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消确定'
        });
      });
    }
  },
};
</script>

<style lang="css" scoped>
.el-button {
  margin-left: 30px;
}
/*.tableclass{*/
/*  width: 100%;*/
/*  min-height: 600px;*/
/*  overflow: auto;*/
/*}*/
</style>
