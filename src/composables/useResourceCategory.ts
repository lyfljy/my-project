//导入接口函数
import { getAll, saveOrderUpdate, deleteCategory } from "@/api/resource-category";
import type { ResourceCategory } from "@/api/resource-category";

//保存所有资源类别信息
export const allResourceCategory = ref([] as ResourceCategory[]) //还可以写成ref<ResourceCategory[]>([])

//获取所有资源类别信息
export const getAllResourceCategory = async () => {
    const { data } = await getAll()
    if (data.code === '000000') {
        allResourceCategory.value = data.data
    } else {
        ElMessage.error("获取资源类型失败...")
        throw new Error("获取资源类型失败...")
    }
}

//提交按钮事件处理函数
export const onSubmit = async () => {
    const { data } = await saveOrderUpdate(form).finally(() => (dialogFormVisible.value = false))
    if (data.code === "000000") {
        ElMessage.success(`${msgText.value}资源类型成功！`)
        getAllResourceCategory()
    } else {
        ElMessage.error(`${msgText.value}资源类型失败...`)
        throw new Error(`${msgText.value}资源类型失败...`)
    }
}

export const form = reactive({
    name: '',
    sort: 0,
})

export const isCreate = ref(true)
export const msgText = ref("")

export const dialogFormVisible = ref(false)

//删除事件处理
export const handleDelete = async (id: number) => {
    await ElMessageBox.confirm("确定要删除吗？", "危险动作提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
    }).catch(() => {
        ElMessage.info("删除动作被取消！")
        return new Promise(() => { })
    })
    const { data } = await deleteCategory(id)
    console.log(data);
    if (data.code === '000000') {
        ElMessage.success('删除资源类型成功！')
        getAllResourceCategory()
    } else {
        ElMessage.error('删除资源类别失败...')
        throw new Error('删除资源类别失败..')
    }
}