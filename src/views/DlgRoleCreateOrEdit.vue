<script setup lang="ts">
import { saveOrUpdate, getRoleById } from "../api/roles";
const dialogFormVisible = ref(false)
const formLabelWidth = '100px'

const initData = () => ({
    name: '',
    description: '',
    code: '',
    id: 0,
})
const form = reactive(initData())

const isCreate = ref(true)
const msgText = ref("")
const initAndShow = async (id = 0) => {
    dialogFormVisible.value = true
    Object.assign(form, initData())
    if (id) {
        isCreate.value = false
        msgText.value = "更新"
        const { data } = await getRoleById(id)
        if (data.code === '000000') {
            console.log(data);

            Object.assign(form, data.data)
        } else {
            ElMessage.error(`获取ID为${id}的角色信息失败` + data.mesg)
            throw new Error(`获取ID为${id}的角色信息失败` + data.mesg)
        }
    } else {
        isCreate.value = true
        msgText.value = "创建"
    }
}

defineExpose({
    initAndShow,
})

//声明消息对象
const emit = defineEmits<{
    (e: 'role-change'): void
}>()

//提交表单
const onSubmit = async () => {
    const { data } = await saveOrUpdate(form).finally(() => (dialogFormVisible.value = false))
    if (data.code === '000000') {
        ElMessage.success(`${msgText.value}角色成功！`)
        emit('role-change')
    } else {
        ElMessage.error(`${msgText.value}角色失败...`)
        throw new Error(`${msgText.value}角色失败...`)
    }
}
</script>

<template>
    <el-dialog v-model="dialogFormVisible" :title="msgText + '角色'">
        <el-form :model="form">
            <el-form-item label="角色名称" :label-width="formLabelWidth" prop="name">
                <el-input v-model="form.name" autocomplete="off" />
            </el-form-item>
            <el-form-item label="角色编码" :label-width="formLabelWidth" prop="code">
                <el-input v-model="form.code" autocomplete="off" />
            </el-form-item>
            <el-form-item label="描述" :label-width="formLabelWidth" prop="description">
                <el-input v-model="form.description" autocomplete="off" type="textarea" />
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
