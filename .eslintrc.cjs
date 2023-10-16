/* eslint-env node */
require('@rushstack/eslint-patch/modern-module-resolution')

module.exports = {
  globals:{
    AliyunUpload:true,
  },
  root: true,
  'extends': [
    'plugin:vue/vue3-essential',
    'eslint:recommended',
    '@vue/eslint-config-typescript',
    '@vue/eslint-config-prettier/skip-formatting',
    '.eslintrc-auto-import.json',
  ],
  parserOptions: {
    ecmaVersion: 'latest',
  },
  //以下为自己添加的片段
  rules:{
    "prettier/prettier":[
      "error",{
        semi:false, //js代码不要分号
        wrapAttributes:false, //标签属性不要刻意换行
        printWidth:100,
        endOfLine:"auto",
      }
    ]
  }
}
