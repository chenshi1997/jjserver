import request from '@/utils/request'

export function getAllGameGroup() {
  return request({
    url: '/gamegroup/getAllGameGroup',
    method: 'get'
  })
}
