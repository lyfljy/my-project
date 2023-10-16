<script setup lang="ts">
import { courseSAL, course, loadSAL } from '../composables/useCourseContent'
import { Plus } from '@element-plus/icons-vue';
import CourseSectionDlgCreateOrEdit from './CourseSectionDlgCreateOrEdit.vue';
import CourseSectionStatusChange from './CourseSectionStatusChange.vue';
import LessonDialogCreateOrEdit from './LessonDialogCreateOrEdit.vue';
import LessonStatusChange from './LessonStatusChange.vue';
import UploadVideoImageDlg from './UploadVideoImageDlg.vue';
import type Node from 'element-plus/es/components/tree/src/model/node';
import type { AllowDropType } from 'element-plus/es/components/tree/src/tree.type';
import { saveOrUpdateLesson, saveOrUpdateSection } from '../api/courses';

const props = defineProps({
    courseId: {
        type: String,
        required: true,
    }
})
loadSAL(props.courseId)
console.log(course, courseSAL);

// interface Tree {
//     label: string
//     children?: Tree[]
// }

const handleNodeClick = (data: any, node: any) => {
    console.log(data, node)
}

const defaultProps = {
    children: 'lessonDTOS',
    label: (data: any) => data.sectionName || data.theme,
}

//章节状态按钮 - 文字
const sectionStatusText = ['隐藏', '待更新', '已发布']
//课时状态按钮 - 文字
const lessonStatusText = ['隐藏', '未发布', '已发布']

//章节对话框的引用
const sectionDlg = ref()
//章节状态对话框的引用
const sectionStatusDlg = ref()

//课时对话框的引用
const lessonDlg = ref()
//课时状态对话框的引用
const lessonStatusDlg = ref()
//上传对话框
const uploadDlg = ref()
//判断拖拽节点的结果是否符合规定.返回true承认拖拽结果，返回false不承认拖拽结果
//一个节点不能变成另一个节点的子节点
//一个节点不能从当前阶段拖拽到另一个阶段
const handleAllowDrop = (draggingNode: Node, dropNode: Node, type: AllowDropType) => {
    return type !== 'inner' && draggingNode.parent === dropNode.parent
}
//当拖拽节点成功时触发该事件处理函数
const onNodeDrop = (draggingNode: Node, dropNode: Node) => {
    const orderFn = dropNode.level === 1 ? saveOrUpdateSection : saveOrUpdateLesson
    const changePromiseArr = dropNode.parent.childNodes.map((node: Node, index) => {
        return orderFn({ id: node.data.id, orderNum: index + 1 })
    })
    Promise.all(changePromiseArr).then((resArr) => {
        const result = resArr.every((res) => res.data.code === '000000')
        if (result) {
            ElMessage.success('节点重新排序成功！')
        } else {
            throw 1
        }
    }).catch(() => {
        ElMessage.error('节点重新排序失败...')
        throw new Error('节点重新排序失败...')
    })
}
</script>

<template>
    <el-page-header @back="$router.go(-1)">
        <template #content>
            <div class="flex items-center">
                <span class="text-large font-600 mr-3"> {{ course.courseName }} </span>
            </div>
        </template>
        <template #extra>
            <div class="flex items-center">
                <el-button @click="sectionDlg.showAndInit(course)" type="primary" class="ml-2" :icon="Plus">添加章节</el-button>
            </div>
        </template>
    </el-page-header>
    <el-card class="box-card">
        <el-tree :data="courseSAL" draggable :allow-drop="handleAllowDrop" :props="defaultProps"
            @node-click="handleNodeClick" @node-drop="onNodeDrop">
            <template #default="{ node, data }">
                <span class="custom-tree-node">
                    <span>{{ node.label }}</span>
                    <span v-if="node.level === 1">
                        <el-button @click.stop="sectionDlg.showAndInit(course, data.id)"
                            size="large">编辑</el-button><!--@click.stop表示点击按钮时不告诉父组件进行冒泡，也就是点击按钮只有对话框弹出，该行的子项不展开-->
                        <el-button @click.stop="lessonDlg.showAndInit(node, data, course)" type="primary"
                            size="large">添加课时</el-button>
                        <el-button @click.stop="sectionStatusDlg.showAndInit(course, data)" size="large">{{
                            sectionStatusText[data.status] }}</el-button>
                    </span>

                    <span v-else-if="node.level === 2">
                        <el-button @click.stop="lessonDlg.showAndInit(node, data, course)" size="large">编辑</el-button>
                        <el-button type="success" size="large"
                            @click.stop="uploadDlg.showAndInit(node, data)">上传视频</el-button>
                        <el-button @click.stop="lessonStatusDlg.showAndInit(node, data, course)" size="large">{{
                            lessonStatusText[data.status] }}</el-button>
                    </span>
                </span>
            </template>
        </el-tree>
    </el-card>

    <CourseSectionDlgCreateOrEdit ref="sectionDlg" @sectionRefresh="loadSAL(props.courseId)" />
    <CourseSectionStatusChange ref="sectionStatusDlg" @statusChange="loadSAL(props.courseId)" />
    <LessonDialogCreateOrEdit ref="lessonDlg" @lessonChange="loadSAL(props.courseId)" />
    <LessonStatusChange ref="lessonStatusDlg" @lessonStatus="loadSAL(props.courseId)" />
    <UploadVideoImageDlg ref="uploadDlg" />
</template>

<style>
.custom-tree-node {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 14px;
    padding-right: 8px;
}
</style>

<style lang="scss" scoped>
.el-page-header {
    margin-bottom: 17px;
}

//单独写在这里，由于是子组件，所以不起效果，解决方法有两种
// .el-tree-node{
//     padding: 15px 0px;
//     border-bottom: 1px solid rgba(0,0,0,0.05);
//     font-size: 18px;
// }

//解决方法二：
:deep(.el-tree-node__content) {
    padding: 15px 0px;
    border-bottom: 1px solid rgba(0, 0, 0, 0.05);
    font-size: 18px;
}
</style>

<!-- 解决方法一：单独提出来写到style标签中 -->
<!-- <style>
.el-tree-node{
    padding: 15px 0px;
    border-bottom: 1px solid rgba(0,0,0,0.05);
    font-size: 18px;
}
</style> -->

<!-- 解决方法三：可以给el-page-header单独套一层div进行添加样式 -->

