import { getAll, saveOrUpdate, deleteMenu, getEditMenuInfo } from "../api/menus";
import type { MenuItem, CreateOrEditMenu } from "../api/menus"
import router from "@/router/index"

export function useMenus() {
    //获取一级菜单
    //1.先获取所有菜单
    const allMenus = ref([] as MenuItem[])
    const getAllMenus = async () => {
        const { data } = await getAll()
        if (data.code === "000000") {
            allMenus.value = data.data
        } else {
            ElMessage.error("获取所有菜单失败...")
            throw new Error("获取所有菜单失败")
        }
    }

    //2.再从所有菜单中过滤出一级菜单
    const topMenus = computed(() => allMenus.value.filter((menu) => menu.level === 0))

    //表单的响应式数据
    const form = ref<CreateOrEditMenu>({
        name: "",
        href: "",
        parentId: -1,
        description: "",
        icon: "",
        shown: true,
        operatorId: 0,
    })

    //表单提交事件
    const onSubmit = async () => {
        const { data } = await saveOrUpdate(form.value)
        console.log(data);
        if (data.code === '000000') {
            ElMessage.success(`${msgText.value}菜单成功！`)
            router.push({ name: 'menus' })
        } else {
            ElMessage.error(`${msgText.value}菜单失败！`)
            throw new Error(`${msgText.value}菜单失败！`)
        }
        return
    }

    //删除菜单的事件处理函数
    const handleDelete = async (id: string) => {
        await ElMessageBox.confirm("确认要删除该菜单吗？", "删除提醒", {
            confirmButtonText: "确定",
            cancelButtonText: "取消",
        }).catch(() => {
            ElMessage.info("删除操作被取消！")
            return new Promise(() => { })//pedding
        })

        //调用接口函数
        const { data } = await deleteMenu(id)
        if (data.code === '000000' && data.data) {
            ElMessage.success('删除菜单成功！')
            getAllMenus()
        } else {
            ElMessage.error('删除菜单失败！')
            throw new Error('删除菜单失败！')
        }
    }

    //根据id获取菜单信息
    const getMenuInfoById = async (id: string) => {
        //2.根据id判断状态
        if (!Number(id)) {
            isCreate.value = true
            return //如果为新建则不用再查询菜单信息
        } else {
            isCreate.value = false
        }
        //通过接口获取信息
        const { data } = await getEditMenuInfo(id)
        if (data.code === '000000') {
            form.value = data.data.menuInfo
        } else {
            ElMessage.error("获取编辑菜单信息失败！")
            throw new Error("获取编辑菜单信息失败！")
        }
    }

    //1.状态与提示文本
    const isCreate = ref(true)
    const msgText = computed(() => (isCreate.value ? "创建" : "更新"))

    return { allMenus, getAllMenus, topMenus, form, onSubmit, handleDelete, getMenuInfoById, msgText }
}