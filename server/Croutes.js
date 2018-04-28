//前端路由配置
import jwt from 'jsonwebtoken'
import config from './config.js'
import api from './api'
import common from './common'
import koa_router from 'koa-router'
import multer from 'koa-multer';
import fs from "fs"
const routes = koa_router();


module.exports = {
    routes
}
