import Vue from 'vue'
import VueRouter from 'vue-router'
import login from '../components/login.vue'
import home from '../components/home.vue'
import welcome from '../components/welcome.vue'
import users from '../components/user/users.vue'
import personal from '../components/grzx/personal.vue'
import buildings from '../components/lygl/buildings.vue'
import dormList from '../components/ssgl/dormList.vue'
import studentsList from '../components/xsgl/studentsList.vue'
import repairReport from '../components/hqfw/repairReport.vue'
import repairList from '../components/hqfw/repairList.vue'
import sspf from '../components/tjzx/sspf.vue'
import bxtj from '../components/tjzx/bxtj.vue'
import BMEvaluation from '../components/tjzx/BMEvaluation.vue'
import myForum from "@/components/xylt/myForum";
import topicDetail from "@/components/xylt/topicDetail";
import forumList from "@/components/xylt/forumList";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect: '/login'
  },
  {
    path: '/login',
    component: login
  },
  {
    path: '/home',
    component: home,
    redirect:'/welcome',
    children:[
      {path:'/welcome',component:welcome},
      {path:'/usersAccess',component:users},
      {path:'/personal',component:personal},
      {path:'/buildings',component:buildings},
      {path:'/dormList',component:dormList},
      {path:'/studentsList',component:studentsList},
      {path:'/repairReport',component:repairReport},
      {path:'/sspf',component:sspf},
      {path:'/bxtj',component:bxtj},
      {path:'/BMEvaluation',component:BMEvaluation},
      {path:'/repairList',component:repairList},
      {path:'/myForum',component: myForum},
      {path:'/topicDetail',component: topicDetail},
      {path:'/forumList',component: forumList}
    ]
  }
]

const router = new VueRouter({
  mode: 'hash',
  base: process.env.BASE_URL,
  routes
})

// 挂载路由导航守卫
router.beforeEach((to,from,next) => {
  if(to.path === '/login') return next();
  // 获取token
  // const tokenStr = window.sessionStorage.getItem('token');
  // if(!tokenStr) return next('/login');
  next();
})

export default router
