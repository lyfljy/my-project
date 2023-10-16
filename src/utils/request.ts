import axios, { type AxiosRequestHeaders } from "axios";
import { useTokenStore } from "@/stores/mytoken";
import { refreshToken } from "@/api/users";
import router from "@/router/index";

const request = axios.create({
    //在根目录创建一个 .env 文件，用来配置环境变量，则此处的baseURL只需要引入环境变量即可
    // baseURL: import.meta.env.VITE_API_URL,
})

//显示用户信息
request.interceptors.request.use((config) => {
    if (!config.headers) {
        config.headers = {} as AxiosRequestHeaders
    }
    const store = useTokenStore()
    config.headers.Authorization = store.token?.access_token

    return config
})

//响应拦截器
request.interceptors.response.use(
    (response) => response,
    async (error) => {
        if (error.response.status === 401) {
            //刷新token
            const { data } = await refreshToken()
            if (data.success) {
                //保存新token
                useTokenStore().saveToken(data.content)
                //重新请求之前的接口，并且返回结果
                return request(error.config)
            } else {
                //跳转到login
                ElMessage.error("刷新Token失败，需要重新登录才可以！")
                router.push({name:"login"})
            }
        }else if(error.response.status === 403){
            ElMessage.error('当前操作权限不足')
            //这里自己捏造一个返回的结果，保证UserIndex.vue中的切换用户状态的事件处理函数可以正常往下走
            return {data:{code:'123456'}}
        }
        return Promise.reject(error)
    })

export default request