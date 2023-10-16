<script setup lang="ts">
import type { FormRules, FormInstance } from 'element-plus';
//导入接口函数
import { login } from "../api/users";
import { useRouter, useRoute } from 'vue-router';
import { useTokenStore } from "../stores/mytoken";
//store就是mytoken.ts中的{token,saveToken}
const store = useTokenStore() 
const router = useRouter()
const route = useRoute()

//表单响应式数据
const form = reactive({
    phone: '18201288771',
    password: "111111",
})

//登录事件处理
const onSubmit = async () => {
    isLoading.value = true

    //调用校验规则
    //因为formRef是ref类型，所以调用时要用formRef.value
    await formRef.value?.validate().catch((err) => {
        ElMessage.error("表单校验失败...")//处理错误
        isLoading.value = false
        throw err//抛出错误，能成功拦截
    })
    //await的意思是，如果校验结果正确则正式发送登录请求（执行下面这个），如果校验有错误则处理并抛出错误（执行await紧跟着的处理）

    //正式发送登录请求
    const data = await login(form).then((res) => {
        if(!res.data.success) {
            ElMessage.error('登录信息有误!')
            isLoading.value = false
            throw new Error("登录信息有误")
        }
        return res.data
    })

    console.log(data);
    //保存token信息
    store.saveToken(data.content)

    isLoading.value = false

    ElMessage.success("登录成功！")
    router.push((route.query.redirect as string) || "/")
}

//定义表单校验规则
const rules = reactive<FormRules>({
    phone: [
        //required表示是否一定有该规则，true表示一定要有phone属性
        //trigger表示什么时候检查规则，blur表示在失去光标/焦点的时候检查规则
        //message表示不符合规则时给的提示是信息
        { required: true, message: "电话号码不能为空", trigger: "blur" },
        //正则表达式，表示以1开头，后面跟上10个数字，之后不再加任何字符符号
        { pattern: /^1\d{10}$/, message: "手机号必须是11位数字", trigger: "blur" },
    ],
    password: [
        { required: true, message: "密码不能为空", trigger: "blur" },
        { min: 6, max: 18, message: "密码长度需要6~18位", trigger: "blur" },
    ]
})

//定义是否登录加载中
const isLoading = ref(false)

const formRef = ref<FormInstance>()
</script>

<template>
    <div class="login">
        <!--获取组件/dom元素用ref-->
        <el-form :model="form" :rules="rules" ref="formRef" label-width="120px" label-position="top" size="large">
            <el-form-item label="手机号" prop="phone">
                <el-input v-model="form.phone" />
            </el-form-item>
            <el-form-item label="密码" prop="password"> <!--prop表示该标签使用的是上面绑定的rules中的phone规则-->
                <el-input v-model="form.password" />
            </el-form-item>

            <el-form-item>
                <el-button type="primary" @click="onSubmit" :loading="isLoading">登录</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<style lang="scss" scoped>
.login {
    background-color: #fff;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background-image: linear-gradient(to top,#fbc2eb 0%,#a6c1ee 100%);
    .el-form {
        width: 300px;
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px gray;
        .el-form-item {
            margin-top: 20px;
        }

        .el-button {
            width: 100%;
            margin-top: 30px;
        }
    }
}</style>
