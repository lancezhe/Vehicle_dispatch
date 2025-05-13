<template>
  <div class="app-container">
    <el-row :gutter="20" class="mt20">
      <el-col :span="12">
        <el-descriptions title="申请详情" :column="1" border>
          <el-descriptions-item label="状态">{{ statusMap[applyDetail.status] }}</el-descriptions-item>
          <el-descriptions-item label="申请单号">{{ applyDetail.id }}</el-descriptions-item>
          <el-descriptions-item label="申请人ID">{{ applyDetail.applicantId }}</el-descriptions-item>
          <el-descriptions-item label="申请人姓名">{{ applyDetail.applicantName }}</el-descriptions-item>
          <el-descriptions-item label="申请人电话">{{ applyDetail.applicantPhone }}</el-descriptions-item>
          <el-descriptions-item label="申请人所在部门">{{ applyDetail.department }}</el-descriptions-item>
          <el-descriptions-item label="使用人姓名">{{ applyDetail.carUser }}</el-descriptions-item>
          <el-descriptions-item label="使用电话">{{ applyDetail.phoneUser }}</el-descriptions-item>
          <el-descriptions-item label="出发地">{{ applyDetail.startLocation }}</el-descriptions-item>
          <el-descriptions-item label="目的地">{{ applyDetail.endLocation }}</el-descriptions-item>
          <el-descriptions-item label="出发时间">{{ parseTime(applyDetail.startTime) }}</el-descriptions-item>
          <el-descriptions-item label="结束时间">{{ parseTime(applyDetail.endTime) }}</el-descriptions-item>
          <el-descriptions-item label="是否出市">{{ applyDetail.outCity === '1' ? '是' : '否' }}</el-descriptions-item>
          <el-descriptions-item label="机要用车">{{ applyDetail.secret === '1' ? '是' : '否' }}</el-descriptions-item>
          <el-descriptions-item label="申请时间">{{ parseTime(applyDetail.applyTime) }}</el-descriptions-item>
          <el-descriptions-item label="用车事由">{{ applyDetail.matter }}</el-descriptions-item>
          <el-descriptions-item label="备注">{{ applyDetail.remark }}</el-descriptions-item>
        </el-descriptions>
      </el-col>
      <el-col :span="12">
        <el-descriptions title="审批信息" :column="1" border>
          <el-descriptions-item label="部门审批人姓名">{{ applyDetail.depApproveName }}</el-descriptions-item>
          <el-descriptions-item label="部门审批时间">{{ parseTime(applyDetail.depApproveTime) }}</el-descriptions-item>
          <el-descriptions-item label="办公室审批人姓名">{{ applyDetail.offApproveName }}</el-descriptions-item>
          <el-descriptions-item label="办公室审批时间">{{ parseTime(applyDetail.offApproveTime) }}</el-descriptions-item>
          <el-descriptions-item label="分管领导姓名">{{ applyDetail.leaderApproveName }}</el-descriptions-item>
          <el-descriptions-item label="分管领导审批时间">{{ parseTime(applyDetail.leaderApproveTime) }}</el-descriptions-item>
          <el-descriptions-item label="调度员姓名">{{ applyDetail.dispatcherName }}</el-descriptions-item>
          <el-descriptions-item label="调度员派车时间">{{ parseTime(applyDetail.dispatcherApproveTime) }}</el-descriptions-item>
          <el-descriptions-item label="驾驶员姓名">{{ applyDetail.driverName }}</el-descriptions-item>
        </el-descriptions>
        <div class="mt20">
          <!-- <el-button type="success" 
            @click="handleDepApprove"
            v-hasPermi="['business:apply:approve']"
            v-if="['1','2','3','4','5'].includes(applyDetail.status) "
          >撤回</el-button> -->
          <el-button type="success" 
            @click="handleDepApprove"
            v-hasPermi="['business:apply:approve']"
            v-if="['1'].includes(applyDetail.status) "
          >部门审批</el-button>
          <el-button type="success" 
            @click="officeApprove"
            icon="el-icon-s-custom"
            v-hasPermi="['business:apply:approve']"
            v-if="['2'].includes(applyDetail.status) "
          >办公室审批</el-button>
          <el-button type="warning" 
            @click="handleLeaderApprove" 
            v-hasPermi="['business:apply:approve']"
            icon="el-icon-s-check"
            v-if="['3'].includes(applyDetail.status) "
          >领导审批</el-button>
          <el-button type="primary" 
            @click="handleDispatch" 
            icon="el-icon-shopping-cart-1"
            v-hasPermi="['business:apply:dispatch']"
            v-if="['4'].includes(applyDetail.status) "
            >派车</el-button>
        </div>
      </el-col>
    </el-row>
    <!-- 审批对话框 -->
    <el-dialog :title="dialogTitle" :visible.sync="dialogVisible" width="40%">
      <el-form :model="approvalForm" ref="approvalForm" label-width="100px">
        <el-form-item label="审批理由">
          <el-input
            type="textarea"
            :rows="4"
            placeholder="请输入审批理由"
            v-model="approvalForm.reason"
          />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleApprove('agree')">同 意</el-button>
        <el-button type="danger" @click="handleApprove('disagree')">不 同 意</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { getapplyDetail,approveApply } from "@/api/business/apply";
