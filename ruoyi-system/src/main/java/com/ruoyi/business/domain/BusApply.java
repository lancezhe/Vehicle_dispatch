package com.ruoyi.business.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 车辆调度申请表 bus_apply
 */
public class BusApply extends BaseEntity {          //继承了BaseEntity   更新时间更新人 这些在基类
    private static final long serialVersionUID = 1L;

    /** 申请单ID */
    @Excel(name = "申请单号", cellType = ColumnType.NUMERIC)
    private Long id;

    /** 申请人ID（关联用户表） */
    @Excel(name = "申请人ID", cellType = ColumnType.NUMERIC)
    @NotNull(message = "申请人id不能为空")
    private Long applicantId;

    /** 申请人ID（关联用户表） */
    @Excel(name = "申请人姓名", cellType = ColumnType.NUMERIC)
    @NotNull(message = "申请人名字不能为空")
    private String applicantName;

    /** 申请人电话（关联用户表） */
    @Excel(name = "申请人电话", cellType = ColumnType.NUMERIC)
    @NotNull(message = "申请人电话不能为空")
    private String applicantPhone;

    /** 部门 */
    @Excel(name = "申请人所在部门")
    @NotBlank(message = "部门不能为空")
    @Size(max = 50, message = "部门名称长度不能超过50个字符")
    private String department;

    /** 使用人 */
    @Excel(name = "使用人")
    @NotBlank(message = "使用人不能为空")
    @Size(max = 15, message = "使用人名称长度不能超过15个字符")
    private String carUser;

    /** 使用人电话 */
    @Excel(name = "使用人电话")
    @NotBlank(message = "使用人电话不能为空")
    @Size(max = 18, message = "使用人电话长度不能超过18个字符")
    private String phoneUser;

    /** 用车事由 */
    @Excel(name = "用车事由")
    // @NotBlank(message = "用车事由不能为空")
    @Size(max = 255, message = "用车事由长度不能超过255个字符")
    private String matter;
    
    /** 用车事由 */
    @Excel(name = "机要用车")
    @NotBlank(message = "机要用车不能为空")
    private String secret;

    /** 是否出市 */
    @Excel(name = "是否出市")
    @NotBlank(message = "是否出市不能为空")
    private String outCity;

