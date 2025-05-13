package com.ruoyi.business.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.business.domain.BusApply;
import com.ruoyi.business.mapper.BusApplyMapper;
import com.ruoyi.system.mapper.SysUserPostMapper;
import com.ruoyi.business.service.IBusApplyService;
import org.apache.commons.lang3.ArrayUtils;
/**
 * 岗位信息 服务层处理
 * 
 * @author ruoyi
 */
@Service
public class BusApplyServiceImpl implements IBusApplyService
{
    @Autowired
    private BusApplyMapper applyMapper;

    @Autowired
    private SysUserPostMapper userPostMapper;

    /**
     * 查询岗位信息集合
     * 
     * @param post 岗位信息
     * @return 岗位信息集合
     */
    @Override
    public List<BusApply> selectApplyList(BusApply post)
    {
        return applyMapper.selectApplyList(post);
    }

    /**
     * 查询所有岗位
     * 
     * @return 岗位列表
     */
    @Override
    public List<BusApply> selectPostAll()
    {
        return applyMapper.selectPostAll();
    }

    /**
     * 通过申请单id查询岗位信息
     * 
     * @param id 申请单id
     * @return 角色对象信息
     */
    @Override
    public BusApply selectApplyById(Long id)
    {
        return applyMapper.selectApplyById(id);
    }

    /**
     * 根据用户ID获取岗位选择框列表
     * 
     * @param userId 用户ID
     * @return 选中申请单id列表
     */
    @Override
    public List<Long> selectApplyListByUserId(Long userId)
    {
        return applyMapper.selectApplyListByUserId(userId);
    }

    /**
     * 校验岗位名称是否唯一
     * 
     * @param post 岗位信息
     * @return 结果
     */
    @Override
    public boolean checkPostNameUnique(BusApply post)
    {
        // Long postId = StringUtils.isNull(post.getPostId()) ? -1L : post.getPostId();
        // BusApply info = applyMapper.checkPostNameUnique(post.getPostName());
        // if (StringUtils.isNotNull(info) && info.getPostId().longValue() != postId.longValue())
        // {
        //     return UserConstants.NOT_UNIQUE;
        // }
        return UserConstants.UNIQUE;
    }

    /**
     * 校验岗位编码是否唯一
     * 
     * @param post 岗位信息
     * @return 结果
     */
    @Override
    public boolean checkPostCodeUnique(BusApply post)
    {
        // Long postId = StringUtils.isNull(post.getPostId()) ? -1L : post.getPostId();
        // BusApply info = applyMapper.checkPostCodeUnique(post.getPostCode());
        // if (StringUtils.isNotNull(info) && info.getPostId().longValue() != postId.longValue())
        // {
        //     return UserConstants.NOT_UNIQUE;
        // }
        return UserConstants.UNIQUE;
    }

    /**
     * 通过申请单id查询岗位使用数量
     * 
     * @param postId 申请单id
     * @return 结果
     */
    @Override
    public int countUserPostById(Long postId)
    {
        return userPostMapper.countUserPostById(postId);
    }

    /**
     * 删除岗位信息
     * 
     * @param postId 申请单id
     * @return 结果
     */
    @Override
    public int deletePostById(Long postId)
    {
        return applyMapper.deletePostById(postId);
    }
    /**
     * 批量删除岗位信息
     * 
     * @param postIds 需要删除的申请单id
     * @return 结果
     */
    // @Override
    // public int deletePostByIds(Long[] postIds)
    // {
    //     for (Long postId : postIds)
    //     {
    //         BusApply post = selectApplyById(postId);
    //         if (countUserPostById(postId) > 0)
    //         {
    //             throw new ServiceException(String.format("%1$s已分配,不能删除", post.getPostName()));
    //         }
    //     }
    //     return applyMapper.deletePostByIds(postIds);
    // }

    @Transactional(rollbackFor = Exception.class)
    public int deleteApplyByIds(Long[] ids) {
        if (ArrayUtils.isEmpty(ids)) {
            throw new ServiceException("请选择要删除的申请");
        }
        
        // 获取当前登录用户
        String loginUsername = SecurityUtils.getUsername();
        
        return applyMapper.deleteApplyByIds(ids, loginUsername);
    }
    /**
     * 新增保存岗位信息
     * 
     * @param post 岗位信息
     * @return 结果
     */
    @Override
    public int insertApply(BusApply apply)
    {
        // 设置岗位状态为"1"（例如：启用状态）
        // apply.setStatus("1");
        return applyMapper.insertApply(apply);
    }

    /**
     * 修改保存岗位信息
     * 
     * @param post 岗位信息
     * @return 结果
     */
    @Override
    public int updateApply(BusApply apply)
    {
        return applyMapper.updateApply(apply);
    }
}
