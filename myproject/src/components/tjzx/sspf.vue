<template>
  <div>
    <!-- 面包屑导航区 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>统计中心</el-breadcrumb-item>
      <el-breadcrumb-item>宿舍评分</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- 卡片视图区 -->
    <el-card>
      <!-- 查找板块 -->
      <el-form :model="searchForm" ref="addFormRef" label-width="60px" style="margin-bottom: 10px;" empty-text="查询数据为空">
        <el-row>
          <el-col :span="5">
            <el-form-item label="楼宇号" prop="lyNumber">
              <el-select v-model="searchForm.lyNumber" placeholder="请选择楼宇号" clearable>
                <el-option
                    v-for="item in lyNamelist"
                    :key="item.id"
                    :label="item.lynumber"
                    :value="item.lynumber"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="5">
            <el-form-item label="宿舍号" prop="sushe">
              <el-input v-model="searchForm.sushe" placeholder="请输入宿舍号" clearable></el-input>
            </el-form-item>
          </el-col>
<!--          <el-col :span="4">-->
<!--            <el-date-picker-->
<!--                v-model="value1"-->
<!--                type="date"-->
<!--                placeholder="选择日期">-->
<!--            </el-date-picker>-->
<!--          </el-col>-->
          <el-col :span="4">
             <el-button type="primary" icon="el-icon-search" @click="search">查询</el-button>
          </el-col>
        </el-row>
      </el-form>
      <!-- 标签页 -->
      <el-tabs type="border-card">
        <el-tab-pane label="数据表展示">
          <!-- 数据列表 -->
          <el-table
            :data="datalist"
            stripe
            border
            height="380px"
            :default-sort="{prop: 'time',prop: 'total', order: 'descending'}"
          >
            <el-table-column label="楼宇号" prop="lynumber" width="90px"></el-table-column>
            <el-table-column label="宿舍号" prop="sushe" width="60px"></el-table-column>
            <el-table-column label="时间" prop="time" sortable width="110px"></el-table-column>
            <el-table-column label="被子" prop="beizi" sortable width="110px"></el-table-column>
            <el-table-column label="桌面" prop="zhuomian" sortable width="110px"></el-table-column>
            <el-table-column label="鞋子" prop="xiezi" sortable width="110px"></el-table-column>
            <el-table-column label="地面" prop="dimian" sortable width="110px"></el-table-column>
            <el-table-column label="阳台" prop="yangtai" sortable width="110px"></el-table-column>
            <el-table-column label="台盆" prop="taipen" sortable width="110px"></el-table-column>
            <el-table-column label="淋浴房" prop="linyufang" sortable width="110px"></el-table-column>
            <el-table-column label="卫生间" prop="weishengjian" sortable width="110px"></el-table-column>
            <el-table-column label="总分（分）" prop="total" sortable width="110px"></el-table-column>
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
        </el-tab-pane>
        <el-tab-pane label="统计图展示" name="second">
          <!-- 数据统计图 -->
          <div id="myChart"></div>
        </el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>

