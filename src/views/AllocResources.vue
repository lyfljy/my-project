<script setup lang="ts">
import { getRoleResources, allocateRoleResources } from '../api/roles'
import type { RoleCategoryItem, RoleResourceItem } from '../api/roles'
import AllocCategory from './AllocCategory.vue';
import type { Ref } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter()
const props = defineProps({
    roleId: {
        type: String,
        required: true,
    }
})
console.log(props.roleId);
//存储数据
const roleResources = ref<RoleCategoryItem[]>()
//获取数据的方法
const loadRoleResources = async () => {
    const { data } = await getRoleResources(props.roleId)
    console.log(data);
    if (data.code === '000000') {
        roleResources.value = data.data.sort((c1, c2) => c1.id - c2.id)
    } else {
        ElMessage.error('获取角色资源权限失败...')
        throw new Error('获取角色资源权限失败...' + data.mesg)
    }
}
loadRoleResources()

//保存
const onSave = async () => {
    //首先要获取所有被选中的资源id
    const allCheckedIds = collectCheckedIds.reduce((tmp: number[], item) => {
        return [...tmp, ...item.value]
    }, []) //tmp初始值是一个空数组[]，用于保存尖括号{}中每一次return的结果
    console.log(allCheckedIds);
    //调用接口，把数据传给服务端
    const { data } = await allocateRoleResources(props.roleId, allCheckedIds)
    if (data.code === '000000') {
        ElMessage.success('更新角色资源权限成功！')
        router.push({ name: 'roles' })
    } else {
        ElMessage.error('更新角色资源权限失败...')
        throw new Error('更新角色资源权限失败...' + data.mesg)
    }
}
//清空
const onClear = () => {
    collectCheckedIds.forEach((item) => {
        item.value = []
    })
}

//存储所有子组件的被选项目
const collectCheckedIds = [] as Ref<number[]>[]
//处理子组件的消息
const handleAddCheckedIds = (payload: Ref<number[]>) => {
    collectCheckedIds.push(payload)
}
</script>

<template>
    <AllocCategory v-for="category in roleResources" :key="category.id" :category="category"
        @postCheckedIdsRef="handleAddCheckedIds" />
    <div class="resources-btn">
        <el-button type="primary" @click="onSave">保存</el-button>
        <el-button type="" @click="onClear">清空</el-button>
    </div>
</template>

<style lang="scss" scoped>
.resource-btn {
    margin-top: 37px;
}
</style>
