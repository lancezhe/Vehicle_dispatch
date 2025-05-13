<template>
  <div class="app-container">
    <!-- 搜索栏 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="80px">
      <el-form-item label="申请人" prop="applicantName">
        <el-input
          v-model="queryParams.applicantName"
          placeholder="请输入申请人姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="申请状态" clearable>
          <el-option
            v-for="dict in dict.type.vehicle_apply_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['businessapply:add']"
        >新建申请</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleWithdraw"
          v-hasPermi="['businessapply:delete']"
        >批量撤回</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['businessapply:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 申请列表表格 -->
    <el-table v-loading="loading" :data="applyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="申请单号" align="center" prop="id" />
      <el-table-column label="申请人" align="center" prop="applicantName" />
      <el-table-column label="使用人" align="center" prop="carUser" />
      <el-table-column label="出发地" align="center" prop="startLocation" />
      <el-table-column label="目的地" align="center" prop="endLocation" />
      <el-table-column label="出发时间" align="center" prop="startTime" width="100"/>
      <el-table-column label="结束时间" align="center" prop="endTime" width="100"/>
      <el-table-column label="机要用车" align="center" prop="secret">
        <template slot-scope="scope">
          {{ scope.row.secret === '1' ? '是' : '否' }}
        </template>
      </el-table-column>
      <el-table-column label="是否出市" align="center" prop="outCity">
        <template slot-scope="scope">
          {{ scope.row.outCity === '1' ? '是' : '否' }}
        </template>
      </el-table-column>
      <el-table-column label="部门审批" align="center" prop="depApproveName" />
      <el-table-column label="办公室" align="center" prop="offApproveName" />
      <el-table-column label="分管领导" align="center" prop="leaderApproveName" />
      <el-table-column label="调度员" align="center" prop="dispatcherName" />
      <el-table-column label="驾驶员" align="center" prop="driverName" />
      <el-table-column label="申请时间" align="center" prop="createTime" width="150">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status" width="120">
        <template slot-scope="scope">
          {{ statusMap[scope.row.status] }}
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="100">
        <template slot-scope="scope">
          <!-- 根据状态和权限显示不同操作 -->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-document"
            @click="handleDetails(scope.row)"
          >详情</el-button>
          <el-button
            v-if="['0','6','7','8'].includes(scope.row.status) "
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
          >修改</el-button>
          <el-button
            v-if="['0'].includes(scope.row.status) "
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['business:apply:delete']"
          >删除</el-button>
          <el-button
            v-if="['1','2','3','4','5'].includes(scope.row.status) "
            size="mini"
            type="text"
            icon="el-icon-s-check"
            @click="handleWithdraw(scope.row)"
            v-hasPermi="['business:apply:withdraw']"
          >撤回</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 申请表单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="申请部门" prop="department">
          <!-- <el-input v-model="form.department"  />  -->
          <treeselect v-model="form.department" :options="deptOptions" :normalizer="normalizer" placeholder="选择部门" />
        </el-form-item>
        <el-form-item label="申请人 " prop="applicantName">
          <el-input v-model="form.applicantName"  /> <!--disabled 自动关联当前用户 -->
        </el-form-item>
        <el-form-item label="申请人电话" prop="applicantPhone">
          <el-input v-model="form.applicantPhone"  /> <!--disabled 自动关联当前用户 -->
        </el-form-item>
        <el-form-item label="使用人" prop="carUser">
          <el-input v-model="form.carUser"  /> <!--disabled 自动关联当前用户 -->
        </el-form-item>
        <el-form-item label="使用人电话" prop="phoneUser">
          <el-input v-model="form.phoneUser"  /> <!--disabled 自动关联当前用户 -->
        </el-form-item>
        <el-form-item label="出发地 " prop="startLocation" >
          <el-input v-model="form.startLocation" placeholder="请输入出发地" />
        </el-form-item>
        <el-form-item label="目的地 " prop="endLocation">
          <el-input v-model="form.endLocation" placeholder="请输入目的地" />
        </el-form-item>
        <el-form-item label="是否出市" prop="outCity">
          <el-switch v-model="form.outCity" active-value="1" inactive-value="0"></el-switch>
        </el-form-item>
        <el-form-item label="机要用车" prop="secret">
          <el-switch v-model="form.secret" active-value="1" inactive-value="0"></el-switch>
        </el-form-item>
        <el-form-item label="用车时间" prop="useTime">
          <el-date-picker
            v-model="form.useTime"
            type="datetimerange"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="用车事由" prop="matter">
          <el-input v-model="form.matter" type="textarea" placeholder="请输入备注信息" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入备注信息" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm('1')">提交申请</el-button>
        <el-button type="primary" @click="submitForm('0')">保存为草稿</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listapply, getapplyDetail, deleteApply, withdrawApply, addapply, updateapply } from "@/api/business/apply"
import { listDept} from "@/api/system/dept"
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import store from "@/store";
import moment from 'moment';

