<script setup lang="ts">
import { ref } from 'vue';
import type { Ref } from 'vue'
import type { CheckboxValueType } from 'element-plus';
import type { RoleCategoryItem } from '../api/roles'

//1.接收数据
const props = defineProps<{
    category: RoleCategoryItem
}>()

//声明触发的事件
const emit = defineEmits<{
    (e: 'postCheckedIdsRef',payload:Ref<number[]>):void
}>()

//2.初始化设置
const checkAll = ref(props.category.selected) //全选/全不选的初始值
const checkedIds = ref([] as number[]) //是否为半选状态，存储选中项的id
const allItemIds = [] as number[] //存储当前category中所有resource的id
const isIndeterminate = ref(
    //半选状态的初始值
    checkedIds.value.length > 0 && checkedIds.value.length < allItemIds.length
)
//遍历category的子元素，填充checkedIds、allItemIds
props.category.resourceList?.forEach((resource) => {
    allItemIds.push(resource.id)
    resource.selected && checkedIds.value.push(resource.id)
})

//在setup执行时，就直接发送消息与数据
emit('postCheckedIdsRef',checkedIds)
//监听，当组内没有被选中项的时候，将全选/全不选置为false
watchEffect(() => {
    if (checkedIds.value.length === 0) {
        checkAll.value = false
        isIndeterminate.value = false //半选状态也清空
    }
})

const handleCheckAllChange = (val: CheckboxValueType) => {
    checkedIds.value = val ? allItemIds : []
    isIndeterminate.value = false
}
const handleCheckedCitiesChange = (checkedItems: CheckboxValueType[]) => {
    const checkedCount = checkedItems.length
    checkAll.value = checkedCount === allItemIds.length
    isIndeterminate.value = checkedCount > 0 && checkedCount < allItemIds.length
}
</script>

<template>
    <el-card class="box-card">
        <template #header>
            <el-checkbox v-model="checkAll" :indeterminate="isIndeterminate" @change="handleCheckAllChange">{{ props.category.name }}</el-checkbox>
        </template>
        <el-checkbox-group v-model="checkedIds" @change="handleCheckedCitiesChange">
            <el-row>
                <el-col :span="8" v-for="resource in category.resourceList" :key="resource.id">
                    <el-checkbox :label="resource.id">{{
                        resource.name
                    }}</el-checkbox>
                </el-col>
            </el-row>

        </el-checkbox-group>
    </el-card>
</template>

<style lang="scss" scoped>
.el-card {
    margin-bottom: 37px;
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
