module.exports = {
    "settings": {
        'vue': {
            // 添加这个配置项
            'compilerOptions': {
              'isCustomElement': tag => tag.startsWith('el-'), // 避免对 Element UI 组件进行 tree-shaking
                'types': ['@vue/runtime-core'], // 自动导入 runtime-core 库
                'resolveRef': true, // 自动导入 ref、computed 等相关API

            },
        },
    },
    "env": {
        "browser": true,
        "es2021": true
    },
    "globals": {
        // 添加下面这行代码
        "ElMessage": 'readonly',
        "ref": true,
        "reactive": true,
        "ElMessageBox": 'readonly',
    },
    "extends": [
        "eslint:recommended",
        "plugin:@typescript-eslint/recommended",
        "plugin:vue/vue3-essential",
        '@vue/typescript/recommended'
    ],
    "overrides": [
        {
            "env": {
                "node": true
            },
            "files": [
                ".eslintrc.{js,cjs}"
            ],
            "parserOptions": {
                "sourceType": "script"
            }
        }
    ],
    "parserOptions": {
        "ecmaVersion": "latest",
        "parser": "@typescript-eslint/parser",
        "sourceType": "module"
    },
    "plugins": [
        "@typescript-eslint",
        "vue"
    ],
    "rules": {
        "@typescript-eslint/no-explicit-any": "off",
    }
}