<script setup lang="ts">
import type { Course } from '../api/courses';
import { getSectionById,saveOrUpdateSection } from '../api/courses'

const dialogFormVisible = ref(false)
const formLabelWidth = '90px'

const initData = () => ({
    id: (undefined as number | undefined) || undefined,
    courseId: 0,
    courseName: '',
    sectionName: '',
    description: '',
    orderNum: 0,
    status: 0,
})
const form = ref(initData())

const title = ref('')
const showAndInit = async (course: Course, sectionId: number | undefined) => {
    //每次显示对话框，都先恢复为默认空值
    form.value = initData()
    if (sectionId) {
        title.value = '更新章节'
        //获取要编辑的章节信息
        const { data } = await getSectionById(sectionId)
        if (data.code === '000000') {
            const { id, sectionName, description, orderNum } = data.data
            Object.assign(form.value, { id, sectionName, description, orderNum })
        }else{
            ElMessage.error('获取章节信息失败..' + data.mesg)
            throw new Error('获取章节信息失败..' + data.mesg)
        }
    } else {
        title.value = '新建章节'
    }
    form.value.courseName = course.courseName
    form.value.courseId = course.id!
    dialogFormVisible.value = true
}

defineExpose({
    showAndInit,
})

//事件给父组件的消息
const emits = defineEmits<{
    (e:'sectionRefresh'):void
}>()

//表单提交事件
const onSubmit =async () => {
    const {data} = await saveOrUpdateSection(form.value)
    if (data.code === '000000') {
        ElMessage.success(`${title.value}成功！`)
        dialogFormVisible.value = false
        emits('sectionRefresh')
    } else {
        ElMessage.error(`${title.value}失败...`)
        throw new Error(`${title.value}失败...`)
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
                <el-input v-model="form.sectionName" autocomplete="off" />
            </el-form-item>
            <el-form-item label="章节描述" :label-width="formLabelWidth">
                <el-input v-model="form.description" autocomplete="off" type="textarea" />
            </el-form-item>
            <el-form-item label="章节排序" :label-width="formLabelWidth">
                <el-input-number v-model="form.orderNum" autocomplete="off" controls-position="right" />
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

<style lang="scss" scoped>
.el-form {
    padding-left: 40px;
}

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