import moment from 'moment';

export default {
  name: "ApplyDetail",
  data() {
    return {
      applyDetail: {},
      statusMap: {
        '0': '草稿',
        '1': '部门审批中',
        '2': '办公室审批中',
        '3': '分管领导审批中',
        '4': '调度中',
        '5': '已分配司机',
        '6': '审批被部门主管拒绝',
        '7': '审批被办公室拒绝',
        '8': '审批被分管领导拒绝'
      },
      applyId:0,
      dialogVisible: false,
      dialogTitle: '',
      approvalForm: {
        reason: ''
      },
      currentAction: ''
    };
  },
  created() {
    this.applyId = this.$route.params.id;
    // console.log('this.$route.params',this.$route.params)
    this.getApplyDetail(this.applyId );
  },
  methods: {
    goBack() {
      this.$router.go(-1);
    },
    parseTime(time) {
        if (!time) {
          return '';
        }
      return moment(time).format('YYYY-MM-DD HH:mm:ss');
    },
    getApplyDetail(applyId) {
        getapplyDetail(applyId).then(response => {
        this.applyDetail = response.data;
      });
    },
    handleApprove(action) {
      const reason = this.approvalForm.reason;

    //   if (!reason) {        //是否必填审批理由
    //     this.$message.warning('请输入审批理由');
    //     return;
    //   }

      const data = {
        applyId: this.applyId ,
        reason: reason,
        currentAction:this.currentAction ,      //审批角色  办公室  领导  。。。currentAction
        action: action
      };

      approveApply(data).then(response => {
        this.$message.success('审批成功');
        this.getApplyDetail(this.applyId );
        this.dialogVisible = false;
        this.approvalForm.reason = ''; // 清空审批理由
      }).catch(error => {
        this.$message.error('审批失败');
        console.error(error);
      });
    },
    handleDepApprove() {
      // 部门审批逻辑
      this.currentAction = "depApprove";
      this.dialogTitle = '部门审批' ;
      this.dialogVisible = true;
      this.approvalForm.reason = ''; // 清空审批理由
    },
    officeApprove() {
      // 部门审批逻辑
      this.currentAction = "officeApprove";
      this.dialogTitle = '办公室审批' ;
      this.dialogVisible = true;
      this.approvalForm.reason = ''; // 清空审批理由
    },
    handleLeaderApprove() {
      // 领导审批逻辑
      this.currentAction = "leaderApprove";
      this.dialogTitle = '领导审批' ;
      this.dialogVisible = true;
      this.approvalForm.reason = ''; // 清空审批理由
    },
    handleDispatch() {
      // 派车逻辑
    }
  }
}
</script>
<!-- <style scoped>
 .text-right {
  text-align: right;
}
.el-descriptions-item {
  min-width: 240px; /* 确保每个描述项有最小高度 */
} 
</style> -->