import request from '@/utils/request'
import { parseStrEmpty } from "@/utils/ruoyi";

// 查询申请列表
export function listapply(query) {
  return request({
    url: '/business/apply/list',
    method: 'get',
    params: query
  })
}
// 新增申请
export function addapply(data) {
  return request({
    url: '/business/apply/add',
    method: 'post',
    data: data
  })
}
// 审批申请
export function approveApply(data) {
    return request({
      url: '/business/apply/approve',
      method: 'post',
      data: data
    })
  }
// 查看申请详情
export function getapplyDetail(id) {
  return request({
    url: '/business/apply/detail/' + parseStrEmpty(id),
    method: 'get'
  })
}
// 修改申请
export function updateapply(data) {
  return request({
    url: '/business/apply/edit',
    method: 'post',
    data: data
  })
}
// 撤回申请
export function withdrawApply(applyIds) {
  return request({
    url: '/business/apply/withdraw',
    method: 'delete',
    params: { ids: applyIds.join(',') },
    headers: {
        'Content-Type': 'application/json' // 明确指定Content-Type
    }
  })
}
// 删除申请
export function deleteApply(applicantIds) {
    return request({
        url: '/business/apply/delete',
        method: 'delete',
        params: { ids: applicantIds.join(',') },
        headers: {
            'Content-Type': 'application/json' // 明确指定Content-Type
        }
    })
}