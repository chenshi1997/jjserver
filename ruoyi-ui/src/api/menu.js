import request from '@/utils/request'

// 获取路由
export const getRouters = (params) => {
  return request({
    url: '/getRouters',
    method: 'get',
    params: params
  })
}