<script>
export default {
  data() {
    return {
      lyNamelist:[],
      value1: '',
      // 宿舍评分查询表单数据
      searchForm: {
        lyNumber: "",
        sushe: "",
      },
      // 数据列表
      datalist: [],
      queryInfo: {
        // 当前页数
        pagenum: 1,
        // 当前页每页显示多少条数据
        pagesize: 5
      },
      // 宿舍号
      sushe: [],
      beizi:[],
      zhuomian:[],
      xiezi:[],
      dimian:[],
      yangtai:[],
      taipen:[],
      linyufang:[],
      weishengjian:[],
      // 总页数
      total: 0,
      // 默认展示的标签页
      activeName: "second"
    };
  },
  created() {
    this.oneQuest();
    var _this=this;
    this.$http
        .post("http://localhost/buildings/lyname")
        .then(function(response) {
          console.log(response.data);
          if (response.data.code == 200) {
            _this.lyNamelist = response.data.data;
          }
        });
  },
  methods: {
    // 封装页面加载请求函数
    oneQuest() {
      var _this = this;
      this.$http
        .post("http://localhost/sspf/search", {
          lynumber: _this.searchForm.lyNumber,
          sushe: _this.searchForm.sushe,
          pagenum: _this.queryInfo.pagenum,
          pagesize: _this.queryInfo.pagesize
        })
        .then(function(response) {
          console.log(response.data);
          if (response.data.code == 200) {
            _this.datalist = response.data.data;
            _this.total = response.data.total;
            _this.sushe = response.data.ssh;
            _this.beizi = response.data.beizi;
            _this.zhuomian = response.data.zhuomian;
            _this.xiezi = response.data.xiezi;
            _this.dimain = response.data.dimain;
            _this.yangtai = response.data.yangtai;
            _this.taipen = response.data.taipen;
            _this.linyufang = response.data.linyufang;
            _this.weishengjian = response.data.weishengjian;
            // 渲染 echarts 统计图
            _this.drawColumn();
          }else{
            // 数据置空
            _this.datalist = [];
            _this.total = [];
            _this.sushe = [];
            _this.beizi = [];
            _this.zhuomian = [];
            _this.xiezi = [];
            _this.dimain = [];
            _this.yangtai = [];
            _this.taipen = [];
            _this.linyufang = [];
            _this.weishengjian = [];
          }
        });
    },
    // 搜索按钮事件
    search(){
      this.oneQuest();
    },
    // 监听pageSize改变的事件
    handleSizeChange(newSize) {
      console.log(newSize);
      this.queryInfo.pagesize = newSize;
      this.oneQuest();
    },
    // 监听页码值改变的事件
    handleCurrentChange(newPage) {
      console.log(newPage);
      this.queryInfo.pagenum = newPage;
      this.oneQuest();
    },

    // echarts图表
    drawColumn() {
      console.log(this.sushe);
      console.log("------------")
      let myChart = this.$echarts.init(document.getElementById("myChart"));
      var option = {
        title: {
          text: "宿舍评分各项数据统计图",
          left: "center",
          top: "auto"
        },
        tooltip: {
          trigger: "axis",
          axisPointer: {
            type: "cross",
            crossStyle: {
              color: "#999"
            }
          }
        },
        toolbox: {
          feature: {
            dataView: { show: true, readOnly: false },
            magicType: { show: true, type: ["line", "bar"] },
            restore: { show: true },
            saveAsImage: { show: true }
          }
        },
        legend: {
          data: ["被子", "桌面", "鞋子","地面","阳台","台盆","淋浴房","卫生间"],
          top: "30px"
        },
        xAxis: [
          {
            type: "category",
            name: "宿舍号",
            data: this.sushe,
            axisPointer: {
              type: "shadow",
            }
          }
        ],
        yAxis: [
          {
            type: "value",
            // name: "被子",
            min: 0,
            max: 3,
            interval: 1,
            axisLabel: {
              formatter: "{value} 分"
            }
          },
          {
            type: "value",
            // name: "桌面",
            min: 0,
            max: 3,
            interval: 1,
            axisLabel: {
              formatter: "{value} 分"
            }
          },
          {
            type: "value",
            // name: "鞋子",
            min: 0,
            max: 3,
            interval: 1,
            axisLabel: {
              formatter: "{value} 分"
            }
          },
          {
            type: "value",
            // name: "地面",
            min: 0,
            max: 3,
            interval: 1,
            axisLabel: {
              formatter: "{value} 分"
            }
          },
          {
            type: "value",
            // name: "阳台",
            min: 0,
            max: 2,
            interval: 1,
            axisLabel: {
              formatter: "{value} 分"
            }
          },
          {
            type: "value",
            // name: "台盆",
            min: 0,
            max: 2,
            interval: 1,
            axisLabel: {
              formatter: "{value} 分"
            }
          },
          {
            type: "value",
            // name: "淋浴房",
            min: 0,
            max: 2,
            interval: 1,
            axisLabel: {
              formatter: "{value} 分"
            }
          },
          {
            type: "value",
            // name: "卫生间",
            min: 0,
            max: 2,
            interval: 1,
            axisLabel: {
              formatter: "{value} 分"
            }
          },
        ],
        series: [
          {
            name: "被子",
            type: "bar",
            data: this.beizi
          },
          {
            name: "桌面",
            type: "bar",
            data: this.zhuomian
          },
          {
            name: "鞋子",
            type: "bar",
            data: this.xiezi
          },
          {
            name: "地面",
            type: "bar",
            data: this.dimian
          },
          {
            name: "阳台",
            type: "bar",
            data: this.yangtai
          },
          {
            name: "台盆",
            type: "bar",
            data: this.taipen
          },
          {
            name: "淋浴房",
            type: "bar",
            data: this.linyufang
          },
          {
            name: "卫生间",
            type: "bar",
            data: this.weishengjian
          },
        ]
      };
      myChart.setOption(option);
    }
  }
};
</script>

<style lang="css" scoped>
.el-button {
  margin-left: 20px;
}
#myChart {
  width: 950px;
  height: 450px;
}
</style>
