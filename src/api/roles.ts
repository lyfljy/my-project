import request from '@/utils/request'

type Common<T> = {
    code: string
    data: T
    mesg: string
    time: string
}
export type Role = {
    code: string
    createdBy?: string
    createdTime?: string
    description: string
    id: number
    name: string
    operatorId: number | null
    updatedBy?: string
    updatedTime?: string
}
export type QueryResult = Partial<{
    current: number
    hitContent: boolean
    optimizeCountSql: boolean
    orders: any[]
    pages: number
    records: Role[] | []
    searchCount: boolean
    size: number
    total: number
}>
//Partial表示内部的每一项属性都是可选的
export type Condition = Partial<{
    code: string
    id: number
    name: string
    startCreateTime: string
    endCreateTime: string
    current: number
    size: number
}>
//按条件查询角色
export const getRolePages = (condition: Condition) => {
    return request<Common<QueryResult>>({
        method: 'POST',
        url: '/boss/role/getRolePages',
        data: condition
    })
}

type RoleParams = Pick<Role, 'code' | 'description' | 'name' | 'id'>
//保存或更新角色
export const saveOrUpdate = (role: RoleParams) => {
    return request<Common<boolean>>({
        method: 'POST',
        url: '/boss/role/saveOrUpdate',
        data: role,
    })
}

//删除角色
export const deleteRole = (id: number) => {
    return request<Common<boolean>>({
        method: 'DELETE',
        url: `/boss/role/${id}`,
    })
}

//获取指定ID的角色
export const getRoleById = (id:number) => {
    return request<Common<Role>>({
        method: 'GET',
        url: `/boss/role/${id}`,
    })
}

export type RoleMenuItem = {
    createdBy: string
    createdTime: string
    description: string
    href: string
    icon: string
    id: number
    level: number
    name: string
    operatorId: number | null
    orderNum: number
    parentId: number
    selected: false
    shown: boolean
    subMuneList: RoleMenuItem[] | null //嵌套
    updatedBy: string
    updatedTime: string
}
//获取角色拥有的菜单信息
export const getRoleMenus = (id:string) => {
    return request<Common<RoleMenuItem[]>>({
        method: 'GET',
        url: '/boss/menu/getRoleMenus',
        params: {
            roleId: id,
        }
    })
}

//给角色信息分配菜单信息
export const allocateRoleMenus = (roleId:string,menuIdList:number[]) => {
    return request<Common<boolean>>({
        method: 'POST',
        url: '/boss/menu/allocateRoleMenus',
        data: {
            roleId,
            menuIdList,
        }
    })
}

export type RoleResourceItem = {
    categoryId: number
    createdBy: string
    createdTime: string
    description: string
    id: number
    name: string
    operatorId: number | null
    selected: boolean
    updatedBy: string
    updatedTime: string
    url: string
}
export type RoleCategoryItem = {
    createdBy: string
    createdTime: string
    id: number
    name: string
    operatorId: number | null
    resourceList: null | RoleResourceItem[]
    selected: boolean
    sort: number
    updatedBy: string
    updatedTime: string
}
//获取角色拥有的资源列表
export const getRoleResources = (id:string) => {
    return request<Common<RoleCategoryItem[]>>({
        method: 'GET',
        url: '/boss/resource/getRoleResources',
        params: {
            roleId: id,
        }
    })
}

//给角色分配资源
export const allocateRoleResources = (roleId:string,resourceIdList:number[]) => {
    return request<Common<boolean>>({
        method: 'POST',
        url: '/boss/resource/allocateRoleResources',
        data:{
            roleId,
            resourceIdList,
        }
    })
}