<script setup lang="ts">
import type { FormInstance } from "element-plus";
import { form, isCreate, msgText, dialogFormVisible, onSubmit, allResourceCategory } from "../composables/useResourceCategory";

const formLabelWidth = '140px'

const initAndShow = (id = 0) => {
    fmResourceCategory.value?.resetFields()
    dialogFormVisible.value = true
    if (id) {
        isCreate.value = false
        msgText.value = "更新"
        const resourceCategory = allResourceCategory.value.find((item) => item.id === id)
        Object.assign(form, resourceCategory)
    } else {
        isCreate.value = true
        msgText.value = "创建"
    }
}

const fmResourceCategory = ref<FormInstance>()


defineExpose({
    initAndShow //向外导出该方法，所有使用该组件的父组件都可以调用该方法
})
</script>

<template>
    <el-dialog v-model="dialogFormVisible" :title="msgText + '资源类别'">
        <el-form :model="form" ref="fmResourceCategory">
            <el-form-item label="类别名称" :label-width="formLabelWidth" prop="name">
                <el-input v-model="form.name" autocomplete="off" />
            </el-form-item>
            <el-form-item label="排序" :label-width="formLabelWidth" prop="sort">
                <el-input v-model="form.sort" autocomplete="off" />
            </el-form-item>
        </el-form>
        <template #footer>
            <span class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取消</el-button>
                <el-button type="primary" @click="onSubmit">
                    提 交
                </el-button>
            </span>
        </template>
    </el-dialog>
</template>

<style lang="scss" scoped>
.el-button--text {
    margin-right: 15px;
}

.el-select {
    width: 300px;
}

.el-input {
    width: 300px;
}

.dialog-footer button:first-child {
    margin-right: 10px;
}
</style>
