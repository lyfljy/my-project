import { createRouter, createWebHistory } from 'vue-router'
import AppLayout from "@/components/layout/AppLayout.vue";
import IndexView from "../views/IndexView.vue";
import { useTokenStore } from '@/stores/mytoken';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      //登录页面不需要验证就可以显示
      path: "/login",
      name: "login",
      component: () => import("@/views/LoginView.vue"),
    },
    {
      //后台管理页面需要登录验证
      path: '/',
      name: '',
      //在AppLayout中挖一个洞，来放IndexView
      component: AppLayout,

      //表示是否需要登录验证：需要
      meta: { requireAuth: true,title:'首页' },
      children: [
        {
          //文件未执行时就导入
          path: '',
          name: 'home',
          component: IndexView,
          meta:{title:'默认页'},
        },
        //将about页面也放在了布局的main的视图中
        {
          path: '/about',
          name: 'about',
          // route level code-splitting
          // this generates a separate chunk (About.[hash].js) for this route
          // which is lazy-loaded when the route is visited.懒加载方式（直接在下面导入），切换到这个地址时，才导入页面
          component: () => import('../views/AboutView.vue'),
          meta:{title:'关于页'},
        },
        {
          path: '/menus',
          name: 'menus',
          component: () => import("@/views/MenuIndex.vue"),
          meta:{title:'菜单列表'},
        },
        {
          path: '/menus/create',
          name: 'menu-create',
          component: () => import("@/views/CreateOrEdit.vue"),
          meta:{title:'创建菜单'},
        },
        {
          path: '/menus/:id/edit',
          name: 'menu-edit',
          component: () => import("@/views/CreateOrEdit.vue"),
          meta:{title:'编辑菜单'},
        },
        {
          path: '/resource-category',
          name: 'resource-category',
          component: () => import('@/views/ResourceCategoryIndex.vue'),
          meta:{title:'资源分类'},
        },
        {
          path: '/resources',
          name: 'resources',
          component: () => import('@/views/ResourcesIndex.vue'),
          meta:{title:'资源列表'},
        },
        {
          path: '/roles',
          name: 'roles',
          component: () => import('@/views/RolesIndex.vue'),
          meta:{title:'角色列表'},
        },
        {
          path: '/roles/:roleId/alloc-menus',
          name: 'alloc-menus',
          component:() => import('@/views/AllocMenus.vue'),
          props: true, //这一行的作用是指，可以把path中的:roleId当作属性去接收
          meta:{title:'分配菜单'},
        },
        {
          path: '/roles/:roleId/alloc-resources',
          name: 'alloc-resources',
          component: () => import('@/views/AllocResources.vue'),
          meta:{title:'分配资源'},
          props: true,
        },
        {
          path: '/users',
          name: 'users',
          component: () => import('@/views/UsersIndex.vue'),
          meta:{title:'用户列表'},
        },
        {
          path: '/courses',
          name: 'courses',
          component: () => import('@/views/CoursesIndex.vue'),
          meta:{title:'课程列表'},
        },
        {
          path: '/course/create',
          name: 'course-create',
          component: ()=> import('@/views/CourseCreateOrEdit.vue'),
          meta:{title:'新建课程'},
        },
        {
          path: '/course/:courseId/edit',
          name: 'course-edit',
          component: () => import('@/views/CourseCreateOrEdit.vue'),
          props: true,
          meta:{title:'编辑课程'},
        },
        {
          path: '/course/:courseId/content',
          name: 'course-content',
          component: () => import('@/views/CourseContent.vue'),
          props: true,
          meta:{title:'菜单章节与课时列表'},
        },
        {
          //path: "/:xxx(.*)*"：这是一个动态路径，其中 :xxx 是参数名，(.*)* 表示匹配零个或多个字符。这样就可以匹配任意路径，例如 /abc、/abc/123 等等。
          //在此处则是，前面的路由匹配不上的，就引发此懒加载
          path: "/:xxx(.*)*",
          name: "ErroPage",
          component: () => import("@/views/ErrorPage.vue")
        }
      ]
    },
  ]
})

/*
  假设目标地址：/aa/bb/cc/dd
  那么matched是一个数组，其中包含：
  /aa
  /aa/bb
  /aa/bb/cc
  /aa/bb/cc/dd
*/

//表示在每一次路由地址变化之前要进行的处理 —— 回调
router.beforeEach((to, from, next) => {
  //some遍历数组，r代表数组中的每一项
  //mata属性可能不存在，所以加上?（不加也不报错，只是严谨）
  //判断语句表示，只要遍历结果有一个为true，则全部为true（需要登录）
  if (to.matched.some(r => r.meta?.requireAuth)) {
    const store = useTokenStore()
    if (!store.token?.access_token) {
      //不存在 access_token 时，跳转到 login，并且将原本要跳转的地址以 query 的形式传递
      next({ name: "login", query: { redirect: to.fullPath } })
      return
    }
  }

  //如果不要求权限，或者存在 acess_token，就按原计划跳转
  next()//调用这个才能继续执行
})

export default router
