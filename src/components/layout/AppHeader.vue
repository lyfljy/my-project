<script setup lang="ts">
import { isCollapse } from "./isCollapse";
import { getInfo, logout } from "../../api/users";
import { useTokenStore } from "../../stores/mytoken";
import { useRouter } from "vue-router";

const router = useRouter()

//显示用户信息
//先给默认值在页面显示
const userInfo = ref({ portrait: "", userName: "" })
//异步请求，把新的数据传给响应式的变量，得以显示
getInfo().then((res) => {
    userInfo.value = res.data.content
})

//退出事件处理
const handleLogout = async () => {
    //1、询问，确认是要退出吗
    await ElMessageBox.confirm("确认要退出码？", "退出询问", {
        confirmButtonText: "确认",
        cancelButtonText: "取消",
        type: 'warning'
    }).catch(() => {
        ElMessage.info("取消退出操作")
        //返回一个不是失败也不是成功的promise，能防止继续向下执行
        return new Promise(() => { })
    })
    //2、执行退出
    await logout().catch(() => { })
    ElMessage.success("用户成功退出！")
    //3、清空token，跳转到login
    useTokenStore().saveToken("")
    router.push({ name: "login" })
}
</script>

<template>
    <el-header>
        <!--图标-->
        <el-icon @click="isCollapse = !isCollapse">
            <IEpExpand v-show="isCollapse" />
            <IEpFold v-show="!isCollapse" />
        </el-icon>

        <!--面包屑-->
        <el-breadcrumb separator="/">
            <el-breadcrumb-item v-for="(item,index) in $route.matched" :key="index" :to="{ path: item.path }">{{ item.meta.title }}</el-breadcrumb-item>
        </el-breadcrumb>

        <!--下拉菜单-->
        <el-dropdown>
            <span class="el-dropdown-link">
                <el-avatar :size="40" :src="userInfo.portrait" />
                <el-icon class="el-icon--right">
                    <i-ep-arrow-down />
                </el-icon>
            </span>
            <template #dropdown>
                <el-dropdown-menu>
                    <el-dropdown-item>{{ userInfo.userName }}</el-dropdown-item>
                    <el-dropdown-item divided @click="handleLogout">退出</el-dropdown-item>
                </el-dropdown-menu>
            </template>
        </el-dropdown>
    </el-header>
</template>

<style lang="scss" scoped>
.el-header {
    display: flex;
    align-items: center; //垂直居中
    background-color: #dedfe0;

    .el-icon {
        margin-right: 10px;
    }
}

.el-dropdown {
    margin-left: auto;

    .el-dropdown-link {
        display: flex;
        justify-content: center;
        align-items: center;
    }
}
</style>
