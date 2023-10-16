import { fileURLToPath, URL } from 'node:url'
import { defineConfig, loadEnv } from 'vite'
import vue from '@vitejs/plugin-vue'
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'
import { ElementPlusResolver } from 'unplugin-vue-components/resolvers'

import Icons from "unplugin-icons/vite"
import IconsResolver from "unplugin-icons/resolver"

// https://vitejs.dev/config/
export default defineConfig({
  //开发阶段的代理请求配置
  server: {
    hmr: {
      overlay: false
    },
    proxy: {
      //以/front开头的话，就替我去请求http://39.97.218.60/front/ad/getAdList
      "/front": {
        target: loadEnv("", process.cwd()).VITE_API_URL, //相当于 import.meta.env.VITE_API_URL,
        changeOrigin: true,
      },
      "/boss": {
        target: loadEnv("", process.cwd()).VITE_API_URL,
        changeOrigin: true,
      }
    }
  },

  plugins: [
    vue(),
    AutoImport({
      imports: ["vue"],
      dts: 'src/types/auto-import.d.ts', // 路径下自动生成文件夹存放全局指令
      resolvers: [ElementPlusResolver(),IconsResolver()],
      eslintrc:{ 
        enabled: true,
        filepath: './src/types/.eslintrc-auto-import.json', // Default `./.eslintrc-auto-import.json`
        globalsPropValue: true, // Default `true`, (true | false | 'readonly' | 'readable' | 'writable' | 'writeable')
      },
    }),
    Components({
      resolvers: [
        ElementPlusResolver(),
        IconsResolver({
          enabledCollections: ["ep"],
        })
      ],
    }),
    Icons({
      autoInstall: true,
    })
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
})