export default {
  name: "Apply",
  dicts: ['sys_normal_disable'],
  components: { Treeselect },
  data() {
    return {
      // 数据状态
      loading: true,    //
      applyList: [],
      total: 0,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,

      // 对话框控制
      open: false,
      dispatchDialog: false,
      title: "",
      currentApplyId: null,

      // 表单数据
      form: {
        outCity: '0',
        secret: '0',
        routeType: '0',
        useTime: []
      },
      departmentOptions: [], // 从接口获取
      deptOptions:[],
      fixedRoutes: [],       // 从接口获取

      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        applicantName: undefined,
        status: undefined
      },

      // 校验规则
      rules: {
        department: [{ required: true, message: "请选择部门", trigger: "blur" }],
        applicantName: [{ required: true, message: "请输入申请人姓名", trigger: "blur" }],
        applicantPhone: [{ required: true, message: "请输入申请人联系方式", trigger: "blur" }],
        startLocation: [{ required: true, message: "请输入出发地", trigger: "blur" }],
        endLocation: [{ required: true, message: "请输入目的地", trigger: "blur" }],
        useTime: [{ required: true, message: "请选择用车时间", trigger: "blur" }],
        carUser: [{ required: true, message: "请输入使用人", trigger: "change" }],
        phoneUser: [{ required: true, message: "请输入使用人手机", trigger: "change" }],
      },
      userinfo: store.getters.userinfo, // 裁剪图片的地址

      // 状态映射对象
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
      }
    };
  },
  created() {
    this.getList()
    this.getDepartments()
    this.getFixedRoutes()
  },
  methods: {
    /** 查询用车列表 */
    getList() {
      this.loading = true
      listapply(this.queryParams).then(response => {
        this.applyList = response.rows
        console.log('this.applyList',this.applyList)
        this.total = response.total
        this.loading = false
      })
      console.log('this.userinfo',this.userinfo)
    },
    /** 转换部门数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.deptId,
        label: node.deptName,
        children: node.children
      };
    },
    /** 获取部门数据 */
    getDepartments() {
      listDept().then(response => {
        this.deptOptions = this.handleTree(response.data, "deptId");
      });
      // // 调用部门接口
      // this.departmentOptions = [{ label: '技术部', value: 'tech' }] // 示例数据
    },

    /** 获取固定行程 */
    getFixedRoutes() {
      // 调用固定行程接口
      this.fixedRoutes = [
        { id: 1, start: '舟山海关', end: '宁波机场' }
      ]
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        applyId: undefined,
        applyCode: undefined,
        applyName: undefined,
        // applySort: 0,
        // status: "0",
        remark: undefined
      }
      this.resetForm("form")
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      console.log('selection',selection)
      this.ids = selection.map(item => item.id)
      this.single = selection.length!=1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.form.applicantName = this.userinfo.nickName // 设置默认值为当前用户的昵称
      this.form.applicantId = this.userinfo.userId // 设置默认值为当前用户的昵称
      this.form.applicantPhone = this.userinfo.phonenumber
      // this.form.department = this.userinfo.dept.deptName
      // console.log('this.userinfo.dept.deptName',this.userinfo.dept.deptName)
      this.open = true
      this.title = "申请用车"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      console.log('row',row,'this.form',this.form)
      // this.reset()
      this.form = { ...row } // 先深拷贝 row，避免引用污染源数据
      // 使用 $set 强制触发响应式更新 不然改了后页面还会显示老的数据      // this.form.useTime = [this.form.startTime, this.form.endTime]
      this.$set(this.form, 'useTime', [
        this.form.startTime,
        this.form.endTime
      ])

      console.log('this.form1',this.form)
      // this.form.applicantId = this.userinfo.userId // 设置默认值为当前用户的昵称
      // this.form.applicantPhone = this.userinfo.phonenumber
      // this.form.department = this.userinfo.dept.deptName
      // console.log('this.userinfo.dept.deptName',this.userinfo.dept.deptName)
      this.open = true
      this.title = "修改申请用车"
    },
    /** 提交按钮 */
    submitForm: function(status) {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.startTime = moment(this.form.useTime[0]).format('YYYY-MM-DD HH:mm:ss')
          this.form.endTime = moment(this.form.useTime[1]).format('YYYY-MM-DD HH:mm:ss')
          console.log('this.form',this.form)
          this.form.status = status
          if (this.title === "修改申请用车") {
            updateapply(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addapply(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 查看详情 */
    handleDetails(row) {
      // console.log('row',row)
      this.$router.push({ name: 'ApplyDetail', params: { id: row.id } })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认删除用车编号为"' + ids + '"的数据项？').then(function() {
        return deleteApply([ids])
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    // 撤回
    handleWithdraw(row){
      console.log('ids',ids,row)
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认撤回用车编号为"' + ids + '"的数据项？').then(function() {
        return withdrawApply([ids])
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("撤回成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('business/apply/export', {
        ...this.queryParams
      }, `apply_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
