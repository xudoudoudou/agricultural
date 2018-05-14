
- 最后执行npm脚本：

```
npm run start #运行前后端（开发）
```

开始您的愉快之旅。

注意：在开发环境下上传的图片不能正常访问，需要在生产环境下才能正常浏览图片！（编辑器中的图片使用的是beas64不受此影响）

- 开始完成后打包

```
npm run build
```

- 上线后只运行服务

```
npm run server
```

## 项目架构

```

├── build // vue-cli 生成，用于webpack监听、构建
│   ├── build.js
│   ├── check-versions.js
│   ├── dev-client.js
│   ├── dev-server.js
│   ├── utils.js
│   ├── webpack.base.conf.js
│   ├── webpack.dev.conf.js
│   └── webpack.prod.conf.js
├── config
│   ├── default.conf
│   ├── dev.env.js
│   ├── index.js
│   └── prod.env.js
├── dist // Vue build 后的文件夹
│   ├── index.html // 入口文件
│   └── static // 静态资源
├── server // Koa后端，用于提供Api
│   ├── api.js // api接口文件，几乎所有后台接口
│   ├── common.js // 前后台共用配置参数，包括权限配置
│   ├── config.js // 后台配置文件夹，主要是数据库及邮箱服务配置
│   ├── mysql.sql // 数据库表文档
│   └── routes.js // 后台route-路由
├── src // vue-cli 生成&自己添加的utils工具类
│   ├── assets // 相关静态资源存放
│   ├── components // 公用组件
│   │      ├── index.js
│   │      └── upFile.vue // 上传组件
│   ├── page // 单文件组件
│   │    ├── Article // 文章
│   │    │     ├── add.vue //添加、编辑文章
│   │    │     ├── list.vue //文章列表
│   │    │     └── sort.vue //文章分类
│   │    ├── UpFile // 上传
│   │    │     └── list.vue //上传列表
│   │    ├── User // 用户
│   │    │     ├── add.vue //添加、编辑用户
│   │    │     └── list.vue //用户列表
│   │    ├── Home.vue //公共首页
│   │    ├── Login.vue // 登录页、注册页
│   │    └── NoFind.vue // 404页面
│   ├── store // vuex文件
│   │    ├── index.js
│   │    └── userInfo.js // 缓存用户信息
│   ├── utils // 插件
│   │    ├── index.js
│   │    ├── ajax.js  //axios封装请求
│   │    └── storage.js // localStorage缓存
│   ├── main.js // 引入Vue等资源、挂载Vue的入口js
│   ├── utils // 工具文件夹-封装的可复用的方法、功能
│   │     ├── ajax // 封装axios的通用请求
│   │     └── storage //本地存储方法
│   ├── App.vue // 主文件
│   ├── main.js // 入口文件
│   ├── App.vue // 主文件
│   └── routes.js // 前端路由
├── static // 前端静态文件
│   └── style.css // 样式
├── .babelrc // babel工具，ES6转ES5配置
├── .editorconfig // 编辑器格式配置
├── .gitignore // Git之忽略文件
├── .postcssrc.js // postcss配置文件
├── app.js  // Koa入口文件
├── favicon.ico // ico图标
├── index.html // 首页模板
├── log.txt  // 后端请求日志
├── package.json // npm的依赖、项目信息文件
├── README.md	//说明文档
├── server-entry.js // 后端服务入口文件

```

