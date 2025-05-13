package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.BusApply;

/**
 * 申请单信息 服务层
 * 
 * @author ruoyi
 */
public interface IBusApplyService
{
    /**
     * 查询申请单信息集合
     * 
     * @param post 申请单信息
     * @return 申请单列表
     */
    public List<BusApply> selectApplyList(BusApply post);

    /**
     * 查询所有申请单
     * 
     * @return 申请单列表
     */
    public List<BusApply> selectPostAll();

    /**
     * 通过申请单ID查询申请单信息
     * 
     * @param postId 申请单ID
     * @return 角色对象信息
     */
    public BusApply selectApplyById(Long postId);

    /**
     * 根据用户ID获取申请单选择框列表
     * 
     * @param userId 用户ID
     * @return 选中申请单ID列表
     */
    public List<Long> selectApplyListByUserId(Long userId);

    /**
     * 校验申请单名称
     * 
     * @param post 申请单信息
     * @return 结果
     */
    public boolean checkPostNameUnique(BusApply post);

    /**
     * 校验申请单编码
     * 
     * @param post 申请单信息
     * @return 结果
     */
    public boolean checkPostCodeUnique(BusApply post);

    /**
     * 通过申请单ID查询申请单使用数量
     * 
     * @param postId 申请单ID
     * @return 结果
     */
    public int countUserPostById(Long postId);

    /**
     * 删除申请单信息
     * 
     * @param postId 申请单ID
     * @return 结果
     */
    public int deletePostById(Long postId);

    /**
     * 批量删除申请单信息
     * 
     * @param postIds 需要删除的申请单ID
     * @return 结果
     */
    public int deleteApplyByIds(Long[] applicantIds); 
    /**
     * 新增保存申请单信息
     * 
     * @param post 申请单信息
     * @return 结果
     */
    public int insertApply(BusApply post);

    /**
     * 修改保存申请单信息
     * 
     * @param apply 申请单信息
     * @return 结果
     */
    public int updateApply(BusApply apply);
}
