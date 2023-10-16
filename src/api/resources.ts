import request from "@/utils/request";

type Common<T> = {
    code: string
    data: T
    mesg: string
    time: string
}
export type Resource = {
    categoryId: number
    createdBy: string
    createdTime: string
    description: string
    id: number
    name: string
    operatorId: number | null
    selected: boolean
    updatedBy: string
    url: string
}
export type QueriedResult = {
    current: number
    hitCount?: false
    optimizeCountSql?: boolean
    orders?: any[]
    pages?: number
    records: Resource[] | []
    searchCount?: boolean
    size: number
    total: number
}

export type Condition = Partial<{
    id: number
    name: string
    startCreateTime: string
    url: string
    categoryId: number | ''
    endCreateTime: string
    current: number
    size: number
}>
//按条件分页查看资源
export const getResourcePages = (condition: Condition) => {
    return request<Common<QueriedResult>>({
        method: 'POST',
        url: '/boss/resource/getResourcePages',
        data: condition,
    })
}

//保存或更新资源
export const saveOrUpdate = (resource:Partial< Resource>) => {
    return request < Common<boolean>>({
        method: 'POST',
        url: '/boss/resource/saveOrUpdate',
        //请求数据类型为 application/json 时就要传一个对象
        data: resource,
    })
}

//删除指定ID的资源
export const deleteResource = (id: number)=> {
    return request<Common<boolean>>({
        method: 'DELETE',
        url: `/boss/resource/${id}`
    })
}

//根据指定ID，获取资源信息
export const getResourceById = (id: number) => {
    return request<Common<Resource>>({
        method: 'GET',
        url: `/boss/resource/${id}`,
    })
}