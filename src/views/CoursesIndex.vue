<script setup lang="ts">
import { queryCondition, queriedResult, queryCourses } from '../composables/useCourses';
import { changeState } from '../api/courses'

queryCourses()

//上架or下架的事件处理函数
const changeStatus = async (val: number, course: any) => {
    const xx = [
        { msg: '下架', oldVal: 1 },
        { msg: '上架', oldVal: 0 },
    ]

    const handleError = () => {
        //切换上下架状态时，如果切换失败，希望页面上可以先切换再弹回去
        course.status = xx[val].oldVal
        ElMessage.error(`${xx[val].msg}失败`)
        throw new Error(`${xx[val].msg}失败`)
    }
    console.log(val, course);
    //这里为啥我改为changeState(0,val)时没有报错，但博主的有？
    const { data } = await changeState(course.id, val).catch(handleError)
    if (data.code === '000000') {
        ElMessage.success(`${xx[val].msg}成功！`)
    } else {
        handleError()
    }
}
</script>

<template>
    <el-card class="box-card">
        <template #header>
            <div class="card-header">
                <el-form :inline="true" :model="queryCondition" class="demo-form-inline">
                    <el-form-item label="课程名称">
                        <el-input v-model="queryCondition.courseName" placeholder="课程名称" clearable />
                    </el-form-item>
                    <el-form-item label="状态">
                        <el-select v-model="queryCondition.status" placeholder="" clearable>
                            <el-option label="全部" value="" />
                            <el-option label="上架" :value="1" />
                            <el-option label="下架" :value="0" />
                        </el-select>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="() => queryCourses({ currentPage: 1 })">查询</el-button>
                    </el-form-item>
                </el-form>
                <el-button type="primary" @click="$router.push({ name: 'course-create' })">新建课程</el-button>
            </div>
        </template>
        <el-table :data="queriedResult.records" border style="width: 100%">
            <el-table-column prop="id" label="ID" width="180" align="center" />
            <el-table-column prop="courseName" label="课程名称" width="180" align="center" />
            <el-table-column prop="price" label="价格" align="center" />
            <el-table-column prop="sortNum" label="排序" align="center" />
            <el-table-column prop="status" label="状态" align="center" v-slot="{ row }">
                <el-switch v-model="row.status" class="mb-2" active-text="上架" inactive-text="下架" active-color="#13ce66"
                    inactive-color="#ff4949" :active-value="1" :inactive-value="0"
                    @change="changeStatus($event as number, row)" />
            </el-table-column>
            <el-table-column label="操作" align="center" v-slot="{ row }">
                <el-button @click="$router.push({ name: 'course-edit', params: { courseId: row.id } })">编辑</el-button>
                <el-button @click="$router.push({ name: 'course-content', params: { courseId: row.id } })">内容管理</el-button>
            </el-table-column>
        </el-table>

        <el-pagination v-model:current-page="queriedResult.current" v-model:page-size="queriedResult.size"
            :page-sizes="[5, 10, 20, 50]" :background="true" layout="total, sizes, prev, pager, next, jumper"
            :total="queriedResult.total || 0" @size-change="(pageSize: number) => queryCourses({ pageSize, currentPage: 1 })"
            @current-change="(currentPage: number) => queryCourses({ currentPage })" />
    </el-card>
</template>

<style lang="scss" scoped>
.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.text {
    font-size: 14px;
}

.item {
    margin-bottom: 18px;
}

.box-card {
    width: auto;
}

.el-form-item {
    margin-bottom: 0px;
}

.pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
}
</style>
