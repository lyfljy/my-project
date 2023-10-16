<script setup lang="ts">
import { getRoleMenus, allocateRoleMenus } from '../api/roles'
import type { RoleMenuItem } from '../api/roles'
import type { ElTree } from 'element-plus'
import { useRouter } from 'vue-router'

const router = useRouter()
//路由中的参数可以当作属性来接收
const props = defineProps({
    roleId: {
        type: String,
        required: true
    }
})
console.log(props.roleId);

//存储数据
const roleMenus = ref<RoleMenuItem[]>([])
//默认被选中的key
const checkedIds = ref<number[]>([])
//获取所有被选中的菜单id
const getCheckedIds = (arrData: RoleMenuItem[]) => {
    arrData.forEach((roleMenu) => {
        if (roleMenu.subMuneList) {
            getCheckedIds(roleMenu.subMuneList)
        } else if (roleMenu.selected) {
            checkedIds.value.push(roleMenu.id)
        }
    })
}
//获取数据的方法
const loadRoleMenus = async () => {
    const { data } = await getRoleMenus(props.roleId)
    if (data.code === '000000') {
        roleMenus.value = data.data
        getCheckedIds(data.data) //获取所有被选中的菜单id
        console.log(data.data);
    } else {
        ElMessage.error('获取角色菜单权限信息失败...')
        throw new Error('获取角色菜单权限信息失败...' + data.mesg)
    }
}
loadRoleMenus()

//创建与引用标识相同的变量名称
const menuTree = ref<InstanceType<typeof ElTree> | null>(null)
//保存更新后的数据
const onSave = async () => {
    //首先获取到当前最新的选项
    const currentCheckedIds:number[] | [] = menuTree.value?.getCheckedKeys() as any
    //把最新的数据（id数组）通过接口发送给服务端
    const { data } =
        await allocateRoleMenus(props.roleId, currentCheckedIds)
    if (data.code === '000000' && data.data) {
        ElMessage.success('更新角色菜单权限成功！')
        router.push({ name: 'roles' })
    } else {
        ElMessage.error('更新角色菜单权限失败...')
        throw new Error('更新角色菜单权限失败...' + data.mesg)
    }
}
//清空所有
const onClear = () => {
    menuTree.value?.setCheckedKeys([])
}
</script>

<template>
    <el-tree ref="menuTree" :data="roleMenus" :props="{ children: 'subMenuList', label: 'name', }" show-checkbox
        default-expand-all node-key="id" :default-checked-keys="checkedIds" />
    <el-button type="primary" @click="onSave">保存</el-button>
    <el-button type="" @click="onClear">清空</el-button>
</template>

<style lang="scss" scoped>
.el-tree {
    margin-bottom: 17px;
}
</style>
