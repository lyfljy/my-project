<script setup lang="ts">
import type { UploadRequestOptions, UploadRequestHandler } from 'element-plus';
import { aliyunTransCode, aliyunTransCodePercent, getImageUploadAuth, getVideoUploadAuth } from '../api/aliyun-upload';

const dialogVisible = ref(false)

const lessonId = ref(0)
const showAndInit = (node: any, data: any) => {
    dialogVisible.value = true
    lessonId.value = data.id
}
defineExpose({
    showAndInit,
})
//上传视频提示
const uploadVideoTip = ref('只支持 mp4 格式')
//上传封面提示
const uploadImageTip = ref('只支持 jpg png gif 格式')
//视频上传进度
const uploadPercent = ref(0)
//视频转码进度
const transPercent = ref(0)

//获取一个上传实例
const initUploader = () => {
    return new AliyunUpload.Vod({
        // userID，必填，您可以使用阿里云账号访问账号中心（https://account.console.aliyun.com/），即可查看账号ID
        userId: "122",
        // 上传到视频点播的地域，默认值为'cn-shanghai'，
        //eu-central-1，ap-southeast-1
        region: "",
        // 分片大小默认1 MB，不能小于100 KB（100*1024）
        partSize: 1048576,
        // 并行上传分片个数，默认5
        parallel: 5,
        // 网络原因失败时，重新上传次数，默认为3
        retryCount: 3,
        // 网络原因失败时，重新上传间隔时间，默认为2秒
        retryDuration: 2,
        // 开始上传
        'onUploadstarted': function (uploadInfo:any) {
        },
        // 文件上传成功
        'onUploadSucceed': function (uploadInfo:any) {
        },
        // 文件上传失败
        'onUploadFailed': function (uploadInfo:any, code:any, message:any) {
        },
        // 文件上传进度，单位：字节
        'onUploadProgress': function (uploadInfo:any, totalSize:any, loadedPercent:any) {
        },
        // 上传凭证或STS token超时
        'onUploadTokenExpired': function (uploadInfo:any) {
        },
        // 全部文件上传结束
        'onUploadEnd': function (uploadInfo:any) {
        }
    })
}
//存储上传成功后的图片地址
const imageUrl = ref('')
//上传封面，保存成功后的图片地址
const handleUploadImage: UploadRequestHandler = (option: UploadRequestOptions): any => {
    uploadImageTip.value = option.file.name
    //1.获取一个上传实例
    const uploader = initUploader()
    //2.添加要上传的文件
    uploader.addFile(option.file)
    //3.获取并配置上传凭证
    uploader.options.onUploadstarted = async (uploadInfo: any) => {
        const { data } = await getImageUploadAuth()
        if (data.code === '000000') {
            //得到凭证
            const { uploadAuth, uploadAddress, imageId, imageURL } = data.data
            try {
                //进行配置
                uploader.setUploadAuthAndAddress(uploadInfo, uploadAuth, uploadAddress, imageId)
            } catch (err) {
                console.log('略过上传图片报错信息');

            }

            imageUrl.value = imageURL
        } else {
            ElMessage.error('获取图片上传凭证失败...')
            throw new Error('获取图片上传凭证失败...')
        }
    }
    //4.开始上传
    uploader.startUpload()
}
//临时保存要上传的文件
const videoFile = ref()
//选择视频，并且临时保存要上传的视频
const handleBeforeVideoUpload = (file: any) => {
    videoFile.value = file
    uploadVideoTip.value = file.name
    return false //在标签中有个action="#"，如果该函数结果返回为true，就会执行action属性，会有一行没必要的报错，加上return false，不需要让action去处理怎么上传视频文件，而是在后面开始上传的按钮去处理
}

//暂时存储上传视频的id
const videoFileId = ref()
//开始上传
const handleUploadVideo = () => {
    //1.获取上传实例
    const uploader = initUploader()
    //2.添加要上传的视频文件
    uploader.addFile(videoFile.value)
    //3.获取并配置上传凭证
    uploader.options.onUploadstarted = async (uploadInfo: any) => {
        const { data } = await getVideoUploadAuth(videoFile.value.name, imageUrl.value)
        if (data.code === '000000') {
            const { uploadAuth, uploadAddress, videoId } = data.data
            try {
                uploader.setUploadAuthAndAddress(uploadInfo, uploadAuth, uploadAddress, videoId)
            } catch (err) {
                console.log('略过视频凭证失败的错误信息');

            }
            /*
                用自己的代码模拟上传进度
            */
            let n = 0
            const hTime = setInterval(() => {
                uploadPercent.value = ++n
                if (n === 100) {
                    clearInterval(hTime)
                    //当上传进度为100%时，手工调用，以模拟视频转码操作
                    uploader.options.onUploadEnd()
                }
            }, 500)

            videoFileId.value = videoId
        } else {
            ElMessage.error('获取视频上传凭证失败...')
            throw new Error('获取视频上传凭证失败...')
        }
    }

    //5.处理视频上传进度
    uploader.options.onUploadProgress = (uploadInfo: any, totalSize: number, percent: number) => {
        uploadPercent.value = Math.round(percent * 100)
    }

    //6.视频转码处理
    uploader.options.onUploadEnd = async () => {
        const { data } = await aliyunTransCode({
            lessonId: lessonId.value,
            coverImageUrl: imageUrl.value,
            fileId: videoFileId.value,
            fileName: videoFile.value.name
        })
        if (data.code === '000000') {
            const hTime = setInterval(() => {
                aliyunTransCodePercent(lessonId.value).then(res => {
                    transPercent.value = res.data.data
                    if (res.data.data === 100) {
                        clearInterval(hTime)
                        ElMessage.success('视频转码成功！')
                    }
                })
            }, 1000)
        }
    }

    //4.开始上传
    uploader.startUpload()
}
</script>

<template>
    <el-dialog v-model="dialogVisible" title="上传视频" width="40%">
        <div class="upload-body">
            <!--点击选择视频按钮，根据accept="video/*"属性，只会显示出来视频文件而不是所有文件-->
            <el-upload class="upload-demo" action="#" accept="video/*" :show-file-list="false"
                :before-upload="handleBeforeVideoUpload">
                <el-button type="primary" plain>选择视频</el-button>
                <template #tip>
                    <div class="el-upload__tip">{{ uploadVideoTip }}
                    </div>
                </template>
            </el-upload>
            <el-upload class="upload-demo" action="#" accept="image/*" :http-request="handleUploadImage"
                :show-file-list="false">
                <el-button type="primary" plain>选择封面</el-button>
                <template #tip>
                    <div class="el-upload__tip">{{ uploadImageTip }}
                    </div>
                </template>
            </el-upload>
            <el-button type="primary" @click="handleUploadVideo">开始上传</el-button>
            <h4>视频上传进度：{{ uploadPercent }}%</h4>
            <h4>视频转码进度：{{ transPercent }}%</h4>
        </div>
    </el-dialog>
</template>

<style lang="scss" scoped>
.el-dialog {
    .upload-demo {
        height: 90px;
    }

    h4 {
        margin: 20px 0;
    }

    .upload-body {
        padding-left: 40px;
    }
}
</style>