    /** 申请时间（数据库datetime类型） */
    @Excel(name = "申请时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date applyTime;


    /** 出发地 */
    @Excel(name = "出发地")
    @NotBlank(message = "出发地不能为空")
    @Size(max = 100, message = "出发地长度不能超过100个字符")
    private String startLocation;

    /** 目的地 */
    @Excel(name = "目的地")
    @NotBlank(message = "目的地不能为空")
    @Size(max = 100, message = "目的地长度不能超过100个字符")
    private String endLocation;

    /** 出发时间 */
    @Excel(name = "出发时间")
    @NotBlank(message = "出发时间不能为空")
    @Size(max = 100, message = "出发时间长度不能超过100个字符")
    private String startTime;

    /** 结束时间 */
    @Excel(name = "结束时间")
    @NotBlank(message = "结束时间不能为空")
    @Size(max = 100, message = "结束时间长度不能超过100个字符")
    private String endTime;


    /** 状态（0待部门审批 1待办公室审批 2待领导审批 3待派车 4已完成 5已终止） */
    @Excel(name = "状态", readConverterExp = "0=待部门审批,1=待办公室审批,2=待领导审批,3=待派车,4=已完成,5=已终止")
    private String status;

    /** 部门审批人ID */
    @Excel(name = "部门审批人ID", cellType = ColumnType.NUMERIC)
    private Long depApproveId;

    /** 部门审批人ID */
    @Excel(name = "部门审批人姓名", cellType = ColumnType.NUMERIC)
    private String depApproveName;

    /** 部门审批时间（数据库datetime类型） */
    @Excel(name = "部门审批时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date depApproveTime;

    /** 办公室审批人ID */
    @Excel(name = "办公室审批人ID", cellType = ColumnType.NUMERIC)
    private Long offApproveId;

    /** 办公室审批人ID */
    @Excel(name = "办公室审批人姓名", cellType = ColumnType.NUMERIC)
    private String offApproveName;

    /** 办公室审批时间（数据库datetime类型） */
    @Excel(name = "办公室审批时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date offApproveTime;

    /** 分管领导ID */
    @Excel(name = "分管领导ID", cellType = ColumnType.NUMERIC)
    private Long leaderApproveId;

    /** 分管领导ID */
    @Excel(name = "分管领导姓名", cellType = ColumnType.NUMERIC)
    private String leaderApproveName;

    /** 分管领导审批时间（数据库datetime类型） */
    @Excel(name = "分管领导审批时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date leaderApproveTime;

    /** 调度员ID */
    @Excel(name = "调度员ID", cellType = ColumnType.NUMERIC)
    private Long dispatcherId;

    /** 调度员ID */
    @Excel(name = "调度员姓名", cellType = ColumnType.NUMERIC)
    private String dispatcherName;

    /** 调度员审批时间（数据库datetime类型） */
    @Excel(name = "调度员审批时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date dispatcherApproveTime;

    /** 车辆ID（关联车辆表） */
    @Excel(name = "车辆ID", cellType = ColumnType.NUMERIC)
    private Long vehicleId;

    /** 驾驶员ID（关联用户表） */
    @Excel(name = "驾驶员ID", cellType = ColumnType.NUMERIC)
    private Long driverId;

    /** 驾驶员ID（关联用户表） */
    @Excel(name = "驾驶员姓名", cellType = ColumnType.NUMERIC)
    private String driverName;

    /** 驾驶员ID（关联用户表） */
    @Excel(name = "审批未通过 拒绝理由", cellType = ColumnType.NUMERIC)
    private String reason;


    /** 驾驶员ID（关联用户表） */
    @Excel(name = "删除标记", cellType = ColumnType.NUMERIC)
    private String delFlag;

    // ---------------------- Getter/Setter ----------------------
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getApplicantId() { return applicantId; }
    public void setApplicantId(Long applicantId) { this.applicantId = applicantId; }

    public String getApplicantName() { return applicantName; }
    public void setApplicantName(String applicantName) { this.applicantName = applicantName; }
    public String getApplicantPhone() { return applicantPhone; }
    public void setApplicantPhone(String applicantPhone) { this.applicantPhone = applicantPhone; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getCarUser() { return carUser; }
    public void setCarUser(String carUser) { this.carUser = carUser; }


    public String getPhoneUser() { return phoneUser; }
    public void setPhoneUser(String phoneUser) { this.phoneUser = phoneUser; }

    public String getMatter() { return matter; }
    public void setMatter(String matter) { this.matter = matter; }
    
    public String getOutCity() { return outCity; }
    public void setOutCity(String outCity) { this.outCity = outCity; }
    
    public String getSecret() { return secret; }
    public void setSecret(String secret) { this.secret = secret; }
    
    public String getStartLocation() { return startLocation; }
    public void setStartLocation(String startLocation) { this.startLocation = startLocation; }

    public String getEndLocation() { return endLocation; }
    public void setEndLocation(String endLocation) { this.endLocation = endLocation; }

    public String getStartTime() { return startTime; }
    public void setStartTime(String startTime) { this.startTime = startTime; }

    public String getEndTime() { return endTime; }
    public void setEndTime(String endTime) { this.endTime = endTime; }

    public Date getApplyTime() { return applyTime; }
    public void setApplyTime(Date applyTime) { this.applyTime = applyTime; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Long getDepApproveId() { return depApproveId; }
    public void setDepApproveId(Long depApproveId) { this.depApproveId = depApproveId; }

    
    public String getDepApproveName() { return depApproveName; }
    public void setDepApproveName(String depApproveName) { this.depApproveName = depApproveName; }


    public Date getDepApproveTime() { return depApproveTime; }
    public void setDepApproveTime(Date depApproveTime) { this.depApproveTime = depApproveTime; }

    public Long getOffApproveId() { return offApproveId; }
    public void setOffApproveId(Long offApproveId) { this.offApproveId = offApproveId; }

    public String getOffApproveName() { return offApproveName; }
    public void setOffApproveName(String offApproveName) { this.offApproveName = depApproveName; }

    public Date getOffApproveTime() { return offApproveTime; }
    public void setOffApproveTime(Date offApproveTime) { this.offApproveTime = offApproveTime; }

    public Long getLeaderApproveId() { return leaderApproveId; }
    public void setLeaderApproveId(Long leaderApproveId) { this.leaderApproveId = leaderApproveId; }
    public String getLeaderApproveName() { return leaderApproveName; }
    public void setLeaderApproveName(String leaderApproveName) { this.leaderApproveName = leaderApproveName; }


    public Date getLeaderApproveTime() { return leaderApproveTime; }
    public void setLeaderApproveTime(Date leaderApproveTime) { this.leaderApproveTime = leaderApproveTime; }

    public Long getDispatcherId() { return dispatcherId; }
    public void setDispatcherId(Long dispatcherId) { this.dispatcherId = dispatcherId; }
    public String getDispatcherName() { return dispatcherName; }
    public void setDispatcherName(String dispatcherName) { this.dispatcherName = dispatcherName; }

    public Date getDispatcherApproveTime() { return dispatcherApproveTime; }
    public void setDispatcherApproveTime(Date dispatcherApproveTime) { this.dispatcherApproveTime = dispatcherApproveTime; }

    public Long getVehicleId() { return vehicleId; }
    public void setVehicleId(Long vehicleId) { this.vehicleId = vehicleId; }

    public Long getDriverId() { return driverId; }
    public void setDriverName(Long driverId) { this.driverId = driverId; }
    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }

    public String getDelFlag() { return delFlag; }
    public void setDelFlag(String delFlag) { this.delFlag = delFlag; }
    
    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }

    // ---------------------- toString ----------------------delFlag reason
    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", id)
            .append("applicantId", applicantId)
            .append("applicantName", applicantName)
            .append("applicantId", applicantPhone)
            .append("department", department)
            .append("startLocation", startLocation)
            .append("endLocation", endLocation)
            .append("startTime", startTime)
            .append("endTime", endTime)
            .append("applyTime", applyTime)
            .append("status", status)
            .append("depApproveId", depApproveId)
            .append("depApproveTime", depApproveTime)
            .append("offApproveId", offApproveId)
            .append("offApproveTime", offApproveTime)
            .append("leaderApproveId", leaderApproveId)
            .append("leaderApproveTime", leaderApproveTime)
            .append("dispatcherId", dispatcherId)
            .append("dispatcherApproveTime", dispatcherApproveTime)
            .append("vehicleId", vehicleId)
            .append("driverId", driverId)
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("reason", getReason())
            .toString();
    }
}