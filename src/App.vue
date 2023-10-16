<script setup lang="ts">
import { RouterView } from 'vue-router'
import request from "./utils/request"
import zhCn from "element-plus/dist/locale/zh-cn"

request({
  method: "GET",
  //http://39.97.218.60/front/ad/getAdList 这是配置请求代理之前，直接向接口服务器请求
  //http://127.0.0.1:5174/front/ad/getAdList这是配置请求代理时，将 request.ts 中的baseURL那一行代码注释掉，则以下接口默认端口为，当前本地服务器
  url: "/front/ad/getAdList",
}).then((res) => {
  console.log(res)

})
</script>

<template>
  <el-config-provider :locale="zhCn">
    <RouterView />
  </el-config-provider>
</template>

<style lang="scss" scoped></style>
