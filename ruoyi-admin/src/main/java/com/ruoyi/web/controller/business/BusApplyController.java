package com.ruoyi.web.controller.business;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
// import com.ruoyi.system.domain.SysPost;
// import com.ruoyi.system.service.ISysapplyService;
import com.ruoyi.business.domain.BusApply;
import com.ruoyi.business.service.IBusApplyService;
import java.util.Date;
/**
 * 用车申请信息操作处理
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/business/apply")
public class BusApplyController extends BaseController
{
    @Autowired
    private IBusApplyService applyService;

    /**
     * 获取用车申请列表
     */
    @PreAuthorize("@ss.hasPermi('business:apply:list')")
    @GetMapping("/list")
    public TableDataInfo list(BusApply post)
    {
        startPage();
        List<BusApply> list = applyService.selectApplyList(post);
        return getDataTable(list);
    }
    
    @Log(title = "导出用车申请", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('business:apply:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, BusApply apply)
    {
        List<BusApply> list = applyService.selectApplyList(apply);
            
        // // 数据处理：遍历并修改字段
        // for (BusApply item : list) {
        //     // 示例：状态转中文
        //     if (item.getStatus() != null) {
        //         switch (item.getStatus()) {
        //             case "0": item.setStatus("草稿"); break;
        //             case "1": item.setStatus("部门审批中"); break;
        //             case "2": item.setStatus("办公室审批中"); break;
        //             case "3": item.setStatus("分管领导审批中"); break;
        //             case "4": item.setStatus("调度中"); break;
        //             case "5": item.setStatus("已分配司机"); break;
        //             case "6": item.setStatus("部门主管拒绝"); break;
        //             case "7": item.setStatus("办公室拒绝"); break;
        //             case "8": item.setStatus("分管领导拒绝"); break;
        //             default: item.setStatus("未知");
        //         }
        //     }

        //     // 示例：时间格式化
        //     if (item.getStartTime() != null) {
        //         item.setStartTimeStr(DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, item.getStartTime()));
        //     }
        //     if (item.getEndTime() != null) {
        //         item.setEndTimeStr(DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, item.getEndTime()));
        //     }

        //     // 示例：设置默认值防止空指针
        //     if (item.getApplicantName() == null) {
        //         item.setApplicantName("无");
        //     }
        // }

        ExcelUtil<BusApply> util = new ExcelUtil<BusApply>(BusApply.class);
        util.exportExcel(response, list, "用车申请数据");
    }

    /**
     * 根据用车申请编号获取详细信息
     */
    // @PreAuthorize("@ss.hasPermi('business:apply:query')")
    @GetMapping(value = "/detail/{id}")
    public AjaxResult getInfo(@PathVariable Long id)
    {
        return success(applyService.selectApplyById(id));
    }

    /**
     * 新增用车申请
     */
    @PreAuthorize("@ss.hasPermi('business:apply:add')")
    @Log(title = "新增用车申请", businessType = BusinessType.INSERT)
    @PostMapping("/add")  // 明确添加路径
    public AjaxResult add(@Validated @RequestBody BusApply apply)
    {
        // if (!applyService.checkPostNameUnique(post))
        // {
        //     return error("新增用车申请'" + post.getPostName() + "'失败，用车申请名称已存在");
        // }
        // else if (!applyService.checkPostCodeUnique(post))
        // {
        //     return error("新增用车申请'" + post.getPostName() + "'失败，用车申请编码已存在");
        // }
        apply.setCreateBy(getUsername());
        return toAjax(applyService.insertApply(apply));
    }
    /**
     * 审批用车申请
     */
    @PreAuthorize("@ss.hasPermi('business:apply:approve')")
    @Log(title = "审批用车申请", businessType = BusinessType.UPDATE)
    @PostMapping("/approve")  // 明确添加路径
    public AjaxResult approve(@RequestBody ApproveRequest request)
    {
        Long id = request.getApplyId();
        String reason = request.getReason();
        String action = request.getAction();
        String currentAction = request.getCurrentAction();

        if (id == null || reason == null || action == null) {
            return error("审批参数不完整");
        }

        BusApply apply = applyService.selectApplyById(id);
        if (apply == null) {
            return error("申请不存在");
        }

        // '0': '草稿',
        // '1': '部门审批中',
        // '2': '办公室审批中',
        // '3': '分管领导审批中',
        // '4': '调度中',
        // '5': '已分配司机',
        // '6': '审批被部门主管拒绝',
        // '7': '审批被办公室拒绝',
        // '8': '审批被分管领导拒绝'
        // 根据 currentAction 和 action 更新申请状态
        Date currentTime = new Date();  // 获取当前时间
        switch (currentAction) {        
            case "depApprove":      // 部门审批中
                // 设置审批人信息
                apply.setDepApproveId(getUserId());
                apply.setDepApproveName(getNickName());
                apply.setDepApproveTime(currentTime);   

                switch (action) {
                    case "agree":   // 同 意
                        if (apply.getSecret().equals("0")) {      //非机要用车  跳过办公室审批  直接给领导。
                            if (apply.getOutCity().equals("0")){   
                                apply.setStatus("4"); // 非机要用车 不出市直接提交给 中心车辆调度  
                            }
                            else{
                                apply.setStatus("3"); // 非机要用车 出市 直接提交分管领导
                            }
                        }
                        else{      // 机要用车
                            apply.setStatus("2"); // 机要用车部门审批后到 办公室审批
                        }
                        break;
                    case "disagree":   // 不 同 意
                        apply.setStatus("6"); // 审批被部门主管拒绝
                        break;
                    default:
                        return error("无效的审批操作");
                }
                break; // 添加 break 语句
            case "officeApprove":      // 办公室审批中
                // 设置审批人信息
                apply.setOffApproveId(getUserId());
                apply.setOffApproveName(getNickName());
                apply.setOffApproveTime(currentTime); 
                switch (action) {
                    case "agree":   // 同 意
                        if (apply.getOutCity().equals("0")){   
                            apply.setStatus("4"); // 机要用车 不出市直接提交给 中心车辆调度  
                        }
                        else{
                            apply.setStatus("3"); // 机要用车 出市 直接提交分管领导
                        }
                        break;
                    case "disagree":   // 不 同 意
                        apply.setStatus("7"); // 审批被办公室拒绝
                        break;
                    default:
                        return error("无效的审批操作");
                }
                break; // 添加 break 语句
            case "leaderApprove":      // 领导审批中
                //设置审批人信息 
                apply.setLeaderApproveId(getUserId());
                apply.setLeaderApproveName(getNickName());
                apply.setLeaderApproveTime(currentTime);  
                switch (action) {
                    case "agree":   // 同 意
                        apply.setStatus("4"); // 分管领导审批后到调度中心
                        break;
                    case "disagree":   // 不 同 意
                        apply.setStatus("8"); // 审批被领导拒绝
                        break;
                    default:
                        return error("无效的审批操作");
                }
                break; // 添加 break 语句
            default:
                return error("无效的审批操作");
        }

        apply.setReason(reason);
        apply.setUpdateBy(getUsername());

        int result = applyService.updateApply(apply);
        if (result > 0) {
            return success("审批成功");
        } else {
            return error("审批失败");
        }
    }
    /**
     * 修改用车申请
     */
    @PreAuthorize("@ss.hasPermi('business:apply:edit')")
    @Log(title = "用车申请管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")  // 明确添加路径
    public AjaxResult edit(@Validated @RequestBody BusApply apply)
    {
        // if (!applyService.checkPostNameUnique(post))
        // {
        //     return error("修改用车申请'" + post.getPostName() + "'失败，用车申请名称已存在");
        // }
        // else if (!applyService.checkPostCodeUnique(post))
        // {
        //     return error("修改用车申请'" + post.getPostName() + "'失败，用车申请编码已存在");
        // }
        if (apply.getId() == null ) {
            return error("审批参数不完整id为空");
        }
        BusApply apply1 = applyService.selectApplyById(apply.getId());
        if (apply1 == null) {
            return error("申请不存在");
        }
        return toAjax(applyService.updateApply(apply));
    }

    /**
     * 删除用车申请
     */
    @PreAuthorize("@ss.hasPermi('business:apply:delete')")
    @Log(title = "删除用车申请", businessType = BusinessType.DELETE)
    @DeleteMapping("/delete")  // 修改路径
    public AjaxResult deleteApply(@RequestParam("ids") Long[] applicantIds) {
        return toAjax(applyService.deleteApplyByIds(applicantIds));
    }

    /**
     * 撤回用车申请
     */
    @PreAuthorize("@ss.hasPermi('business:apply:withdraw')")
    @Log(title = "撤回用车申请", businessType = BusinessType.DELETE)
    @DeleteMapping("/withdraw")  // 修改路径
    public AjaxResult withdrawApply(@RequestParam("ids") Long[] applicantIds) {
        for (Long id : applicantIds) {
            BusApply apply = applyService.selectApplyById(id);
            if (apply == null) {
                return error("申请ID: " + id + " 不存在");
            }
            apply.setStatus("0");
            applyService.updateApply(apply); // 更新状态为草稿
        }
        return success("撤回成功");
    }
    /**
     * 获取用车申请选择框列表
     */
    @GetMapping("/optionselect")
    public AjaxResult optionselect()
    {
        List<BusApply> posts = applyService.selectPostAll();
        return success(posts);
    }
}

// 定义 ApproveRequest 类来接收前端传递的参数
class ApproveRequest {
    private Long applyId;
    private String reason;
    private String action;
    private String currentAction;
    // Getters and Setters
    public Long getApplyId() {
        return applyId;
    }

    public void setApplyId(Long applyId) {
        this.applyId = applyId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
    public String getCurrentAction() {
        return currentAction;
    }

    public void setCurrentAction(String currentAction) {
        this.currentAction = currentAction;
    }
}
