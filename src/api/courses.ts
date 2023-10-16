import request from "../utils/request";

interface Common<T> {
    code: string;
    data: T;
    mesg: string;
    time: string;
}

export interface CoursesResult {
    records: CourseItem[];
    total: number;
    size: number;
    current: number;
    pages: number;
}

export interface CourseItem {
    id: number;
    courseName: string;
    price: string;
    sortNum: number;
    status: number;
}
export type QueryCondition = Partial<{
    currentPage: number
    pageSize: number
    courseName: string
    status: number | ''
}>
//分页查询课程信息
export const getQueryCourses = (params: QueryCondition = {}) => {
    return request<Common<CoursesResult>>({
        method: 'POST',
        url: '/boss/course/getQueryCourses',
        data: params,
    })
}

//课程上下架
export const changeState = (courseId: number, status: number) => {
    return request<Common<boolean>>({
        method: 'GET',
        url: '/boss/course/changeState',
        params: {
            courseId,
            status,
        }
    })
}

export interface Course {
    id?: number,
    courseName: string;
    brief: string;
    teacherDTO: TeacherDTO;
    previewFirstField: string;
    previewSecondField: string;
    sortNum: number;
    courseListImg: string;
    courseImgUrl: string;
    discounts: number;
    price: number;
    sales: number;
    discountsTag: string;
    activityCourse: boolean;
    activityCourseDTO: ActivityCourseDTO;
    courseDescriptionMarkDown: string;
    status: number;
}

interface ActivityCourseDTO {
    beginTime: string;
    endTime: string;
    amount: number;
    stock: number;
}

interface TeacherDTO {
    teacherName: string;
    position: string;
    description: string;
}
//保存或更新课程信息
export const saveOrUpdateCourse = (course: Course) => {
    return request<Common<boolean>>({
        method: 'POST',
        url: '/boss/course/saveOrUpdateCourse',
        data: course, //请求数据类型为 application/json 时使用 data
    })
}

//获取指定ID的课程信息
export const getCourseById = (courseId: string) => {
    return request<Common<Course>>({
        method: 'GET',
        url: '/boss/course/getCourseById',
        params: {
            courseId,
        }
    })
}

export interface SectionDTO {
    id: number;
    courseId: number;
    sectionName: string;
    description: string;
    createTime: string;
    updateTime: string;
    isVisible: boolean;
    isDe: boolean;
    orderNum: number;
    lastOperatorId?: any;
    lessonDTOS: LessonDTO[];
    status: number;
}

interface LessonDTO {
    id: number;
    courseId: number;
    sectionId: number;
    theme: string;
    duration: string;
    durationNum: number;
    isFree: boolean;
    startImgUrl: string;
    orderNum: number;
    status: number;
    isTimingPublish: boolean;
    publishTime: string;
    fileId: number;
}
//获取指定课程中的章节和课时
export const getSectionAndLesson = (courseId: string) => {
    return request<Common<SectionDTO[]>>({
        method: 'GET',
        url: '/boss/course/section/getSectionAndLesson',
        params: {
            courseId,
        }
    })
}

//根据ID - 获取章节的信息
export const getSectionById = (sectionId: number) => {
    return request<Common<SectionDTO>>({
        method: 'GET',
        url: '/boss/course/section/getBySectionId',
        params: {
            sectionId,
        }
    })
}

//新建或更新 - 章节信息
export const saveOrUpdateSection = (data: Partial<SectionDTO>) => {
    return request<Common<boolean>>({
        method: 'POST',
        url: '/boss/course/section/saveOrUpdateSection',
        data,
    })
}

//根据ID - 获取课时信息
export const getLessonById = (lessonId: number) => {
    return request<Common<LessonDTO>>({
        method: 'GET',
        url: '/boss/course/lesson/getById',
        params: {
            lessonId,
        }
    })
}

//课时 - 添加或更新
export const saveOrUpdateLesson = (data: Partial<LessonDTO>) => {
    return request<Common<boolean>>({
        method: 'POST',
        url: '/boss/course/lesson/saveOrUpdate',
        data,
    })
}