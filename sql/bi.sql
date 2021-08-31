/*
 Navicat Premium Data Transfer

 Source Server         : se
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : bi

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 30/08/2021 17:44:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for game_group
-- ----------------------------
DROP TABLE IF EXISTS `game_group`;
CREATE TABLE `game_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `gameName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '游戏名',
  `gameId` int(0) NULL DEFAULT NULL COMMENT '游戏id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of game_group
-- ----------------------------
INSERT INTO `game_group` VALUES (1, 'bame', 1);
INSERT INTO `game_group` VALUES (2, 'napoleon', 2);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(0) NOT NULL,
  `sched_time` bigint(0) NOT NULL,
  `priority` int(0) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017B3E304CF078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017B3E304CF078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017B3E304CF078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(0) NOT NULL,
  `checkin_interval` bigint(0) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', '2YPIBVFI33U6P1630314668439', 1630316652694, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(0) NOT NULL,
  `repeat_interval` bigint(0) NOT NULL,
  `times_triggered` bigint(0) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(0) NULL DEFAULT NULL,
  `int_prop_2` int(0) NULL DEFAULT NULL,
  `long_prop_1` bigint(0) NULL DEFAULT NULL,
  `long_prop_2` bigint(0) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(0) NULL DEFAULT NULL,
  `prev_fire_time` bigint(0) NULL DEFAULT NULL,
  `priority` int(0) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(0) NOT NULL,
  `end_time` bigint(0) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(0) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1630314670000, -1, 5, 'PAUSED', 'CRON', 1630314668000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1630314675000, -1, 5, 'PAUSED', 'CRON', 1630314668000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1630314680000, -1, 5, 'PAUSED', 'CRON', 1630314668000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-08-13 14:25:58', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-08-13 14:25:58', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-08-13 14:25:58', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2021-08-13 14:25:58', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-08-13 14:25:58', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '抱抱科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-13 14:25:58', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '成都总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-13 14:25:58', 'admin', '2021-08-30 17:22:24');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-13 14:25:58', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-13 14:25:58', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '策划部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-13 14:25:58', 'admin', '2021-08-30 17:23:10');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-13 14:25:58', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-13 14:25:58', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-13 14:25:58', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-13 14:25:58', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-08-13 14:25:58', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, 'bgame', '1', 'game_group', NULL, 'default', 'N', '0', 'admin', '2021-08-25 18:13:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, 'napoleon', '2', 'game_group', NULL, 'default', 'N', '0', 'admin', '2021-08-25 18:13:26', 'admin', '2021-08-25 18:13:42', NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '管理员', '1', 'role_type', NULL, 'default', 'N', '0', 'admin', '2021-08-26 10:17:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '用户', '2', 'role_type', NULL, 'default', 'N', '0', 'admin', '2021-08-26 10:17:24', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '游戏分组', 'game_group', '0', 'admin', '2021-08-25 18:12:56', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '角色类型', 'role_type', '0', 'admin', '2021-08-26 10:16:30', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-08-13 14:25:58', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-08-13 14:25:58', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-08-13 14:25:58', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 182 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-13 14:42:05');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-08-13 14:42:38');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-13 14:42:41');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-13 14:43:00');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-08-13 14:43:06');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-13 14:44:49');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2021-08-13 14:59:24');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-13 14:59:28');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-13 14:59:37');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-13 15:03:03');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-25 16:43:12');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 16:43:16');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-25 16:45:08');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 16:46:05');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-25 17:59:52');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 17:59:56');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 10:10:28');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-26 10:57:57');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 10:58:08');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 14:04:01');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 10:12:16');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 10:36:55');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 10:36:59');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 11:32:49');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 11:36:52');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 11:36:56');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 11:53:25');
INSERT INTO `sys_logininfor` VALUES (127, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2021-08-27 11:53:35');
INSERT INTO `sys_logininfor` VALUES (128, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2021-08-27 11:54:23');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 11:54:30');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 11:57:04');
INSERT INTO `sys_logininfor` VALUES (131, 'chenshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 11:57:13');
INSERT INTO `sys_logininfor` VALUES (132, 'chenshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 11:57:35');
INSERT INTO `sys_logininfor` VALUES (133, 'chenshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 11:57:46');
INSERT INTO `sys_logininfor` VALUES (134, 'chenshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 11:58:03');
INSERT INTO `sys_logininfor` VALUES (135, 'chenshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 11:58:09');
INSERT INTO `sys_logininfor` VALUES (136, 'chenshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 11:58:17');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 11:58:30');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 14:09:34');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 14:28:05');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-08-27 14:28:27');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-08-27 14:28:32');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 14:28:34');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 14:28:35');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 14:31:35');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 15:04:47');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 15:29:54');
INSERT INTO `sys_logininfor` VALUES (147, 'chenshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 15:30:02');
INSERT INTO `sys_logininfor` VALUES (148, 'chenshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 15:30:18');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 15:30:51');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 15:55:45');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 15:56:06');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 16:03:10');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 16:03:16');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 16:22:11');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 16:23:05');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 16:23:06');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 16:25:10');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 16:37:23');
INSERT INTO `sys_logininfor` VALUES (159, 'chenshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 16:37:33');
INSERT INTO `sys_logininfor` VALUES (160, 'chenshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 16:59:25');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2021-08-27 16:59:40');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2021-08-27 16:59:43');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-08-27 16:59:46');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2021-08-27 16:59:54');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-08-27 17:00:05');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 17:00:08');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 17:06:51');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 17:06:58');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 17:07:03');
INSERT INTO `sys_logininfor` VALUES (170, 'chenshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 17:07:12');
INSERT INTO `sys_logininfor` VALUES (171, 'chenshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 17:28:25');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 17:28:33');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 17:28:50');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 17:28:54');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 17:29:01');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 17:29:06');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 17:29:14');
INSERT INTO `sys_logininfor` VALUES (178, 'chenshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 17:29:27');
INSERT INTO `sys_logininfor` VALUES (179, 'chenshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-27 17:30:11');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 17:30:17');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 11:14:00');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 14:07:30');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-30 15:18:07');
INSERT INTO `sys_logininfor` VALUES (184, 'chenshi', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 15:18:21');
INSERT INTO `sys_logininfor` VALUES (185, 'chenshi', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-30 15:47:08');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 15:47:13');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-30 16:40:22');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 16:40:26');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-30 16:40:30');
INSERT INTO `sys_logininfor` VALUES (190, 'xiaochen', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 16:40:37');
INSERT INTO `sys_logininfor` VALUES (191, 'xiaochen', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-30 17:13:53');
INSERT INTO `sys_logininfor` VALUES (192, 'xiaochen', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-08-30 17:13:56');
INSERT INTO `sys_logininfor` VALUES (193, 'xiaoshi', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 17:14:02');
INSERT INTO `sys_logininfor` VALUES (194, 'xiaoshi', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-30 17:14:08');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 17:14:15');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-30 17:14:29');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 17:14:32');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-30 17:14:38');
INSERT INTO `sys_logininfor` VALUES (199, 'xiaoshi', '192.168.0.126', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 17:14:45');
INSERT INTO `sys_logininfor` VALUES (200, 'xiaoshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 17:15:11');
INSERT INTO `sys_logininfor` VALUES (201, 'xiaoshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-30 17:17:30');
INSERT INTO `sys_logininfor` VALUES (202, 'xiaoshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2021-08-30 17:17:38');
INSERT INTO `sys_logininfor` VALUES (203, 'xiaoshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2021-08-30 17:17:42');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-08-30 17:17:50');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-08-30 17:17:53');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 17:17:56');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-30 17:24:20');
INSERT INTO `sys_logininfor` VALUES (208, 'xiaoshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 17:24:29');
INSERT INTO `sys_logininfor` VALUES (209, 'xiaoshi', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-30 17:36:42');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-30 17:36:48');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `role_type` int(0) NULL DEFAULT 1 COMMENT '角色类型： 1为管理员，2用户',
  `gameId` int(0) NULL DEFAULT NULL COMMENT '游戏类型Id',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2003 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-08-13 14:25:58', '', NULL, '系统管理目录', 1, NULL);
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-08-13 14:25:58', '', NULL, '系统监控目录', 1, NULL);
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-08-13 14:25:58', '', NULL, '系统工具目录', 1, NULL);
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-08-13 14:25:58', '', NULL, '用户管理菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-08-13 14:25:58', '', NULL, '角色管理菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-08-13 14:25:58', '', NULL, '菜单管理菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-08-13 14:25:58', '', NULL, '部门管理菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-08-13 14:25:58', '', NULL, '岗位管理菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-08-13 14:25:58', '', NULL, '字典管理菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-08-13 14:25:58', '', NULL, '参数设置菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-08-13 14:25:58', '', NULL, '通知公告菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-08-13 14:25:58', '', NULL, '日志管理菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-08-13 14:25:58', '', NULL, '在线用户菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-08-13 14:25:58', '', NULL, '定时任务菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-08-13 14:25:58', '', NULL, '数据监控菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-08-13 14:25:58', '', NULL, '服务监控菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-08-13 14:25:58', '', NULL, '缓存监控菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-08-13 14:25:58', '', NULL, '表单构建菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-08-13 14:25:58', '', NULL, '代码生成菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-08-13 14:25:58', '', NULL, '系统接口菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-08-13 14:25:58', '', NULL, '操作日志菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-08-13 14:25:58', '', NULL, '登录日志菜单', 1, NULL);
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-08-13 14:25:58', '', NULL, '', 1, NULL);
INSERT INTO `sys_menu` VALUES (2000, '数据看板', 0, 1, 'data', NULL, 1, 0, 'M', '0', '0', '', 'clipboard', 'admin', '2021-08-26 15:56:01', 'admin', '2021-08-26 17:56:59', '', 2, 1);
INSERT INTO `sys_menu` VALUES (2001, '行为分析', 0, 2, 'ac', NULL, 1, 0, 'M', '0', '0', '', 'download', 'admin', '2021-08-26 16:00:55', 'admin', '2021-08-26 16:09:40', '', 2, 2);
INSERT INTO `sys_menu` VALUES (2002, '测试菜单', 2000, 1, 'text', 'bgame/index', 1, 0, 'C', '0', '0', '', 'example', 'admin', '2021-08-26 17:53:52', 'admin', '2021-08-27 14:16:39', '', 2, 1);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2021-08-13 14:25:58', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2021-08-13 14:25:58', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/3', '127.0.0.1', '内网IP', '{menuId=3}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2021-08-25 17:05:09');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/115', '127.0.0.1', '内网IP', '{menuId=115}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2021-08-25 17:05:15');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/116', '127.0.0.1', '内网IP', '{menuId=116}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-08-25 17:05:18');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/114', '127.0.0.1', '内网IP', '{menuId=114}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-08-25 17:05:21');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1055', '127.0.0.1', '内网IP', '{menuId=1055}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-08-25 17:05:28');
INSERT INTO `sys_oper_log` VALUES (105, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"游戏分组\",\"params\":{},\"dictType\":\"game_group\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-25 18:12:56');
INSERT INTO `sys_oper_log` VALUES (106, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"game_group\",\"dictLabel\":\"bgame\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-25 18:13:25');
INSERT INTO `sys_oper_log` VALUES (107, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"game_group\",\"dictLabel\":\"bgame\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-25 18:13:26');
INSERT INTO `sys_oper_log` VALUES (108, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"game_group\",\"dictLabel\":\"napoleon\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1629886406000,\"dictCode\":101,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-25 18:13:42');
INSERT INTO `sys_oper_log` VALUES (109, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"角色类型\",\"params\":{},\"dictType\":\"role_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 10:16:30');
INSERT INTO `sys_oper_log` VALUES (110, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"role_type\",\"dictLabel\":\"管理员\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 10:17:08');
INSERT INTO `sys_oper_log` VALUES (111, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"role_type\",\"dictLabel\":\"用户\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 10:17:25');
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"role_type\",\"dictLabel\":\"用户\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 10:17:25');
INSERT INTO `sys_oper_log` VALUES (113, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dict/data/104', '127.0.0.1', '内网IP', '{dictCodes=104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 10:17:30');
INSERT INTO `sys_oper_log` VALUES (114, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleType\":1,\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1628835958000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 11:12:24');
INSERT INTO `sys_oper_log` VALUES (115, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleType\":2,\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1628835958000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 11:12:29');
INSERT INTO `sys_oper_log` VALUES (116, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleType\":0,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"12\",\"roleName\":\"12\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 11:14:10');
INSERT INTO `sys_oper_log` VALUES (117, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/100', '127.0.0.1', '内网IP', '{roleIds=100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 11:14:34');
INSERT INTO `sys_oper_log` VALUES (118, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":101,\"admin\":false,\"params\":{},\"roleType\":0,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"21312\",\"roleName\":\"12312\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 11:16:14');
INSERT INTO `sys_oper_log` VALUES (119, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/101', '127.0.0.1', '内网IP', '{roleIds=101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 11:16:21');
INSERT INTO `sys_oper_log` VALUES (120, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":102,\"admin\":false,\"params\":{},\"roleType\":0,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"33\",\"roleName\":\"33\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 11:16:46');
INSERT INTO `sys_oper_log` VALUES (121, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/102', '127.0.0.1', '内网IP', '{roleIds=102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 11:16:49');
INSERT INTO `sys_oper_log` VALUES (122, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleType\":0,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"33\",\"roleName\":\"33\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'33\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2021-08-26 11:18:18');
INSERT INTO `sys_oper_log` VALUES (123, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleType\":0,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"33\",\"roleName\":\"33\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'33\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2021-08-26 11:18:19');
INSERT INTO `sys_oper_log` VALUES (124, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":103,\"admin\":false,\"params\":{},\"roleType\":0,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"12312\",\"roleName\":\"3312312\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 11:18:25');
INSERT INTO `sys_oper_log` VALUES (125, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/103', '127.0.0.1', '内网IP', '{roleIds=103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 11:18:28');
INSERT INTO `sys_oper_log` VALUES (126, '角色管理', 5, 'com.ruoyi.web.controller.system.SysRoleController.export()', 'GET', 1, 'admin', NULL, '/system/role/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"dfbff10e-d973-4222-8133-ba0f8880ef7d_角色数据.xlsx\",\"code\":200}', 0, NULL, '2021-08-26 11:20:22');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"gameId\":1,\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"rio分析\",\"params\":{},\"roleType\":2,\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 15:56:01');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"gameId\":2,\"visible\":\"0\",\"icon\":\"download\",\"orderNum\":\"2\",\"menuName\":\"行为分析\",\"params\":{},\"roleType\":2,\"parentId\":0,\"isCache\":\"0\",\"path\":\"ac\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 16:00:55');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"gameId\":2,\"visible\":\"0\",\"icon\":\"download\",\"orderNum\":\"2\",\"menuName\":\"行为分析\",\"params\":{},\"roleType\":2,\"parentId\":0,\"isCache\":\"0\",\"path\":\"ac\",\"children\":[],\"createTime\":1629964855000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 16:09:40');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"gameId\":1,\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"数据看板\",\"params\":{},\"roleType\":2,\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1629964561000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 17:46:05');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"gameId\":1,\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"数据看板\",\"params\":{},\"roleType\":2,\"parentId\":2000,\"isCache\":\"0\",\"path\":\"online\",\"component\":\"monitor/online/index\",\"children\":[],\"createTime\":1629964561000,\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"修改菜单\'数据看板\'失败，上级菜单不能选择自己\",\"code\":500}', 0, NULL, '2021-08-26 17:52:29');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"gameId\":1,\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"数据看板\",\"params\":{},\"roleType\":2,\"parentId\":2000,\"isCache\":\"0\",\"path\":\"online\",\"component\":\"monitor/online/index\",\"children\":[],\"createTime\":1629964561000,\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"修改菜单\'数据看板\'失败，上级菜单不能选择自己\",\"code\":500}', 0, NULL, '2021-08-26 17:52:44');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"gameId\":1,\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"数据看板\",\"params\":{},\"roleType\":2,\"parentId\":2000,\"isCache\":\"0\",\"path\":\"online\",\"component\":\"monitor/online/index\",\"children\":[],\"createTime\":1629964561000,\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"修改菜单\'数据看板\'失败，上级菜单不能选择自己\",\"code\":500}', 0, NULL, '2021-08-26 17:52:44');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"gameId\":1,\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"数据看板\",\"params\":{},\"roleType\":2,\"parentId\":2000,\"isCache\":\"0\",\"path\":\"online\",\"component\":\"monitor/online/index\",\"children\":[],\"createTime\":1629964561000,\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"修改菜单\'数据看板\'失败，上级菜单不能选择自己\",\"code\":500}', 0, NULL, '2021-08-26 17:52:44');
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"gameId\":1,\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"测试菜单\",\"params\":{},\"roleType\":2,\"parentId\":2000,\"isCache\":\"0\",\"path\":\"text\",\"component\":\"/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 17:53:52');
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"gameId\":1,\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"测试菜单\",\"params\":{},\"roleType\":2,\"parentId\":2000,\"isCache\":\"0\",\"path\":\"text\",\"component\":\"monitor/online/index\",\"children\":[],\"createTime\":1629971632000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 17:54:44');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"gameId\":1,\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"数据看板\",\"params\":{},\"roleType\":2,\"parentId\":0,\"isCache\":\"0\",\"path\":\"data\",\"children\":[],\"createTime\":1629964561000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 17:56:59');
INSERT INTO `sys_oper_log` VALUES (138, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleType\":2,\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1628835958000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[2000,2002],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-27 10:16:39');
INSERT INTO `sys_oper_log` VALUES (139, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$d0Atx5pHwDKPRg9pwrImV.FFCtPwYrV/Yn2gv2pelW9kDpr3wVc/y\",\"updateBy\":\"admin\",\"params\":{},\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-27 11:52:20');
INSERT INTO `sys_oper_log` VALUES (140, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$LCgdLTv/P0gleL2eN6OXgeIwiZMungKUdofrs1VWHxgGVRhUvlD2y\",\"postIds\":[2],\"nickName\":\"chenshi\",\"sex\":\"0\",\"deptId\":101,\"params\":{},\"userName\":\"chenshi\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-27 11:56:50');
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"gameId\":1,\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"测试菜单\",\"params\":{},\"roleType\":2,\"parentId\":2000,\"isCache\":\"0\",\"path\":\"text\",\"component\":\"bgame/index\",\"children\":[],\"createTime\":1629971632000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-27 14:16:38');
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"gameId\":1,\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"测试菜单\",\"params\":{},\"roleType\":2,\"parentId\":2000,\"isCache\":\"0\",\"path\":\"text\",\"component\":\"bgame/index\",\"children\":[],\"createTime\":1629971632000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-27 14:16:39');
INSERT INTO `sys_oper_log` VALUES (143, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'chenshi', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '13245 admin123', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2021-08-27 17:28:13');
INSERT INTO `sys_oper_log` VALUES (144, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'chenshi', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '12345 admin123', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-27 17:28:19');
INSERT INTO `sys_oper_log` VALUES (145, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleType\":2,\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1628835958000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[2000,2002,2001],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-27 17:28:45');
INSERT INTO `sys_oper_log` VALUES (146, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleType\":2,\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1628835958000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[2000,2002],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 11:26:31');
INSERT INTO `sys_oper_log` VALUES (147, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleType\":2,\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1628835958000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[2000,2002,2001],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 15:05:00');
INSERT INTO `sys_oper_log` VALUES (148, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通管理员\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"新增角色\'普通管理员\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2021-08-30 15:48:15');
INSERT INTO `sys_oper_log` VALUES (149, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":104,\"admin\":false,\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"manager\",\"roleName\":\"普通管理员\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 15:49:14');
INSERT INTO `sys_oper_log` VALUES (150, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":104,\"admin\":false,\"params\":{},\"roleType\":0,\"deptCheckStrictly\":false,\"updateBy\":\"admin\",\"menuCheckStrictly\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 15:49:19');
INSERT INTO `sys_oper_log` VALUES (151, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/104', '192.168.0.126', '内网IP', '{roleIds=104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 15:49:37');
INSERT INTO `sys_oper_log` VALUES (152, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleType\":1,\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"manager\",\"roleName\":\"普通管理员\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"新增角色\'普通管理员\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2021-08-30 15:50:02');
INSERT INTO `sys_oper_log` VALUES (153, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"admin\":false,\"remark\":\"普通管理员\",\"params\":{},\"roleType\":1,\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"manage\",\"roleName\":\"普通管理员\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"新增角色\'普通管理员\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2021-08-30 15:50:44');
INSERT INTO `sys_oper_log` VALUES (154, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":105,\"admin\":false,\"remark\":\"普通管理员\",\"params\":{},\"roleType\":1,\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"manage\",\"roleName\":\"管理员\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 15:50:51');
INSERT INTO `sys_oper_log` VALUES (155, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":105,\"admin\":false,\"params\":{},\"roleType\":0,\"deptCheckStrictly\":false,\"updateBy\":\"admin\",\"menuCheckStrictly\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 15:51:00');
INSERT INTO `sys_oper_log` VALUES (156, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":105,\"admin\":false,\"remark\":\"普通管理员\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleType\":1,\"roleSort\":\"3\",\"deptCheckStrictly\":false,\"createTime\":1630309851000,\"updateBy\":\"admin\",\"menuCheckStrictly\":false,\"roleKey\":\"manage\",\"roleName\":\"管理员\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 15:55:39');
INSERT INTO `sys_oper_log` VALUES (157, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":106,\"admin\":false,\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"11\",\"roleName\":\"特特\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 15:58:58');
INSERT INTO `sys_oper_log` VALUES (158, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":106,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1630310337000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"11\",\"roleName\":\"特特\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:02:03');
INSERT INTO `sys_oper_log` VALUES (159, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":106,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1630310337000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"11\",\"roleName\":\"特特\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:02:32');
INSERT INTO `sys_oper_log` VALUES (160, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/106', '192.168.0.126', '内网IP', '{roleIds=106}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:04:24');
INSERT INTO `sys_oper_log` VALUES (161, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"测试\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"新增角色\'测试\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2021-08-30 16:12:08');
INSERT INTO `sys_oper_log` VALUES (162, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":107,\"admin\":false,\"remark\":\"tet\",\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"ad\",\"roleName\":\"测试\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:13:03');
INSERT INTO `sys_oper_log` VALUES (163, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":108,\"admin\":false,\"remark\":\"33\",\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"333\",\"roleName\":\"33\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:15:50');
INSERT INTO `sys_oper_log` VALUES (164, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":109,\"admin\":false,\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"1231\",\"roleName\":\"123123\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:16:08');
INSERT INTO `sys_oper_log` VALUES (165, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/109', '192.168.0.126', '内网IP', '{roleIds=109}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:16:28');
INSERT INTO `sys_oper_log` VALUES (166, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/107', '192.168.0.126', '内网IP', '{roleIds=107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:16:34');
INSERT INTO `sys_oper_log` VALUES (167, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/108', '192.168.0.126', '内网IP', '{roleIds=108}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:16:40');
INSERT INTO `sys_oper_log` VALUES (168, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":110,\"admin\":false,\"remark\":\"123\",\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"321231\",\"roleName\":\"1\",\"deptIds\":[],\"menuIds\":[2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:18:41');
INSERT INTO `sys_oper_log` VALUES (169, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":111,\"admin\":false,\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"`12`12\",\"roleName\":\"`12\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:21:20');
INSERT INTO `sys_oper_log` VALUES (170, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/111', '192.168.0.126', '内网IP', '{roleIds=111}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:27:28');
INSERT INTO `sys_oper_log` VALUES (171, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"tt\",\"roleName\":\"哈哈哈\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113],\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'role_type\' in \'class com.ruoyi.common.core.domain.entity.SysRole\'', '2021-08-30 16:27:56');
INSERT INTO `sys_oper_log` VALUES (172, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":112,\"admin\":false,\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"tt\",\"roleName\":\"434\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:31:58');
INSERT INTO `sys_oper_log` VALUES (173, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":113,\"admin\":false,\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"test\",\"roleName\":\"测试\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:32:26');
INSERT INTO `sys_oper_log` VALUES (174, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/112', '192.168.0.126', '内网IP', '{roleIds=112}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:32:36');
INSERT INTO `sys_oper_log` VALUES (175, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/113', '192.168.0.126', '内网IP', '{roleIds=113}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:32:38');
INSERT INTO `sys_oper_log` VALUES (176, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/105', '192.168.0.126', '内网IP', '{roleIds=105}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:32:40');
INSERT INTO `sys_oper_log` VALUES (177, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.0.126', '内网IP', '{\"flag\":false,\"roleId\":114,\"admin\":false,\"remark\":\"普通管理员\",\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"manager\",\"roleName\":\"普通管理员\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:33:54');
INSERT INTO `sys_oper_log` VALUES (178, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '192.168.0.126', '内网IP', '{\"admin\":false,\"remark\":\"管理员\",\"password\":\"$2a$10$WXr1YllGjLnEx1dR184o4.u4chrrUHyEEN73MppzxmvvABRUARye.\",\"postIds\":[2],\"nickName\":\"xiaochen\",\"sex\":\"0\",\"deptId\":101,\"params\":{},\"userName\":\"xiaochen\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[114],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:34:59');
INSERT INTO `sys_oper_log` VALUES (179, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '192.168.0.126', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$4gk.abgDjIgGfQspgqQh6.9UnXDqYZnZX0Y0.zZu4jNe9LPWWyls6\",\"updateBy\":\"admin\",\"params\":{},\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:35:35');
INSERT INTO `sys_oper_log` VALUES (180, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '192.168.0.126', '内网IP', '{\"phonenumber\":\"\",\"admin\":false,\"password\":\"$2a$10$YNZXeZ8jlWJmwLqkA0hSZ.3cwd7fnuZhjVQyccPYUdoIx7MGZ6S1a\",\"postIds\":[3],\"email\":\"\",\"nickName\":\"123\",\"sex\":\"0\",\"deptId\":103,\"params\":{},\"userName\":\"123\",\"userId\":102,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:39:45');
INSERT INTO `sys_oper_log` VALUES (181, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/102', '192.168.0.126', '内网IP', '{userIds=102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 16:39:55');
INSERT INTO `sys_oper_log` VALUES (182, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'xiaochen', NULL, '/system/user', '192.168.0.126', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$nyv4DZgzDTYcFKwZsG8FYuTwS00kBmcDMR64cbM8WzHU1xLwPNIMm\",\"postIds\":[2],\"nickName\":\"小石\",\"sex\":\"0\",\"params\":{},\"userName\":\"xiaoshi\",\"userId\":103,\"createBy\":\"xiaochen\",\"roleIds\":[114],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 17:13:08');
INSERT INTO `sys_oper_log` VALUES (183, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'xiaochen', NULL, '/system/user', '192.168.0.126', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":114,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"manager\",\"roleName\":\"普通管理员\",\"status\":\"0\"}],\"phonenumber\":\"\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"xiaochen\",\"postIds\":[2],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"小石\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"xiaoshi\",\"userId\":103,\"createBy\":\"xiaochen\",\"roleIds\":[2],\"createTime\":1630314788000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 17:13:18');
INSERT INTO `sys_oper_log` VALUES (184, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'xiaochen', NULL, '/system/user', '192.168.0.126', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleType\":2,\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"xiaochen\",\"postIds\":[2],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"小石\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"xiaoshi\",\"userId\":103,\"createBy\":\"xiaochen\",\"roleIds\":[114],\"createTime\":1630314788000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 17:13:22');
INSERT INTO `sys_oper_log` VALUES (185, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'xiaochen', NULL, '/system/user/resetPwd', '192.168.0.126', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$jvEq/Fnm/nd8.PAcy04nNe8aqGyGxDvw8NpJ2aXU2m1v/2ow1S0pO\",\"updateBy\":\"xiaochen\",\"params\":{},\"userId\":103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 17:13:39');
INSERT INTO `sys_oper_log` VALUES (186, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '192.168.0.126', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":114,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleType\":1,\"roleSort\":\"0\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"manager\",\"roleName\":\"普通管理员\",\"status\":\"0\"}],\"phonenumber\":\"\",\"admin\":false,\"loginDate\":1630314843000,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"192.168.0.126\",\"email\":\"\",\"nickName\":\"小石\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"xiaoshi\",\"userId\":103,\"createBy\":\"xiaochen\",\"roleIds\":[2],\"createTime\":1630314788000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 17:14:26');
INSERT INTO `sys_oper_log` VALUES (187, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$9YzVCNZk/Owe59Br0/sx5.pAenesl5sCbSOX4KiMH70uWHFd8Duh.\",\"postIds\":[],\"nickName\":\"rrr\",\"params\":{},\"userName\":\"root111\",\"userId\":104,\"createBy\":\"admin\",\"roleIds\":[114],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 17:18:44');
INSERT INTO `sys_oper_log` VALUES (188, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"T7L4lZ^NeOlV#NBQ\",\"postIds\":[],\"nickName\":\"rrr\",\"params\":{},\"userName\":\"root111\",\"roleIds\":[114],\"status\":\"0\"}', '{\"msg\":\"新增用户\'root111\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2021-08-30 17:18:44');
INSERT INTO `sys_oper_log` VALUES (189, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/104', '127.0.0.1', '内网IP', '{userIds=104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 17:18:48');
INSERT INTO `sys_oper_log` VALUES (190, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'GET', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"acb41202-1050-452e-b3bd-7aa97f126178_用户数据.xlsx\",\"code\":200}', 0, NULL, '2021-08-30 17:18:55');
INSERT INTO `sys_oper_log` VALUES (191, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"成都总公司\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1628835958000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 17:22:24');
INSERT INTO `sys_oper_log` VALUES (192, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"策划部门\",\"leader\":\"若依\",\"deptId\":104,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1628835958000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-30 17:23:10');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-08-13 14:25:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-08-13 14:25:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-08-13 14:25:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-08-13 14:25:58', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `role_type` int(0) NULL DEFAULT NULL COMMENT '角色类型： 1为管理员，2用户',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-08-13 14:25:58', '', NULL, '超级管理员', 1);
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2021-08-13 14:25:58', 'admin', '2021-08-30 15:05:00', '普通角色', 2);
INSERT INTO `sys_role` VALUES (114, '普通管理员', 'manager', 0, '1', 1, 1, '0', '0', 'admin', '2021-08-30 16:33:54', '', NULL, '普通管理员', 1);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

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
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (110, 2);
INSERT INTO `sys_role_menu` VALUES (110, 109);
INSERT INTO `sys_role_menu` VALUES (110, 110);
INSERT INTO `sys_role_menu` VALUES (110, 111);
INSERT INTO `sys_role_menu` VALUES (110, 112);
INSERT INTO `sys_role_menu` VALUES (110, 113);
INSERT INTO `sys_role_menu` VALUES (110, 1046);
INSERT INTO `sys_role_menu` VALUES (110, 1047);
INSERT INTO `sys_role_menu` VALUES (110, 1048);
INSERT INTO `sys_role_menu` VALUES (110, 1049);
INSERT INTO `sys_role_menu` VALUES (110, 1050);
INSERT INTO `sys_role_menu` VALUES (110, 1051);
INSERT INTO `sys_role_menu` VALUES (110, 1052);
INSERT INTO `sys_role_menu` VALUES (110, 1053);
INSERT INTO `sys_role_menu` VALUES (110, 1054);
INSERT INTO `sys_role_menu` VALUES (114, 1);
INSERT INTO `sys_role_menu` VALUES (114, 2);
INSERT INTO `sys_role_menu` VALUES (114, 3);
INSERT INTO `sys_role_menu` VALUES (114, 100);
INSERT INTO `sys_role_menu` VALUES (114, 101);
INSERT INTO `sys_role_menu` VALUES (114, 102);
INSERT INTO `sys_role_menu` VALUES (114, 103);
INSERT INTO `sys_role_menu` VALUES (114, 104);
INSERT INTO `sys_role_menu` VALUES (114, 105);
INSERT INTO `sys_role_menu` VALUES (114, 106);
INSERT INTO `sys_role_menu` VALUES (114, 107);
INSERT INTO `sys_role_menu` VALUES (114, 108);
INSERT INTO `sys_role_menu` VALUES (114, 109);
INSERT INTO `sys_role_menu` VALUES (114, 110);
INSERT INTO `sys_role_menu` VALUES (114, 111);
INSERT INTO `sys_role_menu` VALUES (114, 112);
INSERT INTO `sys_role_menu` VALUES (114, 113);
INSERT INTO `sys_role_menu` VALUES (114, 114);
INSERT INTO `sys_role_menu` VALUES (114, 115);
INSERT INTO `sys_role_menu` VALUES (114, 116);
INSERT INTO `sys_role_menu` VALUES (114, 500);
INSERT INTO `sys_role_menu` VALUES (114, 501);
INSERT INTO `sys_role_menu` VALUES (114, 1001);
INSERT INTO `sys_role_menu` VALUES (114, 1002);
INSERT INTO `sys_role_menu` VALUES (114, 1003);
INSERT INTO `sys_role_menu` VALUES (114, 1004);
INSERT INTO `sys_role_menu` VALUES (114, 1005);
INSERT INTO `sys_role_menu` VALUES (114, 1006);
INSERT INTO `sys_role_menu` VALUES (114, 1007);
INSERT INTO `sys_role_menu` VALUES (114, 1008);
INSERT INTO `sys_role_menu` VALUES (114, 1009);
INSERT INTO `sys_role_menu` VALUES (114, 1010);
INSERT INTO `sys_role_menu` VALUES (114, 1011);
INSERT INTO `sys_role_menu` VALUES (114, 1012);
INSERT INTO `sys_role_menu` VALUES (114, 1013);
INSERT INTO `sys_role_menu` VALUES (114, 1014);
INSERT INTO `sys_role_menu` VALUES (114, 1015);
INSERT INTO `sys_role_menu` VALUES (114, 1016);
INSERT INTO `sys_role_menu` VALUES (114, 1017);
INSERT INTO `sys_role_menu` VALUES (114, 1018);
INSERT INTO `sys_role_menu` VALUES (114, 1019);
INSERT INTO `sys_role_menu` VALUES (114, 1020);
INSERT INTO `sys_role_menu` VALUES (114, 1021);
INSERT INTO `sys_role_menu` VALUES (114, 1022);
INSERT INTO `sys_role_menu` VALUES (114, 1023);
INSERT INTO `sys_role_menu` VALUES (114, 1024);
INSERT INTO `sys_role_menu` VALUES (114, 1025);
INSERT INTO `sys_role_menu` VALUES (114, 1026);
INSERT INTO `sys_role_menu` VALUES (114, 1027);
INSERT INTO `sys_role_menu` VALUES (114, 1028);
INSERT INTO `sys_role_menu` VALUES (114, 1029);
INSERT INTO `sys_role_menu` VALUES (114, 1030);
INSERT INTO `sys_role_menu` VALUES (114, 1031);
INSERT INTO `sys_role_menu` VALUES (114, 1032);
INSERT INTO `sys_role_menu` VALUES (114, 1033);
INSERT INTO `sys_role_menu` VALUES (114, 1034);
INSERT INTO `sys_role_menu` VALUES (114, 1035);
INSERT INTO `sys_role_menu` VALUES (114, 1036);
INSERT INTO `sys_role_menu` VALUES (114, 1037);
INSERT INTO `sys_role_menu` VALUES (114, 1038);
INSERT INTO `sys_role_menu` VALUES (114, 1039);
INSERT INTO `sys_role_menu` VALUES (114, 1040);
INSERT INTO `sys_role_menu` VALUES (114, 1041);
INSERT INTO `sys_role_menu` VALUES (114, 1042);
INSERT INTO `sys_role_menu` VALUES (114, 1043);
INSERT INTO `sys_role_menu` VALUES (114, 1044);
INSERT INTO `sys_role_menu` VALUES (114, 1045);
INSERT INTO `sys_role_menu` VALUES (114, 1046);
INSERT INTO `sys_role_menu` VALUES (114, 1047);
INSERT INTO `sys_role_menu` VALUES (114, 1048);
INSERT INTO `sys_role_menu` VALUES (114, 1049);
INSERT INTO `sys_role_menu` VALUES (114, 1050);
INSERT INTO `sys_role_menu` VALUES (114, 1051);
INSERT INTO `sys_role_menu` VALUES (114, 1052);
INSERT INTO `sys_role_menu` VALUES (114, 1053);
INSERT INTO `sys_role_menu` VALUES (114, 1054);
INSERT INTO `sys_role_menu` VALUES (114, 1055);
INSERT INTO `sys_role_menu` VALUES (114, 1056);
INSERT INTO `sys_role_menu` VALUES (114, 1057);
INSERT INTO `sys_role_menu` VALUES (114, 1058);
INSERT INTO `sys_role_menu` VALUES (114, 1059);
INSERT INTO `sys_role_menu` VALUES (114, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-08-30 17:36:49', 'admin', '2021-08-13 14:25:58', '', '2021-08-30 17:36:48', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$d0Atx5pHwDKPRg9pwrImV.FFCtPwYrV/Yn2gv2pelW9kDpr3wVc/y', '0', '0', '127.0.0.1', '2021-08-13 14:25:58', 'admin', '2021-08-13 14:25:58', 'admin', '2021-08-27 11:52:20', '测试员');
INSERT INTO `sys_user` VALUES (100, 101, 'chenshi', 'chenshi', '00', '', '', '0', '', '$2a$10$vdabEF1hhWJsE/bEBIsOuOkFWhRsijBZYl6L6dkZ6Uhp2RmvoUldi', '0', '0', '192.168.0.126', '2021-08-30 15:18:22', 'admin', '2021-08-27 11:56:50', '', '2021-08-30 15:18:21', NULL);
INSERT INTO `sys_user` VALUES (101, 101, 'xiaochen', 'xiaochen', '00', '', '', '0', '', '$2a$10$4gk.abgDjIgGfQspgqQh6.9UnXDqYZnZX0Y0.zZu4jNe9LPWWyls6', '0', '0', '192.168.0.126', '2021-08-30 16:40:37', 'admin', '2021-08-30 16:34:59', 'admin', '2021-08-30 16:40:37', '管理员');
INSERT INTO `sys_user` VALUES (102, 103, '123', '123', '00', '', '', '0', '', '$2a$10$YNZXeZ8jlWJmwLqkA0hSZ.3cwd7fnuZhjVQyccPYUdoIx7MGZ6S1a', '0', '2', '', NULL, 'admin', '2021-08-30 16:39:45', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, NULL, 'xiaoshi', '小石', '00', '', '', '0', '', '$2a$10$jvEq/Fnm/nd8.PAcy04nNe8aqGyGxDvw8NpJ2aXU2m1v/2ow1S0pO', '0', '0', '127.0.0.1', '2021-08-30 17:24:29', 'xiaochen', '2021-08-30 17:13:08', 'admin', '2021-08-30 17:24:29', NULL);
INSERT INTO `sys_user` VALUES (104, NULL, 'root111', 'rrr', '00', '', '', '0', '', '$2a$10$9YzVCNZk/Owe59Br0/sx5.pAenesl5sCbSOX4KiMH70uWHFd8Duh.', '0', '2', '', NULL, 'admin', '2021-08-30 17:18:44', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 2);
INSERT INTO `sys_user_post` VALUES (101, 2);
INSERT INTO `sys_user_post` VALUES (103, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 2);
INSERT INTO `sys_user_role` VALUES (101, 114);
INSERT INTO `sys_user_role` VALUES (103, 2);

SET FOREIGN_KEY_CHECKS = 1;
