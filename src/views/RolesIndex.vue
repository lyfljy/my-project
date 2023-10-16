<script setup lang="ts">
import { queryRoles, queriedResult, queryCondition } from '../composables/useRoles'
import { timeFormatter } from '../utils/timeHandlers';
import DlgRoleCreateOrEdit from './DlgRoleCreateOrEdit.vue';
import { deleteRole } from '../api/roles'

queryRoles()

const dlgCreateOrEdit = ref<InstanceType<typeof DlgRoleCreateOrEdit> | null>()

//删除角色的事件处理
const handleDelete = async (id: number) => {
    await ElMessageBox.confirm('确认要删除吗？', '删除询问', {
        confirmButtonText: '确认',
        cancelButtonText: '取消',
        type: 'warning',
    }).catch(() => {
        ElMessage.success('删除角色动作被取消...')
        return new Promise(() => { })
    })

    //通过接口执行删除操作
    const { data } = await deleteRole(id)
    if (data.code === '000000') {
        ElMessage.success('删除角色成功！')
        queryRoles({ current: 1 })
    } else {
        ElMessage.error('删除角色失败...' + data.mesg)
        throw new Error("删除角色失败..." + data.mesg);

    }
}
</script>

<template>
    <el-card class="box-card">
        <template #header>
            <el-button @click="dlgCreateOrEdit?.initAndShow()">新建角色</el-button>
            <el-form :inline="true" :model="queryCondition" class="demo-form-inline">
                <el-form-item label="输入搜索">
                    <el-input v-model="queryCondition.name" placeholder="角色名称" clearable />
                </el-form-item>
                <el-form-item>
                    <el-button @click="queryCondition.name = ''">重置</el-button>
                    <el-button type="primary" @click="queryRoles({ current: 1 })">查询</el-button>
                </el-form-item>
            </el-form>
        </template>
        <el-table :data="queriedResult.records" border style="width: 100%">
            <el-table-column type="index" label="序号" align="center" width="60" />
            <el-table-column prop="name" label="角色名称" align="center" />
            <el-table-column prop="description" label="描述" align="center" />
            <el-table-column prop="crestedTime" label="添加时间" :formatter="timeFormatter" align="center" />
            <el-table-column label="操作" align="center" width="170" v-slot="{ row }">
                <el-button type="primary" link
                    @click="$router.push({ name: 'alloc-menus', params: { roleId: row.id } })">分配菜单</el-button>
                <el-button type="primary" link @click="$router.push({ name: 'alloc-resources', params: { roleId: row.id } })">分配资源</el-button>
                <el-button type="primary" link @click="dlgCreateOrEdit?.initAndShow(row.id)">编辑</el-button>
                <el-button type="primary" link @click="handleDelete(row.id)">删除</el-button>
            </el-table-column>
        </el-table>

        <el-pagination v-model:current-page="queryCondition.current" v-model:page-size="queryCondition.size"
            :page-sizes="[5, 10, 20, 30]" layout="total,sizes,prev,pager,next,jumper" :total="queriedResult.total"
            @size-change="(size) => { queryRoles({ size, current: 1 }) }"
            @current-change="(current) => { queryRoles({ current }) }" />

        <DlgRoleCreateOrEdit ref="dlgCreateOrEdit" @role-change="queryRoles({ current: 1 })" />
    </el-card>
</template>

<style lang="scss" scoped>
.el-form {
    float: right;
}

.el-table {
    margin-bottom: 17px;
}

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
</style>
