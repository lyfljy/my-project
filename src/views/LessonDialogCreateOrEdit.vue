<script setup lang="ts">
import { getLessonById, saveOrUpdateLesson } from '../api/courses'

const dialogFormVisible = ref(false)
const formLabelWidth = '140px'

const initData = () => ({
    id: undefined as undefined | number,
    courseId: 0,
    sectionId: 0,
    theme: '',
    duration: '0',
    isFree: false,
    orderNum: 0,
    status: 0,
    courseName: '',
    sectionName: '',
})
const form = reactive(initData())

let title = ''
//初始化方法
const showAndInit = async (node: any, data: any, course: any) => {
    Object.assign(form, initData())
    if (node.level === 1) {
        //添加 - 课时
        title = '添加课时'
        form.sectionId = data.id
        form.sectionName = data.sectionName
    } else if (node.level === 2) {
        //编辑 - 课时
        form.id = data.id
        form.sectionId = node.parent.data.id
        form.sectionName = node.parent.data.sectionName
        //用最新的课时信息填写到表单
        const { data: newData } = await getLessonById(data.id)
        if (newData.code === '000000') {
            form.theme = newData.data.theme
            form.duration = String(newData.data.duration)
            form.isFree = newData.data.isFree
            form.orderNum = newData.data.orderNum
            form.status = newData.data.status
        } else {
            form.theme = data.theme
            form.duration = data.duration
            form.isFree = data.isFree
            form.orderNum = data.orderNum
            form.status = data.status
        }
        title = '更新课时'
    }
    form.courseId = course.id
    form.courseName = course.courseName
    dialogFormVisible.value = true
}
defineExpose({
    showAndInit,
})

//声明消息
const emits = defineEmits<{
    (e: 'lessonChange'): void
}>()

//表单提交
const onSubmit = async () => {
    const { data } = await saveOrUpdateLesson(form)
    if (data.code === '000000') {
        dialogFormVisible.value = false
        emits('lessonChange')
        ElMessage.success(`${title}成功！`)
    }else{
        ElMessage.error(`${title}失败...`)
        throw new Error(`${title}失败...`)
    }
}
</script>

<template>
    <el-dialog v-model="dialogFormVisible" :title="title" :close-on-click-modal="false" :close-on-press-escape="false">
        <el-form :model="form" label-position="top">
            <el-form-item label="课程名称" :label-width="formLabelWidth">
                <el-input v-model="form.courseName" autocomplete="off" disabled />
            </el-form-item>
            <el-form-item label="章节名称" :label-width="formLabelWidth">
                <el-input v-model="form.sectionName" autocomplete="off" disabled />
            </el-form-item>
            <el-form-item label="课时名称" :label-width="formLabelWidth">
                <el-input v-model="form.theme" autocomplete="off" />
            </el-form-item>
            <el-form-item label="时长" :label-width="formLabelWidth">
                <el-input v-model="form.duration" autocomplete="off" />
            </el-form-item>
            <el-form-item label="是否开放试听" :label-width="formLabelWidth">
                <el-switch v-model="form.isFree" :active-value="true" :inactive-value="false" />
            </el-form-item>
            <el-form-item label="课时排序" :label-width="formLabelWidth">
                <el-input-number v-model="form.orderNum" controls-position="right" />
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

.dialog-footer button:first-child {
    margin-right: 10px;
}
</style>
