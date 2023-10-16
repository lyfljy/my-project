<script setup lang="ts">
import { saveOrUpdateSection } from '../api/courses';

const dialogFormVisible = ref(false)
const formLabelWidth = '140px'

const form = reactive({
    status: 0,
})

let title = ''
//对话框初始化
const showAndInit = (course: any, section: any) => {
    title = '当前状态为：' + sectionStatusText[section.status]
    Object.assign(form, section)
    dialogFormVisible.value = true
}

defineExpose({
    showAndInit,
})

//声明事件消息
const emits = defineEmits<{
    (e:'statusChange'):void
}>()

//章节状态文字
const sectionStatusText = ['隐藏', '待更新', '已发布']

//表单提交
const onSubmit = async () => {
    const {data} = await saveOrUpdateSection(form)
    if (data.code === '000000') {
        dialogFormVisible.value = false
        ElMessage.success('修改章节状态成功！')
        emits('statusChange')
    } else {
        ElMessage.error('修改章节状态失败...')
        throw new Error('修改章节状态失败...')
    }
}
</script>

<template>
    <el-dialog v-model="dialogFormVisible" title="更改章节状态" :close-on-click-modal="false" :close-on-press-escape="false">
        <el-result icon="info" :title="title" />
        <el-form :model="form">
            <el-form-item label="状态更改为" :label-width="formLabelWidth">
                <el-select v-model="form.status" placeholder="">
                    <el-option v-for="(item, index) in sectionStatusText" :key="item" :label="item" :value="index" />
                </el-select>
            </el-form-item>
        </el-form>
        <template #footer>
            <span class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取消</el-button>
                <el-button type="primary" @click="onSubmit">
                    提交
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
