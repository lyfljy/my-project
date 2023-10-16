<script setup lang="ts">
import { isCollapse } from './isCollapse'
</script>

<template>
    <el-aside>

        <el-scrollbar>
            <!--想要点击子列表的每一项，能够跳转到对应页面，则要加上router-->
            <!--还可以加上属性 unique-opened 无需赋值，表示同一时间子列表只能有一个为下拉状态-->
            <!--动态绑定collapse属性，表示侧边栏折叠或不折叠的状态-->
            <el-menu router :collapse="isCollapse"> 
            <a href="/" class="logo">
                <img src="@/assets/logo.svg" alt="">
                <h1>李元芳</h1>
            </a>

            <!--子菜单-->
            <el-sub-menu index="1">
                <template #title>
                    <el-icon> <IEpLock /></el-icon> <span>权限管理</span>
                </template>
                <el-menu-item index="/menus">
                    <el-icon> <IEpDocument /></el-icon> <span>菜单列表</span>
                </el-menu-item>
                <el-menu-item index="/resources">
                    <el-icon> <IEpCollection /></el-icon> <span>资源列表</span>
                </el-menu-item>
                <el-menu-item index="/roles">
                    <el-icon> <IEpAvatar /></el-icon> <span>角色列表</span>
                </el-menu-item>
            </el-sub-menu>

            <el-menu-item index="users">
                <el-icon> <IEpUser /></el-icon> <span>用户管理</span>
            </el-menu-item>

            <el-menu-item index="/courses">
                <el-icon> <IEpMemo /></el-icon> <span>课程管理</span>
            </el-menu-item>

            <el-sub-menu index="2">
                <template #title>
                    <el-icon> <IEpVideoCamera /></el-icon> <span>广告管理</span>
                </template>
                <el-menu-item index="/advertisement">
                    <el-icon> <IEpFilm /></el-icon> <span>广告列表</span>
                </el-menu-item>
                <el-menu-item index="/advertising-space">
                    <el-icon> <IEpGuide /></el-icon> <span>广告位管理</span>
                </el-menu-item>
            </el-sub-menu>
            </el-menu>
        </el-scrollbar>
    </el-aside>
</template>

<!-- 这里的lang="scss"很关键 -->
<style lang="scss" scoped>
    .el-aside{
        background-color: #e9e9eb;
        height: 100vh;
        width: auto;
    }
    .el-menu{
        background-color: #e9e9eb;
        border-right: none;
        width: 200px;
        white-space: nowrap;
        &.el-menu--collapse{
            width: 60px;
            &.el-menu--collapse h1{
                display: none;
            }
        }
    }
    .logo{
        display: flex;
        justify-content: center;
        align-items: center;
        height: 60px;
        text-decoration: none;
        color: black;
        img{
            width: 32px;
            height: 32px;
        }
    }
</style>
