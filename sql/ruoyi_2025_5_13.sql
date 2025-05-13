/*
 Navicat Premium Data Transfer

 Source Server         : 11_lance_centos
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 112.15.56.86:65306
 Source Schema         : ruoyi

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 13/05/2025 14:21:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for bus_apply
-- ----------------------------
DROP TABLE IF EXISTS `bus_apply`;
CREATE TABLE `bus_apply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '申请单号',
  `applicant_id` bigint(20) NOT NULL COMMENT '申请人ID',
  `applicant_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '申请人姓名',
  `applicant_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请人电话',
  `department` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '申请人所在部门',
  `car_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '使用人姓名',
  `phone_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用电话',
  `matter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用车事由',
  `start_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '出发地',
  `end_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目的地',
  `start_time` datetime NULL DEFAULT NULL COMMENT '出发时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `out_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否出市',
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机要用车',
  `apply_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0-5）',
  `dep_approve_id` bigint(20) NULL DEFAULT NULL COMMENT '部门审批人ID',
  `dep_approve_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门审批人姓名',
  `dep_approve_time` datetime NULL DEFAULT NULL COMMENT '部门审批时间',
  `off_approve_id` bigint(20) NULL DEFAULT NULL COMMENT '办公室审批人ID',
  `off_approve_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '办公室审核人姓名',
  `off_approve_time` datetime NULL DEFAULT NULL COMMENT '办公室审批时间',
  `leader_approve_id` bigint(20) NULL DEFAULT NULL COMMENT '分管领导ID',
  `leader_approve_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分管领导姓名',
  `leader_approve_time` datetime NULL DEFAULT NULL COMMENT '分管领导审批时间',
  `dispatcher_id` bigint(20) NULL DEFAULT NULL COMMENT '调度员ID',
  `dispatcher_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调度员姓名',
  `dispatcher_approve_time` datetime NULL DEFAULT NULL COMMENT '调度员审批时间',
  `vehicle_id` bigint(20) NULL DEFAULT NULL COMMENT '车辆ID',
  `driver_id` bigint(20) NULL DEFAULT NULL COMMENT '驾驶员ID',
  `driver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶员姓名',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批未通过 拒绝理由',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` bigint(20) NULL DEFAULT NULL COMMENT '删除标志（0正常，1删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆调度申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_apply
-- ----------------------------
INSERT INTO `bus_apply` VALUES (1, 1564678123, '李泽昊', NULL, '法规科', '1', NULL, NULL, '舟山', '杭州', NULL, NULL, '', '', '2025-04-26 20:02:21', '0', 1, 'admin', '2025-04-26 20:02:26', 1, 'admin', '2025-04-29 16:39:03', NULL, '若依', '2025-04-29 16:39:29', 97, '徐若曦', '2025-04-26 20:02:40', 1, 1, '张明远', '1', '2025-04-26 20:02:46', 'admin', '2025-04-30 18:56:37', '', '1', 1);
INSERT INTO `bus_apply` VALUES (2, 1, '若依', '15888888888', '100', '林', '112323213', '2222', '舟山', '宁波', '2025-04-10 00:00:00', '2025-04-12 00:00:00', '0', '0', NULL, '4', 1, '若依', '2025-04-30 15:33:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'admin', NULL, '', '34444', 0);
INSERT INTO `bus_apply` VALUES (3, 1, '若依', '15888888888', '100', '林大大', '13566666666', '11111', '舟山', '宁波', '2025-04-15 00:00:00', '2025-05-18 00:00:00', '1', '1', NULL, '1', 1, '若依', '2025-04-29 16:41:07', 1, '若依', '2025-04-29 16:41:49', NULL, '若依', '2025-04-29 16:42:11', NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'admin', NULL, '', '22222', 0);
INSERT INTO `bus_apply` VALUES (4, 1, '若依', '15888888888', '100', '1', '111', '11', '1', '1', '2025-04-11 00:00:00', '2025-05-14 00:00:00', '0', '0', NULL, '0', 1, '若依', '2025-04-29 16:41:26', NULL, '若依', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'admin', NULL, '', '11', 0);
INSERT INTO `bus_apply` VALUES (5, 1, '若依', '15888888888', '100', '111', '111', NULL, '111', '111', '2025-04-07 00:00:00', '2025-04-17 00:00:00', '0', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'admin', '2025-04-29 16:13:38', NULL, NULL, 1);
INSERT INTO `bus_apply` VALUES (6, 1, '若依', '15888888888', '202', '沈依存', '123232', '又是', '舟山', '宁波', '2025-04-08 00:00:00', '2025-04-24 00:00:00', '1', '1', NULL, '7', 1, '若依', '2025-04-30 18:56:58', 1, '若依', '2025-05-13 14:03:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'admin', NULL, '', '没什么111', 0);
INSERT INTO `bus_apply` VALUES (7, 1, '若依', '15888888888', '100', '1', '1', NULL, '1', '1', '2025-04-23 00:00:00', '2025-04-25 00:00:00', '0', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'admin', NULL, '', NULL, 0);
INSERT INTO `bus_apply` VALUES (8, 1, '若依', '15888888888', '202', '林三', '13611112222', '出去', '舟山', '宁波', '2025-04-15 00:00:00', '2025-04-24 00:00:00', '0', '1', NULL, '0', 1, '若依', '2025-04-30 10:10:16', 1, '若依', '2025-04-30 10:10:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'admin', NULL, '', '哈哈哈', 0);
INSERT INTO `bus_apply` VALUES (9, 1, '若依', '15888888888', '203', '陈诺', '13812531562', '初始', '舟山', '宁波', '2025-04-17 00:00:00', '2025-05-21 00:00:00', '0', '1', NULL, '0', 1, '若依', '2025-04-30 10:16:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'admin', NULL, '', '哈哈哈', 0);
INSERT INTO `bus_apply` VALUES (10, 1, '若依', '15888888888', '204', '谢娜', '13921531453', '2222', '舟山', '宁波', '2025-04-24 00:00:00', '2025-04-26 00:00:00', '0', '1', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, NULL, '5555', 0);
INSERT INTO `bus_apply` VALUES (11, 1, '若依', '15888888888', '100', '22', '22', NULL, '22', '22', '2025-04-16 00:00:00', '2025-04-24 00:00:00', '0', '1', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `bus_apply` VALUES (12, 1, '若依', '15888888888', '100', '22', '22', NULL, '22', '22', '2025-04-16 00:00:00', '2025-04-24 00:00:00', '1', '0', NULL, '3', 1, '若依', '2025-04-30 10:24:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'admin', NULL, '', NULL, 0);
INSERT INTO `bus_apply` VALUES (13, 1, '若依', '15888888888', '100', '1', '1', '1', '1', '1', '2025-04-16 00:00:00', '2025-04-24 00:00:00', '0', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'admin', '2025-04-30 10:29:06', NULL, '1', 1);
INSERT INTO `bus_apply` VALUES (14, 1, '若依', '15888888888', '100', '11', '1', NULL, '1', '1', '2025-04-08 00:00:00', '2025-04-24 00:00:00', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `bus_apply` VALUES (15, 1, '若依', '15888888888', '100', '1', '1', NULL, '1', '1', '2025-04-16 00:00:00', '2025-04-23 00:00:00', '0', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `bus_apply` VALUES (16, 1, '若依', '15888888888', '100', '2', '2', NULL, '2', '2', '2025-04-23 00:00:00', '2025-04-25 00:00:00', '0', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'admin', '2025-04-30 10:45:06', NULL, NULL, 1);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-04-25 16:13:04', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-04-25 16:13:04', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-04-25 16:13:04', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-04-25 16:13:04', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-04-25 16:13:04', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-04-25 16:13:04', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 213 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '舟山海关', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-25 16:13:04', 'admin', '2025-04-26 09:48:23');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '总部', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-25 16:13:04', 'admin', '2025-04-26 09:49:09');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-04-25 16:13:04', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '办公室', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-25 16:13:04', 'admin', '2025-04-26 09:54:26');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-04-25 16:13:04', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '法规科', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-25 16:13:04', 'admin', '2025-04-26 10:00:10');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-04-25 16:13:04', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-04-25 16:13:04', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-04-25 16:13:04', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-04-25 16:13:04', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '分部', 2, NULL, NULL, NULL, '0', '0', 'admin', '2025-04-26 09:49:39', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 101, '0,100,101', '财务科', 2, NULL, NULL, NULL, '0', '0', 'admin', '2025-04-26 09:55:01', 'admin', '2025-04-26 10:00:24');
INSERT INTO `sys_dept` VALUES (202, 101, '0,100,101', '科技科', 4, NULL, NULL, NULL, '0', '0', 'admin', '2025-04-26 09:55:22', 'admin', '2025-04-26 10:00:34');
INSERT INTO `sys_dept` VALUES (203, 101, '0,100,101', '督察内控科', 5, NULL, NULL, NULL, '0', '0', 'admin', '2025-04-26 09:55:49', 'admin', '2025-04-26 10:00:45');
INSERT INTO `sys_dept` VALUES (204, 101, '0,100,101', '人事教育科', 6, NULL, NULL, NULL, '0', '0', 'admin', '2025-04-26 09:56:03', 'admin', '2025-04-26 10:00:56');
INSERT INTO `sys_dept` VALUES (205, 101, '0,100,101', '政工科', 7, NULL, NULL, NULL, '0', '0', 'admin', '2025-04-26 09:56:22', 'admin', '2025-04-26 10:01:05');
INSERT INTO `sys_dept` VALUES (206, 101, '0,100,101', '综合业务一科', 8, NULL, NULL, NULL, '0', '0', 'admin', '2025-04-26 09:56:39', 'admin', '2025-04-26 10:01:21');
INSERT INTO `sys_dept` VALUES (207, 101, '0,100,101', '综合业务二科', 9, NULL, NULL, NULL, '0', '0', 'admin', '2025-04-26 09:57:06', 'admin', '2025-04-26 10:01:38');
INSERT INTO `sys_dept` VALUES (208, 101, '0,100,101', '综合业务三科', 10, NULL, NULL, NULL, '0', '0', 'admin', '2025-04-26 09:57:31', 'admin', '2025-04-26 10:01:59');
INSERT INTO `sys_dept` VALUES (209, 101, '0,100,101', '税收管理科', 11, NULL, NULL, NULL, '0', '0', 'admin', '2025-04-26 10:02:15', '', NULL);
INSERT INTO `sys_dept` VALUES (210, 101, '0,100,101', '监管一科至监管六科', 11, NULL, NULL, NULL, '0', '0', 'admin', '2025-04-26 10:02:34', '', NULL);
INSERT INTO `sys_dept` VALUES (211, 101, '0,100,101', '物流监控科', 12, NULL, NULL, NULL, '0', '0', 'admin', '2025-04-26 10:02:49', '', NULL);
INSERT INTO `sys_dept` VALUES (212, 101, '0,100,101', '海上监管科', 13, NULL, NULL, NULL, '0', '0', 'admin', '2025-04-26 10:03:01', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-04-25 16:13:04', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-25 18:35:02');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-26 09:05:14');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-26 11:13:42');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '退出成功', '2025-04-26 11:27:37');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-26 11:27:41');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-26 14:13:08');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-26 15:38:30');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-26 16:59:04');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-26 18:25:25');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-26 19:22:12');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-26 19:57:52');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '192.168.0.119', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-04-27 11:13:58');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '1', '验证码已失效', '2025-04-27 11:16:58');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-27 11:17:02');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-27 13:52:06');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '退出成功', '2025-04-27 14:17:24');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-27 14:17:32');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '退出成功', '2025-04-27 14:21:15');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-27 14:21:19');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-27 16:46:52');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-28 08:40:17');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-28 10:13:15');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-28 12:42:44');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-28 13:31:33');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-29 08:31:39');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '退出成功', '2025-04-29 08:52:06');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-29 08:52:10');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-29 13:33:40');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-29 15:38:56');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-30 09:57:52');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '1', '验证码错误', '2025-04-30 13:27:29');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-30 13:27:33');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-30 14:08:09');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-30 18:55:18');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-05-13 14:00:07');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 2, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-04-25 16:13:04', 'admin', '2025-04-26 11:38:44', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 5, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-04-25 16:13:04', 'admin', '2025-04-26 11:38:57', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-04-25 16:13:04', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2025-04-25 16:13:04', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-04-25 16:13:04', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-04-25 16:13:04', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-04-25 16:13:04', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-04-25 16:13:04', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-04-25 16:13:04', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-04-25 16:13:04', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-04-25 16:13:04', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-04-25 16:13:04', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-04-25 16:13:04', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-04-25 16:13:04', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-04-25 16:13:04', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-04-25 16:13:04', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-04-25 16:13:04', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-04-25 16:13:04', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-04-25 16:13:04', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-04-25 16:13:04', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-04-25 16:13:04', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-04-25 16:13:04', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-04-25 16:13:04', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-04-25 16:13:04', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '业务管理', 0, 1, 'business', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'form', 'admin', '2025-04-26 11:22:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '用车列表', 2000, 1, 'apply', 'business/apply/index', NULL, '', 1, 0, 'C', '0', '0', 'business:apply:index', 'clipboard', 'admin', '2025-04-26 11:25:51', 'admin', '2025-04-29 09:23:19', '');
INSERT INTO `sys_menu` VALUES (2002, '申请列表', 2000, 3, 'applylist', 'business/applylist/index', NULL, '', 1, 0, 'C', '0', '1', 'business:applylist:index', 'post', 'admin', '2025-04-26 11:40:53', 'admin', '2025-04-30 18:55:59', '');
INSERT INTO `sys_menu` VALUES (2003, '车辆管理', 2000, 5, 'vehicle', 'business/vehicle/index', NULL, '', 1, 0, 'C', '0', '0', 'business:vehicle:index', 'shopping', 'admin', '2025-04-26 11:49:38', 'admin', '2025-04-26 11:50:41', '');
INSERT INTO `sys_menu` VALUES (2004, '删除', 2001, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'business:apply:delete', '#', 'admin', '2025-04-28 14:44:08', 'admin', '2025-04-28 16:04:23', '');
INSERT INTO `sys_menu` VALUES (2005, '审批', 2001, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'business:apply:approve', '#', 'admin', '2025-04-28 14:45:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '派车', 2001, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'business:apply:dispatch', '#', 'admin', '2025-04-28 14:46:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '修改', 2001, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'business:apply:edit', '#', 'admin', '2025-04-28 15:26:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '撤回', 2001, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'business:apply:withdraw', '#', 'admin', '2025-04-28 15:27:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '用车列表详情', 2000, 0, 'detail/:id', 'business/apply/detail', NULL, 'ApplyDetail', 1, 0, 'C', '1', '0', 'business:apply:detail', 'build', 'admin', '2025-04-29 08:51:18', 'admin', '2025-04-29 10:28:26', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-04-25 16:13:04', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-04-25 16:13:04', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 275 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"test1\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"sex\":\"1\",\"status\":\"0\",\"userId\":100,\"userName\":\"test1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-25 18:51:46', 257);
INSERT INTO `sys_oper_log` VALUES (101, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-25 18:51:46\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"test1\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"test1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-25 18:52:20', 331);
INSERT INTO `sys_oper_log` VALUES (102, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-25 16:13:04\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"车辆管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:06:38', 261);
INSERT INTO `sys_oper_log` VALUES (103, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":100,\"roleKey\":\"department\",\"roleName\":\"部门申请员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:08:39', 200);
INSERT INTO `sys_oper_log` VALUES (104, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":101,\"roleKey\":\"manager\",\"roleName\":\"部门负责人\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:10:14', 211);
INSERT INTO `sys_oper_log` VALUES (105, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":102,\"roleKey\":\"office\",\"roleName\":\"办公室负责人\",\"roleSort\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:11:02', 180);
INSERT INTO `sys_oper_log` VALUES (106, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":103,\"roleKey\":\"dispatcher\",\"roleName\":\"综合调度员\",\"roleSort\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:14:44', 209);
INSERT INTO `sys_oper_log` VALUES (107, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-26 09:14:44\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":103,\"roleKey\":\"dispatcher\",\"roleName\":\"综合调度员\",\"roleSort\":6,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:14:51', 225);
INSERT INTO `sys_oper_log` VALUES (108, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":104,\"roleKey\":\"driver\",\"roleName\":\"驾驶员\",\"roleSort\":7,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:15:56', 185);
INSERT INTO `sys_oper_log` VALUES (109, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '102', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2025-04-26 09:18:03', 26);
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/108', '127.0.0.1', '内网IP', '108', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:18:11', 86);
INSERT INTO `sys_oper_log` VALUES (111, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '109', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:18:15', 80);
INSERT INTO `sys_oper_log` VALUES (112, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '102', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:18:18', 83);
INSERT INTO `sys_oper_log` VALUES (113, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '105', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2025-04-26 09:46:59', 69);
INSERT INTO `sys_oper_log` VALUES (114, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/106', '127.0.0.1', '内网IP', '106', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:47:04', 134);
INSERT INTO `sys_oper_log` VALUES (115, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/107', '127.0.0.1', '内网IP', '107', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:47:07', 112);
INSERT INTO `sys_oper_log` VALUES (116, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/104', '127.0.0.1', '内网IP', '104', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:47:09', 105);
INSERT INTO `sys_oper_log` VALUES (117, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '103', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2025-04-26 09:47:12', 54);
INSERT INTO `sys_oper_log` VALUES (118, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"舟山海关\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:48:23', 176);
INSERT INTO `sys_oper_log` VALUES (119, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"总部\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"舟山海关\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:49:09', 342);
INSERT INTO `sys_oper_log` VALUES (120, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"分部\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:49:40', 139);
INSERT INTO `sys_oper_log` VALUES (121, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"综合管理部\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"总部\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:50:22', 271);
INSERT INTO `sys_oper_log` VALUES (122, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"办公室\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"总部\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:54:26', 273);
INSERT INTO `sys_oper_log` VALUES (123, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"法规处\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"总部\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:54:38', 223);
INSERT INTO `sys_oper_log` VALUES (124, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"综合业务处\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:55:01', 111);
INSERT INTO `sys_oper_log` VALUES (125, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"关税处\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:55:22', 111);
INSERT INTO `sys_oper_log` VALUES (126, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":201,\"deptName\":\"综合业务处\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"总部\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:55:30', 273);
INSERT INTO `sys_oper_log` VALUES (127, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"卫生检疫处\",\"orderNum\":5,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:55:50', 139);
INSERT INTO `sys_oper_log` VALUES (128, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"动植物检疫处\",\"orderNum\":6,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:56:03', 136);
INSERT INTO `sys_oper_log` VALUES (129, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"进出口食品安全处\",\"orderNum\":7,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:56:22', 138);
INSERT INTO `sys_oper_log` VALUES (130, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"商品检验处\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:56:39', 140);
INSERT INTO `sys_oper_log` VALUES (131, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"口岸监管处\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:57:06', 138);
INSERT INTO `sys_oper_log` VALUES (132, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":207,\"deptName\":\"口岸监管处\",\"orderNum\":9,\"params\":{},\"parentId\":101,\"parentName\":\"总部\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:57:13', 273);
INSERT INTO `sys_oper_log` VALUES (133, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"统计分析处\",\"orderNum\":10,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 09:57:31', 138);
INSERT INTO `sys_oper_log` VALUES (134, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"法规科\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"总部\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:00:10', 275);
INSERT INTO `sys_oper_log` VALUES (135, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":201,\"deptName\":\"财务科\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"总部\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:00:25', 275);
INSERT INTO `sys_oper_log` VALUES (136, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":202,\"deptName\":\"科技科\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"parentName\":\"总部\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:00:34', 271);
INSERT INTO `sys_oper_log` VALUES (137, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":203,\"deptName\":\"督察内控科\",\"orderNum\":5,\"params\":{},\"parentId\":101,\"parentName\":\"总部\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:00:45', 275);
INSERT INTO `sys_oper_log` VALUES (138, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":204,\"deptName\":\"人事教育科\",\"orderNum\":6,\"params\":{},\"parentId\":101,\"parentName\":\"总部\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:00:56', 272);
INSERT INTO `sys_oper_log` VALUES (139, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":205,\"deptName\":\"政工科\",\"orderNum\":7,\"params\":{},\"parentId\":101,\"parentName\":\"总部\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:01:05', 275);
INSERT INTO `sys_oper_log` VALUES (140, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"综合业务一科\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"parentName\":\"总部\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:01:21', 278);
INSERT INTO `sys_oper_log` VALUES (141, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":207,\"deptName\":\"综合业务二科\",\"orderNum\":9,\"params\":{},\"parentId\":101,\"parentName\":\"总部\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:01:38', 272);
INSERT INTO `sys_oper_log` VALUES (142, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":208,\"deptName\":\"综合业务三科\",\"orderNum\":10,\"params\":{},\"parentId\":101,\"parentName\":\"总部\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:01:59', 273);
INSERT INTO `sys_oper_log` VALUES (143, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"税收管理科\",\"orderNum\":11,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:02:15', 139);
INSERT INTO `sys_oper_log` VALUES (144, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"监管一科至监管六科\",\"orderNum\":11,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:02:34', 142);
INSERT INTO `sys_oper_log` VALUES (145, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"物流监控科\",\"orderNum\":12,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:02:49', 137);
INSERT INTO `sys_oper_log` VALUES (146, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"海上监管科\",\"orderNum\":13,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:03:02', 136);
INSERT INTO `sys_oper_log` VALUES (147, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-25 18:51:46\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"办公室\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"张明远\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"车辆管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"test1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:05:49', 305);
INSERT INTO `sys_oper_log` VALUES (148, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"李泽昊\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":101,\"userName\":\"李泽昊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:06:22', 273);
INSERT INTO `sys_oper_log` VALUES (149, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-26 10:06:22\",\"delFlag\":\"0\",\"deptId\":201,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"李泽昊\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"李泽昊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:07:24', 391);
INSERT INTO `sys_oper_log` VALUES (150, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":105,\"nickName\":\"王奕辰\",\"params\":{},\"postIds\":[],\"roleIds\":[100,101],\"status\":\"0\",\"userId\":102,\"userName\":\"王奕辰\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:08:31', 280);
INSERT INTO `sys_oper_log` VALUES (151, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":105,\"nickName\":\"赵雅晴\",\"params\":{},\"postIds\":[],\"roleIds\":[103],\"status\":\"0\",\"userId\":103,\"userName\":\"赵雅晴\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:09:19', 333);
INSERT INTO `sys_oper_log` VALUES (152, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-25 18:51:46\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"办公室\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"张明远\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"车辆管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"test1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:09:59', 299);
INSERT INTO `sys_oper_log` VALUES (153, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":202,\"nickName\":\"孙婉婷\",\"params\":{},\"postIds\":[],\"roleIds\":[102],\"sex\":\"1\",\"status\":\"0\",\"userId\":104,\"userName\":\"孙婉婷\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:10:59', 277);
INSERT INTO `sys_oper_log` VALUES (154, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"郑天磊\",\"params\":{},\"postIds\":[],\"roleIds\":[104],\"status\":\"0\",\"userId\":105,\"userName\":\"郑天磊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:11:33', 335);
INSERT INTO `sys_oper_log` VALUES (155, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"徐若曦\",\"params\":{},\"postIds\":[],\"roleIds\":[2,100,101,104,102,103],\"status\":\"0\",\"userId\":106,\"userName\":\"徐若曦\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:12:26', 284);
INSERT INTO `sys_oper_log` VALUES (156, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":105,\"roleKey\":\"leadership\",\"roleName\":\"分管综合领导\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:13:47', 303);
INSERT INTO `sys_oper_log` VALUES (157, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-26 10:13:47\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":105,\"roleKey\":\"leadership\",\"roleName\":\"分管综合领导\",\"roleSort\":8,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:14:05', 292);
INSERT INTO `sys_oper_log` VALUES (158, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"黄哲瀚\",\"params\":{},\"postIds\":[],\"roleIds\":[105],\"status\":\"0\",\"userId\":107,\"userName\":\"黄哲瀚\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 10:14:37', 336);
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"业务管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"business\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 11:22:13', 130);
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/apply/index\",\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用车申请\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"apply\",\"perms\":\"business:apply:index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 11:25:51', 102);
INSERT INTO `sys_oper_log` VALUES (161, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-26 09:08:39\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2000,2001,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":100,\"roleKey\":\"department\",\"roleName\":\"部门申请员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 11:26:23', 277);
INSERT INTO `sys_oper_log` VALUES (162, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-26 09:10:14\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2000,2001,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":101,\"roleKey\":\"manager\",\"roleName\":\"部门负责人\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 11:28:33', 275);
INSERT INTO `sys_oper_log` VALUES (163, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-26 09:11:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2000,2001,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":102,\"roleKey\":\"office\",\"roleName\":\"办公室负责人\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 11:28:39', 250);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '办公室', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-04-26 11:38:28', 53);
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-25 16:13:04\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 11:38:44', 75);
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-25 16:13:04\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 11:38:57', 78);
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/urging/index\",\"createBy\":\"admin\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"催办流程进度\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"urging\",\"perms\":\"business:urging:index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 11:40:54', 103);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/applylist/index\",\"createTime\":\"2025-04-26 11:40:53\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"申请列表\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"applylist\",\"perms\":\"business:applylist:index\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 11:45:15', 79);
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/vehicle/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"车辆管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"vehicle\",\"perms\":\"business:vehicle:index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 11:49:38', 94);
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/vehicle/index\",\"createTime\":\"2025-04-26 11:49:38\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"车辆管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"vehicle\",\"perms\":\"business:vehicle:index\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 11:50:41', 82);
INSERT INTO `sys_oper_log` VALUES (171, '岗位管理', 5, 'com.ruoyi.web.controller.system.SysPostController.export()', 'POST', 1, 'admin', '办公室', '/system/post/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-26 12:27:38', 1189);
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/apply/index\",\"createTime\":\"2025-04-26 11:25:51\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"用车列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"apply\",\"perms\":\"business:apply:index\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 21:04:36', 91);
INSERT INTO `sys_oper_log` VALUES (173, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"1\",\"params\":{},\"startLocation\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'1\',\n			\'1\',\n			null,\n			null,\n	\' at line 30\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bus_apply(         applicant_id,     applicant_name,     department,    start_location,    end_location,    apply_time,    status,                                                                                create_by,     create_time,                  )values(         ?,     ?,     ?,    ?,    ?,    ?,    ?,                                                                                ?,     ?,                  )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'1\',\n			\'1\',\n			null,\n			null,\n	\' at line 30\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'1\',\n			\'1\',\n			null,\n			null,\n	\' at line 30', '2025-04-28 08:51:26', 21710);
INSERT INTO `sys_oper_log` VALUES (174, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"1\",\"params\":{},\"startLocation\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'1\',\n			\'1\',\n			null,\n			null,\n	\' at line 30\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bus_apply(         applicant_id,     applicant_name,     department,    start_location,    end_location,    apply_time,    status,                                                                                create_by,     create_time,                  )values(         ?,     ?,     ?,    ?,    ?,    ?,    ?,                                                                                ?,     ?,                  )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'1\',\n			\'1\',\n			null,\n			null,\n	\' at line 30\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'1\',\n			\'1\',\n			null,\n			null,\n	\' at line 30', '2025-04-28 08:52:49', 48578);
INSERT INTO `sys_oper_log` VALUES (175, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"宁波\",\"params\":{},\"remark\":\"66666\",\"startLocation\":\"舟山\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'舟山\',\n			\'宁波\',\n			null,\n\' at line 30\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bus_apply(         applicant_id,     applicant_name,     department,    start_location,    end_location,    apply_time,    status,                                                                                create_by,     create_time,               remark,    )values(         ?,     ?,     ?,    ?,    ?,    ?,    ?,                                                                                ?,     ?,               ?,    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'舟山\',\n			\'宁波\',\n			null,\n\' at line 30\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'舟山\',\n			\'宁波\',\n			null,\n\' at line 30', '2025-04-28 08:54:16', 63);
INSERT INTO `sys_oper_log` VALUES (176, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"22\",\"params\":{},\"remark\":\"444\",\"startLocation\":\"11\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'11\',\n			\'22\',\n			null,\n			null,\' at line 30\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bus_apply(         applicant_id,     applicant_name,     department,    start_location,    end_location,    apply_time,    status,                                                                                create_by,     create_time,               remark,    )values(         ?,     ?,     ?,    ?,    ?,    ?,    ?,                                                                                ?,     ?,               ?,    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'11\',\n			\'22\',\n			null,\n			null,\' at line 30\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'11\',\n			\'22\',\n			null,\n			null,\' at line 30', '2025-04-28 09:07:04', 9867);
INSERT INTO `sys_oper_log` VALUES (177, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"22\",\"params\":{},\"remark\":\"444\",\"startLocation\":\"11\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'11\',\n			\'22\',\n			null,\n			null,\' at line 30\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bus_apply(         applicant_id,     applicant_name,     department,    start_location,    end_location,    apply_time,    status,                                                                                create_by,     create_time,               remark,    )values(         ?,     ?,     ?,    ?,    ?,    ?,    ?,                                                                                ?,     ?,               ?,    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'11\',\n			\'22\',\n			null,\n			null,\' at line 30\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'11\',\n			\'22\',\n			null,\n			null,\' at line 30', '2025-04-28 09:08:33', 6211);
INSERT INTO `sys_oper_log` VALUES (178, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"22\",\"params\":{},\"remark\":\"444\",\"startLocation\":\"11\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'11\',\n			\'22\',\n			null,\n			null,\' at line 30\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bus_apply(         applicant_id,     applicant_name,     department,    start_location,    end_location,    apply_time,    status,                                                                                create_by,     create_time,               remark,    )values(         ?,     ?,     ?,    ?,    ?,    ?,    ?,                                                                                ?,     ?,               ?,    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'11\',\n			\'22\',\n			null,\n			null,\' at line 30\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'11\',\n			\'22\',\n			null,\n			null,\' at line 30', '2025-04-28 09:08:58', 2859);
INSERT INTO `sys_oper_log` VALUES (179, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"2\",\"params\":{},\"startLocation\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'1\',\n			\'2\',\n			null,\n			null,\n	\' at line 30\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bus_apply(         applicant_id,     applicant_name,     department,    start_location,    end_location,    apply_time,    status,                                                                                create_by,     create_time,                  )values(         ?,     ?,     ?,    ?,    ?,    ?,    ?,                                                                                ?,     ?,                  )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'1\',\n			\'2\',\n			null,\n			null,\n	\' at line 30\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'1\',\n			\'2\',\n			null,\n			null,\n	\' at line 30', '2025-04-28 09:10:08', 5476);
INSERT INTO `sys_oper_log` VALUES (180, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"222\",\"endTime\":\"2025-04-23T16:00:00.000Z\",\"params\":{},\"remark\":\"444\",\"startLocation\":\"111\",\"startTime\":\"2025-04-15T16:00:00.000Z\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'111\',\n			\'222\',\n			null,\n			nul\' at line 32\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bus_apply(         applicant_id,     applicant_name,     department,    start_location,    end_location,    start_time,    end_time,    apply_time,    status,                                                                                create_by,     create_time,               remark,    )values(         ?,     ?,     ?,    ?,    ?,    ?,    ?,                                                                                ?,     ?,               ?,    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'111\',\n			\'222\',\n			null,\n			nul\' at line 32\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'111\',\n			\'222\',\n			null,\n			nul\' at line 32', '2025-04-28 09:31:15', 15038);
INSERT INTO `sys_oper_log` VALUES (181, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"5\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"22\",\"endTime\":\"2025-04-24T16:00:00.000Z\",\"matter\":\"3\",\"params\":{},\"phoneUser\":\"6\",\"remark\":\"4\",\"startLocation\":\"11\",\"startTime\":\"2025-04-15T16:00:00.000Z\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'11\',\n			\'22\',\n			null,\n			null,\' at line 32\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bus_apply(         applicant_id,     applicant_name,     department,    start_location,    end_location,    start_time,    end_time,    apply_time,    status,                                                                                create_by,     create_time,               remark,    )values(         ?,     ?,     ?,    ?,    ?,    ?,    ?,                                                                                ?,     ?,               ?,    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'11\',\n			\'22\',\n			null,\n			null,\' at line 32\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'11\',\n			\'22\',\n			null,\n			null,\' at line 32', '2025-04-28 10:13:51', 4597);
INSERT INTO `sys_oper_log` VALUES (182, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"5\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"22\",\"endTime\":\"2025-04-24T16:00:00.000Z\",\"matter\":\"3\",\"params\":{},\"phoneUser\":\"6\",\"remark\":\"4\",\"startLocation\":\"11\",\"startTime\":\"2025-04-15T16:00:00.000Z\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'11\',\n			\'22\',\n			null,\n			null,\' at line 32\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bus_apply(         applicant_id,     applicant_name,     department,    start_location,    end_location,    start_time,    end_time,    apply_time,    status,                                                                                create_by,     create_time,               remark,    )values(         ?,     ?,     ?,    ?,    ?,    ?,    ?,                                                                                ?,     ?,               ?,    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'11\',\n			\'22\',\n			null,\n			null,\' at line 32\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'11\',\n			\'22\',\n			null,\n			null,\' at line 32', '2025-04-28 10:14:29', 18482);
INSERT INTO `sys_oper_log` VALUES (183, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"林工\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"宁波\",\"endTime\":\"2025-04-24T16:00:00.000Z\",\"matter\":\"想去\",\"params\":{},\"phoneUser\":\"1235768768\",\"remark\":\"哈哈哈\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-07T16:00:00.000Z\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'舟山\',\n			\'宁波\',\n			null,\n\' at line 32\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bus_apply(         applicant_id,     applicant_name,     department,    start_location,    end_location,    start_time,    end_time,    apply_time,    status,                                                                                create_by,     create_time,               remark,    )values(         ?,     ?,     ?,    ?,    ?,    ?,    ?,                                                                                ?,     ?,               ?,    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'舟山\',\n			\'宁波\',\n			null,\n\' at line 32\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n			 \n			1,\n			 \'若依\', \n			\'100\',\n			\'舟山\',\n			\'宁波\',\n			null,\n\' at line 32', '2025-04-28 10:17:49', 24879);
INSERT INTO `sys_oper_log` VALUES (184, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"林工\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"宁波\",\"endTime\":\"2025-04-24T16:00:00.000Z\",\"matter\":\"想去\",\"params\":{},\"phoneUser\":\"1235768768\",\"remark\":\"哈哈哈\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-07T16:00:00.000Z\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect datetime value: \'2025-04-07T16:00:00.000Z\' for column \'start_time\' at row 1\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bus_apply(         applicant_id,    applicant_name,     applicant_phone,     department,    car_user,     phone_user,      matter,     start_location,    end_location,     start_time,      end_time,     apply_time,    status,                                                                                create_by,     create_time               ,remark    ) VALUES (         ?,    ?,     ?,     ?,    ?,     ?,      ?,     ?,    ?,     ?,      ?,     ?,    ?,                                                                                ?,     ?               ,?    )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect datetime value: \'2025-04-07T16:00:00.000Z\' for column \'start_time\' at row 1\n; Data truncation: Incorrect datetime value: \'2025-04-07T16:00:00.000Z\' for column \'start_time\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect datetime value: \'2025-04-07T16:00:00.000Z\' for column \'start_time\' at row 1', '2025-04-28 10:28:22', 2292);
INSERT INTO `sys_oper_log` VALUES (185, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"林\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"宁波\",\"endTime\":\"2025-04-24 00:00:00\",\"matter\":\"2222\",\"params\":{},\"phoneUser\":\"112323213\",\"remark\":\"34444\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-15 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'status\' cannot be null\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bus_apply(         applicant_id,    applicant_name,     applicant_phone,     department,    car_user,     phone_user,      matter,     start_location,    end_location,     start_time,      end_time,     apply_time,    status,                                                                                create_by,     create_time               ,remark    ) VALUES (         ?,    ?,     ?,     ?,    ?,     ?,      ?,     ?,    ?,     ?,      ?,     ?,    ?,                                                                                ?,     ?               ,?    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'status\' cannot be null\n; Column \'status\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'status\' cannot be null', '2025-04-28 10:40:42', 2652);
INSERT INTO `sys_oper_log` VALUES (186, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"林\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"宁波\",\"endTime\":\"2025-04-24 00:00:00\",\"matter\":\"2222\",\"params\":{},\"phoneUser\":\"112323213\",\"remark\":\"34444\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-15 00:00:00\",\"status\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bus_apply(         applicant_id,    applicant_name,     applicant_phone,     department,    car_user,     phone_user,      matter,     start_location,    end_location,     start_time,      end_time,     apply_time,    status,                                                                                create_by,     create_time               ,remark    ) VALUES (         ?,    ?,     ?,     ?,    ?,     ?,      ?,     ?,    ?,     ?,      ?,     ?,    ?,                                                                                ?,     ?               ,?    )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2025-04-28 10:42:42', 2936);
INSERT INTO `sys_oper_log` VALUES (187, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"林\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"宁波\",\"endTime\":\"2025-04-24 00:00:00\",\"matter\":\"2222\",\"params\":{},\"phoneUser\":\"112323213\",\"remark\":\"34444\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-15 00:00:00\",\"status\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bus_apply(         applicant_id,    applicant_name,     applicant_phone,     department,    car_user,     phone_user,      matter,     start_location,    end_location,     start_time,      end_time,     apply_time,    status,                                                                                create_by,     create_time               ,remark    ) VALUES (         ?,    ?,     ?,     ?,    ?,     ?,      ?,     ?,    ?,     ?,      ?,     ?,    ?,                                                                                ?,     ?               ,?    )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2025-04-28 10:43:22', 9730);
INSERT INTO `sys_oper_log` VALUES (188, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"林\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"宁波\",\"endTime\":\"2025-04-24 00:00:00\",\"id\":2,\"matter\":\"2222\",\"params\":{},\"phoneUser\":\"112323213\",\"remark\":\"34444\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-15 00:00:00\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 10:44:13', 2101);
INSERT INTO `sys_oper_log` VALUES (189, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"林大大\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"宁波\",\"endTime\":\"2025-05-18 00:00:00\",\"id\":3,\"matter\":\"11111\",\"outCity\":\"1\",\"params\":{},\"phoneUser\":\"13566666666\",\"remark\":\"22222\",\"secret\":\"1\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-15 00:00:00\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 11:13:01', 2183);
INSERT INTO `sys_oper_log` VALUES (190, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"1\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"1\",\"endTime\":\"2025-04-30 00:00:00\",\"id\":4,\"outCity\":\"0\",\"params\":{},\"phoneUser\":\"111\",\"secret\":\"0\",\"startLocation\":\"1\",\"startTime\":\"2025-04-15 00:00:00\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 14:10:56', 2750);
INSERT INTO `sys_oper_log` VALUES (191, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"111\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"111\",\"endTime\":\"2025-04-17 00:00:00\",\"id\":5,\"outCity\":\"0\",\"params\":{},\"phoneUser\":\"111\",\"secret\":\"0\",\"startLocation\":\"111\",\"startTime\":\"2025-04-07 00:00:00\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 14:13:14', 3972);
INSERT INTO `sys_oper_log` VALUES (192, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"沈依存\",\"createBy\":\"admin\",\"department\":\"202\",\"endLocation\":\"宁波\",\"endTime\":\"2025-04-24 00:00:00\",\"id\":6,\"matter\":\"又是\",\"outCity\":\"1\",\"params\":{},\"phoneUser\":\"123232\",\"remark\":\"没什么\",\"secret\":\"0\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-08 00:00:00\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 14:26:00', 50);
INSERT INTO `sys_oper_log` VALUES (193, '用车申请管理', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"1\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"1\",\"endTime\":\"2025-04-25 00:00:00\",\"id\":7,\"outCity\":\"0\",\"params\":{},\"phoneUser\":\"1\",\"secret\":\"0\",\"startLocation\":\"1\",\"startTime\":\"2025-04-23 00:00:00\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 14:37:51', 69);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2001,\"perms\":\"business:apply:del\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 14:44:08', 99);
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"审批\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"perms\":\"business:apply:approve\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 14:45:05', 75);
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"派车\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"perms\":\"business:apply:dispatch\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 14:46:09', 98);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-28 14:44:08\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"business:apply:remove\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 15:13:58', 84);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"perms\":\"business:apply:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 15:26:30', 73);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"撤回\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"perms\":\"business:apply:withdraw\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 15:27:11', 40);
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-28 14:44:08\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"business:apply:delete\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 16:04:24', 110);
INSERT INTO `sys_oper_log` VALUES (201, '用车申请管理', 3, 'com.ruoyi.web.controller.business.BusApplyController.deleteApply()', 'DELETE', 1, 'admin', '办公室', '/business/apply/delete', '127.0.0.1', '内网IP', '{\"ids\":\"5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 17:00:29', 2500);
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/apply/detail\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"详情\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"detail\",\"perms\":\"business:apply:detail\",\"routeName\":\"ApplyDetail\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-29 08:51:18', 85);
INSERT INTO `sys_oper_log` VALUES (203, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '办公室', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-25 16:13:04\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2009,2005,2006,2007,2008,2004,2002,2003,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"车辆管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-29 08:54:00', 224);
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/apply/detail\",\"createTime\":\"2025-04-29 08:51:18\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"详情\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"detail\",\"perms\":\"business:apply:detail\",\"routeName\":\"ApplyDetail\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-29 08:55:19', 62);
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/apply/detail\",\"createTime\":\"2025-04-29 08:51:18\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"详情\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"detail\",\"perms\":\"business:apply:detail\",\"routeName\":\"ApplyDetail\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-29 09:11:03', 51);
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/apply/detail\",\"createTime\":\"2025-04-29 08:51:18\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"详情\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"detail\",\"perms\":\"business:apply:detail\",\"routeName\":\"ApplyDetail\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-29 09:15:41', 50);
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/apply/detail\",\"createTime\":\"2025-04-29 08:51:18\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"详情\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"detail\",\"perms\":\"business:apply:detail\",\"routeName\":\"ApplyDetail\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-29 09:17:59', 59);
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/apply/index\",\"createTime\":\"2025-04-26 11:25:51\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"用车列表\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"apply\",\"perms\":\"business:apply:index\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-29 09:22:41', 52);
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/apply/index\",\"createTime\":\"2025-04-26 11:25:51\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"用车列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"apply\",\"perms\":\"business:apply:index\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-29 09:23:20', 48);
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/apply/detail\",\"createTime\":\"2025-04-29 08:51:18\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"用车列表详情\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"detail\",\"perms\":\"business:apply:detail\",\"routeName\":\"ApplyDetail\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-29 09:24:20', 62);
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/apply/detail\",\"createTime\":\"2025-04-29 08:51:18\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"用车列表详情\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"detail/:id\",\"perms\":\"business:apply:detail\",\"routeName\":\"ApplyDetail\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-29 10:28:26', 111);
INSERT INTO `sys_oper_log` VALUES (212, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":3,\"currentAction\":\"depApprove\",\"reason\":\"\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'applyId\' in \'class com.ruoyi.business.domain.BusApply\'', '2025-04-29 15:49:19', 6125);
INSERT INTO `sys_oper_log` VALUES (213, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":3,\"currentAction\":\"depApprove\",\"reason\":\"\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'applyId\' in \'class com.ruoyi.business.domain.BusApply\'', '2025-04-29 15:51:07', 20662);
INSERT INTO `sys_oper_log` VALUES (214, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":7,\"currentAction\":\"depApprove\",\"reason\":\"\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'applyId\' in \'class com.ruoyi.business.domain.BusApply\'', '2025-04-29 15:51:45', 22);
INSERT INTO `sys_oper_log` VALUES (215, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":7,\"currentAction\":\"depApprove\",\"reason\":\"\"}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Failed to obtain JDBC Connection; nested exception is java.sql.SQLException: interrupt\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.updateApply\r\n### The error occurred while executing an update\r\n### Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Failed to obtain JDBC Connection; nested exception is java.sql.SQLException: interrupt', '2025-04-29 15:55:08', 68201);
INSERT INTO `sys_oper_log` VALUES (216, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":7,\"currentAction\":\"depApprove\",\"reason\":\"\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'applyId\' in \'class com.ruoyi.business.domain.BusApply\'', '2025-04-29 16:00:02', 2187);
INSERT INTO `sys_oper_log` VALUES (217, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":7,\"currentAction\":\"depApprove\",\"reason\":\"111\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-29 16:05:10', 3474);
INSERT INTO `sys_oper_log` VALUES (218, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":7,\"currentAction\":\"depApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-29 16:05:31', 88);
INSERT INTO `sys_oper_log` VALUES (219, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":7,\"currentAction\":\"depApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-29 16:06:12', 22485);
INSERT INTO `sys_oper_log` VALUES (220, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":2,\"currentAction\":\"officeApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-29 16:09:04', 3535);
INSERT INTO `sys_oper_log` VALUES (221, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":2,\"currentAction\":\"leaderApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-29 16:09:14', 87);
INSERT INTO `sys_oper_log` VALUES (222, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"disagree\",\"applyId\":7,\"currentAction\":\"officeApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-29 16:09:57', 61);
INSERT INTO `sys_oper_log` VALUES (223, '用车申请管理', 3, 'com.ruoyi.web.controller.business.BusApplyController.deleteApply()', 'DELETE', 1, 'admin', '办公室', '/business/apply/delete', '127.0.0.1', '内网IP', '{\"ids\":\"5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-29 16:13:38', 102);
INSERT INTO `sys_oper_log` VALUES (224, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":1,\"currentAction\":\"depApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-29 16:22:59', 80);
INSERT INTO `sys_oper_log` VALUES (225, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":3,\"currentAction\":\"leaderApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-29 16:23:19', 66);
INSERT INTO `sys_oper_log` VALUES (226, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":1,\"currentAction\":\"officeApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-29 16:39:05', 93);
INSERT INTO `sys_oper_log` VALUES (227, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":1,\"currentAction\":\"leaderApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-29 16:39:31', 86);
INSERT INTO `sys_oper_log` VALUES (228, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":3,\"currentAction\":\"depApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-29 16:41:06', 15729);
INSERT INTO `sys_oper_log` VALUES (229, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":3,\"currentAction\":\"depApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-29 16:41:10', 60);
INSERT INTO `sys_oper_log` VALUES (230, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"disagree\",\"applyId\":4,\"currentAction\":\"depApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-29 16:41:28', 57);
INSERT INTO `sys_oper_log` VALUES (231, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":3,\"currentAction\":\"officeApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-29 16:41:52', 61);
INSERT INTO `sys_oper_log` VALUES (232, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":3,\"currentAction\":\"leaderApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-29 16:42:13', 55);
INSERT INTO `sys_oper_log` VALUES (233, '新增用车申请', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"林三\",\"createBy\":\"admin\",\"department\":\"202\",\"endLocation\":\"宁波\",\"endTime\":\"2025-04-24 00:00:00\",\"matter\":\"出去\",\"outCity\":\"1\",\"params\":{},\"phoneUser\":\"13611112222\",\"remark\":\"哈哈哈\",\"secret\":\"0\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-15 00:00:00\",\"status\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bus_apply(         applicant_id,    applicant_name,     applicant_phone,     department,    car_user,     phone_user,      matter,      out_city,      secret,     start_location,    end_location,     start_time,      end_time,     apply_time,    status,                                                                                create_by,     create_time              ,del_flag   ) VALUES (         ?,    ?,     ?,     ?,    ?,     ?,      ?,      ?,      ?,     ?,    ?,     ?,      ?,     ?,    ?,                                                                                ?,     ?               ,?     ,0     )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2025-04-30 09:59:00', 205);
INSERT INTO `sys_oper_log` VALUES (234, '新增用车申请', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"林三\",\"createBy\":\"admin\",\"department\":\"202\",\"endLocation\":\"宁波\",\"endTime\":\"2025-04-24 00:00:00\",\"matter\":\"出去\",\"outCity\":\"1\",\"params\":{},\"phoneUser\":\"13611112222\",\"remark\":\"哈哈哈\",\"secret\":\"0\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-15 00:00:00\",\"status\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [D:\\公司\\项目\\海关车辆调度\\前后端\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\business\\BusApplyMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.BusApplyMapper.insertApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO bus_apply(         applicant_id,    applicant_name,     applicant_phone,     department,    car_user,     phone_user,      matter,      out_city,      secret,     start_location,    end_location,     start_time,      end_time,     apply_time,    status,                                                                                create_by,     create_time              ,del_flag   ) VALUES (         ?,    ?,     ?,     ?,    ?,     ?,      ?,      ?,      ?,     ?,    ?,     ?,      ?,     ?,    ?,                                                                                ?,     ?               ,?     ,0     )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2025-04-30 09:59:18', 54);
INSERT INTO `sys_oper_log` VALUES (235, '新增用车申请', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"林三\",\"createBy\":\"admin\",\"department\":\"202\",\"endLocation\":\"宁波\",\"endTime\":\"2025-04-24 00:00:00\",\"id\":8,\"matter\":\"出去\",\"outCity\":\"1\",\"params\":{},\"phoneUser\":\"13611112222\",\"remark\":\"哈哈哈\",\"secret\":\"0\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-15 00:00:00\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 10:07:44', 3750);
INSERT INTO `sys_oper_log` VALUES (236, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":8,\"currentAction\":\"depApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-30 10:10:29', 18338);
INSERT INTO `sys_oper_log` VALUES (237, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":8,\"currentAction\":\"officeApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-30 10:10:55', 16096);
INSERT INTO `sys_oper_log` VALUES (238, '新增用车申请', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"陈诺\",\"createBy\":\"admin\",\"department\":\"203\",\"endLocation\":\"宁波\",\"endTime\":\"2025-05-21 00:00:00\",\"id\":9,\"matter\":\"初始\",\"outCity\":\"1\",\"params\":{},\"phoneUser\":\"13812531562\",\"remark\":\"哈哈哈\",\"secret\":\"0\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-17 00:00:00\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 10:15:51', 84);
INSERT INTO `sys_oper_log` VALUES (239, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":9,\"currentAction\":\"depApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-30 10:16:11', 58);
INSERT INTO `sys_oper_log` VALUES (240, '新增用车申请', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"谢娜\",\"createBy\":\"admin\",\"department\":\"204\",\"endLocation\":\"宁波\",\"endTime\":\"2025-04-26 00:00:00\",\"id\":10,\"matter\":\"2222\",\"outCity\":\"1\",\"params\":{},\"phoneUser\":\"13921531453\",\"remark\":\"5555\",\"secret\":\"0\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-24 00:00:00\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 10:17:23', 79);
INSERT INTO `sys_oper_log` VALUES (241, '新增用车申请', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"22\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"22\",\"endTime\":\"2025-04-24 00:00:00\",\"id\":11,\"outCity\":\"1\",\"params\":{},\"phoneUser\":\"22\",\"secret\":\"0\",\"startLocation\":\"22\",\"startTime\":\"2025-04-16 00:00:00\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 10:18:50', 32871);
INSERT INTO `sys_oper_log` VALUES (242, '新增用车申请', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"22\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"22\",\"endTime\":\"2025-04-24 00:00:00\",\"id\":12,\"outCity\":\"1\",\"params\":{},\"phoneUser\":\"22\",\"secret\":\"0\",\"startLocation\":\"22\",\"startTime\":\"2025-04-16 00:00:00\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 10:21:42', 2498);
INSERT INTO `sys_oper_log` VALUES (243, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":12,\"currentAction\":\"depApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-30 10:24:59', 88);
INSERT INTO `sys_oper_log` VALUES (244, '新增用车申请', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"1\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"1\",\"endTime\":\"2025-04-24 00:00:00\",\"id\":13,\"matter\":\"1\",\"outCity\":\"0\",\"params\":{},\"phoneUser\":\"1\",\"remark\":\"1\",\"secret\":\"0\",\"startLocation\":\"1\",\"startTime\":\"2025-04-16 00:00:00\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 10:28:58', 3705);
INSERT INTO `sys_oper_log` VALUES (245, '用车申请管理', 3, 'com.ruoyi.web.controller.business.BusApplyController.deleteApply()', 'DELETE', 1, 'admin', '办公室', '/business/apply/delete', '127.0.0.1', '内网IP', '{\"ids\":\"13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 10:29:06', 133);
INSERT INTO `sys_oper_log` VALUES (246, '新增用车申请', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"11\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"1\",\"endTime\":\"2025-04-24 00:00:00\",\"id\":14,\"outCity\":\"0\",\"params\":{},\"phoneUser\":\"1\",\"secret\":\"0\",\"startLocation\":\"1\",\"startTime\":\"2025-04-08 00:00:00\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 10:42:33', 69);
INSERT INTO `sys_oper_log` VALUES (247, '新增用车申请', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"1\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"1\",\"endTime\":\"2025-04-23 00:00:00\",\"id\":15,\"outCity\":\"0\",\"params\":{},\"phoneUser\":\"1\",\"secret\":\"0\",\"startLocation\":\"1\",\"startTime\":\"2025-04-16 00:00:00\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 10:44:16', 51);
INSERT INTO `sys_oper_log` VALUES (248, '新增用车申请', 1, 'com.ruoyi.web.controller.business.BusApplyController.add()', 'POST', 1, 'admin', '办公室', '/business/apply/add', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"2\",\"createBy\":\"admin\",\"department\":\"100\",\"endLocation\":\"2\",\"endTime\":\"2025-04-25 00:00:00\",\"id\":16,\"outCity\":\"0\",\"params\":{},\"phoneUser\":\"2\",\"secret\":\"0\",\"startLocation\":\"2\",\"startTime\":\"2025-04-23 00:00:00\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 10:44:29', 66);
INSERT INTO `sys_oper_log` VALUES (249, '用车申请管理', 3, 'com.ruoyi.web.controller.business.BusApplyController.deleteApply()', 'DELETE', 1, 'admin', '办公室', '/business/apply/delete', '127.0.0.1', '内网IP', '{\"ids\":\"16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 10:45:07', 164);
INSERT INTO `sys_oper_log` VALUES (250, '用车申请管理', 3, 'com.ruoyi.web.controller.business.BusApplyController.withdrawApply()', 'DELETE', 1, 'admin', '办公室', '/business/apply/withdraw', '127.0.0.1', '内网IP', '{\"ids\":\"3\"}', '{\"msg\":\"撤回成功\",\"code\":200}', 0, NULL, '2025-04-30 11:11:03', 75);
INSERT INTO `sys_oper_log` VALUES (251, '用车申请管理', 3, 'com.ruoyi.web.controller.business.BusApplyController.withdrawApply()', 'DELETE', 1, 'admin', '办公室', '/business/apply/withdraw', '127.0.0.1', '内网IP', '{\"ids\":\"6\"}', '{\"msg\":\"撤回成功\",\"code\":200}', 0, NULL, '2025-04-30 11:11:14', 68);
INSERT INTO `sys_oper_log` VALUES (252, '用车申请管理', 3, 'com.ruoyi.web.controller.business.BusApplyController.withdrawApply()', 'DELETE', 1, 'admin', '办公室', '/business/apply/withdraw', '127.0.0.1', '内网IP', '{\"ids\":\"10\"}', '{\"msg\":\"撤回成功\",\"code\":200}', 0, NULL, '2025-04-30 11:31:56', 66);
INSERT INTO `sys_oper_log` VALUES (253, '用车申请管理', 3, 'com.ruoyi.web.controller.business.BusApplyController.withdrawApply()', 'DELETE', 1, 'admin', '办公室', '/business/apply/withdraw', '127.0.0.1', '内网IP', '{\"ids\":\"3\"}', '{\"msg\":\"撤回成功\",\"code\":200}', 0, NULL, '2025-04-30 11:48:50', 71);
INSERT INTO `sys_oper_log` VALUES (254, '用车申请管理', 2, 'com.ruoyi.web.controller.business.BusApplyController.edit()', 'POST', 1, 'admin', '办公室', '/business/apply/edit', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"沈依存\",\"createBy\":\"admin\",\"delFlag\":\"0\",\"department\":\"202\",\"endLocation\":\"宁波\",\"endTime\":\"2025-04-24 00:00:00\",\"id\":6,\"matter\":\"又是\",\"outCity\":\"0\",\"params\":{},\"phoneUser\":\"123232\",\"remark\":\"没什么111\",\"secret\":\"1\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-08 00:00:00\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 13:31:29', 11758);
INSERT INTO `sys_oper_log` VALUES (255, '用车申请管理', 2, 'com.ruoyi.web.controller.business.BusApplyController.edit()', 'POST', 1, 'admin', '办公室', '/business/apply/edit', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"1\",\"createBy\":\"admin\",\"delFlag\":\"0\",\"depApproveId\":1,\"depApproveName\":\"若依\",\"depApproveTime\":\"2025-04-29 16:41:26\",\"department\":\"100\",\"endLocation\":\"1\",\"endTime\":\"2025-04-30 00:00:00\",\"id\":4,\"matter\":\"11\",\"offApproveName\":\"若依\",\"outCity\":\"0\",\"params\":{},\"phoneUser\":\"111\",\"reason\":\"\",\"remark\":\"11\",\"secret\":\"0\",\"startLocation\":\"1\",\"startTime\":\"2025-04-15 00:00:00\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 13:32:50', 105);
INSERT INTO `sys_oper_log` VALUES (256, '撤回用车申请', 3, 'com.ruoyi.web.controller.business.BusApplyController.withdrawApply()', 'DELETE', 1, 'admin', '办公室', '/business/apply/withdraw', '127.0.0.1', '内网IP', '{\"ids\":\"1,2,3,4,6,7,8,9,10,11\"}', '{\"msg\":\"撤回成功\",\"code\":200}', 0, NULL, '2025-04-30 13:33:18', 794);
INSERT INTO `sys_oper_log` VALUES (257, '用车申请管理', 2, 'com.ruoyi.web.controller.business.BusApplyController.edit()', 'POST', 1, 'admin', '办公室', '/business/apply/edit', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"林\",\"createBy\":\"admin\",\"delFlag\":\"0\",\"department\":\"100\",\"endLocation\":\"宁波\",\"endTime\":\"2025-04-12 00:00:00\",\"id\":2,\"matter\":\"2222\",\"outCity\":\"0\",\"params\":{},\"phoneUser\":\"112323213\",\"reason\":\"\",\"remark\":\"34444\",\"secret\":\"0\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-10 00:00:00\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 14:11:17', 83);
INSERT INTO `sys_oper_log` VALUES (258, '用车申请管理', 2, 'com.ruoyi.web.controller.business.BusApplyController.edit()', 'POST', 1, 'admin', '办公室', '/business/apply/edit', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"1\",\"createBy\":\"admin\",\"delFlag\":\"0\",\"depApproveId\":1,\"depApproveName\":\"若依\",\"depApproveTime\":\"2025-04-29 16:41:26\",\"department\":\"100\",\"endLocation\":\"1\",\"endTime\":\"2025-05-14 00:00:00\",\"id\":4,\"matter\":\"11\",\"offApproveName\":\"若依\",\"outCity\":\"0\",\"params\":{},\"phoneUser\":\"111\",\"reason\":\"\",\"remark\":\"11\",\"secret\":\"0\",\"startLocation\":\"1\",\"startTime\":\"2025-04-11 00:00:00\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 14:35:58', 84);
INSERT INTO `sys_oper_log` VALUES (259, '用车申请管理', 2, 'com.ruoyi.web.controller.business.BusApplyController.edit()', 'POST', 1, 'admin', '办公室', '/business/apply/edit', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"沈依存\",\"createBy\":\"admin\",\"delFlag\":\"0\",\"department\":\"202\",\"endLocation\":\"宁波\",\"endTime\":\"2025-04-24 00:00:00\",\"id\":6,\"matter\":\"又是\",\"outCity\":\"1\",\"params\":{},\"phoneUser\":\"123232\",\"remark\":\"没什么111\",\"secret\":\"1\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-08 00:00:00\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 14:36:12', 80);
INSERT INTO `sys_oper_log` VALUES (260, '导出用车申请', 5, 'com.ruoyi.web.controller.business.BusApplyController.export()', 'POST', 1, 'admin', '办公室', '/business/apply/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-30 15:09:00', 5358);
INSERT INTO `sys_oper_log` VALUES (261, '导出用车申请', 5, 'com.ruoyi.web.controller.business.BusApplyController.export()', 'POST', 1, 'admin', '办公室', '/business/apply/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-30 15:11:09', 27817);
INSERT INTO `sys_oper_log` VALUES (262, '导出用车申请', 5, 'com.ruoyi.web.controller.business.BusApplyController.export()', 'POST', 1, 'admin', '办公室', '/business/apply/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-30 15:12:26', 50347);
INSERT INTO `sys_oper_log` VALUES (263, '导出用车申请', 5, 'com.ruoyi.web.controller.business.BusApplyController.export()', 'POST', 1, 'admin', '办公室', '/business/apply/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-30 15:13:28', 58070);
INSERT INTO `sys_oper_log` VALUES (264, '导出用车申请', 5, 'com.ruoyi.web.controller.business.BusApplyController.export()', 'POST', 1, 'admin', '办公室', '/business/apply/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-30 15:17:45', 253437);
INSERT INTO `sys_oper_log` VALUES (265, '导出用车申请', 5, 'com.ruoyi.web.controller.business.BusApplyController.export()', 'POST', 1, 'admin', '办公室', '/business/apply/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-30 15:23:54', 546);
INSERT INTO `sys_oper_log` VALUES (266, '导出用车申请', 5, 'com.ruoyi.web.controller.business.BusApplyController.export()', 'POST', 1, 'admin', '办公室', '/business/apply/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-30 15:30:49', 591);
INSERT INTO `sys_oper_log` VALUES (267, '导出用车申请', 5, 'com.ruoyi.web.controller.business.BusApplyController.export()', 'POST', 1, 'admin', '办公室', '/business/apply/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-30 15:31:35', 692);
INSERT INTO `sys_oper_log` VALUES (268, '导出用车申请', 5, 'com.ruoyi.web.controller.business.BusApplyController.export()', 'POST', 1, 'admin', '办公室', '/business/apply/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-30 15:32:25', 644);
INSERT INTO `sys_oper_log` VALUES (269, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":2,\"currentAction\":\"depApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-30 15:33:49', 89);
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '办公室', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"business/applylist/index\",\"createTime\":\"2025-04-26 11:40:53\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"申请列表\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"applylist\",\"perms\":\"business:applylist:index\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 18:55:59', 38);
INSERT INTO `sys_oper_log` VALUES (271, '删除用车申请', 3, 'com.ruoyi.web.controller.business.BusApplyController.deleteApply()', 'DELETE', 1, 'admin', '办公室', '/business/apply/delete', '127.0.0.1', '内网IP', '{\"ids\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 18:56:37', 21);
INSERT INTO `sys_oper_log` VALUES (272, '用车申请管理', 2, 'com.ruoyi.web.controller.business.BusApplyController.edit()', 'POST', 1, 'admin', '办公室', '/business/apply/edit', '127.0.0.1', '内网IP', '{\"applicantId\":1,\"applicantName\":\"若依\",\"applicantPhone\":\"15888888888\",\"carUser\":\"林大大\",\"createBy\":\"admin\",\"delFlag\":\"0\",\"depApproveId\":1,\"depApproveName\":\"若依\",\"depApproveTime\":\"2025-04-29 16:41:07\",\"department\":\"100\",\"endLocation\":\"宁波\",\"endTime\":\"2025-05-18 00:00:00\",\"id\":3,\"leaderApproveName\":\"若依\",\"leaderApproveTime\":\"2025-04-29 16:42:11\",\"matter\":\"11111\",\"offApproveId\":1,\"offApproveName\":\"若依\",\"offApproveTime\":\"2025-04-29 16:41:49\",\"outCity\":\"1\",\"params\":{},\"phoneUser\":\"13566666666\",\"reason\":\"\",\"remark\":\"22222\",\"secret\":\"1\",\"startLocation\":\"舟山\",\"startTime\":\"2025-04-15 00:00:00\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 18:56:49', 25);
INSERT INTO `sys_oper_log` VALUES (273, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"agree\",\"applyId\":6,\"currentAction\":\"depApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-04-30 18:56:58', 15);
INSERT INTO `sys_oper_log` VALUES (274, '审批用车申请', 2, 'com.ruoyi.web.controller.business.BusApplyController.approve()', 'POST', 1, 'admin', '办公室', '/business/apply/approve', '127.0.0.1', '内网IP', '{\"action\":\"disagree\",\"applyId\":6,\"currentAction\":\"officeApprove\",\"reason\":\"\"}', '{\"msg\":\"审批成功\",\"code\":200}', 0, NULL, '2025-05-13 14:03:25', 121);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-04-25 16:13:04', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-04-25 16:13:04', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-04-25 16:13:04', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '车辆管理员', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-04-25 16:13:04', 'admin', '2025-04-29 08:53:59', '普通角色');
INSERT INTO `sys_role` VALUES (100, '部门申请员', 'department', 3, '1', 1, 1, '0', '0', 'admin', '2025-04-26 09:08:39', 'admin', '2025-04-26 11:26:22', NULL);
INSERT INTO `sys_role` VALUES (101, '部门负责人', 'manager', 4, '1', 1, 1, '0', '0', 'admin', '2025-04-26 09:10:14', 'admin', '2025-04-26 11:28:33', NULL);
INSERT INTO `sys_role` VALUES (102, '办公室负责人', 'office', 5, '1', 1, 1, '0', '0', 'admin', '2025-04-26 09:11:02', 'admin', '2025-04-26 11:28:39', NULL);
INSERT INTO `sys_role` VALUES (103, '综合调度员', 'dispatcher', 6, '1', 1, 1, '0', '0', 'admin', '2025-04-26 09:14:44', 'admin', '2025-04-26 09:14:51', NULL);
INSERT INTO `sys_role` VALUES (104, '驾驶员', 'driver', 7, '1', 1, 1, '0', '0', 'admin', '2025-04-26 09:15:56', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (105, '分管综合领导', 'leadership', 8, '1', 1, 1, '0', '0', 'admin', '2025-04-26 10:13:47', 'admin', '2025-04-26 10:14:05', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 3);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 105);
INSERT INTO `sys_role_menu` VALUES (100, 106);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 111);
INSERT INTO `sys_role_menu` VALUES (100, 112);
INSERT INTO `sys_role_menu` VALUES (100, 113);
INSERT INTO `sys_role_menu` VALUES (100, 114);
INSERT INTO `sys_role_menu` VALUES (100, 115);
INSERT INTO `sys_role_menu` VALUES (100, 116);
INSERT INTO `sys_role_menu` VALUES (100, 117);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1020);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1022);
INSERT INTO `sys_role_menu` VALUES (100, 1023);
INSERT INTO `sys_role_menu` VALUES (100, 1024);
INSERT INTO `sys_role_menu` VALUES (100, 1025);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 1027);
INSERT INTO `sys_role_menu` VALUES (100, 1028);
INSERT INTO `sys_role_menu` VALUES (100, 1029);
INSERT INTO `sys_role_menu` VALUES (100, 1030);
INSERT INTO `sys_role_menu` VALUES (100, 1031);
INSERT INTO `sys_role_menu` VALUES (100, 1032);
INSERT INTO `sys_role_menu` VALUES (100, 1033);
INSERT INTO `sys_role_menu` VALUES (100, 1034);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 1055);
INSERT INTO `sys_role_menu` VALUES (100, 1056);
INSERT INTO `sys_role_menu` VALUES (100, 1057);
INSERT INTO `sys_role_menu` VALUES (100, 1058);
INSERT INTO `sys_role_menu` VALUES (100, 1059);
INSERT INTO `sys_role_menu` VALUES (100, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 2);
INSERT INTO `sys_role_menu` VALUES (101, 3);
INSERT INTO `sys_role_menu` VALUES (101, 100);
INSERT INTO `sys_role_menu` VALUES (101, 101);
INSERT INTO `sys_role_menu` VALUES (101, 102);
INSERT INTO `sys_role_menu` VALUES (101, 103);
INSERT INTO `sys_role_menu` VALUES (101, 104);
INSERT INTO `sys_role_menu` VALUES (101, 105);
INSERT INTO `sys_role_menu` VALUES (101, 106);
INSERT INTO `sys_role_menu` VALUES (101, 107);
INSERT INTO `sys_role_menu` VALUES (101, 108);
INSERT INTO `sys_role_menu` VALUES (101, 109);
INSERT INTO `sys_role_menu` VALUES (101, 110);
INSERT INTO `sys_role_menu` VALUES (101, 111);
INSERT INTO `sys_role_menu` VALUES (101, 112);
INSERT INTO `sys_role_menu` VALUES (101, 113);
INSERT INTO `sys_role_menu` VALUES (101, 114);
INSERT INTO `sys_role_menu` VALUES (101, 115);
INSERT INTO `sys_role_menu` VALUES (101, 116);
INSERT INTO `sys_role_menu` VALUES (101, 117);
INSERT INTO `sys_role_menu` VALUES (101, 500);
INSERT INTO `sys_role_menu` VALUES (101, 501);
INSERT INTO `sys_role_menu` VALUES (101, 1000);
INSERT INTO `sys_role_menu` VALUES (101, 1001);
INSERT INTO `sys_role_menu` VALUES (101, 1002);
INSERT INTO `sys_role_menu` VALUES (101, 1003);
INSERT INTO `sys_role_menu` VALUES (101, 1004);
INSERT INTO `sys_role_menu` VALUES (101, 1005);
INSERT INTO `sys_role_menu` VALUES (101, 1006);
INSERT INTO `sys_role_menu` VALUES (101, 1007);
INSERT INTO `sys_role_menu` VALUES (101, 1008);
INSERT INTO `sys_role_menu` VALUES (101, 1009);
INSERT INTO `sys_role_menu` VALUES (101, 1010);
INSERT INTO `sys_role_menu` VALUES (101, 1011);
INSERT INTO `sys_role_menu` VALUES (101, 1012);
INSERT INTO `sys_role_menu` VALUES (101, 1013);
INSERT INTO `sys_role_menu` VALUES (101, 1014);
INSERT INTO `sys_role_menu` VALUES (101, 1015);
INSERT INTO `sys_role_menu` VALUES (101, 1016);
INSERT INTO `sys_role_menu` VALUES (101, 1017);
INSERT INTO `sys_role_menu` VALUES (101, 1018);
INSERT INTO `sys_role_menu` VALUES (101, 1019);
INSERT INTO `sys_role_menu` VALUES (101, 1020);
INSERT INTO `sys_role_menu` VALUES (101, 1021);
INSERT INTO `sys_role_menu` VALUES (101, 1022);
INSERT INTO `sys_role_menu` VALUES (101, 1023);
INSERT INTO `sys_role_menu` VALUES (101, 1024);
INSERT INTO `sys_role_menu` VALUES (101, 1025);
INSERT INTO `sys_role_menu` VALUES (101, 1026);
INSERT INTO `sys_role_menu` VALUES (101, 1027);
INSERT INTO `sys_role_menu` VALUES (101, 1028);
INSERT INTO `sys_role_menu` VALUES (101, 1029);
INSERT INTO `sys_role_menu` VALUES (101, 1030);
INSERT INTO `sys_role_menu` VALUES (101, 1031);
INSERT INTO `sys_role_menu` VALUES (101, 1032);
INSERT INTO `sys_role_menu` VALUES (101, 1033);
INSERT INTO `sys_role_menu` VALUES (101, 1034);
INSERT INTO `sys_role_menu` VALUES (101, 1035);
INSERT INTO `sys_role_menu` VALUES (101, 1036);
INSERT INTO `sys_role_menu` VALUES (101, 1037);
INSERT INTO `sys_role_menu` VALUES (101, 1038);
INSERT INTO `sys_role_menu` VALUES (101, 1039);
INSERT INTO `sys_role_menu` VALUES (101, 1040);
INSERT INTO `sys_role_menu` VALUES (101, 1041);
INSERT INTO `sys_role_menu` VALUES (101, 1042);
INSERT INTO `sys_role_menu` VALUES (101, 1043);
INSERT INTO `sys_role_menu` VALUES (101, 1044);
INSERT INTO `sys_role_menu` VALUES (101, 1045);
INSERT INTO `sys_role_menu` VALUES (101, 1046);
INSERT INTO `sys_role_menu` VALUES (101, 1047);
INSERT INTO `sys_role_menu` VALUES (101, 1048);
INSERT INTO `sys_role_menu` VALUES (101, 1049);
INSERT INTO `sys_role_menu` VALUES (101, 1050);
INSERT INTO `sys_role_menu` VALUES (101, 1051);
INSERT INTO `sys_role_menu` VALUES (101, 1052);
INSERT INTO `sys_role_menu` VALUES (101, 1053);
INSERT INTO `sys_role_menu` VALUES (101, 1054);
INSERT INTO `sys_role_menu` VALUES (101, 1055);
INSERT INTO `sys_role_menu` VALUES (101, 1056);
INSERT INTO `sys_role_menu` VALUES (101, 1057);
INSERT INTO `sys_role_menu` VALUES (101, 1058);
INSERT INTO `sys_role_menu` VALUES (101, 1059);
INSERT INTO `sys_role_menu` VALUES (101, 1060);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2001);
INSERT INTO `sys_role_menu` VALUES (102, 1);
INSERT INTO `sys_role_menu` VALUES (102, 2);
INSERT INTO `sys_role_menu` VALUES (102, 3);
INSERT INTO `sys_role_menu` VALUES (102, 100);
INSERT INTO `sys_role_menu` VALUES (102, 101);
INSERT INTO `sys_role_menu` VALUES (102, 102);
INSERT INTO `sys_role_menu` VALUES (102, 103);
INSERT INTO `sys_role_menu` VALUES (102, 104);
INSERT INTO `sys_role_menu` VALUES (102, 105);
INSERT INTO `sys_role_menu` VALUES (102, 106);
INSERT INTO `sys_role_menu` VALUES (102, 107);
INSERT INTO `sys_role_menu` VALUES (102, 108);
INSERT INTO `sys_role_menu` VALUES (102, 109);
INSERT INTO `sys_role_menu` VALUES (102, 110);
INSERT INTO `sys_role_menu` VALUES (102, 111);
INSERT INTO `sys_role_menu` VALUES (102, 112);
INSERT INTO `sys_role_menu` VALUES (102, 113);
INSERT INTO `sys_role_menu` VALUES (102, 114);
INSERT INTO `sys_role_menu` VALUES (102, 115);
INSERT INTO `sys_role_menu` VALUES (102, 116);
INSERT INTO `sys_role_menu` VALUES (102, 117);
INSERT INTO `sys_role_menu` VALUES (102, 500);
INSERT INTO `sys_role_menu` VALUES (102, 501);
INSERT INTO `sys_role_menu` VALUES (102, 1000);
INSERT INTO `sys_role_menu` VALUES (102, 1001);
INSERT INTO `sys_role_menu` VALUES (102, 1002);
INSERT INTO `sys_role_menu` VALUES (102, 1003);
INSERT INTO `sys_role_menu` VALUES (102, 1004);
INSERT INTO `sys_role_menu` VALUES (102, 1005);
INSERT INTO `sys_role_menu` VALUES (102, 1006);
INSERT INTO `sys_role_menu` VALUES (102, 1007);
INSERT INTO `sys_role_menu` VALUES (102, 1008);
INSERT INTO `sys_role_menu` VALUES (102, 1009);
INSERT INTO `sys_role_menu` VALUES (102, 1010);
INSERT INTO `sys_role_menu` VALUES (102, 1011);
INSERT INTO `sys_role_menu` VALUES (102, 1012);
INSERT INTO `sys_role_menu` VALUES (102, 1013);
INSERT INTO `sys_role_menu` VALUES (102, 1014);
INSERT INTO `sys_role_menu` VALUES (102, 1015);
INSERT INTO `sys_role_menu` VALUES (102, 1016);
INSERT INTO `sys_role_menu` VALUES (102, 1017);
INSERT INTO `sys_role_menu` VALUES (102, 1018);
INSERT INTO `sys_role_menu` VALUES (102, 1019);
INSERT INTO `sys_role_menu` VALUES (102, 1020);
INSERT INTO `sys_role_menu` VALUES (102, 1021);
INSERT INTO `sys_role_menu` VALUES (102, 1022);
INSERT INTO `sys_role_menu` VALUES (102, 1023);
INSERT INTO `sys_role_menu` VALUES (102, 1024);
INSERT INTO `sys_role_menu` VALUES (102, 1025);
INSERT INTO `sys_role_menu` VALUES (102, 1026);
INSERT INTO `sys_role_menu` VALUES (102, 1027);
INSERT INTO `sys_role_menu` VALUES (102, 1028);
INSERT INTO `sys_role_menu` VALUES (102, 1029);
INSERT INTO `sys_role_menu` VALUES (102, 1030);
INSERT INTO `sys_role_menu` VALUES (102, 1031);
INSERT INTO `sys_role_menu` VALUES (102, 1032);
INSERT INTO `sys_role_menu` VALUES (102, 1033);
INSERT INTO `sys_role_menu` VALUES (102, 1034);
INSERT INTO `sys_role_menu` VALUES (102, 1035);
INSERT INTO `sys_role_menu` VALUES (102, 1036);
INSERT INTO `sys_role_menu` VALUES (102, 1037);
INSERT INTO `sys_role_menu` VALUES (102, 1038);
INSERT INTO `sys_role_menu` VALUES (102, 1039);
INSERT INTO `sys_role_menu` VALUES (102, 1040);
INSERT INTO `sys_role_menu` VALUES (102, 1041);
INSERT INTO `sys_role_menu` VALUES (102, 1042);
INSERT INTO `sys_role_menu` VALUES (102, 1043);
INSERT INTO `sys_role_menu` VALUES (102, 1044);
INSERT INTO `sys_role_menu` VALUES (102, 1045);
INSERT INTO `sys_role_menu` VALUES (102, 1046);
INSERT INTO `sys_role_menu` VALUES (102, 1047);
INSERT INTO `sys_role_menu` VALUES (102, 1048);
INSERT INTO `sys_role_menu` VALUES (102, 1049);
INSERT INTO `sys_role_menu` VALUES (102, 1050);
INSERT INTO `sys_role_menu` VALUES (102, 1051);
INSERT INTO `sys_role_menu` VALUES (102, 1052);
INSERT INTO `sys_role_menu` VALUES (102, 1053);
INSERT INTO `sys_role_menu` VALUES (102, 1054);
INSERT INTO `sys_role_menu` VALUES (102, 1055);
INSERT INTO `sys_role_menu` VALUES (102, 1056);
INSERT INTO `sys_role_menu` VALUES (102, 1057);
INSERT INTO `sys_role_menu` VALUES (102, 1058);
INSERT INTO `sys_role_menu` VALUES (102, 1059);
INSERT INTO `sys_role_menu` VALUES (102, 1060);
INSERT INTO `sys_role_menu` VALUES (102, 2000);
INSERT INTO `sys_role_menu` VALUES (102, 2001);
INSERT INTO `sys_role_menu` VALUES (103, 1);
INSERT INTO `sys_role_menu` VALUES (103, 2);
INSERT INTO `sys_role_menu` VALUES (103, 3);
INSERT INTO `sys_role_menu` VALUES (103, 100);
INSERT INTO `sys_role_menu` VALUES (103, 101);
INSERT INTO `sys_role_menu` VALUES (103, 102);
INSERT INTO `sys_role_menu` VALUES (103, 103);
INSERT INTO `sys_role_menu` VALUES (103, 104);
INSERT INTO `sys_role_menu` VALUES (103, 105);
INSERT INTO `sys_role_menu` VALUES (103, 106);
INSERT INTO `sys_role_menu` VALUES (103, 107);
INSERT INTO `sys_role_menu` VALUES (103, 108);
INSERT INTO `sys_role_menu` VALUES (103, 109);
INSERT INTO `sys_role_menu` VALUES (103, 110);
INSERT INTO `sys_role_menu` VALUES (103, 111);
INSERT INTO `sys_role_menu` VALUES (103, 112);
INSERT INTO `sys_role_menu` VALUES (103, 113);
INSERT INTO `sys_role_menu` VALUES (103, 114);
INSERT INTO `sys_role_menu` VALUES (103, 115);
INSERT INTO `sys_role_menu` VALUES (103, 116);
INSERT INTO `sys_role_menu` VALUES (103, 117);
INSERT INTO `sys_role_menu` VALUES (103, 500);
INSERT INTO `sys_role_menu` VALUES (103, 501);
INSERT INTO `sys_role_menu` VALUES (103, 1000);
INSERT INTO `sys_role_menu` VALUES (103, 1001);
INSERT INTO `sys_role_menu` VALUES (103, 1002);
INSERT INTO `sys_role_menu` VALUES (103, 1003);
INSERT INTO `sys_role_menu` VALUES (103, 1004);
INSERT INTO `sys_role_menu` VALUES (103, 1005);
INSERT INTO `sys_role_menu` VALUES (103, 1006);
INSERT INTO `sys_role_menu` VALUES (103, 1007);
INSERT INTO `sys_role_menu` VALUES (103, 1008);
INSERT INTO `sys_role_menu` VALUES (103, 1009);
INSERT INTO `sys_role_menu` VALUES (103, 1010);
INSERT INTO `sys_role_menu` VALUES (103, 1011);
INSERT INTO `sys_role_menu` VALUES (103, 1012);
INSERT INTO `sys_role_menu` VALUES (103, 1013);
INSERT INTO `sys_role_menu` VALUES (103, 1014);
INSERT INTO `sys_role_menu` VALUES (103, 1015);
INSERT INTO `sys_role_menu` VALUES (103, 1016);
INSERT INTO `sys_role_menu` VALUES (103, 1017);
INSERT INTO `sys_role_menu` VALUES (103, 1018);
INSERT INTO `sys_role_menu` VALUES (103, 1019);
INSERT INTO `sys_role_menu` VALUES (103, 1020);
INSERT INTO `sys_role_menu` VALUES (103, 1021);
INSERT INTO `sys_role_menu` VALUES (103, 1022);
INSERT INTO `sys_role_menu` VALUES (103, 1023);
INSERT INTO `sys_role_menu` VALUES (103, 1024);
INSERT INTO `sys_role_menu` VALUES (103, 1025);
INSERT INTO `sys_role_menu` VALUES (103, 1026);
INSERT INTO `sys_role_menu` VALUES (103, 1027);
INSERT INTO `sys_role_menu` VALUES (103, 1028);
INSERT INTO `sys_role_menu` VALUES (103, 1029);
INSERT INTO `sys_role_menu` VALUES (103, 1030);
INSERT INTO `sys_role_menu` VALUES (103, 1031);
INSERT INTO `sys_role_menu` VALUES (103, 1032);
INSERT INTO `sys_role_menu` VALUES (103, 1033);
INSERT INTO `sys_role_menu` VALUES (103, 1034);
INSERT INTO `sys_role_menu` VALUES (103, 1035);
INSERT INTO `sys_role_menu` VALUES (103, 1036);
INSERT INTO `sys_role_menu` VALUES (103, 1037);
INSERT INTO `sys_role_menu` VALUES (103, 1038);
INSERT INTO `sys_role_menu` VALUES (103, 1039);
INSERT INTO `sys_role_menu` VALUES (103, 1040);
INSERT INTO `sys_role_menu` VALUES (103, 1041);
INSERT INTO `sys_role_menu` VALUES (103, 1042);
INSERT INTO `sys_role_menu` VALUES (103, 1043);
INSERT INTO `sys_role_menu` VALUES (103, 1044);
INSERT INTO `sys_role_menu` VALUES (103, 1045);
INSERT INTO `sys_role_menu` VALUES (103, 1046);
INSERT INTO `sys_role_menu` VALUES (103, 1047);
INSERT INTO `sys_role_menu` VALUES (103, 1048);
INSERT INTO `sys_role_menu` VALUES (103, 1049);
INSERT INTO `sys_role_menu` VALUES (103, 1050);
INSERT INTO `sys_role_menu` VALUES (103, 1051);
INSERT INTO `sys_role_menu` VALUES (103, 1052);
INSERT INTO `sys_role_menu` VALUES (103, 1053);
INSERT INTO `sys_role_menu` VALUES (103, 1054);
INSERT INTO `sys_role_menu` VALUES (103, 1055);
INSERT INTO `sys_role_menu` VALUES (103, 1056);
INSERT INTO `sys_role_menu` VALUES (103, 1057);
INSERT INTO `sys_role_menu` VALUES (103, 1058);
INSERT INTO `sys_role_menu` VALUES (103, 1059);
INSERT INTO `sys_role_menu` VALUES (103, 1060);
INSERT INTO `sys_role_menu` VALUES (104, 1);
INSERT INTO `sys_role_menu` VALUES (104, 2);
INSERT INTO `sys_role_menu` VALUES (104, 3);
INSERT INTO `sys_role_menu` VALUES (104, 100);
INSERT INTO `sys_role_menu` VALUES (104, 101);
INSERT INTO `sys_role_menu` VALUES (104, 102);
INSERT INTO `sys_role_menu` VALUES (104, 103);
INSERT INTO `sys_role_menu` VALUES (104, 104);
INSERT INTO `sys_role_menu` VALUES (104, 105);
INSERT INTO `sys_role_menu` VALUES (104, 106);
INSERT INTO `sys_role_menu` VALUES (104, 107);
INSERT INTO `sys_role_menu` VALUES (104, 108);
INSERT INTO `sys_role_menu` VALUES (104, 109);
INSERT INTO `sys_role_menu` VALUES (104, 110);
INSERT INTO `sys_role_menu` VALUES (104, 111);
INSERT INTO `sys_role_menu` VALUES (104, 112);
INSERT INTO `sys_role_menu` VALUES (104, 113);
INSERT INTO `sys_role_menu` VALUES (104, 114);
INSERT INTO `sys_role_menu` VALUES (104, 115);
INSERT INTO `sys_role_menu` VALUES (104, 116);
INSERT INTO `sys_role_menu` VALUES (104, 117);
INSERT INTO `sys_role_menu` VALUES (104, 500);
INSERT INTO `sys_role_menu` VALUES (104, 501);
INSERT INTO `sys_role_menu` VALUES (104, 1000);
INSERT INTO `sys_role_menu` VALUES (104, 1001);
INSERT INTO `sys_role_menu` VALUES (104, 1002);
INSERT INTO `sys_role_menu` VALUES (104, 1003);
INSERT INTO `sys_role_menu` VALUES (104, 1004);
INSERT INTO `sys_role_menu` VALUES (104, 1005);
INSERT INTO `sys_role_menu` VALUES (104, 1006);
INSERT INTO `sys_role_menu` VALUES (104, 1007);
INSERT INTO `sys_role_menu` VALUES (104, 1008);
INSERT INTO `sys_role_menu` VALUES (104, 1009);
INSERT INTO `sys_role_menu` VALUES (104, 1010);
INSERT INTO `sys_role_menu` VALUES (104, 1011);
INSERT INTO `sys_role_menu` VALUES (104, 1012);
INSERT INTO `sys_role_menu` VALUES (104, 1013);
INSERT INTO `sys_role_menu` VALUES (104, 1014);
INSERT INTO `sys_role_menu` VALUES (104, 1015);
INSERT INTO `sys_role_menu` VALUES (104, 1016);
INSERT INTO `sys_role_menu` VALUES (104, 1017);
INSERT INTO `sys_role_menu` VALUES (104, 1018);
INSERT INTO `sys_role_menu` VALUES (104, 1019);
INSERT INTO `sys_role_menu` VALUES (104, 1020);
INSERT INTO `sys_role_menu` VALUES (104, 1021);
INSERT INTO `sys_role_menu` VALUES (104, 1022);
INSERT INTO `sys_role_menu` VALUES (104, 1023);
INSERT INTO `sys_role_menu` VALUES (104, 1024);
INSERT INTO `sys_role_menu` VALUES (104, 1025);
INSERT INTO `sys_role_menu` VALUES (104, 1026);
INSERT INTO `sys_role_menu` VALUES (104, 1027);
INSERT INTO `sys_role_menu` VALUES (104, 1028);
INSERT INTO `sys_role_menu` VALUES (104, 1029);
INSERT INTO `sys_role_menu` VALUES (104, 1030);
INSERT INTO `sys_role_menu` VALUES (104, 1031);
INSERT INTO `sys_role_menu` VALUES (104, 1032);
INSERT INTO `sys_role_menu` VALUES (104, 1033);
INSERT INTO `sys_role_menu` VALUES (104, 1034);
INSERT INTO `sys_role_menu` VALUES (104, 1035);
INSERT INTO `sys_role_menu` VALUES (104, 1036);
INSERT INTO `sys_role_menu` VALUES (104, 1037);
INSERT INTO `sys_role_menu` VALUES (104, 1038);
INSERT INTO `sys_role_menu` VALUES (104, 1039);
INSERT INTO `sys_role_menu` VALUES (104, 1040);
INSERT INTO `sys_role_menu` VALUES (104, 1041);
INSERT INTO `sys_role_menu` VALUES (104, 1042);
INSERT INTO `sys_role_menu` VALUES (104, 1043);
INSERT INTO `sys_role_menu` VALUES (104, 1044);
INSERT INTO `sys_role_menu` VALUES (104, 1045);
INSERT INTO `sys_role_menu` VALUES (104, 1046);
INSERT INTO `sys_role_menu` VALUES (104, 1047);
INSERT INTO `sys_role_menu` VALUES (104, 1048);
INSERT INTO `sys_role_menu` VALUES (104, 1049);
INSERT INTO `sys_role_menu` VALUES (104, 1050);
INSERT INTO `sys_role_menu` VALUES (104, 1051);
INSERT INTO `sys_role_menu` VALUES (104, 1052);
INSERT INTO `sys_role_menu` VALUES (104, 1053);
INSERT INTO `sys_role_menu` VALUES (104, 1054);
INSERT INTO `sys_role_menu` VALUES (104, 1055);
INSERT INTO `sys_role_menu` VALUES (104, 1056);
INSERT INTO `sys_role_menu` VALUES (104, 1057);
INSERT INTO `sys_role_menu` VALUES (104, 1058);
INSERT INTO `sys_role_menu` VALUES (104, 1059);
INSERT INTO `sys_role_menu` VALUES (104, 1060);
INSERT INTO `sys_role_menu` VALUES (105, 1);
INSERT INTO `sys_role_menu` VALUES (105, 2);
INSERT INTO `sys_role_menu` VALUES (105, 3);
INSERT INTO `sys_role_menu` VALUES (105, 100);
INSERT INTO `sys_role_menu` VALUES (105, 101);
INSERT INTO `sys_role_menu` VALUES (105, 102);
INSERT INTO `sys_role_menu` VALUES (105, 103);
INSERT INTO `sys_role_menu` VALUES (105, 104);
INSERT INTO `sys_role_menu` VALUES (105, 105);
INSERT INTO `sys_role_menu` VALUES (105, 106);
INSERT INTO `sys_role_menu` VALUES (105, 107);
INSERT INTO `sys_role_menu` VALUES (105, 108);
INSERT INTO `sys_role_menu` VALUES (105, 109);
INSERT INTO `sys_role_menu` VALUES (105, 110);
INSERT INTO `sys_role_menu` VALUES (105, 111);
INSERT INTO `sys_role_menu` VALUES (105, 112);
INSERT INTO `sys_role_menu` VALUES (105, 113);
INSERT INTO `sys_role_menu` VALUES (105, 114);
INSERT INTO `sys_role_menu` VALUES (105, 115);
INSERT INTO `sys_role_menu` VALUES (105, 116);
INSERT INTO `sys_role_menu` VALUES (105, 117);
INSERT INTO `sys_role_menu` VALUES (105, 500);
INSERT INTO `sys_role_menu` VALUES (105, 501);
INSERT INTO `sys_role_menu` VALUES (105, 1000);
INSERT INTO `sys_role_menu` VALUES (105, 1001);
INSERT INTO `sys_role_menu` VALUES (105, 1002);
INSERT INTO `sys_role_menu` VALUES (105, 1003);
INSERT INTO `sys_role_menu` VALUES (105, 1004);
INSERT INTO `sys_role_menu` VALUES (105, 1005);
INSERT INTO `sys_role_menu` VALUES (105, 1006);
INSERT INTO `sys_role_menu` VALUES (105, 1007);
INSERT INTO `sys_role_menu` VALUES (105, 1008);
INSERT INTO `sys_role_menu` VALUES (105, 1009);
INSERT INTO `sys_role_menu` VALUES (105, 1010);
INSERT INTO `sys_role_menu` VALUES (105, 1011);
INSERT INTO `sys_role_menu` VALUES (105, 1012);
INSERT INTO `sys_role_menu` VALUES (105, 1013);
INSERT INTO `sys_role_menu` VALUES (105, 1014);
INSERT INTO `sys_role_menu` VALUES (105, 1015);
INSERT INTO `sys_role_menu` VALUES (105, 1016);
INSERT INTO `sys_role_menu` VALUES (105, 1017);
INSERT INTO `sys_role_menu` VALUES (105, 1018);
INSERT INTO `sys_role_menu` VALUES (105, 1019);
INSERT INTO `sys_role_menu` VALUES (105, 1020);
INSERT INTO `sys_role_menu` VALUES (105, 1021);
INSERT INTO `sys_role_menu` VALUES (105, 1022);
INSERT INTO `sys_role_menu` VALUES (105, 1023);
INSERT INTO `sys_role_menu` VALUES (105, 1024);
INSERT INTO `sys_role_menu` VALUES (105, 1025);
INSERT INTO `sys_role_menu` VALUES (105, 1026);
INSERT INTO `sys_role_menu` VALUES (105, 1027);
INSERT INTO `sys_role_menu` VALUES (105, 1028);
INSERT INTO `sys_role_menu` VALUES (105, 1029);
INSERT INTO `sys_role_menu` VALUES (105, 1030);
INSERT INTO `sys_role_menu` VALUES (105, 1031);
INSERT INTO `sys_role_menu` VALUES (105, 1032);
INSERT INTO `sys_role_menu` VALUES (105, 1033);
INSERT INTO `sys_role_menu` VALUES (105, 1034);
INSERT INTO `sys_role_menu` VALUES (105, 1035);
INSERT INTO `sys_role_menu` VALUES (105, 1036);
INSERT INTO `sys_role_menu` VALUES (105, 1037);
INSERT INTO `sys_role_menu` VALUES (105, 1038);
INSERT INTO `sys_role_menu` VALUES (105, 1039);
INSERT INTO `sys_role_menu` VALUES (105, 1040);
INSERT INTO `sys_role_menu` VALUES (105, 1041);
INSERT INTO `sys_role_menu` VALUES (105, 1042);
INSERT INTO `sys_role_menu` VALUES (105, 1043);
INSERT INTO `sys_role_menu` VALUES (105, 1044);
INSERT INTO `sys_role_menu` VALUES (105, 1045);
INSERT INTO `sys_role_menu` VALUES (105, 1046);
INSERT INTO `sys_role_menu` VALUES (105, 1047);
INSERT INTO `sys_role_menu` VALUES (105, 1048);
INSERT INTO `sys_role_menu` VALUES (105, 1049);
INSERT INTO `sys_role_menu` VALUES (105, 1050);
INSERT INTO `sys_role_menu` VALUES (105, 1051);
INSERT INTO `sys_role_menu` VALUES (105, 1052);
INSERT INTO `sys_role_menu` VALUES (105, 1053);
INSERT INTO `sys_role_menu` VALUES (105, 1054);
INSERT INTO `sys_role_menu` VALUES (105, 1055);
INSERT INTO `sys_role_menu` VALUES (105, 1056);
INSERT INTO `sys_role_menu` VALUES (105, 1057);
INSERT INTO `sys_role_menu` VALUES (105, 1058);
INSERT INTO `sys_role_menu` VALUES (105, 1059);
INSERT INTO `sys_role_menu` VALUES (105, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-05-13 14:00:06', 'admin', '2025-04-25 16:13:04', '', '2025-05-13 14:00:07', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-04-25 16:13:04', 'admin', '2025-04-25 16:13:04', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, 103, 'test1', '张明远', '00', '', '', '0', '', '$2a$10$suRzOxl.KAlvT369TABrHeAY3cm8A5WbbZyxb8ntarW/aMMsWS3Ti', '0', '0', '', NULL, 'admin', '2025-04-25 18:51:46', 'admin', '2025-04-26 10:09:58', NULL);
INSERT INTO `sys_user` VALUES (101, 201, '李泽昊', '李泽昊', '00', '', '', '0', '', '$2a$10$0hXgA7/H2aEkrwM4YL9wXuOCfdAdSYDqcoXKj6Dzj//K4aS8qsZf2', '0', '0', '', NULL, 'admin', '2025-04-26 10:06:22', 'admin', '2025-04-26 10:07:24', NULL);
INSERT INTO `sys_user` VALUES (102, 105, '王奕辰', '王奕辰', '00', '', '', '0', '', '$2a$10$7AFVKy.Y8x3nYnVEwoRKMOLVB4jZ7D0LZBa/6vgijvNxGJDDvVoQe', '0', '0', '', NULL, 'admin', '2025-04-26 10:08:31', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, 105, '赵雅晴', '赵雅晴', '00', '', '', '0', '', '$2a$10$s0dWPwJTT2lVfPHxU/jonOBKcjVP9I7SOqnPIzZOBaaRJ.kdxQr7i', '0', '0', '', NULL, 'admin', '2025-04-26 10:09:18', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (104, 202, '孙婉婷', '孙婉婷', '00', '', '', '1', '', '$2a$10$P/We9aGutxsIFxaDvJqQ7.AiA6OZkoHU17P2AKcOJKUormYs/3iqW', '0', '0', '', NULL, 'admin', '2025-04-26 10:10:59', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (105, 103, '郑天磊', '郑天磊', '00', '', '', '0', '', '$2a$10$Af4LQggKz2fjBmT3slD6w.qlyhEakidDmP.AibeirH8UsFUXrsKnu', '0', '0', '', NULL, 'admin', '2025-04-26 10:11:33', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (106, 103, '徐若曦', '徐若曦', '00', '', '', '0', '', '$2a$10$xI3v6Pk2kPs7U3Z.QOOhje1QCZ8gUVHxf8H81FixqCVPirZEH4J6G', '0', '0', '', NULL, 'admin', '2025-04-26 10:12:26', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (107, 103, '黄哲瀚', '黄哲瀚', '00', '', '', '0', '', '$2a$10$4.2jjYQiktJYP3GB75oDfegP5Q/rSFnZ91caq1CohsW8ahwOa6ulO', '0', '0', '', NULL, 'admin', '2025-04-26 10:14:37', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 2);
INSERT INTO `sys_user_role` VALUES (101, 101);
INSERT INTO `sys_user_role` VALUES (102, 100);
INSERT INTO `sys_user_role` VALUES (102, 101);
INSERT INTO `sys_user_role` VALUES (103, 103);
INSERT INTO `sys_user_role` VALUES (104, 102);
INSERT INTO `sys_user_role` VALUES (105, 104);
INSERT INTO `sys_user_role` VALUES (106, 2);
INSERT INTO `sys_user_role` VALUES (106, 100);
INSERT INTO `sys_user_role` VALUES (106, 101);
INSERT INTO `sys_user_role` VALUES (106, 102);
INSERT INTO `sys_user_role` VALUES (106, 103);
INSERT INTO `sys_user_role` VALUES (106, 104);
INSERT INTO `sys_user_role` VALUES (107, 105);

SET FOREIGN_KEY_CHECKS = 1;
