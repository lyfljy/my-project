<script setup lang="ts">
import { queryCondition, queryUsers, queriedResult } from '../composables/useUsers';
import { timeFormatter } from '../utils/timeHandlers';
import { enableUser, forbidUser } from '../api/users'
import DlgAllocRoles from './DlgAllocRoles.vue';

queryUsers()

//默认用户头像（当用户没有头像时显示的头像）
const circleUrl = 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'

//切换用户状态的事件处理函数
const handleChange = async (act: 'ENABLE' | 'DISABLE', userId: number) => {
    //这里用let的话会有提示：不建议用let
    const actions = {
        ENABLE: { msg: '启用', fn: enableUser },
        DISABLE: { msg: '禁用', fn: forbidUser }
    }
    const { data } = await actions[act].fn(userId)
    if (data.code === '000000') {
        ElMessage.success(`${actions[act].msg}用户成功！`)
    } else {
        ElMessage.error(`${actions[act].msg}用户失败~`)
        throw new Error(`${actions[act].msg}用户失败~`)
    }
}

//时间选取器的时间范围
const timeRange = ref('')
//当时间范围变化时，修改相应的时间条件
watch(timeRange, (newTime) => {
    if (Array.isArray(newTime)) {
        queryCondition.value.startCreateTime = newTime[0].toISOString()
        queryCondition.value.endCreateTime = newTime[1].toISOString()
    } else {
        queryCondition.value.startCreateTime = ''
        queryCondition.value.endCreateTime = ''
    }
})

//创建与引用标识同名的变量
const dlgAllocRoles = ref<InstanceType<typeof DlgAllocRoles> | null>(null)
</script>

<template>
    <el-card class="box-card">
        <template #header>
            <el-form :inline="true" :model="queryCondition" class="demo-form-inline">
                <el-form-item label="手机号">
                    <el-input v-model="queryCondition.phone" placeholder="请输入手机号" clearable />
                </el-form-item>
                <el-form-item label="注册时间">
                    <el-date-picker v-model="timeRange" type="datetimerange" start-placeholder="开始时间"
                        end-placeholder="结束时间" />
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="queryUsers({ currentPage: 1 })">查询</el-button>
                </el-form-item>
            </el-form>
        </template>
        <el-table :data="queriedResult.records" border style="width: 100%">
            <el-table-column prop="id" label="用户ID" width="180" align="center" />
            <el-table-column label="头像" width="180" align="center" v-slot="{ row }">
                <el-avatar :size="50" :src="row.portrait">
                    <img :src="circleUrl" alt="">
                </el-avatar>
            </el-table-column>
            <el-table-column prop="name" label="用户名" align="center" />
            <el-table-column prop="phone" label="手机号" align="center" />
            <el-table-column prop="createTime" label="注册时间" :formatter="timeFormatter" align="center" />
            <el-table-column label="状态" align="center" v-slot="{ row }">
                <el-switch v-model="row.status" class="mb-2" active-value="ENABLE" inactive-value="DISABLE" active-text="启用"
                    inactive-text="禁用" @change="handleChange($event as 'ENABLE' | 'DISABLE', row.id)" />
            </el-table-column>
            <el-table-column label="操作" align="center" v-slot="{row}">
                <el-button type="default" @click="dlgAllocRoles?.initAndShow(row.id)">分配角色</el-button>
            </el-table-column>
        </el-table>

        <el-pagination v-model:current-page="queriedResult.current" v-model:page-size="queriedResult.size"
            :page-sizes="[5, 10, 20, 50]" layout="total, sizes, prev, pager, next, jumper" :total="queriedResult.total || 0"
            @size-change="(size) => queryUsers({ pageSize: size, currentPage: 1 })"
            @current-change="(currentPage) => queryUsers({ currentPage })" />
        <DlgAllocRoles ref="dlgAllocRoles" /> <!--用一个变量来代表这个组件实例-->
    </el-card>
</template>

<style lang="scss" scoped>
.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.text {
    font-size: 14px;
}

.item {
    margin-bottom: 18px;
}

.box-card {
    width: auto;
}

.el-pagination {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}
</style>
