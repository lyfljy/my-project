<script setup lang="ts">
import { getRolesWithUserPermission, allocateUserRoles } from '../api/users';
import type { UserRole } from '../api/users'

const dialogFormVisible = ref(false)
const formLabelWidth = '140px'

const form = reactive({
    userId: undefined as number | undefined,
    roleIdList: [] as number[]
})

//保存所有角色信息
const allRoles = ref([] as UserRole[])
//封装显示的方法
const initAndShow = async (userId: number) => {
    dialogFormVisible.value = true
    console.log(userId);
    const { data } = await getRolesWithUserPermission(userId)
    if (data.code === '000000') {
        allRoles.value = data.data
        console.log(data.data);
        form.userId = userId
        form.roleIdList = data.data.filter((r) => r.hasPermission).map((r) => r.id)
    } else {
        ElMessage.error('获取用户的角色信息失败...')
        throw new Error('获取用户的角色信息失败...')
    }
}
//把方法向外暴露
defineExpose({
    initAndShow,
})

//对话框表单提交事件
const onSubmit =async () => {
    const {data} = await allocateUserRoles(form.userId as number,form.roleIdList).finally(() => {
        dialogFormVisible.value = false
    })
    //data.code === '000000'是指发起请求也正确返回了，data.data是指分配成功
    if (data.code === '000000' && data.data) {
        ElMessage.success('给用户分配角色成功！')
    }else{
        ElMessage.error('给用户分配角色失败...')
        throw new Error('给用户分配角色失败...')
    }
}
</script>

<template>
    <el-dialog v-model="dialogFormVisible" title="分配角色">
        <el-form :model="form">
            <el-form-item label="" :label-width="formLabelWidth">
                <el-select v-model="form.roleIdList" multiple placeholder="请选择角色">
                    <el-option v-for="role in allRoles" :key="role.id" :value="role.id" :label="role.name" />
                </el-select>
            </el-form-item>
        </el-form>
        <template #footer>
            <span class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取消</el-button>
                <el-button type="primary" @click="onSubmit">
                    确认
                </el-button>
            </span>
        </template>
    </el-dialog>
</template>

<style lang="scss" scoped></style>
