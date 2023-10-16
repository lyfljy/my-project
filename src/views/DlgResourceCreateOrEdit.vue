<script setup lang="ts">
import { saveOrUpdate, getResourceById } from '../api/resources';
import { queryResources } from '../composables/useResources';
//所有资源分类，获取所有分类的函数
import { allResourceCategory, getAllResourceCategory } from '../composables/useResourceCategory';

getAllResourceCategory()
const dialogFormVisible = ref(false)
const formLabelWidth = '140px'
const initData = () => ({
    id: 0,
    name: '',
    categoryId: 1,
    url: '',
    description: '',
})
const form = reactive(initData())

const isCreate = ref(true)
const msgText = ref('')
const initAndShow = async (id = 0) => {
    //清空表单
    Object.assign(form, initData())
    dialogFormVisible.value = true
    if (id) {
        isCreate.value = false
        msgText.value = "更新"
        //根据传进来的ID获取要更新资源的信息
        const {data} =await getResourceById(id)
        if(data.code === '000000') {
            Object.assign(form,data.data)
        } else {
            ElMessage.error(`获取ID为${id}的资源信息失败...`)
            throw new Error(`获取ID为${id}的资源信息失败...`)
        }
    } else {
        isCreate.value = true
        msgText.value = "创建"
    }
}

defineExpose({
    initAndShow,
})

//表单提交
const onSubmit = async () => {
    //提交表单数据并隐藏对话框
    const { data } = await saveOrUpdate(form).finally(() => (dialogFormVisible.value = false))
    if (data.code === '000000') {
        ElMessage.success(`${msgText.value}资源成功！`)
        queryResources({ current: 1 })
    } else {
        ElMessage.error(`${msgText.value}资源失败！`)
        throw new Error(`${msgText.value}资源失败！`)
    }
}
</script>

<template>
    <el-dialog :title="msgText + '资源'" v-model="dialogFormVisible">
        <el-form :model="form">
            <el-form-item label="资源名称" :label-width="formLabelWidth" prop="name">
                <el-input v-model="form.name" autocomplete="off" />
            </el-form-item>
            <el-form-item label="资源路径" :label-width="formLabelWidth" prop="url">
                <el-input v-model="form.url" autocomplete="off" />
            </el-form-item>
            <el-form-item label="资源类别" :label-width="formLabelWidth" prop="categoryId">
                <el-select v-model="form.categoryId" placeholder="资源类别">
                    <el-option v-for="category in allResourceCategory" :key="category.id" :label="category.name"
                        :value="category.id" />
                </el-select>
            </el-form-item>
            <el-form-item label="资源描述" :label-width="formLabelWidth" prop="description">
                <el-input v-model="form.description" type="textarea" autocomplete="off" />
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

<style lang="scss" scoped></style>
