import { getRolePages } from "@/api/roles";
import type { Condition, QueryResult, Role } from "@/api/roles";

//查询-条件
export const queryCondition = reactive<Condition>({
    name: '',
    size: 5
})

//查询-结果
export const queriedResult = ref<QueryResult>({
    records: [],
    size: 0,
    total: 0,
})

//查询-方法
export const queryRoles = async (params: Condition = {}) => {
    Object.assign(queryCondition, params)
    const {data} = await getRolePages(queryCondition)
    if (data.code === '000000') {
        queriedResult.value = data.data
    } else {
        ElMessage.error('按条件查询角色信息失败...')
        throw new Error('按条件查询角色信息失败...')
    }
}