import request from "@/utils/request"

//定义类型
type Common<T> = {
    code: string,
    data: T,
    mesg: string,
    time: string,
}
export type MenuItem = {
    createdBy: string,
    createdTime: string,
    description: string,
    href: string,
    icon: string,
    id: number,
    level: number,
    name: string,
    operatorId: number | null,
    parentId: number,
    shown: boolean,
    updatedBy: string,
    updatedTime: string,
}

//获取所有菜单项
export const getAll = () => {
    return request<Common<MenuItem[]>>({
        method: "GET",
        url: "/boss/menu/getAll",
    })
}

// type CreateOrEditMenu = Partial<MenuItem>
export type CreateOrEditMenu = Pick<
    MenuItem,
    "parentId" | "name" | "href" | "icon" | "operatorId" | "description" | "shown"
> & { id?: number } //对id是否可选进行修正
// type CreateOrEditMenu = Omit<
//     MenuItem,
//     "createBy" | "createTime" | "level" | "operatorId" | "updatedBy" | "updatedTime"
// > & { id?: number }
//保存或新增菜单
export const saveOrUpdate = (menuInfo: CreateOrEditMenu) => {
    return request<Common<boolean>>({
        method: 'POST',
        //接口地址点进去发现，这些都是mock的假数据
        url: '/boss/menu/saveOrUpdate',
        data: menuInfo,
    })
}

//删除菜单
export const deleteMenu = (id: string) => {
    return request<Common<boolean>>({
        method: 'DELETE',
        url: `/boss/menu/${id}`,
    })
}

type SubMenuList = MenuItem & { subMenuList: SubMenuList[] | null }
type EditMenuInfo = Common<{
    menuInfo: MenuItem
    parentMenuList: SubMenuList[]
}>
//获取指定ID的菜单信息
export const getEditMenuInfo = (id: string) => {
    return request<EditMenuInfo>({
        method: 'GET',
        url: '/boss/menu/getEditMenuInfo',
        params: {
            id: id, //可以简写为id
        }
    })
}