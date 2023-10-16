import request from "@/utils/request";
import type { ErrorTypes } from "vue-router";

//总的返回类型
type Common<T> = {
    code: string
    mesg: string
    data: T
    time: string
}

interface VideoAuth {
    requestId: string
    videoId: string
    uploadAddress: string
    uploadAuth: string
}

//1.获取阿里云视频上传凭证
export const getVideoUploadAuth = (fileName: string, imageUrl: string) => {
    return request<Common<VideoAuth>>({
        method: 'GET',
        url: '/boss/course/upload/aliyunVideoUploadAddressAdnAuth.json',
        params: {
            fileName,
            imageUrl
        }
    })
}

type ImageAuth = {
    requestId: string
    imageId: string
    imageURL: string
    uploadAddress: string
    uploadAuth: string
    fileURL: string
}
//2.获取阿里云图片上传凭证
export const getImageUploadAuth = () => {
    return request<Common<ImageAuth>>({
        method: 'GET',
        url: '/boss/course/upload/aliyunImageUploadAddressAdnAuth.json',
    })
}

//3.刷新视频上传凭证
export const refreshVideoUploadAuth = (videoId:string) => {
    return request({
        method: 'GET',
        url: '/boss/course/upload/refreshAliyunVideoUploadAddressAdnAuth.json',
        params:{
            videoId,
        }
    })
}

export type VideoOpt = {
    lessonId: number //课程id
    coverImageUrl:string //封面的图片地址
    fileId:number //视频文件的id
    fileName:string //视频文件的名称
}
//4.阿里云转码请求
export const aliyunTransCode = (opt:VideoOpt) => {
    return request<Common<boolean>>({
        method: 'POST',
        url: '/boss/course/upload/aliyunTransCode.json',
        data:opt,
    })
}

//5.阿里云视频转码进度
export const aliyunTransCodePercent = (lessonId:number) => {
    return request<Common<number>>({
        method: 'GET',
        url: '/boss/course/upload/aliyunTransCodePercent.json',
        params: {
            lessonId,
        }
    })
}

//6.获取媒体信息
export const getMediaByLessonId = (lessonId:number) => {
    return request({
        method: 'GET',
        url: '/boss/course/upload/getMediaByLessonId.json',
        params:{
            lessonId,
        }
    })
}