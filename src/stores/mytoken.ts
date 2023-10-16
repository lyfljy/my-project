import { defineStore } from "pinia";

interface Token {
    access_token: string,
    token_type: string,
    refresh_token: string,
    expires_in: number,
    user_id: string
}

export const useTokenStore = defineStore('mytoken', () => {
    //ref相当于state
    const tokenJson = ref("") //设置为字符串类型
    //computed相当于getters
    const token = computed<Token>(() => {
        try {
            return JSON.parse(tokenJson.value || window.localStorage.getItem("TokenInfo") || "{}")
        } catch (err) {
            ElMessage.error("json字符串格式不对，转化对象时失败...")
            window.localStorage.setItem("TokenInfo", "")
            throw err
        }
    })

    //function相当于actions
    function saveToken(data:string) {
        tokenJson.value = data 
        window.localStorage.setItem("TokenInfo", data) //使token在本地浏览器中保存
    }

    //向外暴露
    return { token, saveToken }
})