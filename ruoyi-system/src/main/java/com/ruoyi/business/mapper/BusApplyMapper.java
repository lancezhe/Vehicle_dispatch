package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.BusApply;
import org.apache.ibatis.annotations.Param; // 导入Param注解
/**
 * 申请单信息 数据层
 * 
 * @author ruoyi
 */
public interface BusApplyMapper
{
    /**
     * 查询申请单数据集合
     * 
     * @param post 申请单信息
     * @return 申请单数据集合
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
     * @param id 申请单ID
     * @return 角色对象信息
     */
    public BusApply selectApplyById(Long id);

    /**
     * 根据用户ID获取申请单选择框列表
     * 
     * @param userId 用户ID
     * @return 选中申请单ID列表
     */
    public List<Long> selectApplyListByUserId(Long userId);

    /**
     * 查询用户所属申请单组
     * 
     * @param userName 用户名
     * @return 结果
     */
    public List<BusApply> selectPostsByUserName(String userName);

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
    public int deletePostByIds(Long[] postIds);

    /**
     * 修改申请单信息
     * 
     * @param post 申请单信息
     * @return 结果
     */
    public int updateApply(BusApply apply);

    /**
     * 新增申请单信息
     * 
     * @param post 申请单信息
     * @return 结果
     */
    public int insertApply(BusApply apply);
        /**
     * 新增申请单信息
     * 
     * @param post 申请单信息
     * @return 结果
     */
    int deleteApplyByIds(@Param("array") Long[] ids, @Param("updateBy") String updateBy);

    /**
     * 校验申请单名称
     * 
     * @param postName 申请单名称
     * @return 结果
     */
    public BusApply checkPostNameUnique(String postName);

    /**
     * 校验申请单编码
     * 
     * @param postCode 申请单编码
     * @return 结果
     */
    public BusApply checkPostCodeUnique(String postCode);
}
