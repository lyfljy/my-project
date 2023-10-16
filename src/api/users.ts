import { useTokenStore } from "@/stores/mytoken"
import request from "@/utils/request"

//用户登录-参数类型
type LoginInfo = {
    phone: string,
    code?: string,
    password: string
}

//提取公共的类型
type CommonReturn<T> = {
    success: boolean,
    state: number,
    message: string,
    content: T
}
//用户登录-返回数据类型
type LoginResult = CommonReturn<string>
//用户请求登录 {phone: '1111', password:'2222}
export const login = (loginInfo: LoginInfo) => {
    return request<LoginResult>({
        method: 'POST',
        url: '/front/user/login',
        data: `phone=${loginInfo.phone}&password=${loginInfo.password}`
    })
}

/*
    如果要求请求类型为 application/x-www.form-urlencoded
        需要把数据拼接为 属性1=值1&属性2=值2 （注意中间不能加任何空格）
    如果要求请求类型为 application/json
        只需要直接传对象 data: loginInfo
*/

//获取用户信息
type UserInfo = CommonReturn<{
    isUpdatedPassword: boolean,
    portrait: string,
    userName: string,
}>

export const getInfo = () => {
    return request<UserInfo>({
        method: "GET",
        url: "/front/user/getInfo",
    })
}

//用户退出
export const logout = () => {
    return request({
        method: 'POST',
        url: '/front/user/logout',
    })
}

//刷新token
type RToken = CommonReturn<string>
//是否刷新中的标志
// eslint-disable-next-line @typescript-eslint/no-explicit-any
let promiseRT: Promise<any>
//保存请求的promise对象
let isRefreshing = false
export const refreshToken = () => {
    if (isRefreshing) {
        return promiseRT
    }
    isRefreshing = true
    //把请求返回值保存到变量
    promiseRT = request<RToken>({
        method: 'POST',
        url: '/front/user/refresh_token',
        params: {
            refreshtoken: useTokenStore().token?.refresh_token,
        }
    }).finally(() => {
        isRefreshing = false
    })

    return promiseRT
}

//公共的类型
type Common<T> = {
    code: string
    data: T
    mesg: string
    time: string
}
//每一个用户项的类型
type UserItem = {
    accountNonExpired: boolean
    accountNonLocked: boolean
    createTime: string
    credntialsNonExpired: boolean
    id: number
    isDel: boolean
    name: string
    password: string
    phone: string
    portrait: string | null
    regIp: string | null
    status: 'ENABLE'|'DISABLE'
}
//用户查询结果的类型
export type QueryResult = {
    current: number
    hitCount: boolean
    optimizeCountSql: boolean
    orders: any[]
    pages: number
    records: UserItem[]
    searchCount: boolean
    size: number
    total: number
}
export type QueryCondition = Partial<{
    currentPage: number
    pageSize: number
    phone: string
    userId: number
    startCreateTime: string
    endCreateTime: string
}>
//获取用户列表信息
export const getUserPages = (queryCondition: QueryCondition = {}) => {
    return request<Common<QueryResult>>({
        method: 'POST',
        url: '/boss/user/getUserPages',
        data: { queryCondition, }
    })
}

//启用用户
export const enableUser = (userId: number) => {
    return request<Common<boolean>>({
        method: 'GET',
        url: '/boss/user/enableUser',
        params: {
            userId,
        }
    })
}

//禁用用户
export const forbidUser = (userId: number) => {
    return request<Common<boolean>>({
        method: 'POST',
        url: '/boss/user/forbidUser',
        data: {
            userId,
        }
    })
}

export type UserRole = {
    hasPermission: boolean
    id: number
    name: string
}
//获取指定用户的角色信息
export const getRolesWithUserPermission = (userId:number) => {
    return request<Common<UserRole[]>>({
        method: 'GET',
        url: '/boss/role/getRolesWithUserPermission',
        params: {
            userId,
        }
    })
}

//给指定用户分配角色
export const allocateUserRoles = (userId:number,roleIdList:number[]) => {
    return request<Common<boolean>>({
        method: 'POST',
        url: '/boss/role/allocateUserRoles',
        //接口要求的数据是body时，用data
        data:{
            userId,
            roleIdList,
        }
    })
}