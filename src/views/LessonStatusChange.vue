<script setup lang="ts">
import { saveOrUpdateLesson } from '../api/courses';

const dialogFormVisible = ref(false)
const formLabelWidth = '140px'

const form = reactive({
    status: 0,
})

let title = ''
const lessonStatusText = ['隐藏', '未发布', '已发布']
//初始化方法
const showAndInit = (node: any, data: any, course: any) => {
    Object.assign(form, data)
    title = '当前状态为：' + lessonStatusText[data.status]
    dialogFormVisible.value = true
}

//向外暴露
defineExpose({
    showAndInit,
})
//声明消息
const emits = defineEmits<{
    (e:'lessonStatus') : void
}>()

//表单提交
const onSubmit =async () => {
    const {data} = await saveOrUpdateLesson(form)
    if (data.code === '000000') {
        dialogFormVisible.value = false
        emits('lessonStatus')
    }
}
</script>

<template>
    <el-dialog v-model="dialogFormVisible" title="更改课时状态">
        <el-result icon="info" :title="title" />
        <el-form :model="form">
            <el-form-item label="状态更改为" :label-width="formLabelWidth">
                <el-select v-model="form.status" placeholder="">
                    <el-option v-for="(item,index) in lessonStatusText" :key="item" :label="item" :value="index" />
                </el-select>
            </el-form-item>
        </el-form>
        <template #footer>
            <span class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取消</el-button>
                <el-button type="primary" @click="onSubmit">
                    确定
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

.dialog-footer button:first-child {
    margin-right: 10px;
}
</style>
