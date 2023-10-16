import { getResourcePages } from "@/api/resources"
import type { Condition, QueriedResult } from "@/api/resources"

//查询条件
export const queryCondtion = reactive<Condition>({
    name: '',
    url: '',
    categoryId: '',
    current: 1,
    size: 5,
})

//查询结果
export const queriedResult = ref<QueriedResult>({
    current: 1,
    records: [],
    size: 0,
    total: 0
})

//查询方法
export const queryResources = async (params: Condition = {}) => {
    //两个对象的相同属性，params补充条件会覆盖queryCondtion查询条件，能形成新的queryCondtion查询条件，之后能按新的查询条件去查询
    Object.assign(queryCondtion,params)
    const { data } = await getResourcePages(queryCondtion)
    if (data.code === '000000') {
        queriedResult.value = data.data
    } else {
        ElMessage.error("获取资源失败...")
        throw new Error("获取资源失败")
    }
}