/*
 Navicat Premium Data Transfer

 Source Server         : MySQL-Mac
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : workorder

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 20/02/2022 16:52:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add 权限', 6, 'add_permissions');
INSERT INTO `auth_permission` VALUES (22, 'Can change 权限', 6, 'change_permissions');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 权限', 6, 'delete_permissions');
INSERT INTO `auth_permission` VALUES (24, 'Can view 权限', 6, 'view_permissions');
INSERT INTO `auth_permission` VALUES (25, 'Can add 角色', 7, 'add_role');
INSERT INTO `auth_permission` VALUES (26, 'Can change 角色', 7, 'change_role');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 角色', 7, 'delete_role');
INSERT INTO `auth_permission` VALUES (28, 'Can view 角色', 7, 'view_role');
INSERT INTO `auth_permission` VALUES (29, 'Can add 组织架构', 8, 'add_organization');
INSERT INTO `auth_permission` VALUES (30, 'Can change 组织架构', 8, 'change_organization');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 组织架构', 8, 'delete_organization');
INSERT INTO `auth_permission` VALUES (32, 'Can view 组织架构', 8, 'view_organization');
INSERT INTO `auth_permission` VALUES (33, 'Can add 用户信息', 9, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (34, 'Can change 用户信息', 9, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 用户信息', 9, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (36, 'Can view 用户信息', 9, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (37, 'Can add 权限', 6, 'add_permission');
INSERT INTO `auth_permission` VALUES (38, 'Can change 权限', 6, 'change_permission');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 权限', 6, 'delete_permission');
INSERT INTO `auth_permission` VALUES (40, 'Can view 权限', 6, 'view_permission');
INSERT INTO `auth_permission` VALUES (41, 'Can add 模型分组', 10, 'add_group');
INSERT INTO `auth_permission` VALUES (42, 'Can change 模型分组', 10, 'change_group');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 模型分组', 10, 'delete_group');
INSERT INTO `auth_permission` VALUES (44, 'Can view 模型分组', 10, 'view_group');
INSERT INTO `auth_permission` VALUES (45, 'Can add 模型', 11, 'add_info');
INSERT INTO `auth_permission` VALUES (46, 'Can change 模型', 11, 'change_info');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 模型', 11, 'delete_info');
INSERT INTO `auth_permission` VALUES (48, 'Can view 模型', 11, 'view_info');
INSERT INTO `auth_permission` VALUES (49, 'Can add 模型关系类型', 12, 'add_inforelatedtype');
INSERT INTO `auth_permission` VALUES (50, 'Can change 模型关系类型', 12, 'change_inforelatedtype');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 模型关系类型', 12, 'delete_inforelatedtype');
INSERT INTO `auth_permission` VALUES (52, 'Can view 模型关系类型', 12, 'view_inforelatedtype');
INSERT INTO `auth_permission` VALUES (53, 'Can add 字段分组', 13, 'add_fieldgroup');
INSERT INTO `auth_permission` VALUES (54, 'Can change 字段分组', 13, 'change_fieldgroup');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 字段分组', 13, 'delete_fieldgroup');
INSERT INTO `auth_permission` VALUES (56, 'Can view 字段分组', 13, 'view_fieldgroup');
INSERT INTO `auth_permission` VALUES (57, 'Can add 模型关系', 14, 'add_inforelated');
INSERT INTO `auth_permission` VALUES (58, 'Can change 模型关系', 14, 'change_inforelated');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 模型关系', 14, 'delete_inforelated');
INSERT INTO `auth_permission` VALUES (60, 'Can view 模型关系', 14, 'view_inforelated');
INSERT INTO `auth_permission` VALUES (61, 'Can add 字段', 15, 'add_fields');
INSERT INTO `auth_permission` VALUES (62, 'Can change 字段', 15, 'change_fields');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 字段', 15, 'delete_fields');
INSERT INTO `auth_permission` VALUES (64, 'Can view 字段', 15, 'view_fields');
INSERT INTO `auth_permission` VALUES (65, 'Can add 数据', 16, 'add_data');
INSERT INTO `auth_permission` VALUES (66, 'Can change 数据', 16, 'change_data');
INSERT INTO `auth_permission` VALUES (67, 'Can delete 数据', 16, 'delete_data');
INSERT INTO `auth_permission` VALUES (68, 'Can view 数据', 16, 'view_data');
INSERT INTO `auth_permission` VALUES (69, 'Can add 标签管理', 17, 'add_tag');
INSERT INTO `auth_permission` VALUES (70, 'Can change 标签管理', 17, 'change_tag');
INSERT INTO `auth_permission` VALUES (71, 'Can delete 标签管理', 17, 'delete_tag');
INSERT INTO `auth_permission` VALUES (72, 'Can view 标签管理', 17, 'view_tag');
INSERT INTO `auth_permission` VALUES (73, 'Can add 数据和标签关联关系', 18, 'add_datatagrelated');
INSERT INTO `auth_permission` VALUES (74, 'Can change 数据和标签关联关系', 18, 'change_datatagrelated');
INSERT INTO `auth_permission` VALUES (75, 'Can delete 数据和标签关联关系', 18, 'delete_datatagrelated');
INSERT INTO `auth_permission` VALUES (76, 'Can view 数据和标签关联关系', 18, 'view_datatagrelated');
INSERT INTO `auth_permission` VALUES (77, 'Can add 数据关系', 19, 'add_datarelated');
INSERT INTO `auth_permission` VALUES (78, 'Can change 数据关系', 19, 'change_datarelated');
INSERT INTO `auth_permission` VALUES (79, 'Can delete 数据关系', 19, 'delete_datarelated');
INSERT INTO `auth_permission` VALUES (80, 'Can view 数据关系', 19, 'view_datarelated');
INSERT INTO `auth_permission` VALUES (81, 'Can add 应用id', 20, 'add_appid');
INSERT INTO `auth_permission` VALUES (82, 'Can change 应用id', 20, 'change_appid');
INSERT INTO `auth_permission` VALUES (83, 'Can delete 应用id', 20, 'delete_appid');
INSERT INTO `auth_permission` VALUES (84, 'Can view 应用id', 20, 'view_appid');
INSERT INTO `auth_permission` VALUES (85, 'Can add 微信消息', 21, 'add_wxmsglogs');
INSERT INTO `auth_permission` VALUES (86, 'Can change 微信消息', 21, 'change_wxmsglogs');
INSERT INTO `auth_permission` VALUES (87, 'Can delete 微信消息', 21, 'delete_wxmsglogs');
INSERT INTO `auth_permission` VALUES (88, 'Can view 微信消息', 21, 'view_wxmsglogs');
INSERT INTO `auth_permission` VALUES (89, 'Can add 告警表', 22, 'add_alertcenter');
INSERT INTO `auth_permission` VALUES (90, 'Can change 告警表', 22, 'change_alertcenter');
INSERT INTO `auth_permission` VALUES (91, 'Can delete 告警表', 22, 'delete_alertcenter');
INSERT INTO `auth_permission` VALUES (92, 'Can view 告警表', 22, 'view_alertcenter');
INSERT INTO `auth_permission` VALUES (93, 'Can add 工单', 23, 'add_workorder');
INSERT INTO `auth_permission` VALUES (94, 'Can change 工单', 23, 'change_workorder');
INSERT INTO `auth_permission` VALUES (95, 'Can delete 工单', 23, 'delete_workorder');
INSERT INTO `auth_permission` VALUES (96, 'Can view 工单', 23, 'view_workorder');
INSERT INTO `auth_permission` VALUES (97, 'Can add 任务', 24, 'add_tasks');
INSERT INTO `auth_permission` VALUES (98, 'Can change 任务', 24, 'change_tasks');
INSERT INTO `auth_permission` VALUES (99, 'Can delete 任务', 24, 'delete_tasks');
INSERT INTO `auth_permission` VALUES (100, 'Can view 任务', 24, 'view_tasks');
INSERT INTO `auth_permission` VALUES (101, 'Can add deploy', 25, 'add_deploy');
INSERT INTO `auth_permission` VALUES (102, 'Can change deploy', 25, 'change_deploy');
INSERT INTO `auth_permission` VALUES (103, 'Can delete deploy', 25, 'delete_deploy');
INSERT INTO `auth_permission` VALUES (104, 'Can view deploy', 25, 'view_deploy');
INSERT INTO `auth_permission` VALUES (105, 'Can add pkey model', 26, 'add_pkeymodel');
INSERT INTO `auth_permission` VALUES (106, 'Can change pkey model', 26, 'change_pkeymodel');
INSERT INTO `auth_permission` VALUES (107, 'Can delete pkey model', 26, 'delete_pkeymodel');
INSERT INTO `auth_permission` VALUES (108, 'Can view pkey model', 26, 'view_pkeymodel');
INSERT INTO `auth_permission` VALUES (109, 'Can add host category', 27, 'add_hostcategory');
INSERT INTO `auth_permission` VALUES (110, 'Can change host category', 27, 'change_hostcategory');
INSERT INTO `auth_permission` VALUES (111, 'Can delete host category', 27, 'delete_hostcategory');
INSERT INTO `auth_permission` VALUES (112, 'Can view host category', 27, 'view_hostcategory');
INSERT INTO `auth_permission` VALUES (113, 'Can add host', 28, 'add_host');
INSERT INTO `auth_permission` VALUES (114, 'Can change host', 28, 'change_host');
INSERT INTO `auth_permission` VALUES (115, 'Can delete host', 28, 'delete_host');
INSERT INTO `auth_permission` VALUES (116, 'Can view host', 28, 'view_host');
INSERT INTO `auth_permission` VALUES (117, 'Can add cmd template', 29, 'add_cmdtemplate');
INSERT INTO `auth_permission` VALUES (118, 'Can change cmd template', 29, 'change_cmdtemplate');
INSERT INTO `auth_permission` VALUES (119, 'Can delete cmd template', 29, 'delete_cmdtemplate');
INSERT INTO `auth_permission` VALUES (120, 'Can view cmd template', 29, 'view_cmdtemplate');
INSERT INTO `auth_permission` VALUES (121, 'Can add cmd exex history', 30, 'add_cmdexexhistory');
INSERT INTO `auth_permission` VALUES (122, 'Can change cmd exex history', 30, 'change_cmdexexhistory');
INSERT INTO `auth_permission` VALUES (123, 'Can delete cmd exex history', 30, 'delete_cmdexexhistory');
INSERT INTO `auth_permission` VALUES (124, 'Can view cmd exex history', 30, 'view_cmdexexhistory');
INSERT INTO `auth_permission` VALUES (125, 'Can add cmd template category', 31, 'add_cmdtemplatecategory');
INSERT INTO `auth_permission` VALUES (126, 'Can change cmd template category', 31, 'change_cmdtemplatecategory');
INSERT INTO `auth_permission` VALUES (127, 'Can delete cmd template category', 31, 'delete_cmdtemplatecategory');
INSERT INTO `auth_permission` VALUES (128, 'Can view cmd template category', 31, 'view_cmdtemplatecategory');
INSERT INTO `auth_permission` VALUES (129, 'Can add environment', 32, 'add_environment');
INSERT INTO `auth_permission` VALUES (130, 'Can change environment', 32, 'change_environment');
INSERT INTO `auth_permission` VALUES (131, 'Can delete environment', 32, 'delete_environment');
INSERT INTO `auth_permission` VALUES (132, 'Can view environment', 32, 'view_environment');
INSERT INTO `auth_permission` VALUES (133, 'Can add release app', 33, 'add_releaseapp');
INSERT INTO `auth_permission` VALUES (134, 'Can change release app', 33, 'change_releaseapp');
INSERT INTO `auth_permission` VALUES (135, 'Can delete release app', 33, 'delete_releaseapp');
INSERT INTO `auth_permission` VALUES (136, 'Can view release app', 33, 'view_releaseapp');
INSERT INTO `auth_permission` VALUES (137, 'Can add release record detail', 34, 'add_releaserecorddetail');
INSERT INTO `auth_permission` VALUES (138, 'Can change release record detail', 34, 'change_releaserecorddetail');
INSERT INTO `auth_permission` VALUES (139, 'Can delete release record detail', 34, 'delete_releaserecorddetail');
INSERT INTO `auth_permission` VALUES (140, 'Can view release record detail', 34, 'view_releaserecorddetail');
INSERT INTO `auth_permission` VALUES (141, 'Can add release record', 35, 'add_releaserecord');
INSERT INTO `auth_permission` VALUES (142, 'Can change release record', 35, 'change_releaserecord');
INSERT INTO `auth_permission` VALUES (143, 'Can delete release record', 35, 'delete_releaserecord');
INSERT INTO `auth_permission` VALUES (144, 'Can view release record', 35, 'view_releaserecord');
INSERT INTO `auth_permission` VALUES (145, 'Can add release apply', 36, 'add_releaseapply');
INSERT INTO `auth_permission` VALUES (146, 'Can change release apply', 36, 'change_releaseapply');
INSERT INTO `auth_permission` VALUES (147, 'Can delete release apply', 36, 'delete_releaseapply');
INSERT INTO `auth_permission` VALUES (148, 'Can view release apply', 36, 'view_releaseapply');
INSERT INTO `auth_permission` VALUES (149, 'Can add prom alert center', 37, 'add_promalertcenter');
INSERT INTO `auth_permission` VALUES (150, 'Can change prom alert center', 37, 'change_promalertcenter');
INSERT INTO `auth_permission` VALUES (151, 'Can delete prom alert center', 37, 'delete_promalertcenter');
INSERT INTO `auth_permission` VALUES (152, 'Can view prom alert center', 37, 'view_promalertcenter');
INSERT INTO `auth_permission` VALUES (153, 'Can add task schedule', 38, 'add_taskschedule');
INSERT INTO `auth_permission` VALUES (154, 'Can change task schedule', 38, 'change_taskschedule');
INSERT INTO `auth_permission` VALUES (155, 'Can delete task schedule', 38, 'delete_taskschedule');
INSERT INTO `auth_permission` VALUES (156, 'Can view task schedule', 38, 'view_taskschedule');
INSERT INTO `auth_permission` VALUES (157, 'Can add task host', 39, 'add_taskhost');
INSERT INTO `auth_permission` VALUES (158, 'Can change task host', 39, 'change_taskhost');
INSERT INTO `auth_permission` VALUES (159, 'Can delete task host', 39, 'delete_taskhost');
INSERT INTO `auth_permission` VALUES (160, 'Can view task host', 39, 'view_taskhost');
INSERT INTO `auth_permission` VALUES (161, 'Can add crontab', 40, 'add_crontabschedule');
INSERT INTO `auth_permission` VALUES (162, 'Can change crontab', 40, 'change_crontabschedule');
INSERT INTO `auth_permission` VALUES (163, 'Can delete crontab', 40, 'delete_crontabschedule');
INSERT INTO `auth_permission` VALUES (164, 'Can view crontab', 40, 'view_crontabschedule');
INSERT INTO `auth_permission` VALUES (165, 'Can add interval', 41, 'add_intervalschedule');
INSERT INTO `auth_permission` VALUES (166, 'Can change interval', 41, 'change_intervalschedule');
INSERT INTO `auth_permission` VALUES (167, 'Can delete interval', 41, 'delete_intervalschedule');
INSERT INTO `auth_permission` VALUES (168, 'Can view interval', 41, 'view_intervalschedule');
INSERT INTO `auth_permission` VALUES (169, 'Can add periodic task', 42, 'add_periodictask');
INSERT INTO `auth_permission` VALUES (170, 'Can change periodic task', 42, 'change_periodictask');
INSERT INTO `auth_permission` VALUES (171, 'Can delete periodic task', 42, 'delete_periodictask');
INSERT INTO `auth_permission` VALUES (172, 'Can view periodic task', 42, 'view_periodictask');
INSERT INTO `auth_permission` VALUES (173, 'Can add periodic tasks', 43, 'add_periodictasks');
INSERT INTO `auth_permission` VALUES (174, 'Can change periodic tasks', 43, 'change_periodictasks');
INSERT INTO `auth_permission` VALUES (175, 'Can delete periodic tasks', 43, 'delete_periodictasks');
INSERT INTO `auth_permission` VALUES (176, 'Can view periodic tasks', 43, 'view_periodictasks');
INSERT INTO `auth_permission` VALUES (177, 'Can add solar event', 44, 'add_solarschedule');
INSERT INTO `auth_permission` VALUES (178, 'Can change solar event', 44, 'change_solarschedule');
INSERT INTO `auth_permission` VALUES (179, 'Can delete solar event', 44, 'delete_solarschedule');
INSERT INTO `auth_permission` VALUES (180, 'Can view solar event', 44, 'view_solarschedule');
INSERT INTO `auth_permission` VALUES (181, 'Can add clocked', 45, 'add_clockedschedule');
INSERT INTO `auth_permission` VALUES (182, 'Can change clocked', 45, 'change_clockedschedule');
INSERT INTO `auth_permission` VALUES (183, 'Can delete clocked', 45, 'delete_clockedschedule');
INSERT INTO `auth_permission` VALUES (184, 'Can view clocked', 45, 'view_clockedschedule');
COMMIT;

-- ----------------------------
-- Table structure for autotask_tasks
-- ----------------------------
DROP TABLE IF EXISTS `autotask_tasks`;
CREATE TABLE `autotask_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `playbook` varchar(100) NOT NULL,
  `detail_result` longtext,
  `status` varchar(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `exec_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of autotask_tasks
-- ----------------------------
BEGIN;
INSERT INTO `autotask_tasks` VALUES (1, 'test', 'playbook/2022/01/前端架构.png', '{\n    \"skipped\": {},\n    \"failed\": {},\n    \"ok\": {},\n    \"status\": {},\n    \"unreachable\": {},\n    \"changed\": {}\n}', 'Y', '2022-01-26 16:03:07.965711', '2022-01-26 16:03:07.967344');
INSERT INTO `autotask_tasks` VALUES (2, 'test2', 'playbook/2022/01/前端架构_v4QRyPT.png', 'xxx', 'N', '2022-01-26 16:03:20.841571', '2022-01-26 16:03:20.843522');
INSERT INTO `autotask_tasks` VALUES (3, '测试playbook', 'playbook/2022/01/install_pkg.yml', NULL, 'N', '2022-01-26 17:33:57.794278', '2022-01-26 17:33:57.797448');
INSERT INTO `autotask_tasks` VALUES (4, 'shell', 'playbook/2022/01/test1.yml', '{\n    \"skipped\": {},\n    \"failed\": {},\n    \"ok\": {\n        \"localhost\": {\n            \"cmd\": \"date\",\n            \"stdout\": \"Wed Jan 26 20:51:01 CST 2022\",\n            \"stderr\": \"\",\n            \"rc\": 0,\n            \"start\": \"2022-01-26 20:51:01.460004\",\n            \"end\": \"2022-01-26 20:51:01.471319\",\n            \"delta\": \"0:00:00.011315\",\n            \"changed\": true,\n            \"invocation\": {\n                \"module_args\": {\n                    \"_raw_params\": \"date\",\n                    \"_uses_shell\": true,\n                    \"warn\": true,\n                    \"argv\": null,\n                    \"chdir\": null,\n                    \"executable\": null,\n                    \"creates\": null,\n                    \"removes\": null,\n                    \"stdin\": null\n                }\n            },\n            \"_ansible_parsed\": true,\n            \"stdout_lines\": [\n                \"Wed Jan 26 20:51:01 CST 2022\"\n            ],\n            \"stderr_lines\": [],\n            \"_ansible_no_log\": false\n        }\n    },\n    \"status\": {\n        \"localhost\": {\n            \"ok\": 2,\n            \"changed\": 1,\n            \"unreachable\": 0,\n            \"skipped\": 0,\n            \"failed\": 0\n        }\n    },\n    \"unreachable\": {},\n    \"changed\": {}\n}', 'Y', '2022-01-26 19:15:50.770481', '2022-01-26 19:15:50.774949');
COMMIT;

-- ----------------------------
-- Table structure for cmdb_model_field_group
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_model_field_group`;
CREATE TABLE `cmdb_model_field_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_user` varchar(64) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sequence` smallint(5) unsigned NOT NULL,
  `is_fold` tinyint(1) NOT NULL,
  `info_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cmdb_model_field_group_name_info_id_fb813915_uniq` (`name`,`info_id`),
  KEY `cmdb_model_field_group_info_id_8f608463_fk_cmdb_model_info_id` (`info_id`),
  CONSTRAINT `cmdb_model_field_group_info_id_8f608463_fk_cmdb_model_info_id` FOREIGN KEY (`info_id`) REFERENCES `cmdb_model_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cmdb_model_field_group
-- ----------------------------
BEGIN;
INSERT INTO `cmdb_model_field_group` VALUES (1, 'admin', '2021-11-18 23:51:58.352698', '2021-11-18 23:51:58.352726', '基本信息', 999, 0, 1);
INSERT INTO `cmdb_model_field_group` VALUES (2, 'admin', '2021-11-18 23:52:06.276716', '2021-11-18 23:52:06.276743', '其他信息', 999, 0, 1);
INSERT INTO `cmdb_model_field_group` VALUES (3, 'admin', '2021-11-22 22:49:08.419899', '2021-11-22 22:49:08.419929', '基本信息', 999, 0, 2);
COMMIT;

-- ----------------------------
-- Table structure for cmdb_model_fields
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_model_fields`;
CREATE TABLE `cmdb_model_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_user` varchar(64) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `identifies` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` varchar(10) NOT NULL,
  `is_edit` tinyint(1) NOT NULL,
  `is_unique` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `prompt` varchar(200) DEFAULT NULL,
  `configuration` longtext NOT NULL,
  `is_list_display` tinyint(1) NOT NULL,
  `list_display_sort` smallint(5) unsigned NOT NULL,
  `field_group_id` int(11) NOT NULL,
  `info_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifies` (`identifies`),
  UNIQUE KEY `cmdb_model_fields_name_info_id_92814d21_uniq` (`name`,`info_id`),
  UNIQUE KEY `cmdb_model_fields_identifies_info_id_8a9b2c2b_uniq` (`identifies`,`info_id`),
  KEY `cmdb_model_fields_info_id_771137e6_fk_cmdb_model_info_id` (`info_id`),
  KEY `cmdb_model_fields_field_group_id_14f628ef_fk_cmdb_mode` (`field_group_id`),
  CONSTRAINT `cmdb_model_fields_field_group_id_14f628ef_fk_cmdb_mode` FOREIGN KEY (`field_group_id`) REFERENCES `cmdb_model_field_group` (`id`),
  CONSTRAINT `cmdb_model_fields_info_id_771137e6_fk_cmdb_model_info_id` FOREIGN KEY (`info_id`) REFERENCES `cmdb_model_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cmdb_model_fields
-- ----------------------------
BEGIN;
INSERT INTO `cmdb_model_fields` VALUES (1, 'admin', '2021-11-18 23:53:03.427555', '2021-11-18 23:53:03.427599', 'instance_id', '实例ID', 'string', 1, 1, 0, 'unknow', '{\n    \"is_edit\": true,\n    \"list_value\": [\n        {\n            \"value\": \"\"\n        }\n    ],\n    \"enum_list\": [\n        {\n            \"uuid\": \"\",\n            \"value\": \"\"\n        }\n    ]\n}', 1, 999, 1, 1);
INSERT INTO `cmdb_model_fields` VALUES (2, 'admin', '2021-11-18 23:53:28.779790', '2021-11-18 23:53:28.779817', 'instance_name', '实例名称', 'string', 1, 0, 1, 'unknow', '{\n    \"is_edit\": true,\n    \"list_value\": [\n        {\n            \"value\": \"\"\n        }\n    ],\n    \"enum_list\": [\n        {\n            \"uuid\": \"\",\n            \"value\": \"\"\n        }\n    ]\n}', 0, 999, 1, 1);
INSERT INTO `cmdb_model_fields` VALUES (3, 'admin', '2021-11-18 23:53:59.439162', '2021-11-18 23:53:59.439189', 'internal_ip', '内网IP', 'string', 1, 1, 0, 'unknow', '{\n    \"is_edit\": true,\n    \"list_value\": [\n        {\n            \"value\": \"\"\n        }\n    ],\n    \"enum_list\": [\n        {\n            \"uuid\": \"\",\n            \"value\": \"\"\n        }\n    ]\n}', 1, 999, 1, 1);
INSERT INTO `cmdb_model_fields` VALUES (4, 'admin', '2021-11-18 23:54:20.279756', '2021-11-18 23:54:20.279785', 'instance_os', '操作系统', 'string', 1, 0, 1, 'unknow', '{\n    \"is_edit\": true,\n    \"list_value\": [\n        {\n            \"value\": \"\"\n        }\n    ],\n    \"enum_list\": [\n        {\n            \"uuid\": \"\",\n            \"value\": \"\"\n        }\n    ]\n}', 1, 999, 1, 1);
INSERT INTO `cmdb_model_fields` VALUES (5, 'admin', '2021-11-18 23:54:49.826358', '2021-11-18 23:54:49.826386', 'instance_owner', '使用人', 'user', 1, 0, 0, 'unknow', '{\n    \"is_edit\": true,\n    \"list_value\": [\n        {\n            \"value\": \"\"\n        }\n    ],\n    \"enum_list\": [\n        {\n            \"uuid\": \"\",\n            \"value\": \"\"\n        }\n    ]\n}', 0, 999, 2, 1);
INSERT INTO `cmdb_model_fields` VALUES (6, 'admin', '2021-11-18 23:55:31.345179', '2021-11-18 23:55:31.345205', 'instance_spec', '实例规格', 'string', 1, 0, 1, 'unknow', '{\n    \"is_edit\": true,\n    \"list_value\": [\n        {\n            \"value\": \"\"\n        }\n    ],\n    \"enum_list\": [\n        {\n            \"uuid\": \"\",\n            \"value\": \"\"\n        }\n    ]\n}', 1, 999, 1, 1);
INSERT INTO `cmdb_model_fields` VALUES (7, 'admin', '2021-11-22 22:54:36.027903', '2021-11-22 22:54:36.027932', 'instance_bbc_name', '实例名称', 'string', 1, 1, 1, '实例名称', '{\"is_edit\": true, \"list_value\": [{\"value\": \"\"}], \"enum_list\": [{\"uuid\": \"\", \"value\": \"\"}]}', 1, 999, 3, 2);
COMMIT;

-- ----------------------------
-- Table structure for cmdb_model_group
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_model_group`;
CREATE TABLE `cmdb_model_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_user` varchar(64) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `identifies` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifies` (`identifies`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cmdb_model_group
-- ----------------------------
BEGIN;
INSERT INTO `cmdb_model_group` VALUES (1, 'admin', '2021-11-18 23:48:31.292682', '2021-11-18 23:48:31.292707', 'host_manager', '主机管理');
COMMIT;

-- ----------------------------
-- Table structure for cmdb_model_info
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_model_info`;
CREATE TABLE `cmdb_model_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_user` varchar(64) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `identifies` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_usable` tinyint(1) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifies` (`identifies`),
  UNIQUE KEY `cmdb_model_info_identifies_group_id_2e9393f7_uniq` (`identifies`,`group_id`),
  KEY `cmdb_model_info_group_id_641323f9_fk_cmdb_model_group_id` (`group_id`),
  CONSTRAINT `cmdb_model_info_group_id_641323f9_fk_cmdb_model_group_id` FOREIGN KEY (`group_id`) REFERENCES `cmdb_model_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cmdb_model_info
-- ----------------------------
BEGIN;
INSERT INTO `cmdb_model_info` VALUES (1, 'admin', '2021-11-18 23:51:33.028245', '2021-11-18 23:51:33.028273', 'bcc', '云主机BCC', 'el-icon-s-data', 1, 1);
INSERT INTO `cmdb_model_info` VALUES (2, 'admin', '2021-11-22 22:44:34.151074', '2021-11-22 22:44:34.151107', 'bbc', '云主机BBC', 'el-icon-s-data', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for cmdb_model_info_related
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_model_info_related`;
CREATE TABLE `cmdb_model_info_related` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_user` varchar(64) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `constraint` smallint(5) unsigned NOT NULL,
  `remark` varchar(200) NOT NULL,
  `related_type_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cmdb_model_info_related_source_id_target_id_rela_3759cd00_uniq` (`source_id`,`target_id`,`related_type_id`,`constraint`),
  KEY `cmdb_model_info_rela_related_type_id_d4d7327f_fk_cmdb_mode` (`related_type_id`),
  KEY `cmdb_model_info_related_target_id_a5584e6a_fk_cmdb_model_info_id` (`target_id`),
  CONSTRAINT `cmdb_model_info_rela_related_type_id_d4d7327f_fk_cmdb_mode` FOREIGN KEY (`related_type_id`) REFERENCES `cmdb_model_related_type` (`id`),
  CONSTRAINT `cmdb_model_info_related_source_id_d7e6c007_fk_cmdb_model_info_id` FOREIGN KEY (`source_id`) REFERENCES `cmdb_model_info` (`id`),
  CONSTRAINT `cmdb_model_info_related_target_id_a5584e6a_fk_cmdb_model_info_id` FOREIGN KEY (`target_id`) REFERENCES `cmdb_model_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cmdb_model_info_related
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cmdb_model_related_type
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_model_related_type`;
CREATE TABLE `cmdb_model_related_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_user` varchar(64) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `identifies` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `source_desc` varchar(200) NOT NULL,
  `target_desc` varchar(200) NOT NULL,
  `direction` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifies` (`identifies`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cmdb_model_related_type
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cmdb_resource_data
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_resource_data`;
CREATE TABLE `cmdb_resource_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_user` varchar(64) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `status` smallint(5) unsigned NOT NULL,
  `data` longtext NOT NULL,
  `info_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `cmdb_resource_data_info_id_71ea12a5_fk_cmdb_model_info_id` (`info_id`),
  CONSTRAINT `cmdb_resource_data_info_id_71ea12a5_fk_cmdb_model_info_id` FOREIGN KEY (`info_id`) REFERENCES `cmdb_model_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cmdb_resource_data
-- ----------------------------
BEGIN;
INSERT INTO `cmdb_resource_data` VALUES (1, 'zhangsan', '2021-11-19 11:41:59.786301', '2021-11-19 13:21:25.622146', 'e49c1ba08af24d4897265e5e4456f48d', 0, '{\"instance_name\": \"dev-lisi\", \"instance_status\": \"\\u8fd0\\u884c\\u4e2d\", \"instance_os\": \"CentOS\", \"instance_vpc\": \"BD-SU-VPC-Core\", \"internal_ip\": \"192.168.3.1\", \"instance_id\": \"i-1clo3oGb\"}', 1);
INSERT INTO `cmdb_resource_data` VALUES (2, 'admin', '2021-11-19 11:42:07.371675', '2021-11-19 11:42:07.371704', 'e49c1ba08af24d4897265e5e4456f48b', 0, '{\"instance_name\": \"dev-zhangsan\", \"instance_status\": \"\\u8fd0\\u884c\\u4e2d\", \"instance_os\": \"CentOS\", \"instance_vpc\": \"BD-SU-VPC-Core\", \"internal_ip\": \"192.168.2.1\", \"instance_id\": \"i-1clo3oGa\"}', 1);
INSERT INTO `cmdb_resource_data` VALUES (3, 'admin', '2021-11-19 11:42:13.022748', '2021-11-19 11:42:13.022775', 'e49c1ba08af24d4897275e5e4456f48b', 0, '{\"instance_name\": \"dev-zhangsan\", \"instance_status\": \"\\u8fd0\\u884c\\u4e2d\", \"instance_os\": \"CentOS\", \"instance_vpc\": \"BD-SU-VPC-Core\", \"internal_ip\": \"192.168.2.1\", \"instance_id\": \"i-1clo3oGa\"}', 1);
INSERT INTO `cmdb_resource_data` VALUES (4, 'admin', '2021-11-22 22:57:04.456226', '2021-11-22 22:57:04.456255', 'e49c1ba08af24d4897274e5e4453f48b', 0, '{\"instance_name\": \"dev-zhangsan\", \"instance_status\": \"\\u8fd0\\u884c\\u4e2d\", \"instance_os\": \"CentOS\", \"instance_vpc\": \"BD-SU-VPC-Core\", \"internal_ip\": \"192.168.2.1\", \"instance_id\": \"i-1clo3oGa\"}', 2);
INSERT INTO `cmdb_resource_data` VALUES (5, 'admin', '2021-11-22 22:59:39.031545', '2021-11-22 22:59:39.031573', 'e49c1ba08af34d4897274e5e4453f48b', 0, '{\"instance_name\": \"dev-zhangsan\", \"instance_status\": \"\\u8fd0\\u884c\\u4e2d\", \"instance_os\": \"CentOS\", \"instance_vpc\": \"BD-SU-VPC-Core\", \"internal_ip\": \"192.168.2.1\", \"instance_id\": \"i-1clo3oGa\"}', 2);
COMMIT;

-- ----------------------------
-- Table structure for cmdb_resource_data_related
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_resource_data_related`;
CREATE TABLE `cmdb_resource_data_related` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_user` varchar(64) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `source_id` int(11) NOT NULL,
  `source_info_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `target_info_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cmdb_resource_data_relat_source_info_id_target_in_dab5cbf8_uniq` (`source_info_id`,`target_info_id`),
  UNIQUE KEY `cmdb_resource_data_related_source_id_target_id_aee8fee7_uniq` (`source_id`,`target_id`),
  KEY `cmdb_resource_data_r_target_id_f97f37be_fk_cmdb_reso` (`target_id`),
  KEY `cmdb_resource_data_r_target_info_id_073e19ec_fk_cmdb_mode` (`target_info_id`),
  CONSTRAINT `cmdb_resource_data_r_source_id_6871e0bd_fk_cmdb_reso` FOREIGN KEY (`source_id`) REFERENCES `cmdb_resource_data` (`id`),
  CONSTRAINT `cmdb_resource_data_r_source_info_id_79115177_fk_cmdb_mode` FOREIGN KEY (`source_info_id`) REFERENCES `cmdb_model_info` (`id`),
  CONSTRAINT `cmdb_resource_data_r_target_id_f97f37be_fk_cmdb_reso` FOREIGN KEY (`target_id`) REFERENCES `cmdb_resource_data` (`id`),
  CONSTRAINT `cmdb_resource_data_r_target_info_id_073e19ec_fk_cmdb_mode` FOREIGN KEY (`target_info_id`) REFERENCES `cmdb_model_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cmdb_resource_data_related
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cmdb_tags_data_related
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_tags_data_related`;
CREATE TABLE `cmdb_tags_data_related` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_user` varchar(64) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `data_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cmdb_tags_data_related_data_id_tag_id_3f693c34_uniq` (`data_id`,`tag_id`),
  KEY `cmdb_tags_data_related_tag_id_7e171bbc_fk_cmdb_tags_tag_id` (`tag_id`),
  CONSTRAINT `cmdb_tags_data_related_data_id_bbe08058_fk_cmdb_resource_data_id` FOREIGN KEY (`data_id`) REFERENCES `cmdb_resource_data` (`id`),
  CONSTRAINT `cmdb_tags_data_related_tag_id_7e171bbc_fk_cmdb_tags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `cmdb_tags_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cmdb_tags_data_related
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cmdb_tags_tag
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_tags_tag`;
CREATE TABLE `cmdb_tags_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_user` varchar(64) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `tag_name` varchar(50) NOT NULL,
  `tag_value` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cmdb_tags_tag_tag_name_tag_value_1edc3ef3_uniq` (`tag_name`,`tag_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cmdb_tags_tag
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for confcenter_environment
-- ----------------------------
DROP TABLE IF EXISTS `confcenter_environment`;
CREATE TABLE `confcenter_environment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `tag` varchar(32) NOT NULL,
  `desc` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of confcenter_environment
-- ----------------------------
BEGIN;
INSERT INTO `confcenter_environment` VALUES (1, '测试环境', 'test', 'test');
INSERT INTO `confcenter_environment` VALUES (2, '预生产环境', 'pre', 'pre');
INSERT INTO `confcenter_environment` VALUES (3, '生产环境', 'pro', '生产');
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES (1, '2021-11-04 18:05:52.461410', '7', 'test5', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (2, '2021-11-04 18:06:22.137326', '8', 'test6', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (3, '2021-11-04 18:07:00.607814', '9', 'test7', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (4, '2021-11-04 18:08:41.393159', '10', 'test8', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (5, '2021-11-04 18:09:07.769078', '11', 'test9', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (6, '2021-11-11 11:19:22.839124', '32', 'test', 2, '[]', 6, 1);
INSERT INTO `django_admin_log` VALUES (7, '2021-11-11 11:26:09.306523', '7', '服务器1', 2, '[{\"changed\": {\"fields\": [\"desc\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (8, '2021-11-11 15:26:00.736251', '4', 'test', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (9, '2021-11-18 23:48:31.295764', '1', '主机管理', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (10, '2021-11-18 23:51:33.031336', '1', '云主机BCC', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (11, '2021-11-18 23:51:58.356263', '1', '基本信息', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (12, '2021-11-18 23:52:06.280352', '2', '其他信息', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (13, '2021-11-18 23:53:03.431298', '1', '实例ID', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (14, '2021-11-18 23:53:28.782993', '2', '实例名称', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (15, '2021-11-18 23:53:59.442589', '3', '内网IP', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (16, '2021-11-18 23:54:20.283153', '4', '操作系统', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (17, '2021-11-18 23:54:49.829534', '5', '使用人', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (18, '2021-11-18 23:55:31.348548', '6', '实例规格', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (19, '2021-11-19 10:40:01.476097', '35', '用户锁定/激活', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (20, '2021-11-19 10:45:52.821436', '16', '用户权限', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (21, '2021-11-19 10:46:16.203729', '12', '用户新增', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (22, '2021-11-19 16:26:09.696048', '33', 'test2', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (23, '2021-11-19 16:26:09.747421', '32', 'test', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (24, '2021-12-07 15:15:05.855070', '1', 'AppID object (1)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (25, '2021-12-07 15:33:02.924961', '2', 'test1', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (26, '2021-12-07 15:41:46.115951', '2', 'test1', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (27, '2021-12-07 15:41:46.133784', '1', 'test', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (28, '2021-12-07 15:42:26.064838', '3', 'test', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (29, '2021-12-07 15:43:55.326660', '4', 'test1', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (30, '2021-12-07 15:45:03.291452', '5', 'test2', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (31, '2021-12-07 15:59:30.116510', '6', 'test2', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (32, '2021-12-07 16:00:37.693298', '7', 'test3', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (33, '2021-12-07 16:10:17.659513', '3', 'test', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (34, '2021-12-07 16:10:17.679675', '4', 'test1', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (35, '2021-12-07 16:10:17.696213', '5', 'test2', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (36, '2021-12-07 16:10:17.719148', '6', 'test2', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (37, '2021-12-07 16:10:17.741698', '7', 'test3', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (38, '2021-12-07 16:10:28.935999', '8', 'test', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (39, '2021-12-07 16:11:07.999333', '9', 'test1', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (40, '2021-12-07 16:13:38.364660', '10', 'test2', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (41, '2021-12-07 16:18:16.105247', '11', 'test3', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (42, '2021-12-07 16:19:30.689137', '12', 'test4', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (43, '2021-12-07 16:29:33.011818', '13', 'test5', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (44, '2021-12-07 16:33:56.844646', '14', 'test6', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (45, '2021-12-08 10:34:05.133545', '14', 'test6', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (46, '2021-12-08 10:34:05.153400', '8', 'test', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (47, '2021-12-08 10:34:05.172748', '11', 'test3', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (48, '2021-12-08 10:34:05.193514', '9', 'test1', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (49, '2021-12-08 10:34:05.213526', '12', 'test4', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (50, '2021-12-08 10:34:05.231941', '10', 'test2', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (51, '2021-12-08 10:34:05.467801', '13', 'test5', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (52, '2021-12-08 10:34:15.722713', '15', 'test', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (53, '2021-12-08 12:07:13.181409', '16', 'test1', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (54, '2021-12-08 12:07:30.600148', '15', 'test', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (55, '2021-12-08 12:07:30.625170', '16', 'test1', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (56, '2021-12-08 12:07:39.246790', '17', 'test', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (57, '2021-12-08 13:52:32.096710', '18', 'test1', 1, '[{\"added\": {}}]', 20, 1);
COMMIT;

-- ----------------------------
-- Table structure for django_celery_beat_clockedschedule
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_clockedschedule`;
CREATE TABLE `django_celery_beat_clockedschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clocked_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_celery_beat_clockedschedule
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for django_celery_beat_crontabschedule
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_crontabschedule`;
CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(240) NOT NULL,
  `hour` varchar(96) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(124) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  `timezone` varchar(63) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_celery_beat_crontabschedule
-- ----------------------------
BEGIN;
INSERT INTO `django_celery_beat_crontabschedule` VALUES (1, '0', '4', '*', '*', '*', 'Asia/Shanghai');
INSERT INTO `django_celery_beat_crontabschedule` VALUES (2, '0', '0', '*', '*', '*', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for django_celery_beat_intervalschedule
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_intervalschedule`;
CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_celery_beat_intervalschedule
-- ----------------------------
BEGIN;
INSERT INTO `django_celery_beat_intervalschedule` VALUES (3, 5, 'seconds');
COMMIT;

-- ----------------------------
-- Table structure for django_celery_beat_periodictask
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_periodictask`;
CREATE TABLE `django_celery_beat_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  `solar_id` int(11) DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `priority` int(10) unsigned DEFAULT NULL,
  `headers` longtext NOT NULL,
  `clocked_id` int(11) DEFAULT NULL,
  `expire_seconds` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`),
  KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`),
  KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`),
  KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`),
  CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_celery_beat_periodictask
-- ----------------------------
BEGIN;
INSERT INTO `django_celery_beat_periodictask` VALUES (1, 'celery.backend_cleanup', 'celery.backend_cleanup', '[]', '{}', NULL, NULL, NULL, NULL, 1, NULL, 0, '2022-02-20 16:49:49.411307', '', 1, NULL, NULL, 0, NULL, NULL, '{}', NULL, 43200);
INSERT INTO `django_celery_beat_periodictask` VALUES (8, 'test3', 'schedule_task', '[\"ls\", [19, 20]]', '{}', NULL, NULL, NULL, '2022-02-20 08:50:10.361113', 1, '2022-02-20 08:50:04.403830', 3, '2022-02-20 16:50:05.505745', '', NULL, 3, NULL, 0, NULL, NULL, '{}', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for django_celery_beat_periodictasks
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_periodictasks`;
CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_celery_beat_periodictasks
-- ----------------------------
BEGIN;
INSERT INTO `django_celery_beat_periodictasks` VALUES (1, '2022-02-20 16:49:49.409734');
COMMIT;

-- ----------------------------
-- Table structure for django_celery_beat_solarschedule
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_beat_solarschedule`;
CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_celery_beat_solarschedule
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (24, 'autotask', 'tasks');
INSERT INTO `django_content_type` VALUES (16, 'cmdb', 'data');
INSERT INTO `django_content_type` VALUES (19, 'cmdb', 'datarelated');
INSERT INTO `django_content_type` VALUES (18, 'cmdb', 'datatagrelated');
INSERT INTO `django_content_type` VALUES (13, 'cmdb', 'fieldgroup');
INSERT INTO `django_content_type` VALUES (15, 'cmdb', 'fields');
INSERT INTO `django_content_type` VALUES (10, 'cmdb', 'group');
INSERT INTO `django_content_type` VALUES (11, 'cmdb', 'info');
INSERT INTO `django_content_type` VALUES (14, 'cmdb', 'inforelated');
INSERT INTO `django_content_type` VALUES (12, 'cmdb', 'inforelatedtype');
INSERT INTO `django_content_type` VALUES (17, 'cmdb', 'tag');
INSERT INTO `django_content_type` VALUES (32, 'confcenter', 'environment');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (45, 'django_celery_beat', 'clockedschedule');
INSERT INTO `django_content_type` VALUES (40, 'django_celery_beat', 'crontabschedule');
INSERT INTO `django_content_type` VALUES (41, 'django_celery_beat', 'intervalschedule');
INSERT INTO `django_content_type` VALUES (42, 'django_celery_beat', 'periodictask');
INSERT INTO `django_content_type` VALUES (43, 'django_celery_beat', 'periodictasks');
INSERT INTO `django_content_type` VALUES (44, 'django_celery_beat', 'solarschedule');
INSERT INTO `django_content_type` VALUES (28, 'host', 'host');
INSERT INTO `django_content_type` VALUES (27, 'host', 'hostcategory');
INSERT INTO `django_content_type` VALUES (26, 'host', 'pkeymodel');
INSERT INTO `django_content_type` VALUES (22, 'monitor', 'alertcenter');
INSERT INTO `django_content_type` VALUES (37, 'monitor', 'promalertcenter');
INSERT INTO `django_content_type` VALUES (20, 'msg', 'appid');
INSERT INTO `django_content_type` VALUES (21, 'msg', 'wxmsglogs');
INSERT INTO `django_content_type` VALUES (30, 'mtask', 'cmdexexhistory');
INSERT INTO `django_content_type` VALUES (29, 'mtask', 'cmdtemplate');
INSERT INTO `django_content_type` VALUES (31, 'mtask', 'cmdtemplatecategory');
INSERT INTO `django_content_type` VALUES (33, 'newrelease', 'releaseapp');
INSERT INTO `django_content_type` VALUES (36, 'newrelease', 'releaseapply');
INSERT INTO `django_content_type` VALUES (35, 'newrelease', 'releaserecord');
INSERT INTO `django_content_type` VALUES (34, 'newrelease', 'releaserecorddetail');
INSERT INTO `django_content_type` VALUES (25, 'release', 'deploy');
INSERT INTO `django_content_type` VALUES (39, 'schedule', 'taskhost');
INSERT INTO `django_content_type` VALUES (38, 'schedule', 'taskschedule');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'user', 'organization');
INSERT INTO `django_content_type` VALUES (6, 'user', 'permission');
INSERT INTO `django_content_type` VALUES (7, 'user', 'role');
INSERT INTO `django_content_type` VALUES (9, 'user', 'userprofile');
INSERT INTO `django_content_type` VALUES (23, 'workorder', 'workorder');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2021-10-21 15:26:45.336553');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2021-10-21 15:26:45.626980');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2021-10-21 15:26:46.068026');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2021-10-21 15:26:46.431908');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2021-10-21 15:26:46.488075');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2021-10-21 15:26:46.558510');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2021-10-21 15:26:46.622074');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2021-10-21 15:26:46.674196');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2021-10-21 15:26:46.738582');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2021-10-21 15:26:46.812599');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2021-10-21 15:26:46.890266');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2021-10-21 15:26:46.982397');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2021-10-21 15:26:47.135206');
INSERT INTO `django_migrations` VALUES (14, 'user', '0001_initial', '2021-10-21 15:26:49.108367');
INSERT INTO `django_migrations` VALUES (15, 'admin', '0001_initial', '2021-10-21 15:26:50.340021');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0002_logentry_remove_auto_add', '2021-10-21 15:26:50.564699');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0003_logentry_add_action_flag_choices', '2021-10-21 15:26:50.634580');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0004_auto_20211018_1714', '2021-10-21 15:26:50.882446');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2021-10-21 15:26:51.057859');
INSERT INTO `django_migrations` VALUES (20, 'user', '0002_auto_20211027_2330', '2021-10-27 23:30:29.027418');
INSERT INTO `django_migrations` VALUES (21, 'user', '0003_auto_20211103_0017', '2021-11-03 00:17:40.133261');
INSERT INTO `django_migrations` VALUES (22, 'user', '0004_auto_20211112_0215', '2021-11-12 02:16:05.844258');
INSERT INTO `django_migrations` VALUES (23, 'cmdb', '0001_initial', '2021-11-18 23:04:56.601921');
INSERT INTO `django_migrations` VALUES (24, 'cmdb', '0002_data_datarelated_datatagrelated_tag', '2021-11-18 23:04:57.146218');
INSERT INTO `django_migrations` VALUES (25, 'cmdb', '0003_auto_20211118_1729', '2021-11-18 23:04:57.721488');
INSERT INTO `django_migrations` VALUES (26, 'cmdb', '0004_auto_20211118_2304', '2021-11-18 23:04:57.868677');
INSERT INTO `django_migrations` VALUES (27, 'user', '0004_auto_20211116_2350', '2021-11-18 23:04:57.887707');
INSERT INTO `django_migrations` VALUES (28, 'user', '0005_auto_20211121_2259', '2021-11-21 23:03:34.773267');
INSERT INTO `django_migrations` VALUES (29, 'user', '0006_userprofile_name', '2021-11-21 23:03:34.836480');
INSERT INTO `django_migrations` VALUES (30, 'msg', '0001_initial', '2021-12-07 14:53:18.780010');
INSERT INTO `django_migrations` VALUES (31, 'msg', '0002_auto_20211207_1613', '2021-12-07 16:13:20.813642');
INSERT INTO `django_migrations` VALUES (32, 'monitor', '0001_initial', '2021-12-17 01:02:11.031492');
INSERT INTO `django_migrations` VALUES (33, 'msg', '0002_auto_20211217_0101', '2021-12-17 01:02:11.173720');
INSERT INTO `django_migrations` VALUES (34, 'monitor', '0002_auto_20211230_1116', '2021-12-30 11:48:02.072626');
INSERT INTO `django_migrations` VALUES (35, 'msg', '0003_auto_20211230_1116', '2021-12-30 11:48:02.204336');
INSERT INTO `django_migrations` VALUES (36, 'msg', '0002_auto_20220110_0331', '2022-01-10 03:31:59.153970');
INSERT INTO `django_migrations` VALUES (37, 'workorder', '0001_initial', '2022-01-15 17:00:30.947600');
INSERT INTO `django_migrations` VALUES (38, 'autotask', '0001_initial', '2022-01-26 15:32:17.348355');
INSERT INTO `django_migrations` VALUES (39, 'release', '0001_initial', '2022-01-29 03:28:07.255271');
INSERT INTO `django_migrations` VALUES (40, 'release', '0002_auto_20220129_2053', '2022-01-29 20:53:43.100212');
INSERT INTO `django_migrations` VALUES (41, 'host', '0001_initial', '2022-02-06 19:56:41.381314');
INSERT INTO `django_migrations` VALUES (42, 'host', '0002_auto_20220206_2000', '2022-02-06 20:00:07.694971');
INSERT INTO `django_migrations` VALUES (43, 'host', '0003_auto_20220210_0155', '2022-02-10 01:57:01.225494');
INSERT INTO `django_migrations` VALUES (44, 'confcenter', '0001_initial', '2022-02-16 02:26:33.589852');
INSERT INTO `django_migrations` VALUES (45, 'host', '0004_host_environments', '2022-02-16 02:26:33.792891');
INSERT INTO `django_migrations` VALUES (46, 'mtask', '0001_initial', '2022-02-16 02:28:27.198300');
INSERT INTO `django_migrations` VALUES (47, 'newrelease', '0001_initial', '2022-02-16 03:54:34.535330');
INSERT INTO `django_migrations` VALUES (48, 'newrelease', '0002_auto_20220216_2103', '2022-02-16 21:03:52.447565');
INSERT INTO `django_migrations` VALUES (49, 'newrelease', '0003_releaserecord_releaserecorddetail', '2022-02-16 22:56:37.458055');
INSERT INTO `django_migrations` VALUES (50, 'newrelease', '0004_auto_20220218_0142', '2022-02-18 01:42:54.171217');
INSERT INTO `django_migrations` VALUES (51, 'newrelease', '0005_releaseapply', '2022-02-18 05:02:56.563510');
INSERT INTO `django_migrations` VALUES (52, 'newrelease', '0006_auto_20220219_0316', '2022-02-19 03:17:04.827372');
INSERT INTO `django_migrations` VALUES (53, 'newrelease', '0007_auto_20220219_1317', '2022-02-19 13:17:32.995821');
INSERT INTO `django_migrations` VALUES (54, 'schedule', '0001_initial', '2022-02-20 09:41:54.323471');
INSERT INTO `django_migrations` VALUES (55, 'django_celery_beat', '0001_initial', '2022-02-20 12:29:34.506431');
INSERT INTO `django_migrations` VALUES (56, 'django_celery_beat', '0002_auto_20161118_0346', '2022-02-20 12:29:34.649881');
INSERT INTO `django_migrations` VALUES (57, 'django_celery_beat', '0003_auto_20161209_0049', '2022-02-20 12:29:34.713985');
INSERT INTO `django_migrations` VALUES (58, 'django_celery_beat', '0004_auto_20170221_0000', '2022-02-20 12:29:34.721170');
INSERT INTO `django_migrations` VALUES (59, 'django_celery_beat', '0005_add_solarschedule_events_choices', '2022-02-20 12:29:34.729010');
INSERT INTO `django_migrations` VALUES (60, 'django_celery_beat', '0006_auto_20180322_0932', '2022-02-20 12:29:34.862208');
INSERT INTO `django_migrations` VALUES (61, 'django_celery_beat', '0007_auto_20180521_0826', '2022-02-20 12:29:34.941614');
INSERT INTO `django_migrations` VALUES (62, 'django_celery_beat', '0008_auto_20180914_1922', '2022-02-20 12:29:34.971751');
INSERT INTO `django_migrations` VALUES (63, 'django_celery_beat', '0006_auto_20180210_1226', '2022-02-20 12:29:34.990790');
INSERT INTO `django_migrations` VALUES (64, 'django_celery_beat', '0006_periodictask_priority', '2022-02-20 12:29:35.014966');
INSERT INTO `django_migrations` VALUES (65, 'django_celery_beat', '0009_periodictask_headers', '2022-02-20 12:29:35.042732');
INSERT INTO `django_migrations` VALUES (66, 'django_celery_beat', '0010_auto_20190429_0326', '2022-02-20 12:29:35.455459');
INSERT INTO `django_migrations` VALUES (67, 'django_celery_beat', '0011_auto_20190508_0153', '2022-02-20 12:29:35.488118');
INSERT INTO `django_migrations` VALUES (68, 'django_celery_beat', '0012_periodictask_expire_seconds', '2022-02-20 12:29:35.550688');
INSERT INTO `django_migrations` VALUES (69, 'django_celery_beat', '0013_auto_20200609_0727', '2022-02-20 12:29:35.561541');
INSERT INTO `django_migrations` VALUES (70, 'django_celery_beat', '0014_remove_clockedschedule_enabled', '2022-02-20 12:29:35.583977');
INSERT INTO `django_migrations` VALUES (71, 'django_celery_beat', '0015_edit_solarschedule_events_choices', '2022-02-20 12:29:35.591882');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('854b97ejlgi4b1y5zsv9n5d3gsckctwi', 'ODcwNDViNTg2N2IxZmI1NjU1Y2FlODlkOTIxZDU4MDBlOTAxZjU5Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZmE2YjA4N2E1ODlhNmVlZjlhMmNjNGM5ZjVhMjlkYjg4ZTQwNWRmIiwiX21lbnVzIjoiW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJtb2RlbHNcIjogW3tcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvZmllbGRzL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2ZpZWxkcy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwMn0sIHtcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVxcdTUyMDZcXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9maWVsZGdyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2ZpZWxkZ3JvdXAvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NWI1N1xcdTZiYjVcXHU1MjA2XFx1N2VjNFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwM30sIHtcIm5hbWVcIjogXCJcXHU2NTcwXFx1NjM2ZVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvZGF0YS9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9kYXRhL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA0fSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2RhdGFyZWxhdGVkL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2RhdGFyZWxhdGVkL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDV9LCB7XCJuYW1lXCI6IFwiXFx1NjU3MFxcdTYzNmVcXHU1NDhjXFx1NjgwN1xcdTdiN2VcXHU1MTczXFx1ODA1NFxcdTUxNzNcXHU3Y2ZiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9kYXRhdGFncmVsYXRlZC9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9kYXRhdGFncmVsYXRlZC9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU2NTcwXFx1NjM2ZVxcdTU0OGNcXHU2ODA3XFx1N2I3ZVxcdTUxNzNcXHU4MDU0XFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDZ9LCB7XCJuYW1lXCI6IFwiXFx1NjgwN1xcdTdiN2VcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvdGFnL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL3RhZy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU2ODA3XFx1N2I3ZVxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA3fSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9pbmZvL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2luZm8vYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDh9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvaW5mb3JlbGF0ZWQvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2NtZGIvaW5mb3JlbGF0ZWQvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwOX0sIHtcIm5hbWVcIjogXCJcXHU2YTIxXFx1NTc4YlxcdTUxNzNcXHU3Y2ZiXFx1N2M3YlxcdTU3OGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2luZm9yZWxhdGVkdHlwZS9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9pbmZvcmVsYXRlZHR5cGUvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlxcdTdjN2JcXHU1NzhiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDEwfSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXFx1NTIwNlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2dyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2dyb3VwL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXFx1NTIwNlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wifV0sIFwiZWlkXCI6IDEwMTF9XSwgXCJlaWRcIjogMTAwMX0sIHtcIm5hbWVcIjogXCJNc2dcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcIm1vZGVsc1wiOiBbe1wibmFtZVwiOiBcIlxcdTVlOTRcXHU3NTI4aWRcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9tc2cvYXBwaWQvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL21zZy9hcHBpZC9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJNc2dcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTVlOTRcXHU3NTI4aWRcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTN9LCB7XCJuYW1lXCI6IFwiXFx1NWZhZVxcdTRmZTFcXHU2ZDg4XFx1NjA2ZlxcdTY1ZTVcXHU1ZmQ3XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vbXNnL3d4bXNnbG9ncy9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vbXNnL3d4bXNnbG9ncy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJNc2dcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTVmYWVcXHU0ZmUxXFx1NmQ4OFxcdTYwNmZcXHU2NWU1XFx1NWZkN1wiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAxNH1dLCBcImVpZFwiOiAxMDEyfSwge1wibmFtZVwiOiBcIlVzZXJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcIm1vZGVsc1wiOiBbe1wibmFtZVwiOiBcIlxcdTY3NDNcXHU5NjUwXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdXNlci9wZXJtaXNzaW9uL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi91c2VyL3Blcm1pc3Npb24vYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiVXNlclwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1Njc0M1xcdTk2NTBcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTZ9LCB7XCJuYW1lXCI6IFwiXFx1NzUyOFxcdTYyMzdcXHU0ZmUxXFx1NjA2ZlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlcnByb2ZpbGUvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlcnByb2ZpbGUvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiVXNlclwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NzUyOFxcdTYyMzdcXHU0ZmUxXFx1NjA2ZlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAxN30sIHtcIm5hbWVcIjogXCJcXHU3ZWM0XFx1N2VjN1xcdTY3YjZcXHU2Nzg0XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdXNlci9vcmdhbml6YXRpb24vXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL3VzZXIvb3JnYW5pemF0aW9uL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlVzZXJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTdlYzRcXHU3ZWM3XFx1NjdiNlxcdTY3ODRcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTh9LCB7XCJuYW1lXCI6IFwiXFx1ODlkMlxcdTgyNzJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyL3JvbGUvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL3VzZXIvcm9sZS9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJVc2VyXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU4OWQyXFx1ODI3MlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAxOX1dLCBcImVpZFwiOiAxMDE1fSwge1wibmFtZVwiOiBcIlxcdThiYTRcXHU4YmMxXFx1NTQ4Y1xcdTYzODhcXHU2NzQzXCIsIFwiaWNvblwiOiBcImZhcyBmYS1zaGllbGQtYWx0XCIsIFwibW9kZWxzXCI6IFt7XCJuYW1lXCI6IFwiXFx1N2VjNFwiLCBcImljb25cIjogXCJmYXMgZmEtdXNlcnMtY29nXCIsIFwidXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiXFx1OGJhNFxcdThiYzFcXHU1NDhjXFx1NjM4OFxcdTY3NDNcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXNoaWVsZC1hbHRcIn0sIHtcIm5hbWVcIjogXCJcXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhcyBmYS11c2Vycy1jb2dcIn1dLCBcImVpZFwiOiAxMDIxfV0sIFwiZWlkXCI6IDEwMjB9XSJ9', '2021-12-23 12:01:17.162824');
INSERT INTO `django_session` VALUES ('8gc20jnn233y23fq96elqzsgcpb1u5fb', 'ODcwNDViNTg2N2IxZmI1NjU1Y2FlODlkOTIxZDU4MDBlOTAxZjU5Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZmE2YjA4N2E1ODlhNmVlZjlhMmNjNGM5ZjVhMjlkYjg4ZTQwNWRmIiwiX21lbnVzIjoiW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJtb2RlbHNcIjogW3tcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvZmllbGRzL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2ZpZWxkcy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwMn0sIHtcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVxcdTUyMDZcXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9maWVsZGdyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2ZpZWxkZ3JvdXAvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NWI1N1xcdTZiYjVcXHU1MjA2XFx1N2VjNFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwM30sIHtcIm5hbWVcIjogXCJcXHU2NTcwXFx1NjM2ZVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvZGF0YS9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9kYXRhL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA0fSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2RhdGFyZWxhdGVkL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2RhdGFyZWxhdGVkL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDV9LCB7XCJuYW1lXCI6IFwiXFx1NjU3MFxcdTYzNmVcXHU1NDhjXFx1NjgwN1xcdTdiN2VcXHU1MTczXFx1ODA1NFxcdTUxNzNcXHU3Y2ZiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9kYXRhdGFncmVsYXRlZC9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9kYXRhdGFncmVsYXRlZC9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU2NTcwXFx1NjM2ZVxcdTU0OGNcXHU2ODA3XFx1N2I3ZVxcdTUxNzNcXHU4MDU0XFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDZ9LCB7XCJuYW1lXCI6IFwiXFx1NjgwN1xcdTdiN2VcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvdGFnL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL3RhZy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU2ODA3XFx1N2I3ZVxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA3fSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9pbmZvL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2luZm8vYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDh9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvaW5mb3JlbGF0ZWQvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2NtZGIvaW5mb3JlbGF0ZWQvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwOX0sIHtcIm5hbWVcIjogXCJcXHU2YTIxXFx1NTc4YlxcdTUxNzNcXHU3Y2ZiXFx1N2M3YlxcdTU3OGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2luZm9yZWxhdGVkdHlwZS9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9pbmZvcmVsYXRlZHR5cGUvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlxcdTdjN2JcXHU1NzhiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDEwfSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXFx1NTIwNlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2dyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2dyb3VwL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXFx1NTIwNlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wifV0sIFwiZWlkXCI6IDEwMTF9XSwgXCJlaWRcIjogMTAwMX0sIHtcIm5hbWVcIjogXCJNc2dcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcIm1vZGVsc1wiOiBbe1wibmFtZVwiOiBcIlxcdTVlOTRcXHU3NTI4aWRcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9tc2cvYXBwaWQvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL21zZy9hcHBpZC9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJNc2dcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTVlOTRcXHU3NTI4aWRcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTN9LCB7XCJuYW1lXCI6IFwiXFx1NWZhZVxcdTRmZTFcXHU2ZDg4XFx1NjA2ZlxcdTY1ZTVcXHU1ZmQ3XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vbXNnL3d4bXNnbG9ncy9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vbXNnL3d4bXNnbG9ncy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJNc2dcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTVmYWVcXHU0ZmUxXFx1NmQ4OFxcdTYwNmZcXHU2NWU1XFx1NWZkN1wiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAxNH1dLCBcImVpZFwiOiAxMDEyfSwge1wibmFtZVwiOiBcIlVzZXJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcIm1vZGVsc1wiOiBbe1wibmFtZVwiOiBcIlxcdTY3NDNcXHU5NjUwXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdXNlci9wZXJtaXNzaW9uL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi91c2VyL3Blcm1pc3Npb24vYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiVXNlclwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1Njc0M1xcdTk2NTBcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTZ9LCB7XCJuYW1lXCI6IFwiXFx1NzUyOFxcdTYyMzdcXHU0ZmUxXFx1NjA2ZlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlcnByb2ZpbGUvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlcnByb2ZpbGUvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiVXNlclwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NzUyOFxcdTYyMzdcXHU0ZmUxXFx1NjA2ZlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAxN30sIHtcIm5hbWVcIjogXCJcXHU3ZWM0XFx1N2VjN1xcdTY3YjZcXHU2Nzg0XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdXNlci9vcmdhbml6YXRpb24vXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL3VzZXIvb3JnYW5pemF0aW9uL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlVzZXJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTdlYzRcXHU3ZWM3XFx1NjdiNlxcdTY3ODRcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTh9LCB7XCJuYW1lXCI6IFwiXFx1ODlkMlxcdTgyNzJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyL3JvbGUvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL3VzZXIvcm9sZS9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJVc2VyXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU4OWQyXFx1ODI3MlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAxOX1dLCBcImVpZFwiOiAxMDE1fSwge1wibmFtZVwiOiBcIlxcdThiYTRcXHU4YmMxXFx1NTQ4Y1xcdTYzODhcXHU2NzQzXCIsIFwiaWNvblwiOiBcImZhcyBmYS1zaGllbGQtYWx0XCIsIFwibW9kZWxzXCI6IFt7XCJuYW1lXCI6IFwiXFx1N2VjNFwiLCBcImljb25cIjogXCJmYXMgZmEtdXNlcnMtY29nXCIsIFwidXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiXFx1OGJhNFxcdThiYzFcXHU1NDhjXFx1NjM4OFxcdTY3NDNcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXNoaWVsZC1hbHRcIn0sIHtcIm5hbWVcIjogXCJcXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhcyBmYS11c2Vycy1jb2dcIn1dLCBcImVpZFwiOiAxMDIxfV0sIFwiZWlkXCI6IDEwMjB9XSJ9', '2021-12-28 10:28:36.573710');
INSERT INTO `django_session` VALUES ('8glp10s4jnhhg9il97aivawa05z3ks76', 'M2JiYzQwYjBlMTUzNzNiNzRjYTlkNzA0YjQxMmUwNTRlZDRlMzJkYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZmE2YjA4N2E1ODlhNmVlZjlhMmNjNGM5ZjVhMjlkYjg4ZTQwNWRmIiwiX21lbnVzIjoiW3tcIm5hbWVcIjogXCJVc2VyXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJtb2RlbHNcIjogW3tcIm5hbWVcIjogXCJcXHU2NzQzXFx1OTY1MFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvcGVybWlzc2lvbnMvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL3VzZXIvcGVybWlzc2lvbnMvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiVXNlclwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1Njc0M1xcdTk2NTBcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDJ9LCB7XCJuYW1lXCI6IFwiXFx1NzUyOFxcdTYyMzdcXHU0ZmUxXFx1NjA2ZlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlcnByb2ZpbGUvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlcnByb2ZpbGUvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiVXNlclwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NzUyOFxcdTYyMzdcXHU0ZmUxXFx1NjA2ZlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwM30sIHtcIm5hbWVcIjogXCJcXHU3ZWM0XFx1N2VjN1xcdTY3YjZcXHU2Nzg0XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdXNlci9vcmdhbml6YXRpb24vXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL3VzZXIvb3JnYW5pemF0aW9uL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlVzZXJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTdlYzRcXHU3ZWM3XFx1NjdiNlxcdTY3ODRcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDR9LCB7XCJuYW1lXCI6IFwiXFx1ODlkMlxcdTgyNzJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyL3JvbGUvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL3VzZXIvcm9sZS9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJVc2VyXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU4OWQyXFx1ODI3MlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwNX1dLCBcImVpZFwiOiAxMDAxfSwge1wibmFtZVwiOiBcIlxcdThiYTRcXHU4YmMxXFx1NTQ4Y1xcdTYzODhcXHU2NzQzXCIsIFwiaWNvblwiOiBcImZhcyBmYS1zaGllbGQtYWx0XCIsIFwibW9kZWxzXCI6IFt7XCJuYW1lXCI6IFwiXFx1N2VjNFwiLCBcImljb25cIjogXCJmYXMgZmEtdXNlcnMtY29nXCIsIFwidXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiXFx1OGJhNFxcdThiYzFcXHU1NDhjXFx1NjM4OFxcdTY3NDNcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXNoaWVsZC1hbHRcIn0sIHtcIm5hbWVcIjogXCJcXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhcyBmYS11c2Vycy1jb2dcIn1dLCBcImVpZFwiOiAxMDA3fV0sIFwiZWlkXCI6IDEwMDZ9XSJ9', '2021-11-05 09:54:37.366977');
INSERT INTO `django_session` VALUES ('ik938iq6z8buwramu0z0f33cpe5xvx4k', 'ZTUzY2EyMDMzODFhZTY3ZTA5OWQ5YWE0ODExNjU3YjIxMDVhNDBhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZmE2YjA4N2E1ODlhNmVlZjlhMmNjNGM5ZjVhMjlkYjg4ZTQwNWRmIiwiX21lbnVzIjoiW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJtb2RlbHNcIjogW3tcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvZmllbGRzL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2ZpZWxkcy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwMn0sIHtcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVxcdTUyMDZcXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9maWVsZGdyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2ZpZWxkZ3JvdXAvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NWI1N1xcdTZiYjVcXHU1MjA2XFx1N2VjNFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwM30sIHtcIm5hbWVcIjogXCJcXHU2NTcwXFx1NjM2ZVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvZGF0YS9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9kYXRhL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA0fSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2RhdGFyZWxhdGVkL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2RhdGFyZWxhdGVkL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDV9LCB7XCJuYW1lXCI6IFwiXFx1NjU3MFxcdTYzNmVcXHU1NDhjXFx1NjgwN1xcdTdiN2VcXHU1MTczXFx1ODA1NFxcdTUxNzNcXHU3Y2ZiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9kYXRhdGFncmVsYXRlZC9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9kYXRhdGFncmVsYXRlZC9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU2NTcwXFx1NjM2ZVxcdTU0OGNcXHU2ODA3XFx1N2I3ZVxcdTUxNzNcXHU4MDU0XFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDZ9LCB7XCJuYW1lXCI6IFwiXFx1NjgwN1xcdTdiN2VcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvdGFnL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL3RhZy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU2ODA3XFx1N2I3ZVxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA3fSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9pbmZvL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2luZm8vYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDh9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvaW5mb3JlbGF0ZWQvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2NtZGIvaW5mb3JlbGF0ZWQvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwOX0sIHtcIm5hbWVcIjogXCJcXHU2YTIxXFx1NTc4YlxcdTUxNzNcXHU3Y2ZiXFx1N2M3YlxcdTU3OGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2luZm9yZWxhdGVkdHlwZS9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9pbmZvcmVsYXRlZHR5cGUvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlxcdTdjN2JcXHU1NzhiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDEwfSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXFx1NTIwNlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2dyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2dyb3VwL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXFx1NTIwNlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wifV0sIFwiZWlkXCI6IDEwMTF9XSwgXCJlaWRcIjogMTAwMX0sIHtcIm5hbWVcIjogXCJVc2VyXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJtb2RlbHNcIjogW3tcIm5hbWVcIjogXCJcXHU2NzQzXFx1OTY1MFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvcGVybWlzc2lvbi9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vdXNlci9wZXJtaXNzaW9uL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlVzZXJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTY3NDNcXHU5NjUwXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDEzfSwge1wibmFtZVwiOiBcIlxcdTc1MjhcXHU2MjM3XFx1NGZlMVxcdTYwNmZcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyL3VzZXJwcm9maWxlL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi91c2VyL3VzZXJwcm9maWxlL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlVzZXJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTc1MjhcXHU2MjM3XFx1NGZlMVxcdTYwNmZcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTR9LCB7XCJuYW1lXCI6IFwiXFx1N2VjNFxcdTdlYzdcXHU2N2I2XFx1Njc4NFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvb3JnYW5pemF0aW9uL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi91c2VyL29yZ2FuaXphdGlvbi9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJVc2VyXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU3ZWM0XFx1N2VjN1xcdTY3YjZcXHU2Nzg0XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDE1fSwge1wibmFtZVwiOiBcIlxcdTg5ZDJcXHU4MjcyXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdXNlci9yb2xlL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi91c2VyL3JvbGUvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiVXNlclwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1ODlkMlxcdTgyNzJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTZ9XSwgXCJlaWRcIjogMTAxMn0sIHtcIm5hbWVcIjogXCJcXHU4YmE0XFx1OGJjMVxcdTU0OGNcXHU2Mzg4XFx1Njc0M1wiLCBcImljb25cIjogXCJmYXMgZmEtc2hpZWxkLWFsdFwiLCBcIm1vZGVsc1wiOiBbe1wibmFtZVwiOiBcIlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdThiYTRcXHU4YmMxXFx1NTQ4Y1xcdTYzODhcXHU2NzQzXCIsIFwiaWNvblwiOiBcImZhcyBmYS1zaGllbGQtYWx0XCJ9LCB7XCJuYW1lXCI6IFwiXFx1N2VjNFwiLCBcImljb25cIjogXCJmYXMgZmEtdXNlcnMtY29nXCJ9XSwgXCJlaWRcIjogMTAxOH1dLCBcImVpZFwiOiAxMDE3fV0ifQ==', '2021-12-03 11:40:40.633368');
INSERT INTO `django_session` VALUES ('nbfcq1795vop39u0z3wsggd94tyjx282', 'ODcwNDViNTg2N2IxZmI1NjU1Y2FlODlkOTIxZDU4MDBlOTAxZjU5Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZmE2YjA4N2E1ODlhNmVlZjlhMmNjNGM5ZjVhMjlkYjg4ZTQwNWRmIiwiX21lbnVzIjoiW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJtb2RlbHNcIjogW3tcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvZmllbGRzL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2ZpZWxkcy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwMn0sIHtcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVxcdTUyMDZcXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9maWVsZGdyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2ZpZWxkZ3JvdXAvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NWI1N1xcdTZiYjVcXHU1MjA2XFx1N2VjNFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwM30sIHtcIm5hbWVcIjogXCJcXHU2NTcwXFx1NjM2ZVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvZGF0YS9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9kYXRhL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA0fSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2RhdGFyZWxhdGVkL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2RhdGFyZWxhdGVkL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDV9LCB7XCJuYW1lXCI6IFwiXFx1NjU3MFxcdTYzNmVcXHU1NDhjXFx1NjgwN1xcdTdiN2VcXHU1MTczXFx1ODA1NFxcdTUxNzNcXHU3Y2ZiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9kYXRhdGFncmVsYXRlZC9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9kYXRhdGFncmVsYXRlZC9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU2NTcwXFx1NjM2ZVxcdTU0OGNcXHU2ODA3XFx1N2I3ZVxcdTUxNzNcXHU4MDU0XFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDZ9LCB7XCJuYW1lXCI6IFwiXFx1NjgwN1xcdTdiN2VcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvdGFnL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL3RhZy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU2ODA3XFx1N2I3ZVxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA3fSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9pbmZvL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2luZm8vYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDh9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvaW5mb3JlbGF0ZWQvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2NtZGIvaW5mb3JlbGF0ZWQvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwOX0sIHtcIm5hbWVcIjogXCJcXHU2YTIxXFx1NTc4YlxcdTUxNzNcXHU3Y2ZiXFx1N2M3YlxcdTU3OGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2luZm9yZWxhdGVkdHlwZS9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9pbmZvcmVsYXRlZHR5cGUvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlxcdTdjN2JcXHU1NzhiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDEwfSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXFx1NTIwNlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2dyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2dyb3VwL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXFx1NTIwNlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wifV0sIFwiZWlkXCI6IDEwMTF9XSwgXCJlaWRcIjogMTAwMX0sIHtcIm5hbWVcIjogXCJNc2dcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcIm1vZGVsc1wiOiBbe1wibmFtZVwiOiBcIlxcdTVlOTRcXHU3NTI4aWRcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9tc2cvYXBwaWQvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL21zZy9hcHBpZC9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJNc2dcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTVlOTRcXHU3NTI4aWRcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTN9LCB7XCJuYW1lXCI6IFwiXFx1NWZhZVxcdTRmZTFcXHU2ZDg4XFx1NjA2ZlxcdTY1ZTVcXHU1ZmQ3XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vbXNnL3d4bXNnbG9ncy9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vbXNnL3d4bXNnbG9ncy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJNc2dcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTVmYWVcXHU0ZmUxXFx1NmQ4OFxcdTYwNmZcXHU2NWU1XFx1NWZkN1wiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAxNH1dLCBcImVpZFwiOiAxMDEyfSwge1wibmFtZVwiOiBcIlVzZXJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcIm1vZGVsc1wiOiBbe1wibmFtZVwiOiBcIlxcdTY3NDNcXHU5NjUwXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdXNlci9wZXJtaXNzaW9uL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi91c2VyL3Blcm1pc3Npb24vYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiVXNlclwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1Njc0M1xcdTk2NTBcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTZ9LCB7XCJuYW1lXCI6IFwiXFx1NzUyOFxcdTYyMzdcXHU0ZmUxXFx1NjA2ZlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlcnByb2ZpbGUvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlcnByb2ZpbGUvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiVXNlclwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NzUyOFxcdTYyMzdcXHU0ZmUxXFx1NjA2ZlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAxN30sIHtcIm5hbWVcIjogXCJcXHU3ZWM0XFx1N2VjN1xcdTY3YjZcXHU2Nzg0XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdXNlci9vcmdhbml6YXRpb24vXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL3VzZXIvb3JnYW5pemF0aW9uL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlVzZXJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTdlYzRcXHU3ZWM3XFx1NjdiNlxcdTY3ODRcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTh9LCB7XCJuYW1lXCI6IFwiXFx1ODlkMlxcdTgyNzJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyL3JvbGUvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL3VzZXIvcm9sZS9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJVc2VyXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU4OWQyXFx1ODI3MlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAxOX1dLCBcImVpZFwiOiAxMDE1fSwge1wibmFtZVwiOiBcIlxcdThiYTRcXHU4YmMxXFx1NTQ4Y1xcdTYzODhcXHU2NzQzXCIsIFwiaWNvblwiOiBcImZhcyBmYS1zaGllbGQtYWx0XCIsIFwibW9kZWxzXCI6IFt7XCJuYW1lXCI6IFwiXFx1N2VjNFwiLCBcImljb25cIjogXCJmYXMgZmEtdXNlcnMtY29nXCIsIFwidXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiXFx1OGJhNFxcdThiYzFcXHU1NDhjXFx1NjM4OFxcdTY3NDNcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXNoaWVsZC1hbHRcIn0sIHtcIm5hbWVcIjogXCJcXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhcyBmYS11c2Vycy1jb2dcIn1dLCBcImVpZFwiOiAxMDIxfV0sIFwiZWlkXCI6IDEwMjB9XSJ9', '2021-12-27 18:17:43.277075');
INSERT INTO `django_session` VALUES ('nt4226ssw4yu9fwjbhmnnxle1g3wzgvf', 'ZTUzY2EyMDMzODFhZTY3ZTA5OWQ5YWE0ODExNjU3YjIxMDVhNDBhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZmE2YjA4N2E1ODlhNmVlZjlhMmNjNGM5ZjVhMjlkYjg4ZTQwNWRmIiwiX21lbnVzIjoiW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJtb2RlbHNcIjogW3tcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvZmllbGRzL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2ZpZWxkcy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwMn0sIHtcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVxcdTUyMDZcXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9maWVsZGdyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2ZpZWxkZ3JvdXAvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NWI1N1xcdTZiYjVcXHU1MjA2XFx1N2VjNFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwM30sIHtcIm5hbWVcIjogXCJcXHU2NTcwXFx1NjM2ZVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvZGF0YS9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9kYXRhL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA0fSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2RhdGFyZWxhdGVkL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2RhdGFyZWxhdGVkL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDV9LCB7XCJuYW1lXCI6IFwiXFx1NjU3MFxcdTYzNmVcXHU1NDhjXFx1NjgwN1xcdTdiN2VcXHU1MTczXFx1ODA1NFxcdTUxNzNcXHU3Y2ZiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9kYXRhdGFncmVsYXRlZC9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9kYXRhdGFncmVsYXRlZC9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU2NTcwXFx1NjM2ZVxcdTU0OGNcXHU2ODA3XFx1N2I3ZVxcdTUxNzNcXHU4MDU0XFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDZ9LCB7XCJuYW1lXCI6IFwiXFx1NjgwN1xcdTdiN2VcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvdGFnL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL3RhZy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU2ODA3XFx1N2I3ZVxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA3fSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9pbmZvL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2luZm8vYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDh9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvaW5mb3JlbGF0ZWQvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2NtZGIvaW5mb3JlbGF0ZWQvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwOX0sIHtcIm5hbWVcIjogXCJcXHU2YTIxXFx1NTc4YlxcdTUxNzNcXHU3Y2ZiXFx1N2M3YlxcdTU3OGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2luZm9yZWxhdGVkdHlwZS9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9pbmZvcmVsYXRlZHR5cGUvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlxcdTdjN2JcXHU1NzhiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDEwfSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXFx1NTIwNlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2dyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2dyb3VwL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXFx1NTIwNlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wifV0sIFwiZWlkXCI6IDEwMTF9XSwgXCJlaWRcIjogMTAwMX0sIHtcIm5hbWVcIjogXCJVc2VyXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJtb2RlbHNcIjogW3tcIm5hbWVcIjogXCJcXHU2NzQzXFx1OTY1MFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvcGVybWlzc2lvbi9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vdXNlci9wZXJtaXNzaW9uL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlVzZXJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTY3NDNcXHU5NjUwXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDEzfSwge1wibmFtZVwiOiBcIlxcdTc1MjhcXHU2MjM3XFx1NGZlMVxcdTYwNmZcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyL3VzZXJwcm9maWxlL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi91c2VyL3VzZXJwcm9maWxlL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlVzZXJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTc1MjhcXHU2MjM3XFx1NGZlMVxcdTYwNmZcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTR9LCB7XCJuYW1lXCI6IFwiXFx1N2VjNFxcdTdlYzdcXHU2N2I2XFx1Njc4NFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvb3JnYW5pemF0aW9uL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi91c2VyL29yZ2FuaXphdGlvbi9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJVc2VyXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU3ZWM0XFx1N2VjN1xcdTY3YjZcXHU2Nzg0XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDE1fSwge1wibmFtZVwiOiBcIlxcdTg5ZDJcXHU4MjcyXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdXNlci9yb2xlL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi91c2VyL3JvbGUvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiVXNlclwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1ODlkMlxcdTgyNzJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTZ9XSwgXCJlaWRcIjogMTAxMn0sIHtcIm5hbWVcIjogXCJcXHU4YmE0XFx1OGJjMVxcdTU0OGNcXHU2Mzg4XFx1Njc0M1wiLCBcImljb25cIjogXCJmYXMgZmEtc2hpZWxkLWFsdFwiLCBcIm1vZGVsc1wiOiBbe1wibmFtZVwiOiBcIlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdThiYTRcXHU4YmMxXFx1NTQ4Y1xcdTYzODhcXHU2NzQzXCIsIFwiaWNvblwiOiBcImZhcyBmYS1zaGllbGQtYWx0XCJ9LCB7XCJuYW1lXCI6IFwiXFx1N2VjNFwiLCBcImljb25cIjogXCJmYXMgZmEtdXNlcnMtY29nXCJ9XSwgXCJlaWRcIjogMTAxOH1dLCBcImVpZFwiOiAxMDE3fV0ifQ==', '2021-12-04 21:28:46.066011');
INSERT INTO `django_session` VALUES ('ul7n43qyedrtdtc3uwyv8lko20zousnn', 'ZTUzY2EyMDMzODFhZTY3ZTA5OWQ5YWE0ODExNjU3YjIxMDVhNDBhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZmE2YjA4N2E1ODlhNmVlZjlhMmNjNGM5ZjVhMjlkYjg4ZTQwNWRmIiwiX21lbnVzIjoiW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJtb2RlbHNcIjogW3tcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvZmllbGRzL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2ZpZWxkcy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwMn0sIHtcIm5hbWVcIjogXCJcXHU1YjU3XFx1NmJiNVxcdTUyMDZcXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9maWVsZGdyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2ZpZWxkZ3JvdXAvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NWI1N1xcdTZiYjVcXHU1MjA2XFx1N2VjNFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwM30sIHtcIm5hbWVcIjogXCJcXHU2NTcwXFx1NjM2ZVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvZGF0YS9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9kYXRhL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA0fSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2RhdGFyZWxhdGVkL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2RhdGFyZWxhdGVkL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTY1NzBcXHU2MzZlXFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDV9LCB7XCJuYW1lXCI6IFwiXFx1NjU3MFxcdTYzNmVcXHU1NDhjXFx1NjgwN1xcdTdiN2VcXHU1MTczXFx1ODA1NFxcdTUxNzNcXHU3Y2ZiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9kYXRhdGFncmVsYXRlZC9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9kYXRhdGFncmVsYXRlZC9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU2NTcwXFx1NjM2ZVxcdTU0OGNcXHU2ODA3XFx1N2I3ZVxcdTUxNzNcXHU4MDU0XFx1NTE3M1xcdTdjZmJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDZ9LCB7XCJuYW1lXCI6IFwiXFx1NjgwN1xcdTdiN2VcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvdGFnL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL3RhZy9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJDbWRiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU2ODA3XFx1N2I3ZVxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA3fSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY21kYi9pbmZvL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2luZm8vYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDh9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2NtZGIvaW5mb3JlbGF0ZWQvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2NtZGIvaW5mb3JlbGF0ZWQvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwOX0sIHtcIm5hbWVcIjogXCJcXHU2YTIxXFx1NTc4YlxcdTUxNzNcXHU3Y2ZiXFx1N2M3YlxcdTU3OGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2luZm9yZWxhdGVkdHlwZS9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vY21kYi9pbmZvcmVsYXRlZHR5cGUvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiQ21kYlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NmEyMVxcdTU3OGJcXHU1MTczXFx1N2NmYlxcdTdjN2JcXHU1NzhiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDEwfSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXFx1NTIwNlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wiLCBcInVybFwiOiBcIi9hZG1pbi9jbWRiL2dyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9jbWRiL2dyb3VwL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkNtZGJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTZhMjFcXHU1NzhiXFx1NTIwNlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wifV0sIFwiZWlkXCI6IDEwMTF9XSwgXCJlaWRcIjogMTAwMX0sIHtcIm5hbWVcIjogXCJVc2VyXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJtb2RlbHNcIjogW3tcIm5hbWVcIjogXCJcXHU2NzQzXFx1OTY1MFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvcGVybWlzc2lvbi9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vdXNlci9wZXJtaXNzaW9uL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlVzZXJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTY3NDNcXHU5NjUwXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDEzfSwge1wibmFtZVwiOiBcIlxcdTc1MjhcXHU2MjM3XFx1NGZlMVxcdTYwNmZcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyL3VzZXJwcm9maWxlL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi91c2VyL3VzZXJwcm9maWxlL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlVzZXJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTc1MjhcXHU2MjM3XFx1NGZlMVxcdTYwNmZcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTR9LCB7XCJuYW1lXCI6IFwiXFx1N2VjNFxcdTdlYzdcXHU2N2I2XFx1Njc4NFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvb3JnYW5pemF0aW9uL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi91c2VyL29yZ2FuaXphdGlvbi9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJVc2VyXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU3ZWM0XFx1N2VjN1xcdTY3YjZcXHU2Nzg0XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDE1fSwge1wibmFtZVwiOiBcIlxcdTg5ZDJcXHU4MjcyXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdXNlci9yb2xlL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi91c2VyL3JvbGUvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiVXNlclwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1ODlkMlxcdTgyNzJcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTZ9XSwgXCJlaWRcIjogMTAxMn0sIHtcIm5hbWVcIjogXCJcXHU4YmE0XFx1OGJjMVxcdTU0OGNcXHU2Mzg4XFx1Njc0M1wiLCBcImljb25cIjogXCJmYXMgZmEtc2hpZWxkLWFsdFwiLCBcIm1vZGVsc1wiOiBbe1wibmFtZVwiOiBcIlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdThiYTRcXHU4YmMxXFx1NTQ4Y1xcdTYzODhcXHU2NzQzXCIsIFwiaWNvblwiOiBcImZhcyBmYS1zaGllbGQtYWx0XCJ9LCB7XCJuYW1lXCI6IFwiXFx1N2VjNFwiLCBcImljb25cIjogXCJmYXMgZmEtdXNlcnMtY29nXCJ9XSwgXCJlaWRcIjogMTAxOH1dLCBcImVpZFwiOiAxMDE3fV0ifQ==', '2021-12-06 17:32:29.878495');
COMMIT;

-- ----------------------------
-- Table structure for host_host
-- ----------------------------
DROP TABLE IF EXISTS `host_host`;
CREATE TABLE `host_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `hostname` varchar(50) NOT NULL,
  `ip_addr` varchar(50) DEFAULT NULL,
  `port` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `environments_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `host_host_category_id_d7f721c0_fk_host_hostcategory_id` (`category_id`),
  CONSTRAINT `host_host_category_id_d7f721c0_fk_host_hostcategory_id` FOREIGN KEY (`category_id`) REFERENCES `host_hostcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of host_host
-- ----------------------------
BEGIN;
INSERT INTO `host_host` VALUES (19, 1, 1, 0, '2022-02-17 03:17:34.356598', '2022-02-17 03:17:34.356624', 'Polevic', '120.76.130.43', 22, 'root', '狗子的云主机', 1, 1);
INSERT INTO `host_host` VALUES (20, 1, 1, 0, '2022-02-17 03:17:35.618775', '2022-02-17 03:17:35.618799', 'hk-0-16.hey-nick.com', '101.33.125.146', 20343, 'wenliang', '狗子的云主机', 5, 2);
INSERT INTO `host_host` VALUES (21, 1, 1, 0, '2022-02-17 03:17:36.170467', '2022-02-17 03:17:36.170490', 'tencent', '101.34.182.116', 22, 'root', '帅哥的云主机', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for host_host_users
-- ----------------------------
DROP TABLE IF EXISTS `host_host_users`;
CREATE TABLE `host_host_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host_host_users_host_id_userprofile_id_c5ee7206_uniq` (`host_id`,`userprofile_id`),
  KEY `host_host_users_userprofile_id_a7757ec1_fk_user_userprofile_id` (`userprofile_id`),
  CONSTRAINT `host_host_users_host_id_7f204dc3_fk_host_host_id` FOREIGN KEY (`host_id`) REFERENCES `host_host` (`id`),
  CONSTRAINT `host_host_users_userprofile_id_a7757ec1_fk_user_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of host_host_users
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for host_hostcategory
-- ----------------------------
DROP TABLE IF EXISTS `host_hostcategory`;
CREATE TABLE `host_hostcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host_hostcategory_name_b174cbb6_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of host_hostcategory
-- ----------------------------
BEGIN;
INSERT INTO `host_hostcategory` VALUES (1, 1, 1, 0, '2022-02-06 21:48:28.000000', '2022-02-06 21:48:31.000000', 'web服务');
INSERT INTO `host_hostcategory` VALUES (5, 1, 1, 0, '2022-02-10 01:46:26.000252', '2022-02-10 01:46:26.000267', '数据库服务');
COMMIT;

-- ----------------------------
-- Table structure for host_pkeymodel
-- ----------------------------
DROP TABLE IF EXISTS `host_pkeymodel`;
CREATE TABLE `host_pkeymodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of host_pkeymodel
-- ----------------------------
BEGIN;
INSERT INTO `host_pkeymodel` VALUES (1, 1, 1, 0, '2022-02-07 19:51:05.214576', '2022-02-07 19:51:05.214599', 'private_key', '-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKCAQEAsX7j0ecw4TOZcR5qGye25R9YnTCtBOgreJKRZXHgS3prPP6/\ntHm5fuHBh8fFHX5P/vkNs+lh3zcCabvk/kszAEpix9lW4hntIG0VDpTxtJTD3liO\nDi9t9v/A5G0mUCUQUfKHYA6K26xSE168QQrflyNfLdfHweGG760QFwpSYmE2FUKR\n27YjAN9jsuRPV6nQG0+JNaIwgt5yZ87UvwFTsOCRNpEXzadoUsp/wL3JzRvqxnc8\no0DnEI7pbWEtLW7AnwbT6gOGy6NdnBzMwga3fLihgqIheTod7BGSwmfoQRG5QoTP\nkiCj31B0P2LPhVC3cscmtP3vH//i4VAh+O7B2wIDAQABAoIBAAYK0siXfTN9ZTDT\nnzsTbAd6vLKFMK6lFK3DF44DhWYsYbAu3+nN5wGpv8PWiiBJ54E/izbfsARARCXD\nTrVVbAQLhDdXb7y8szTSYdAgQ+Yo1k4gZ52WAcFRzYg5Kv+5c0fG4NLlS9bUk+qy\n4+e27gugGaJe4R75hXVtR8nxAQL2S6mqF7j47aObIUidM4CYJvzYWv0vg2h6GCg5\nD0Xgg4/4AnGuuWzObOEtW1Uns8YlFby/vsExxW6M/9EDB5ONREEprmukDZUkmJnE\nq4X4v4fx4RYUWFar+R+vNzQcIUdqROGsp/ajF1TG/Q38932baocmTPzOlgoE55mq\naFfuNdECgYEA5jJqH/df0HryYyeF84m2WKHeH0TT61gweSjf8VCGSeKMyX4YW7A0\n2m+oTbzciD0Y6JbS55D/B4Vo36QHa2Qmbuc9avTiKSYtTbghVkkJjS3FOH+M9cGw\n0smqtQgrOuBFsKCZmUss+GSyBeb+4TyrJw6NT/grif8/+HKKzAnHi5MCgYEAxWQx\ncaetHZBHjMtXdeAe45DtPp55hNovOG9U12PyyJMNZJ1fP6stSILVfG1UAtBJP0Ac\nL1OaRWbW0iIRSMbGrXdOcwSueoo+5fdX6ksPH3FT6J17ehZIBqt8OMyO5/N+xm4b\nN7w3fSLqaaSxyfU8jiV6p63Wxeecu2+Suzd+rZkCgYEAgFlpvKsUHE0A6vI1iMWn\nCyItlCevNVB1rohw3L72MSoFL6+D61ODFKwfHkEIgVn3km/N5ll9KPdksxVlIaa0\nmy+JmiIyG5lytxvMUqzki3gSt96+fKRjcBQLf2avm+NCWCojmkpFJ7YVYJ8cS/+k\numEtv4Hy3L2aMG/FHeDyBssCgYBye4vZuUBEVzvIQt809Im1voZ6vPsJvGmKt7dj\nPQrAndk0s7lcefFHjuo2wknpX9g7oPk30as1+VE6ipuvs+njDcEoIFz5oVidk/kf\nX+0jdV0PGtdUlbuscqUXZDy19pleiNmsV7NvFmMSZnze/ybh4obi3YYlPhG+/BUE\nFEmacQKBgEN5eIrsZvbwSdeLUflGzgTYDJsj9hnZoXqySJLBZcofOIjZ++TviJjt\n1gbczs7iQmh3W+sG1YPRaFjcylVnPTEj8BfkF4krqh8vSHFD9Sfv2znBIx9dDUbW\nYMAs6St6W1KVaB6mTfDEhZNX56Enu4giNa0mdDyez6e6SwRIN/6W\n-----END RSA PRIVATE KEY-----\n', 'ssh private key');
INSERT INTO `host_pkeymodel` VALUES (2, 1, 1, 0, '2022-02-07 19:51:05.229986', '2022-02-07 19:51:05.230006', 'public_key', 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxfuPR5zDhM5lxHmobJ7blH1idMK0E6Ct4kpFlceBLems8/r+0ebl+4cGHx8Udfk/++Q2z6WHfNwJpu+T+SzMASmLH2VbiGe0gbRUOlPG0lMPeWI4OL232/8DkbSZQJRBR8odgDorbrFITXrxBCt+XI18t18fB4YbvrRAXClJiYTYVQpHbtiMA32Oy5E9XqdAbT4k1ojCC3nJnztS/AVOw4JE2kRfNp2hSyn/AvcnNG+rGdzyjQOcQjultYS0tbsCfBtPqA4bLo12cHMzCBrd8uKGCoiF5Oh3sEZLCZ+hBEblChM+SIKPfUHQ/Ys+FULdyxya0/e8f/+LhUCH47sHb', 'ssh private key');
COMMIT;

-- ----------------------------
-- Table structure for monitor_alertcenter
-- ----------------------------
DROP TABLE IF EXISTS `monitor_alertcenter`;
CREATE TABLE `monitor_alertcenter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventID` varchar(128) NOT NULL,
  `TriggerID` varchar(128) DEFAULT NULL,
  `env` varchar(16) NOT NULL,
  `eventName` varchar(512) DEFAULT NULL,
  `eventMessage` varchar(1024) DEFAULT NULL,
  `hostname` varchar(128) NOT NULL,
  `eventLevel` varchar(64) NOT NULL,
  `eventType` varchar(64) NOT NULL,
  `status` varchar(32) NOT NULL,
  `startTime` datetime(6) DEFAULT NULL,
  `recoveryTime` datetime(6) DEFAULT NULL,
  `alert_type` varchar(64) NOT NULL,
  `alertTime` int(11) DEFAULT NULL,
  `department` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of monitor_alertcenter
-- ----------------------------
BEGIN;
INSERT INTO `monitor_alertcenter` VALUES (1, '98966', '28215', 'PRO', 'Unavailable by ICMP ping', '(ID:28215) ICMP ping: (icmpping): Down (0)', 'Alarm-Test', 'High', 'zabbix', 'recovery', '2021-12-16 13:52:56.000000', '2021-12-16 13:52:56.000000', 'unreachable', 0, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (2, '98967', '28215', 'PRO', 'Unavailable by ICMP ping', '(ID:28215) ICMP ping: (icmpping): Down (0)', 'Alarm-Test', 'High', 'zabbix', 'recovery', '2021-12-16 13:53:56.000000', '2021-12-16 13:54:56.000000', 'unreachable', 60, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (3, '99100', '27028', 'PRO', '入向流量大于 90M', '(ID:27028) 172.21.30.100 eth-trunk 10 In: (ifHCInOctets[eth-trunk 10]): 40.58 Mb/s', '虹桥-办伴电信线路', 'Average', 'zabbix', 'recovery', '2021-12-16 18:07:03.000000', '2021-12-17 10:52:03.000000', 'netflow', 60300, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (4, '106816', '27028', 'PRO', '入向流量大于 90M', '(ID:27028) 172.21.30.100 eth-trunk 10 In: (ifHCInOctets[eth-trunk 10]): 141.88 Mb/s', '虹桥-办伴电信线路', 'Average', 'zabbix', 'recovery', '2021-12-17 11:52:03.000000', '2021-12-29 15:27:03.000000', 'netflow', 12900, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (5, '106817', '27028', 'PRO', '入向流量大于 90M', '(ID:27028) 172.21.30.100 eth-trunk 10 In: (ifHCInOctets[eth-trunk 10]): 141.88 Mb/s', '虹桥-办伴电信线路', 'Average', 'zabbix', 'recovery', '2021-12-17 11:52:03.000000', '2021-12-29 15:27:03.000000', 'netflow', 12900, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (6, '157785', '27034', 'PRO', '入向流量大于 160M', '(ID:27034) 172.21.30.52 MultiGE 0/0/1 In: (ifHCInOctets[MultiGE 0/0/1]): 127.55 Mb/s', '虹桥互联网电信线路', 'Average', 'zabbix', 'recovery', NULL, '2021-12-21 16:44:06.000000', 'unknown', NULL, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (7, '98960', '28215', 'TEST', 'Unavailable by ICMP ping', '(ID:28215) ICMP ping: (icmpping): Up (1)', 'Alarm-Test', 'High', 'zabbix', 'recovery', '2021-12-16 13:52:56.000000', NULL, 'unreachable', NULL, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (8, '98960', '28215', 'TEST', 'Unavailable by ICMP ping', '(ID:28215) ICMP ping: (icmpping): Up (1)', 'Alarm-Test', 'High', 'zabbix', 'recovery', '2021-12-16 13:52:56.000000', NULL, 'unreachable', NULL, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (9, '157976', '28480', 'PRO', 'Unavailable by ICMP ping', '(ID:28480) ICMP ping: (icmpping): Up (1)', 'ALARM-TEST', 'High', 'zabbix', 'recovery', '2021-12-22 11:03:58.000000', '2021-12-22 11:06:35.000000', 'unreachable', 157, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (10, '158362', '28565', 'PRO', 'Oracle TBS \'PREEVISIONI\': Tablespace utilization is too high (over 90% for 5m).', '(ID:28565) Oracle TBS \'PREEVISIONI\': Tablespace allocated, percent: (oracle.tbs_used_pct[\"PREEVISIONI\"]): 93.75 %', 'suoracle', 'High', 'zabbix', 'alert', '2021-12-23 19:08:48.000000', NULL, 'db', NULL, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (11, '158363', '28566', 'PRO', 'Oracle TBS \'UNDO_TABLESPACE\': Tablespace utilization is too high (over 90% for 5m).', '(ID:28566) Oracle TBS \'UNDO_TABLESPACE\': Tablespace allocated, percent: (oracle.tbs_used_pct[\"UNDO_TABLESPACE\"]): 93.75 %', 'suoracle', 'High', 'zabbix', 'alert', '2021-12-23 19:08:48.000000', NULL, 'db', NULL, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (12, '158362', '28565', 'PRO', 'Oracle TBS \'PREEVISIONI\': Tablespace utilization is too high (over 90% for 5m).', 'NOTE: Escalation cancelled: trigger \"Oracle TBS \'PREEVISIONI\': Tablespace utilization is too high (over {$ORACLE.TBS.UTIL.PCT.MAX.HIGH}% for 5m).\" disabled.\nLast message sent:\n(ID:28565) Oracle TBS \'PREEVISIONI\': Tablespace allocated, percent: (oracle.tbs_used_pct[\"PREEVISIONI\"]): 93.75 %', 'suoracle', 'High', 'zabbix', 'alert', '2021-12-23 19:08:48.000000', NULL, 'db', NULL, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (13, '158363', '28566', 'PRO', 'Oracle TBS \'UNDO_TABLESPACE\': Tablespace utilization is too high (over 90% for 5m).', 'NOTE: Escalation cancelled: trigger \"Oracle TBS \'UNDO_TABLESPACE\': Tablespace utilization is too high (over {$ORACLE.TBS.UTIL.PCT.MAX.HIGH}% for 5m).\" disabled.\nLast message sent:\n(ID:28566) Oracle TBS \'UNDO_TABLESPACE\': Tablespace allocated, percent: (oracle.tbs_used_pct[\"UNDO_TABLESPACE\"]): 93.75 %', 'suoracle', 'High', 'zabbix', 'recovery', '2021-12-23 19:08:48.000000', NULL, 'db', NULL, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (14, '158545', '28570', 'PRO', 'Oracle Database \'CDB19C\': Force logging is deactivated for DB with active Archivelog', '(ID:28570) Oracle Database \'CDB19C\': Force logging: (oracle.db_force_logging[\"CDB19C\"]): No (0)', 'suoracle', 'Warning', 'zabbix', 'recovery', '2021-12-23 21:31:44.000000', NULL, 'db', NULL, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (15, '158545', '28570', 'PRO', 'Oracle Database \'CDB19C\': Force logging is deactivated for DB with active Archivelog', 'NOTE: Escalation cancelled: trigger \"Oracle Database \'CDB19C\': Force logging is deactivated for DB with active Archivelog\" disabled.\nLast message sent:\n(ID:28570) Oracle Database \'CDB19C\': Force logging: (oracle.db_force_logging[\"CDB19C\"]): No (0)', 'suoracle', 'Warning', 'zabbix', 'recovery', '2021-12-23 21:31:44.000000', NULL, 'db', NULL, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (16, '158858', '25088', 'PRO', 'Switch 1 - Temp Sensor 2, GREEN : Temperature is above warning threshold: >50', '(ID:25088) Switch 1 - Temp Sensor 2, GREEN : Temperature: (sensor.temp.value[ciscoEnvMonTemperatureValue.1014]): 51 °C', 'BJ-DHCP-SW', 'Warning', 'zabbix', 'alert', '2021-12-25 07:36:38.000000', NULL, 'unknown', NULL, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (17, '159272', '27034', 'PRO', '入向流量大于 160M', '(ID:27034) 172.21.30.52 MultiGE 0/0/1 In: (ifHCInOctets[MultiGE 0/0/1]): 155.5 Mb/s', '虹桥互联网电信线路', 'Average', 'zabbix', 'recovery', '2021-12-27 14:01:05.000000', '2021-12-27 15:09:05.000000', 'netflow', 4080, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (18, '159273', '27008', 'PRO', 'Interface MultiGE0/0/1(CT): High bandwidth usage (>90% )', '(ID:27008) Interface MultiGE0/0/1(CT): Bits received: (net.if.in[ifHCInOctets.7]): 147.64 Mbps', 'HQ互联网接入SW01', 'Warning', 'zabbix', 'recovery', '2021-12-27 14:03:25.000000', '2021-12-27 15:07:25.000000', 'netflow', 3840, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (19, '159716', '27034', 'PRO', '入向流量大于 160M', '(ID:27034) 172.21.30.51 MultiGE 0/0/1 In: (ifHCInOctets[MultiGE 0/0/1]): 77.04 Mb/s', '虹桥互联网电信线路', 'Average', 'zabbix', 'recovery', '2021-12-29 15:10:05.000000', '2021-12-29 16:48:05.000000', 'netflow', 5880, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (20, '159717', '27016', 'PRO', '入向流量大于 160M', '(ID:27016) 172.21.30.52 MultiGE 0/0/1 In: (ifHCInOctets[MultiGE 0/0/1]): 60.07 Mb/s', '虹桥互联网联通线路', 'Average', 'zabbix', 'recovery', '2021-12-29 15:10:59.000000', '2021-12-29 16:46:59.000000', 'netflow', 5760, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (21, '159718', '27008', 'PRO', 'Interface MultiGE0/0/1(CT): High bandwidth usage (>90% )', '(ID:27008) Interface MultiGE0/0/1(CT): Bits received: (net.if.in[ifHCInOctets.7]): 77.91 Mbps', 'HQ互联网接入SW01', 'Warning', 'zabbix', 'recovery', '2021-12-29 15:11:25.000000', '2021-12-29 16:47:25.000000', 'netflow', 5760, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (22, '159719', '27028', 'PRO', '入向流量大于 160M', '(ID:27028) 172.21.30.100 eth-trunk 10 In: (ifHCInOctets[eth-trunk 10]): 141.88 Mb/s', '虹桥-办伴电信线路', 'Average', 'zabbix', 'recovery', '2021-12-29 15:13:03.000000', '2021-12-29 15:27:03.000000', 'netflow', 840, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (23, '159736', '28580', 'PRO', 'Unavailable by ICMP ping', '(ID:28580) ICMP ping: (icmpping): Up (1)', 'ALARM-TEST02', 'High', 'zabbix', 'recovery', '2021-12-29 18:19:45.000000', '2021-12-29 18:29:52.000000', 'unreachable', 607, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (24, '159737', '28480', 'PRO', 'Unavailable by ICMP ping', '(ID:28480) ICMP ping: (icmpping): Up (1)', 'ALARM-TEST', 'High', 'zabbix', 'recovery', '2021-12-29 18:20:11.000000', '2021-12-29 18:29:51.000000', 'unreachable', 580, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (25, '159743', '28480', 'PRO', 'Unavailable by ICMP ping', '(ID:28480) ICMP ping: (icmpping): Up (1)', 'ALARM-TEST', 'High', 'zabbix', 'recovery', '2021-12-29 18:53:36.000000', '2021-12-29 19:11:22.000000', 'unreachable', 1066, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (26, '159743', '28480', 'PRO', 'Unavailable by ICMP ping', '(ID:28480) ICMP ping: (icmpping): Down (0)', 'ALARM-TEST', 'High', 'zabbix', 'recovery', '2021-12-29 18:53:36.000000', NULL, 'unreachable', NULL, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (27, '159743', '28480', 'PRO', 'Unavailable by ICMP ping', '(ID:28480) ICMP ping: (icmpping): Down (0)', 'ALARM-TEST', 'High', 'zabbix', 'recovery', '2021-12-29 18:53:36.000000', NULL, 'unreachable', NULL, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (28, '159879', '28480', 'PRO', 'Unavailable by ICMP ping', '(ID:28480) ICMP ping: (icmpping): Up (1)', 'ALARM-TEST', 'High', 'zabbix', 'recovery', '2021-12-30 12:00:28.000000', '2021-12-30 12:02:04.000000', 'unreachable', 96, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (29, '159938', '27028', 'PRO', '入向流量大于 160M', '(ID:27028) 172.21.30.100 eth-trunk 10 In: (ifHCInOctets[eth-trunk 10]): 58.3 Mb/s', '虹桥-办伴电信线路', 'Average', 'zabbix', 'recovery', '2021-12-30 17:46:03.000000', '2021-12-30 18:01:04.000000', 'netflow', 901, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (30, '160999', '24154', 'PRO', 'Unavailable by ICMP ping', '(ID:24154) ICMP ping: (icmpping): Up (1)', 'BJ-To-BDcloud-SW', 'High', 'zabbix', 'recovery', '2022-01-04 10:51:03.000000', '2022-01-04 11:03:35.000000', 'unreachable', 752, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (31, '161000', '24131', 'PRO', 'Unavailable by ICMP ping', '(ID:24131) ICMP ping: (icmpping): Up (1)', 'BJ互联网接入SW', 'High', 'zabbix', 'recovery', '2022-01-04 10:52:23.000000', '2022-01-04 10:57:31.000000', 'unreachable', 308, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (32, '161162', '24161', 'PRO', 'No SNMP data collection', '(ID:24161) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ-To-BDcloud-SW', 'Warning', 'zabbix', 'recovery', '2022-01-04 11:04:05.000000', '2022-01-04 11:06:05.000000', 'unknown', 120, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (33, '161428', '24154', 'PRO', 'Unavailable by ICMP ping', '(ID:24154) ICMP ping: (icmpping): Up (1)', 'BJ-To-BDcloud-SW', 'High', 'zabbix', 'recovery', '2022-01-04 11:38:57.000000', '2022-01-04 11:39:49.000000', 'unreachable', 52, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (34, '162031', '24154', 'PRO', 'Unavailable by ICMP ping', '(ID:24154) ICMP ping: (icmpping): Up (1)', 'BJ-To-BDcloud-SW', 'High', 'zabbix', 'recovery', '2022-01-04 12:32:26.000000', '2022-01-04 12:35:24.000000', 'unreachable', 178, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (35, '162032', '24200', 'PRO', 'Unavailable by ICMP ping', '(ID:24200) ICMP ping: (icmpping): Up (1)', 'BJ-DHCP-SW', 'High', 'zabbix', 'recovery', '2022-01-04 12:32:44.000000', '2022-01-04 12:48:38.000000', 'unreachable', 954, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (36, '162034', '24131', 'PRO', 'Unavailable by ICMP ping', '(ID:24131) ICMP ping: (icmpping): Up (1)', 'BJ互联网接入SW', 'High', 'zabbix', 'recovery', '2022-01-04 12:35:15.000000', '2022-01-04 12:44:03.000000', 'unreachable', 528, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (37, '162038', '24161', 'PRO', 'No SNMP data collection', '(ID:24161) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ-To-BDcloud-SW', 'Warning', 'zabbix', 'recovery', '2022-01-04 12:36:05.000000', '2022-01-04 12:40:05.000000', 'unknown', 240, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (38, '162196', '24138', 'PRO', 'No SNMP data collection', '(ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ互联网接入SW', 'Warning', 'zabbix', 'recovery', '2022-01-04 12:44:24.000000', '2022-01-04 12:46:24.000000', 'unknown', 120, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (39, '162800', '24154', 'PRO', 'Unavailable by ICMP ping', '(ID:24154) ICMP ping: (icmpping): Up (1)', 'BJ-To-BDcloud-SW', 'High', 'zabbix', 'recovery', '2022-01-04 14:47:46.000000', '2022-01-04 14:52:19.000000', 'unreachable', 273, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (40, '162952', '24207', 'PRO', 'No SNMP data collection', '(ID:24207) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ-DHCP-SW', 'Warning', 'zabbix', 'recovery', '2022-01-04 15:39:27.000000', '2022-01-04 15:41:27.000000', 'unknown', 120, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (41, '163114', '27445', 'PRO', 'Server 172.21.14.205 Timeouts on SH-Aruba-AC-vrrp', '(ID:27445) Server Timeouts 172.21.14.205: (aos.authSrvTimeouts.[172.21.14.205]): 319', 'SH-Aruba-AC-vrrp', 'High', 'zabbix', 'recovery', '2022-01-04 15:50:30.000000', '2022-01-04 15:51:35.000000', 'unknown', 65, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (42, '163128', '27029', 'PRO', '出向流量大于  160M', '(ID:27029) 172.21.30.100 eth-trunk 10 Out: (ifHCOutOctets[eth-trunk 10]): 44.56 Mb/s', '虹桥-办伴电信线路', 'Average', 'zabbix', 'recovery', '2022-01-04 16:37:03.000000', '2022-01-04 16:43:03.000000', 'netflow', 360, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (43, '163137', '24131', 'PRO', 'Unavailable by ICMP ping', '(ID:24131) ICMP ping: (icmpping): Up (1)', 'BJ互联网接入SW', 'High', 'zabbix', 'recovery', '2022-01-04 17:00:45.000000', '2022-01-04 17:08:46.000000', 'unreachable', 481, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (44, '163138', '24154', 'PRO', 'Unavailable by ICMP ping', '(ID:24154) ICMP ping: (icmpping): Up (1)', 'BJ-To-BDcloud-SW', 'High', 'zabbix', 'recovery', '2022-01-04 17:00:51.000000', '2022-01-04 17:03:46.000000', 'unreachable', 175, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (45, '163421', '25143', 'PRO', 'Server 172.16.10.205 Timeouts on BJ-Aruba-WLC-vrrp', '(ID:25143) Server Timeouts 172.16.10.205: (aos.authSrvTimeouts.[172.16.10.205]): 201', 'BJ-Aruba-WLC-vrrp', 'High', 'zabbix', 'recovery', '2022-01-04 17:45:39.000000', '2022-01-04 17:46:39.000000', 'unknown', 60, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (46, '163423', '24154', 'PRO', 'Unavailable by ICMP ping', '(ID:24154) ICMP ping: (icmpping): Up (1)', 'BJ-To-BDcloud-SW', 'High', 'zabbix', 'recovery', '2022-01-04 17:51:34.000000', '2022-01-04 17:57:52.000000', 'unreachable', 378, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (47, '163733', '24161', 'PRO', 'No SNMP data collection', '(ID:24161) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ-To-BDcloud-SW', 'Warning', 'zabbix', 'recovery', '2022-01-04 19:27:05.000000', '2022-01-04 19:29:05.000000', 'unknown', 120, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (48, '163736', '24138', 'PRO', 'No SNMP data collection', '(ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ互联网接入SW', 'Warning', 'zabbix', 'recovery', '2022-01-04 19:27:24.000000', '2022-01-04 19:33:24.000000', 'unknown', 360, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (49, '163745', '24131', 'PRO', 'Unavailable by ICMP ping', '(ID:24131) ICMP ping: (icmpping): Up (1)', 'BJ互联网接入SW', 'High', 'zabbix', 'recovery', '2022-01-04 19:30:15.000000', '2022-01-04 19:33:10.000000', 'unreachable', 175, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (50, '164029', '24131', 'PRO', 'Unavailable by ICMP ping', '(ID:24131) ICMP ping: (icmpping): Up (1)', 'BJ互联网接入SW', 'High', 'zabbix', 'recovery', '2022-01-04 20:04:50.000000', '2022-01-04 20:07:43.000000', 'unreachable', 173, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (51, '164030', '24200', 'PRO', 'Unavailable by ICMP ping', '(ID:24200) ICMP ping: (icmpping): Up (1)', 'BJ-DHCP-SW', 'High', 'zabbix', 'recovery', '2022-01-04 20:05:43.000000', '2022-01-04 20:07:54.000000', 'unreachable', 131, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (52, '164177', '24138', 'PRO', 'No SNMP data collection', '(ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ互联网接入SW', 'Warning', 'zabbix', 'recovery', '2022-01-04 20:08:24.000000', '2022-01-04 20:09:24.000000', 'unknown', 60, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (53, '164467', '24200', 'PRO', 'Unavailable by ICMP ping', '(ID:24200) ICMP ping: (icmpping): Up (1)', 'BJ-DHCP-SW', 'High', 'zabbix', 'recovery', '2022-01-04 20:48:28.000000', '2022-01-04 20:54:27.000000', 'unreachable', 359, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (54, '164468', '24131', 'PRO', 'Unavailable by ICMP ping', '(ID:24131) ICMP ping: (icmpping): Up (1)', 'BJ互联网接入SW', 'High', 'zabbix', 'recovery', '2022-01-04 20:48:45.000000', '2022-01-04 21:01:19.000000', 'unreachable', 754, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (55, '164469', '24154', 'PRO', 'Unavailable by ICMP ping', '(ID:24154) ICMP ping: (icmpping): Up (1)', 'BJ-To-BDcloud-SW', 'High', 'zabbix', 'recovery', '2022-01-04 20:50:35.000000', '2022-01-04 20:57:18.000000', 'unreachable', 403, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (56, '164781', '24138', 'PRO', 'No SNMP data collection', '(ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ互联网接入SW', 'Warning', 'zabbix', 'recovery', '2022-01-04 21:01:24.000000', '2022-01-04 21:03:24.000000', 'unknown', 120, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (57, '164936', '24131', 'PRO', 'Unavailable by ICMP ping', '(ID:24131) ICMP ping: (icmpping): Up (1)', 'BJ互联网接入SW', 'High', 'zabbix', 'recovery', '2022-01-04 23:51:58.000000', '2022-01-04 23:58:46.000000', 'unreachable', 408, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (58, '164940', '24138', 'PRO', 'No SNMP data collection', '(ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ互联网接入SW', 'Warning', 'zabbix', 'recovery', '2022-01-04 23:59:24.000000', '2022-01-05 00:01:24.000000', 'unknown', 120, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (59, '165084', '24200', 'PRO', 'Unavailable by ICMP ping', '(ID:24200) ICMP ping: (icmpping): Up (1)', 'BJ-DHCP-SW', 'High', 'zabbix', 'recovery', '2022-01-05 00:43:23.000000', '2022-01-05 01:01:04.000000', 'unreachable', 1061, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (60, '165430', '24154', 'PRO', 'Unavailable by ICMP ping', '(ID:24154) ICMP ping: (icmpping): Up (1)', 'BJ-To-BDcloud-SW', 'High', 'zabbix', 'recovery', '2022-01-05 06:01:50.000000', '2022-01-05 06:03:50.000000', 'unreachable', 120, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (61, '165431', '24131', 'PRO', 'Unavailable by ICMP ping', '(ID:24131) ICMP ping: (icmpping): Up (1)', 'BJ互联网接入SW', 'High', 'zabbix', 'recovery', '2022-01-05 06:02:25.000000', '2022-01-05 06:10:19.000000', 'unreachable', 474, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (62, '165730', '24138', 'PRO', 'No SNMP data collection', '(ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ互联网接入SW', 'Warning', 'zabbix', 'recovery', '2022-01-05 06:13:24.000000', '2022-01-05 06:14:24.000000', 'unknown', 60, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (63, '165884', '24154', 'PRO', 'Unavailable by ICMP ping', '(ID:24154) ICMP ping: (icmpping): Up (1)', 'BJ-To-BDcloud-SW', 'High', 'zabbix', 'recovery', '2022-01-05 07:33:44.000000', '2022-01-05 07:50:18.000000', 'unreachable', 994, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (64, '165885', '24200', 'PRO', 'Unavailable by ICMP ping', '(ID:24200) ICMP ping: (icmpping): Up (1)', 'BJ-DHCP-SW', 'High', 'zabbix', 'recovery', '2022-01-05 07:34:11.000000', '2022-01-05 07:52:03.000000', 'unreachable', 1072, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (65, '165886', '24131', 'PRO', 'Unavailable by ICMP ping', '(ID:24131) ICMP ping: (icmpping): Up (1)', 'BJ互联网接入SW', 'High', 'zabbix', 'recovery', '2022-01-05 07:34:33.000000', '2022-01-05 07:39:33.000000', 'unreachable', 300, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (66, '165896', '24138', 'PRO', 'No SNMP data collection', '(ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ互联网接入SW', 'Warning', 'zabbix', 'recovery', '2022-01-05 07:42:24.000000', '2022-01-05 07:45:24.000000', 'unknown', 180, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (67, '166050', '24161', 'PRO', 'No SNMP data collection', '(ID:24161) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ-To-BDcloud-SW', 'Warning', 'zabbix', 'recovery', '2022-01-05 07:51:05.000000', '2022-01-05 07:52:05.000000', 'unknown', 60, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (68, '166601', '24154', 'PRO', 'Unavailable by ICMP ping', '(ID:24154) ICMP ping: (icmpping): Up (1)', 'BJ-To-BDcloud-SW', 'High', 'zabbix', 'recovery', '2022-01-05 08:12:57.000000', '2022-01-05 08:27:40.000000', 'unreachable', 883, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (69, '166602', '24131', 'PRO', 'Unavailable by ICMP ping', '(ID:24131) ICMP ping: (icmpping): Up (1)', 'BJ互联网接入SW', 'High', 'zabbix', 'recovery', '2022-01-05 08:13:28.000000', '2022-01-05 08:16:23.000000', 'unreachable', 175, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (70, '166669', '24200', 'PRO', 'Unavailable by ICMP ping', '(ID:24200) ICMP ping: (icmpping): Up (1)', 'BJ-DHCP-SW', 'High', 'zabbix', 'recovery', '2022-01-05 08:17:41.000000', '2022-01-05 08:18:21.000000', 'unreachable', 40, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (71, '167176', '24200', 'PRO', 'Unavailable by ICMP ping', '(ID:24200) ICMP ping: (icmpping): Up (1)', 'BJ-DHCP-SW', 'High', 'zabbix', 'recovery', '2022-01-05 09:45:01.000000', '2022-01-05 09:45:46.000000', 'unreachable', 45, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (72, '167470', '24154', 'PRO', 'Unavailable by ICMP ping', '(ID:24154) ICMP ping: (icmpping): Up (1)', 'BJ-To-BDcloud-SW', 'High', 'zabbix', 'recovery', '2022-01-05 09:49:32.000000', '2022-01-05 09:50:57.000000', 'unreachable', 85, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (73, '167640', '24138', 'PRO', 'No SNMP data collection', '(ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ互联网接入SW', 'Warning', 'zabbix', 'recovery', '2022-01-05 12:58:24.000000', '2022-01-05 13:00:24.000000', 'unknown', 120, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (74, '167641', '24207', 'PRO', 'No SNMP data collection', '(ID:24207) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ-DHCP-SW', 'Warning', 'zabbix', 'recovery', '2022-01-05 12:58:27.000000', '2022-01-05 13:00:27.000000', 'unknown', 120, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (75, '168091', '24161', 'PRO', 'No SNMP data collection', '(ID:24161) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ-To-BDcloud-SW', 'Warning', 'zabbix', 'recovery', '2022-01-05 13:43:05.000000', '2022-01-05 13:45:05.000000', 'unknown', 120, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (76, '170239', '24132', 'PRO', 'High ICMP ping loss', '(ID:24132) ICMP loss: (icmppingloss): 100 %', 'BJ互联网接入SW', 'Warning', 'zabbix', 'recovery', '2022-01-06 03:19:00.000000', '2022-01-06 03:20:20.000000', 'unreachable', 80, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (77, '170399', '24154', 'PRO', 'Unavailable by ICMP ping', '(ID:24154) ICMP ping: (icmpping): Up (1)', 'BJ-To-BDcloud-SW', 'High', 'zabbix', 'recovery', '2022-01-06 03:24:40.000000', '2022-01-06 03:25:45.000000', 'unreachable', 65, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (78, '170402', '24131', 'PRO', 'Unavailable by ICMP ping', '(ID:24131) ICMP ping: (icmpping): Up (1)', 'BJ互联网接入SW', 'High', 'zabbix', 'recovery', '2022-01-06 03:27:15.000000', '2022-01-06 03:30:00.000000', 'unreachable', 165, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (79, '177011', '25143', 'PRO', 'Server 172.16.10.205 Timeouts on BJ-Aruba-WLC-vrrp', '(ID:25143) Server Timeouts 172.16.10.205: (aos.authSrvTimeouts.[172.16.10.205]): 290', 'BJ-Aruba-WLC-vrrp', 'High', 'zabbix', 'recovery', '2022-01-06 14:41:39.000000', '2022-01-06 14:42:39.000000', 'unknown', 60, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (80, '177615', '25143', 'PRO', 'Server 172.16.10.205 Timeouts on BJ-Aruba-WLC-vrrp', '(ID:25143) Server Timeouts 172.16.10.205: (aos.authSrvTimeouts.[172.16.10.205]): 314', 'BJ-Aruba-WLC-vrrp', 'High', 'zabbix', 'recovery', '2022-01-06 16:12:48.000000', '2022-01-06 16:13:40.000000', 'unknown', 52, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (81, '182921', '27026', 'PRO', '出向流量大于  30M', '(ID:27026) 172.21.30.51 MultiGE 0/0/2 Out: (ifHCOutOctets[MultiGE 0/0/2]): 0 b/s', '虹桥-吉利电信线路', 'Average', 'zabbix', 'recovery', '2022-01-07 17:41:03.000000', '2022-01-07 17:42:02.000000', 'netflow', 59, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (82, '182923', '27026', 'PRO', '出向流量大于  30M', '(ID:27026) 172.21.30.51 MultiGE 0/0/2 Out: (ifHCOutOctets[MultiGE 0/0/2]): 346.52 Kb/s', '虹桥-吉利电信线路', 'Average', 'zabbix', 'recovery', '2022-01-07 17:43:03.000000', '2022-01-07 17:45:02.000000', 'netflow', 119, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (83, '183043', '26073', 'PRO', 'Zabbix agent is not available (for 3m)', '(ID:26073) Zabbix agent availability: (zabbix[host,agent,available]): available (1)', 'BJDC001', 'Average', 'zabbix', 'recovery', '2022-01-08 09:16:04.000000', '2022-01-08 09:18:04.000000', 'unknown', 120, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (84, '183044', '26955', 'PRO', 'Zabbix agent is not available (for 3m)', '(ID:26955) Zabbix agent availability: (zabbix[host,agent,available]): available (1)', 'BJNPS001', 'Average', 'zabbix', 'recovery', '2022-01-08 09:16:16.000000', '2022-01-08 09:18:16.000000', 'unknown', 120, 'unknown');
INSERT INTO `monitor_alertcenter` VALUES (85, '183052', '24250', 'PRO', 'No SNMP data collection', '(ID:24250) SNMP agent availability: (zabbix[host,snmp,available]): available (1)', 'BJ-Sangfor-AC-02', 'Warning', 'zabbix', 'recovery', '2022-01-08 09:18:20.000000', '2022-01-08 09:19:20.000000', 'unknown', 60, 'unknown');
COMMIT;

-- ----------------------------
-- Table structure for msg_appid
-- ----------------------------
DROP TABLE IF EXISTS `msg_appid`;
CREATE TABLE `msg_appid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_user` varchar(64) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `appid` varchar(32) NOT NULL,
  `appname` varchar(64) NOT NULL,
  `desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `msg_appid_appname_ae9571bc_uniq` (`appname`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of msg_appid
-- ----------------------------
BEGIN;
INSERT INTO `msg_appid` VALUES (20, 'admin', '2021-12-09 18:48:51.745668', '2021-12-09 18:48:51.745762', 'D14J3M1K', 'Stargate', '运维平台');
INSERT INTO `msg_appid` VALUES (21, 'admin', '2021-12-09 18:49:30.743281', '2021-12-31 10:26:24.028261', '00SR73PO', 'prometheus-prod', 'prometheus-prod');
INSERT INTO `msg_appid` VALUES (23, 'admin', '2021-12-15 10:58:36.864007', '2022-02-16 02:46:30.822810', '5Q5F3W4C', 'zabbix-prod', 'zabbix-prod');
INSERT INTO `msg_appid` VALUES (24, 'admin', '2021-12-29 18:36:25.768149', '2021-12-29 18:36:25.768178', '67FPNBXD', '默认', '默认应用iD');
INSERT INTO `msg_appid` VALUES (26, 'admin', '2022-01-06 14:40:57.850564', '2022-01-06 14:40:57.850596', '0KT3C5WJ', 'zabbix-prod-plm', '');
INSERT INTO `msg_appid` VALUES (27, 'admin', '2022-02-07 21:45:09.358126', '2022-02-07 21:45:09.358151', 'VTPIO176', 'test', 'xxx');
INSERT INTO `msg_appid` VALUES (28, 'admin', '2022-02-07 21:45:41.295187', '2022-02-07 21:45:41.295211', 'MZWADZ6K', 'xxxx', 'xxxx');
INSERT INTO `msg_appid` VALUES (29, 'admin', '2022-02-07 21:47:06.430173', '2022-02-07 21:47:06.430197', '4V8B3VOO', 'dfsdf', 'sdfsdf');
COMMIT;

-- ----------------------------
-- Table structure for msg_wxmsglogs
-- ----------------------------
DROP TABLE IF EXISTS `msg_wxmsglogs`;
CREATE TABLE `msg_wxmsglogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_date` datetime(6) NOT NULL,
  `msg_type` varchar(64) NOT NULL,
  `msg` longtext NOT NULL,
  `status` varchar(16) NOT NULL,
  `detail` longtext NOT NULL,
  `appid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `msg_wxmsglogs_appid_id_c26daec5_fk_msg_appid_id` (`appid_id`),
  CONSTRAINT `msg_wxmsglogs_appid_id_c26daec5_fk_msg_appid_id` FOREIGN KEY (`appid_id`) REFERENCES `msg_appid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of msg_wxmsglogs
-- ----------------------------
BEGIN;
INSERT INTO `msg_wxmsglogs` VALUES (1, '2021-12-08 16:37:32.173078', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': {\'xxx\'}}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (2, '2021-12-08 16:42:34.754404', 'text', '测试消息', 'failed', 'All touser & toparty & totag & ticket invalid, hint: [1638952954075722215810704], from ip: 140.207.2.210, more info at https://open.work.weixin.qq.com/devtool/query?e=82001', 20);
INSERT INTO `msg_wxmsglogs` VALUES (3, '2021-12-08 16:46:03.896083', 'text', '测试消息', 'failed', 'All touser & toparty & totag & ticket invalid, hint: [1638953163065493018642588], from ip: 58.34.29.26, more info at https://open.work.weixin.qq.com/devtool/query?e=82001', 20);
INSERT INTO `msg_wxmsglogs` VALUES (4, '2021-12-08 16:46:50.322578', 'text', '测试消息', 'failed', 'All touser & toparty & totag & ticket invalid, hint: [1638953210450091352694510], from ip: 58.34.29.26, more info at https://open.work.weixin.qq.com/devtool/query?e=82001', 20);
INSERT INTO `msg_wxmsglogs` VALUES (5, '2021-12-08 17:10:51.065178', 'text', '测试消息', 'failed', 'All touser & toparty & totag & ticket invalid, hint: [1638954651638943096841551], from ip: 58.34.29.26, more info at https://open.work.weixin.qq.com/devtool/query?e=82001', 20);
INSERT INTO `msg_wxmsglogs` VALUES (6, '2021-12-08 17:11:20.596049', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': {\'xxx\'}}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (7, '2021-12-08 17:11:40.199538', 'text', '测试消息', 'failed', 'All touser & toparty & totag & ticket invalid, hint: [1638954700252370131871543], from ip: 140.207.2.210, more info at https://open.work.weixin.qq.com/devtool/query?e=82001', 20);
INSERT INTO `msg_wxmsglogs` VALUES (8, '2021-12-08 17:12:14.558413', 'tet', '测试消息', 'failed', 'invalid message type, hint: [1638954734593812721685879], from ip: 140.207.2.210, more info at https://open.work.weixin.qq.com/devtool/query?e=40008', 20);
INSERT INTO `msg_wxmsglogs` VALUES (9, '2021-12-08 17:13:26.440879', 'text', '', 'failed', 'empty content, hint: [1638954806156051485033591], from ip: 140.207.2.210, more info at https://open.work.weixin.qq.com/devtool/query?e=44004', 20);
INSERT INTO `msg_wxmsglogs` VALUES (10, '2021-12-08 17:37:46.889518', 'text', '', 'failed', 'empty content, hint: [1638956266206732964709833], from ip: 58.34.29.26, more info at https://open.work.weixin.qq.com/devtool/query?e=44004', 20);
INSERT INTO `msg_wxmsglogs` VALUES (11, '2021-12-08 17:38:03.138785', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': {\'xxx\'}}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (12, '2021-12-08 23:56:42.188228', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (13, '2021-12-08 23:56:56.704207', 'tet', '测试消息', 'failed', 'invalid message type, hint: [1638979016156051197076731], from ip: 183.195.60.85, more info at https://open.work.weixin.qq.com/devtool/query?e=40008', 20);
INSERT INTO `msg_wxmsglogs` VALUES (14, '2021-12-09 00:08:14.505052', 'text', '测试消息', 'failed', 'All touser & toparty & totag & ticket invalid, hint: [1638979694638941541177178], from ip: 183.195.60.85, more info at https://open.work.weixin.qq.com/devtool/query?e=82001', 20);
INSERT INTO `msg_wxmsglogs` VALUES (15, '2021-12-09 00:08:47.054035', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (16, '2021-12-09 00:22:58.838506', 'ext', '测试消息', 'failed', 'invalid message type, hint: [1638980578626611469758367], from ip: 183.195.60.85, more info at https://open.work.weixin.qq.com/devtool/query?e=40008', NULL);
INSERT INTO `msg_wxmsglogs` VALUES (17, '2021-12-09 00:24:31.343929', 'markdown', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (18, '2021-12-09 16:33:19.204630', 'markdown', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (19, '2021-12-09 16:33:30.330726', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (20, '2021-12-09 16:33:46.573357', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (21, '2021-12-09 16:33:54.814474', 'text', '测试消息', 'failed', 'All touser & toparty & totag & ticket invalid, hint: [1639038834252373007502517], from ip: 140.207.2.210, more info at https://open.work.weixin.qq.com/devtool/query?e=82001', 20);
INSERT INTO `msg_wxmsglogs` VALUES (22, '2021-12-09 16:33:57.787925', 'text', '测试消息', 'failed', 'All touser & toparty & totag & ticket invalid, hint: [1639038837188813697522185], from ip: 140.207.2.210, more info at https://open.work.weixin.qq.com/devtool/query?e=82001', 20);
INSERT INTO `msg_wxmsglogs` VALUES (23, '2021-12-09 16:34:01.857260', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (24, '2021-12-09 16:34:02.633986', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (25, '2021-12-09 16:34:03.532410', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', NULL);
INSERT INTO `msg_wxmsglogs` VALUES (26, '2021-12-09 16:34:04.253850', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', NULL);
INSERT INTO `msg_wxmsglogs` VALUES (27, '2021-12-09 16:34:04.991387', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', NULL);
INSERT INTO `msg_wxmsglogs` VALUES (28, '2021-12-09 16:38:41.064135', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', NULL);
INSERT INTO `msg_wxmsglogs` VALUES (29, '2021-12-09 16:44:07.194784', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', NULL);
INSERT INTO `msg_wxmsglogs` VALUES (30, '2021-12-09 16:45:27.255598', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', NULL);
INSERT INTO `msg_wxmsglogs` VALUES (31, '2021-12-10 10:57:11.655370', 'text', '测试消息', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', NULL);
INSERT INTO `msg_wxmsglogs` VALUES (32, '2021-12-10 10:59:17.934242', 'tet', '测试消息', 'failed', 'invalid message type, hint: [1639105157249823572742401], from ip: 106.13.178.152, more info at https://open.work.weixin.qq.com/devtool/query?e=40008', 24);
INSERT INTO `msg_wxmsglogs` VALUES (33, '2021-12-10 12:02:33.514584', 'text', '您的会议室已经预定', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (34, '2021-12-10 13:01:07.318124', 'markdown', '您的会议室已经预定，稍后会同步到`邮箱`\r\n>**事项详情**\r\n>事　项：<font color=\"info\">开会</font>\r\n>组织者：@miglioguan\r\n>参与者：@miglioguan、@kunliu、@jamdeezhou、@kanexiong、@kisonwang\r\n>>会议室：<font color=\"info\">广州TIT 1楼 301</font>\r\n>日　期：<font color=\"warning\">2018年5月18日</font>\r\n>时　间：<font color=\"comment\">上午9:00-11:00</font>\r\n>\r\n>请准时参加会议。\r\n>\r\n>如需修改会议信息，请点击：[修改会议信息](https://work.weixin.qq.com)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (35, '2021-12-10 13:04:55.124671', 'markdown', 'Stargate运维系统小功能上线了~~~`\r\n>**功能详情**\r\n>事　项：<font color=\"info\">消息中心(微信消息)</font>\r\n>贡献者：@liang.zhao、@wenliang.yan\r\n>\r\n>访问地址：<font color=\"info\">http://stargate.jiduauto.com</font>\r\n>默认用户：<font color=\"warning\">admin admin</font>\r\n>时　间：<font color=\"comment\">上午9:00-11:00</font>\r\n>\r\n>这是一条测试消息。\r\n>\r\n>目前只对接了测试环境LDAP；详情请点击：[修改会议信息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=23163611)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (36, '2021-12-10 13:09:16.096672', 'markdown', 'Stargate运维系统小功能上线了~~~\r\n>**功能详情**\r\n>事　项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>贡献者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com/#/msg/appid</font>\r\n>默认用户：<font color=\"warning\">admin admin</font>\r\n>时　间：<font color=\"comment\">上午9:00-11:00</font>\r\n>\r\n>这是一条测试消息。\r\n>\r\n>目前只对接了测试环境LDAP；详情请点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (37, '2021-12-10 13:10:02.810239', 'markdown', 'Stargate运维系统小功能上线了~~~\r\n>**功能详情**\r\n>事　项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>贡献者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com/#/msg/appid</font>\r\n>默认用户：<font color=\"warning\">admin admin</font>\r\n>这是一条测试消息。\r\n>\r\n>目前只对接了测试环境LDAP；详情请点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (38, '2021-12-10 13:11:58.236223', 'markdown', 'Stargate运维系统小功能上线了~~~\r\n>**功能详情**\r\n>事　项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>贡献者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com/#/msg/appid</font>\r\n>默认用户：<font color=\"warning\">admin admin</font>\r\n>这是一条测试消息。\r\n>\r\n>目前只对接了测试环境LDAP；\r\n>详情请点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (39, '2021-12-10 13:12:48.775839', 'markdown', 'Stargate运维系统小功能上线了~~~\r\n>**功能详情**\r\n>事　项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>贡献者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com/#/msg/appid</font>\r\n>默认用户：<font color=\"warning\">admin admin</font>\r\n>\r\n>目前只对接了测试环境LDAP；\r\n>详情请点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (40, '2021-12-10 13:14:11.959894', 'markdown', 'Stargate运维系统小功能上线了~~~\r\n>**功能详情**\r\n>事　项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>贡献者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">[请先申请appid](http://stargate.jiduauto.com/#/msg/appid)</font>\r\n>默认用户：<font color=\"warning\">admin admin</font>\r\n>\r\n>目前只对接了测试环境LDAP,后期对接生产环境LDAP \r\n>详情请点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (41, '2021-12-10 13:14:56.743066', 'markdown', 'Stargate运维系统小功能上线了~~~\r\n>**功能详情**\r\n>事　项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>贡献者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：[请先申请appid](http://stargate.jiduauto.com/#/msg/appid)</font>\r\n>默认用户：<font color=\"warning\">admin admin</font>\r\n>\r\n>目前只对接了测试环境LDAP,后期对接生产环境LDAP \r\n>详情请点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (42, '2021-12-10 13:16:32.267734', 'markdown', 'Stargate运维系统小功能上线了~~~\r\n>**功能详情**\r\n>事　项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>贡献者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com\r\n>\r\nAppID申请：[请先申请appid](http://stargate.jiduauto.com/#/msg/Appid)\r\n>默认用户：<font color=\"warning\">admin admin</font>\r\n>\r\n>目前只对接了测试环境LDAP,后期对接生产环境LDAP \r\n>详情请点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (43, '2021-12-10 13:18:42.687925', 'markdown', 'Stargate运维系统小功能上线了~~~\r\n>**功能详情**\r\n>事　项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>贡献者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com</font>\r\n>\r\nAppID申请：[请先申请appid](http://stargate.jiduauto.com/#/msg/Appid)\r\n>默认用户：<font color=\"warning\">admin admin(目前接了测试环境LDAP)</font>\r\n>\r\n>目前支持markdown，text \r\n>详情请点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (44, '2021-12-10 13:23:32.266701', 'markdown', 'Stargate运维系统小功能上线了~~~\r\n>**功能详情**\r\n>事　项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>文本格式：<font color=\"success\">markdown，text</font>\r\n>贡献者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com</font>\r\n>\r\nAppID申请：[请先申请appid](http://stargate.jiduauto.com/#/msg/Appid)\r\n>默认用户：<font color=\"warning\">admin admin(目前接了测试环境LDAP)</font>\r\n>\r\n>文本类型：目前支持markdown、text \r\n>详情请点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (45, '2021-12-10 13:24:11.851176', 'markdown', 'Stargate运维系统小功能上线了~~~\r\n>**功能详情**\r\n>事　项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>文本格式：<font color=\"success\">markdown，text</font>\r\n>贡献者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com</font>\r\n>\r\nAppID申请：[请先申请appid](http://stargate.jiduauto.com/#/msg/Appid)\r\n>默认用户：<font color=\"warning\">admin admin(目前接了测试环境LDAP)</font>\r\n>\r\n>详情点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (46, '2021-12-10 13:25:27.557046', 'markdown', 'Stargate运维系统小功能上线了~~~\r\n>**功能详情**\r\n>事　 项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>文本格式：<font color=\"success\">markdown，text</font>\r\n>贡献者： @liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com</font>\r\n>\r\nAppID申请：[请先申请appid](http://stargate.jiduauto.com/#/msg/Appid)\r\n>默认用户：<font color=\"warning\">admin admin(目前接了测试环境LDAP)</font>\r\n>\r\n>详情点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (47, '2021-12-10 13:25:49.361510', 'markdown', 'Stargate运维系统小功能上线了~~~\r\n>**功能详情**\r\n>事　 项：<font color=\"info\"> 消息中心(微信应用指定人发送消息)</font>\r\n>文本格式：<font color=\"success\">markdown，text</font>\r\n>贡献者：  @liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com</font>\r\n>\r\nAppID申请：[请先申请appid](http://stargate.jiduauto.com/#/msg/Appid)\r\n>默认用户：<font color=\"warning\">admin admin(目前接了测试环境LDAP)</font>\r\n>\r\n>详情点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (48, '2021-12-10 13:26:32.641444', 'markdown', '`Stargate运维系统小功能上线了!!!`\r\n>**功能详情**\r\n>事　 项：<font color=\"info\"> 消息中心(微信应用指定人发送消息)</font>\r\n>文本格式：<font color=\"success\">markdown，text</font>\r\n>贡献者：  @liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com</font>\r\n>\r\nAppID申请：[请先申请appid](http://stargate.jiduauto.com/#/msg/Appid)\r\n>默认用户：<font color=\"warning\">admin admin(目前接了测试环境LDAP)</font>\r\n>\r\n>详情点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (49, '2021-12-10 13:27:40.002379', 'markdown', '`Stargate运维系统小功能上线了~~~`\r\n>**功能详情**\r\n>事　  项：<font color=\"info\"> 消息中心(微信应用指定人发送消息)</font>\r\n>文本格式：<font color=\"success\">markdown，text</font>\r\n>贡献者：  @liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com</font>\r\n>\r\nAppID申请：[请先申请appid](http://stargate.jiduauto.com/#/msg/Appid)\r\n>默认用户：<font color=\"warning\">admin admin(目前接了测试环境LDAP)</font>\r\n>\r\n>详情点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (50, '2021-12-10 13:28:03.570762', 'markdown', '`Stargate运维系统小功能上线了~~~`\r\n>**功能详情**\r\n>更新事项：<font color=\"info\"> 消息中心(微信应用指定人发送消息)</font>\r\n>文本格式：<font color=\"success\">markdown，text</font>\r\n>贡献者：  @liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com</font>\r\n>\r\nAppID申请：[请先申请appid](http://stargate.jiduauto.com/#/msg/Appid)\r\n>默认用户：<font color=\"warning\">admin admin(目前接了测试环境LDAP)</font>\r\n>\r\n>详情点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (51, '2021-12-10 13:28:54.262146', 'markdown', '`Stargate运维系统小功能上线了~~~`\r\n>**功能详情**\r\n>更新事项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>文本格式：<font color=\"success\">markdown，text</font>\r\n>贡 献 者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com</font>\r\n>\r\nAppID申请：[请先申请appid](http://stargate.jiduauto.com/#/msg/Appid)\r\n>默认用户：<font color=\"warning\">admin admin(目前接了测试环境LDAP)</font>\r\n>\r\n>详情点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (52, '2021-12-10 13:29:04.270355', 'markdown', '`Stargate运维系统小功能上线了~~~`\r\n>**功能详情**\r\n>更新事项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>文本格式：<font color=\"success\">markdown，text</font>\r\n>贡  献  者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com</font>\r\n>\r\nAppID申请：[请先申请appid](http://stargate.jiduauto.com/#/msg/Appid)\r\n>默认用户：<font color=\"warning\">admin admin(目前接了测试环境LDAP)</font>\r\n>\r\n>详情点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (53, '2021-12-10 13:29:04.955347', 'markdown', '`Stargate运维系统小功能上线了~~~`\r\n>**功能详情**\r\n>更新事项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>文本格式：<font color=\"success\">markdown，text</font>\r\n>贡  献  者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com</font>\r\n>\r\nAppID申请：[请先申请appid](http://stargate.jiduauto.com/#/msg/Appid)\r\n>默认用户：<font color=\"warning\">admin admin(目前接了测试环境LDAP)</font>\r\n>\r\n>详情点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (54, '2021-12-10 13:30:48.246049', 'markdown', '`Stargate运维系统小功能上线了~~~`\r\n>**功能详情**\r\n>更新事项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>文本格式：<font color=\"success\">markdown，text</font>\r\n>\r\n贡  献  者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com</font>\r\n>\r\nAppID申请：[请先申请appid](http://stargate.jiduauto.com/#/msg/Appid)\r\n>默认用户：<font color=\"warning\">admin admin(目前接了测试环境LDAP)</font>\r\n>\r\n>详情点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (55, '2021-12-10 13:31:21.846550', 'markdown', '`Stargate运维系统小功能上线了~~~`\r\n>**功能详情**\r\n>更新事项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>文本格式：<font color=\"comment\">markdown，text</font>\r\n>\r\n贡  献  者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com</font>\r\n>\r\nAppID申请：[请先申请appid](http://stargate.jiduauto.com/#/msg/Appid)\r\n>默认用户：<font color=\"warning\">admin admin(目前接了测试环境LDAP)</font>\r\n>\r\n>详情点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': [\'xxx\']}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (56, '2021-12-10 13:32:41.981082', 'markdown', '`Stargate运维系统小功能上线了~~~`\r\n>**功能详情**\r\n>更新事项：<font color=\"info\">消息中心(微信应用指定人发送消息)</font>\r\n>文本格式：<font color=\"comment\">markdown，text</font>\r\n>\r\n贡  献  者：@liang.zhao、@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com</font>\r\n>\r\nAppID申请：[请先申请appid](http://stargate.jiduauto.com/#/msg/Appid)\r\n>默认用户：<font color=\"warning\">admin admin(目前接了测试环境LDAP)</font>\r\n>\r\n>详情点击：[如何调用接口发送消息](https://wiki.jiduauto.com/pages/viewpage.action?pageId=24295883)', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'wenliang.yan\'], \'error_userlist\': []}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (57, '2021-12-30 11:53:43.854889', 'markdown', '`Stargate功能上线`\r\n>**功能详情**\r\n>更新事项：<font color=\"info\">zabbix告警数据统计(Echarts展示)</font>\r\n>\r\n贡  献  者：@wenliang.yan\r\n>\r\n>平台地址：<font color=\"info\">http://stargate.jiduauto.com/#/monitor/statistics/</font>\r\n>\r\n\r\n>默认用户：<font color=\"warning\">admin admin</font>', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': []}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (58, '2021-12-30 11:55:46.909863', 'markdown', '`Stargate功能上线`\r\n>**功能详情**\r\n>更新事项：<font color=\"info\">告警功能(zabbix)</font>\r\n>\r\n贡  献  者：@wenliang.yan\r\n>告警统计：<font color=\"info\">http://stargate.jiduauto.com/#/monitor/statistics/</font>\r\n>\r\n>默认用户：<font color=\"warning\">admin admin</font>', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': []}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (59, '2021-12-30 11:56:20.274758', 'markdown', '`Stargate功能上线`\r\n>**功能详情**\r\n>更新事项：<font color=\"info\">告警功能(zabbix)</font>\r\n>贡  献  者：@wenliang.yan\r\n>告警统计：<font color=\"info\">http://stargate.jiduauto.com/#/monitor/statistics/</font>\r\n>默认用户：<font color=\"warning\">admin admin</font>', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': []}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (60, '2021-12-30 11:57:50.456527', 'markdown', '`Stargate功能上线`\r\n>**功能详情**\r\n>更新事项：<font color=\"info\">告警功能(zabbix)</font>\r\n>贡  献  者：@wenliang.yan\r\n>告警统计视图：<font color=\"info\">http://stargate.jiduauto.com/#/monitor/statistics/</font>\r\n>告警日志：<font color=\"primary\">http://stargate.jiduauto.com/#/msg/wxmsglog/</font>\r\n>默认用户：<font color=\"warning\">admin admin</font>', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': []}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (61, '2021-12-30 11:58:03.936883', 'markdown', '`Stargate功能上线`\r\n>**功能详情**\r\n>更新事项：<font color=\"info\">告警功能(zabbix)</font>\r\n>贡  献  者：@wenliang.yan\r\n>告警统计视图：<font color=\"info\">http://stargate.jiduauto.com/#/monitor/statistics/</font>\r\n>告警日志：<font color=\"success\">http://stargate.jiduauto.com/#/msg/wxmsglog/</font>\r\n>默认用户：<font color=\"warning\">admin admin</font>', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': []}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (62, '2021-12-30 11:58:20.398003', 'markdown', '`Stargate功能上线`\r\n>**功能详情**\r\n>更新事项：<font color=\"info\">告警功能(zabbix)</font>\r\n>贡  献  者：@wenliang.yan\r\n>告警统计视图：<font color=\"info\">http://stargate.jiduauto.com/#/monitor/statistics/</font>\r\n>告警日志：<font color=\"info\">http://stargate.jiduauto.com/#/msg/wxmsglog/</font>\r\n>默认用户：<font color=\"warning\">admin admin</font>', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': []}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (63, '2021-12-30 12:02:08.667891', 'text', '【故障恢复】ALARM-TEST: Unavailable by ICMP ping\n告警主机：ALARM-TEST\n主机 IP：None\n告警时间：2021-12-30 12:00:28\n恢复时间：2021-12-30 12:02:04\n持续时间：96\n告警状态: (ID:28480) ICMP ping: (icmpping): Up (1)\n事件ID:  159879', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (64, '2021-12-30 12:12:14.921396', 'markdown', '`Stargate功能上线`\r\n>**功能详情**\r\n>更新事项：<font color=\"info\">告警功能(zabbix)</font>\r\n>贡  献  者：@wenliang.yan\r\n>告警统计视图：<font color=\"info\">http://stargate.jiduauto.com/#/monitor/statistics/</font>\r\n>告警日志：<font color=\"info\">http://stargate.jiduauto.com/#/msg/wxmsglog/</font>\r\n>默认用户：<font color=\"warning\">admin admin</font>', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': []}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (65, '2021-12-30 15:13:07.538540', 'text', '又到了该写日报的时候了哟。\n周报链接<a href=\"https://wiki.jiduauto.com/pages/viewpage.action?pageId=29498634\">日报链接</a>', 'success', '{\'success_userlist\': [\'yirui.wei\'], \'error_userlist\': []}', 24);
INSERT INTO `msg_wxmsglogs` VALUES (66, '2021-12-30 17:46:06.798162', 'text', '【故障产生】虹桥-办伴电信线路: 入向流量大于 160M\n告警主机：虹桥-办伴电信线路\n主机 IP：None\n告警时间：2021-12-30 17:46:03\n告警等级：Average\n告警信息：入向流量大于 160M\n告警状态: (ID:27028) 172.21.30.100 eth-trunk 10 In: (ifHCInOctets[eth-trunk 10]): 11.55 Gb/s\n事件ID:  159938', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (67, '2021-12-30 18:01:06.032480', 'text', '【故障恢复】虹桥-办伴电信线路: 入向流量大于 160M\n告警主机：虹桥-办伴电信线路\n主机 IP：None\n告警时间：2021-12-30 17:46:03\n恢复时间：2021-12-30 18:01:04\n持续时间：901\n告警状态: (ID:27028) 172.21.30.100 eth-trunk 10 In: (ifHCInOctets[eth-trunk 10]): 58.3 Mb/s\n事件ID:  159938', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (68, '2022-01-04 10:51:09.581506', 'text', '【故障产生】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：None\n告警时间：2022-01-04 10:51:03\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24154) ICMP ping: (icmpping): Down (0)\n事件ID:  160999', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (69, '2022-01-04 10:52:30.145088', 'text', '【故障产生】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：None\n告警时间：2022-01-04 10:52:23\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24131) ICMP ping: (icmpping): Down (0)\n事件ID:  161000', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (70, '2022-01-04 10:57:36.014339', 'text', '【故障恢复】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：None\n告警时间：2022-01-04 10:52:23\n恢复时间：2022-01-04 10:57:31\n持续时间：308\n告警状态: (ID:24131) ICMP ping: (icmpping): Up (1)\n事件ID:  161000', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (71, '2022-01-04 11:03:39.351807', 'text', '【故障恢复】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：None\n告警时间：2022-01-04 10:51:03\n恢复时间：2022-01-04 11:03:35\n持续时间：752\n告警状态: (ID:24154) ICMP ping: (icmpping): Up (1)\n事件ID:  160999', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (72, '2022-01-04 11:04:09.676004', 'text', '【故障产生】BJ-To-BDcloud-SW: No SNMP data collection\n告警主机：BJ-To-BDcloud-SW\n主机 IP：None\n告警时间：2022-01-04 11:04:05\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24161) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  161162', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (73, '2022-01-04 11:06:08.691720', 'text', '【故障恢复】BJ-To-BDcloud-SW: No SNMP data collection\n告警主机：BJ-To-BDcloud-SW\n主机 IP：None\n告警时间：2022-01-04 11:04:05\n恢复时间：2022-01-04 11:06:05\n持续时间：120\n告警状态: (ID:24161) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  161162', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (74, '2022-01-04 11:39:03.232753', 'text', '【故障产生】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：None\n告警时间：2022-01-04 11:38:57\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24154) ICMP ping: (icmpping): Down (0)\n事件ID:  161428', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (75, '2022-01-04 11:39:54.698776', 'text', '【故障恢复】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：None\n告警时间：2022-01-04 11:38:57\n恢复时间：2022-01-04 11:39:49\n持续时间：52\n告警状态: (ID:24154) ICMP ping: (icmpping): Up (1)\n事件ID:  161428', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (76, '2022-01-04 12:32:33.252196', 'text', '【故障产生】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：None\n告警时间：2022-01-04 12:32:26\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24154) ICMP ping: (icmpping): Down (0)\n事件ID:  162031', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (77, '2022-01-04 12:32:51.515341', 'text', '【故障产生】BJ-DHCP-SW: Unavailable by ICMP ping\n告警主机：BJ-DHCP-SW\n主机 IP：None\n告警时间：2022-01-04 12:32:44\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24200) ICMP ping: (icmpping): Down (0)\n事件ID:  162032', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (78, '2022-01-04 12:35:20.937712', 'text', '【故障产生】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：None\n告警时间：2022-01-04 12:35:15\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24131) ICMP ping: (icmpping): Down (0)\n事件ID:  162034', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (79, '2022-01-04 12:35:29.971954', 'text', '【故障恢复】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：None\n告警时间：2022-01-04 12:32:26\n恢复时间：2022-01-04 12:35:24\n持续时间：178\n告警状态: (ID:24154) ICMP ping: (icmpping): Up (1)\n事件ID:  162031', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (80, '2022-01-04 12:36:09.343496', 'text', '【故障产生】BJ-To-BDcloud-SW: No SNMP data collection\n告警主机：BJ-To-BDcloud-SW\n主机 IP：None\n告警时间：2022-01-04 12:36:05\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24161) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  162038', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (81, '2022-01-04 12:40:08.582651', 'text', '【故障恢复】BJ-To-BDcloud-SW: No SNMP data collection\n告警主机：BJ-To-BDcloud-SW\n主机 IP：None\n告警时间：2022-01-04 12:36:05\n恢复时间：2022-01-04 12:40:05\n持续时间：240\n告警状态: (ID:24161) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  162038', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (82, '2022-01-04 12:44:08.829730', 'text', '【故障恢复】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：None\n告警时间：2022-01-04 12:35:15\n恢复时间：2022-01-04 12:44:03\n持续时间：528\n告警状态: (ID:24131) ICMP ping: (icmpping): Up (1)\n事件ID:  162034', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (83, '2022-01-04 12:44:27.053025', 'text', '【故障产生】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：None\n告警时间：2022-01-04 12:44:24\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  162196', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (84, '2022-01-04 12:46:27.134357', 'text', '【故障恢复】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：None\n告警时间：2022-01-04 12:44:24\n恢复时间：2022-01-04 12:46:24\n持续时间：120\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  162196', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (85, '2022-01-04 12:48:44.494346', 'text', '【故障恢复】BJ-DHCP-SW: Unavailable by ICMP ping\n告警主机：BJ-DHCP-SW\n主机 IP：None\n告警时间：2022-01-04 12:32:44\n恢复时间：2022-01-04 12:48:38\n持续时间：954\n告警状态: (ID:24200) ICMP ping: (icmpping): Up (1)\n事件ID:  162032', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (86, '2022-01-04 14:27:20.183873', 'markdown', '`Stargate功能上线`\r\n>**功能详情**\r\n>更新事项：<font color=\"info\">zabbix告警Echarts展示优化,新的一年周显示数据bug修复(zabbix)</font>\r\n>贡  献  者：@wenliang.yan\r\n>告警统计视图：<font color=\"info\">http://stargate.jiduauto.com/#/monitor/statistics</font>\r\n>告警日志：<font color=\"info\">http://stargate.jiduauto.com/#/msg/wxmsglog/</font>\r\n>默认用户：<font color=\"warning\">admin admin</font>', 'success', '{\'success_userlist\': [\'wenliang.yan\'], \'error_userlist\': []}', 20);
INSERT INTO `msg_wxmsglogs` VALUES (87, '2022-01-04 14:47:53.302242', 'text', '【故障产生】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：None\n告警时间：2022-01-04 14:47:46\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24154) ICMP ping: (icmpping): Down (0)\n事件ID:  162800', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (88, '2022-01-04 14:52:23.878165', 'text', '【故障恢复】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：None\n告警时间：2022-01-04 14:47:46\n恢复时间：2022-01-04 14:52:19\n持续时间：273\n告警状态: (ID:24154) ICMP ping: (icmpping): Up (1)\n事件ID:  162800', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (89, '2022-01-04 15:39:30.276010', 'text', '【故障产生】BJ-DHCP-SW: No SNMP data collection\n告警主机：BJ-DHCP-SW\n主机 IP：None\n告警时间：2022-01-04 15:39:27\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24207) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  162952', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (90, '2022-01-04 15:41:29.300734', 'text', '【故障恢复】BJ-DHCP-SW: No SNMP data collection\n告警主机：BJ-DHCP-SW\n主机 IP：172.16.30.251\n告警时间：2022-01-04 15:39:27\n恢复时间：2022-01-04 15:41:27\n持续时间：120\n告警状态: (ID:24207) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  162952', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (91, '2022-01-04 15:50:32.454150', 'text', '【故障产生】SH-Aruba-AC-vrrp: Server 172.21.14.205 Timeouts on SH-Aruba-AC-vrrp\n告警主机：SH-Aruba-AC-vrrp\n主机 IP：172.21.30.240\n告警时间：2022-01-04 15:50:30\n告警等级：High\n告警信息：Server 172.21.14.205 Timeouts on SH-Aruba-AC-vrrp\n告警状态: (ID:27445) Server Timeouts 172.21.14.205: (aos.authSrvTimeouts.[172.21.14.205]): 319\n事件ID:  163114', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (92, '2022-01-04 15:51:39.097375', 'text', '【故障恢复】SH-Aruba-AC-vrrp: Server 172.21.14.205 Timeouts on SH-Aruba-AC-vrrp\n告警主机：SH-Aruba-AC-vrrp\n主机 IP：172.21.30.240\n告警时间：2022-01-04 15:50:30\n恢复时间：2022-01-04 15:51:35\n持续时间：65\n告警状态: (ID:27445) Server Timeouts 172.21.14.205: (aos.authSrvTimeouts.[172.21.14.205]): 319\n事件ID:  163114', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (93, '2022-01-04 16:37:06.949314', 'text', '【故障产生】虹桥-办伴电信线路: 出向流量大于  160M\n告警主机：虹桥-办伴电信线路\n主机 IP：172.21.30.100\n告警时间：2022-01-04 16:37:03\n告警等级：Average\n告警信息：出向流量大于  160M\n告警状态: (ID:27029) 172.21.30.100 eth-trunk 10 Out: (ifHCOutOctets[eth-trunk 10]): 11.59 Gb/s\n事件ID:  163128', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (94, '2022-01-04 16:43:06.095055', 'text', '【故障恢复】虹桥-办伴电信线路: 出向流量大于  160M\n告警主机：虹桥-办伴电信线路\n主机 IP：172.21.30.100\n告警时间：2022-01-04 16:37:03\n恢复时间：2022-01-04 16:43:03\n持续时间：360\n告警状态: (ID:27029) 172.21.30.100 eth-trunk 10 Out: (ifHCOutOctets[eth-trunk 10]): 44.56 Mb/s\n事件ID:  163128', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (95, '2022-01-04 17:00:51.014906', 'text', '【故障产生】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 17:00:45\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24131) ICMP ping: (icmpping): Down (0)\n事件ID:  163137', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (96, '2022-01-04 17:00:57.101090', 'text', '【故障产生】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-04 17:00:51\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24154) ICMP ping: (icmpping): Down (0)\n事件ID:  163138', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (97, '2022-01-04 17:03:50.792910', 'text', '【故障恢复】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-04 17:00:51\n恢复时间：2022-01-04 17:03:46\n持续时间：175\n告警状态: (ID:24154) ICMP ping: (icmpping): Up (1)\n事件ID:  163138', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (98, '2022-01-04 17:08:51.728860', 'text', '【故障恢复】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 17:00:45\n恢复时间：2022-01-04 17:08:46\n持续时间：481\n告警状态: (ID:24131) ICMP ping: (icmpping): Up (1)\n事件ID:  163137', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (99, '2022-01-04 17:45:41.962154', 'text', '【故障产生】BJ-Aruba-WLC-vrrp: Server 172.16.10.205 Timeouts on BJ-Aruba-WLC-vrrp\n告警主机：BJ-Aruba-WLC-vrrp\n主机 IP：172.16.30.240\n告警时间：2022-01-04 17:45:39\n告警等级：High\n告警信息：Server 172.16.10.205 Timeouts on BJ-Aruba-WLC-vrrp\n告警状态: (ID:25143) Server Timeouts 172.16.10.205: (aos.authSrvTimeouts.[172.16.10.205]): 201\n事件ID:  163421', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (100, '2022-01-04 17:46:42.444869', 'text', '【故障恢复】BJ-Aruba-WLC-vrrp: Server 172.16.10.205 Timeouts on BJ-Aruba-WLC-vrrp\n告警主机：BJ-Aruba-WLC-vrrp\n主机 IP：172.16.30.240\n告警时间：2022-01-04 17:45:39\n恢复时间：2022-01-04 17:46:39\n持续时间：60\n告警状态: (ID:25143) Server Timeouts 172.16.10.205: (aos.authSrvTimeouts.[172.16.10.205]): 201\n事件ID:  163421', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (101, '2022-01-04 17:51:39.250483', 'text', '【故障产生】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-04 17:51:34\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24154) ICMP ping: (icmpping): Down (0)\n事件ID:  163423', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (102, '2022-01-04 17:57:56.765805', 'text', '【故障恢复】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-04 17:51:34\n恢复时间：2022-01-04 17:57:52\n持续时间：378\n告警状态: (ID:24154) ICMP ping: (icmpping): Up (1)\n事件ID:  163423', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (103, '2022-01-04 19:27:10.029630', 'text', '【故障产生】BJ-To-BDcloud-SW: No SNMP data collection\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-04 19:27:05\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24161) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  163733', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (104, '2022-01-04 19:27:27.920686', 'text', '【故障产生】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 19:27:24\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  163736', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (105, '2022-01-04 19:29:06.884591', 'text', '【故障恢复】BJ-To-BDcloud-SW: No SNMP data collection\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-04 19:27:05\n恢复时间：2022-01-04 19:29:05\n持续时间：120\n告警状态: (ID:24161) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  163733', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (106, '2022-01-04 19:30:21.681929', 'text', '【故障产生】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 19:30:15\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24131) ICMP ping: (icmpping): Down (0)\n事件ID:  163745', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (107, '2022-01-04 19:33:15.309176', 'text', '【故障恢复】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 19:30:15\n恢复时间：2022-01-04 19:33:10\n持续时间：175\n告警状态: (ID:24131) ICMP ping: (icmpping): Up (1)\n事件ID:  163745', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (108, '2022-01-04 19:33:27.387061', 'text', '【故障恢复】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 19:27:24\n恢复时间：2022-01-04 19:33:24\n持续时间：360\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  163736', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (109, '2022-01-04 20:04:57.090958', 'text', '【故障产生】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 20:04:50\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24131) ICMP ping: (icmpping): Down (0)\n事件ID:  164029', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (110, '2022-01-04 20:05:47.591798', 'text', '【故障产生】BJ-DHCP-SW: Unavailable by ICMP ping\n告警主机：BJ-DHCP-SW\n主机 IP：172.16.30.251\n告警时间：2022-01-04 20:05:43\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24200) ICMP ping: (icmpping): Down (0)\n事件ID:  164030', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (111, '2022-01-04 20:07:50.651876', 'text', '【故障恢复】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 20:04:50\n恢复时间：2022-01-04 20:07:43\n持续时间：173\n告警状态: (ID:24131) ICMP ping: (icmpping): Up (1)\n事件ID:  164029', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (112, '2022-01-04 20:07:59.888723', 'text', '【故障恢复】BJ-DHCP-SW: Unavailable by ICMP ping\n告警主机：BJ-DHCP-SW\n主机 IP：172.16.30.251\n告警时间：2022-01-04 20:05:43\n恢复时间：2022-01-04 20:07:54\n持续时间：131\n告警状态: (ID:24200) ICMP ping: (icmpping): Up (1)\n事件ID:  164030', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (113, '2022-01-04 20:08:27.157767', 'text', '【故障产生】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 20:08:24\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  164177', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (114, '2022-01-04 20:09:29.760712', 'text', '【故障恢复】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 20:08:24\n恢复时间：2022-01-04 20:09:24\n持续时间：60\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  164177', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (115, '2022-01-04 20:48:36.749068', 'text', '【故障产生】BJ-DHCP-SW: Unavailable by ICMP ping\n告警主机：BJ-DHCP-SW\n主机 IP：172.16.30.251\n告警时间：2022-01-04 20:48:28\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24200) ICMP ping: (icmpping): Down (0)\n事件ID:  164467', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (116, '2022-01-04 20:48:50.934988', 'text', '【故障产生】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 20:48:45\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24131) ICMP ping: (icmpping): Down (0)\n事件ID:  164468', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (117, '2022-01-04 20:50:42.013442', 'text', '【故障产生】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-04 20:50:35\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24154) ICMP ping: (icmpping): Down (0)\n事件ID:  164469', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (118, '2022-01-04 20:54:32.220082', 'text', '【故障恢复】BJ-DHCP-SW: Unavailable by ICMP ping\n告警主机：BJ-DHCP-SW\n主机 IP：172.16.30.251\n告警时间：2022-01-04 20:48:28\n恢复时间：2022-01-04 20:54:27\n持续时间：359\n告警状态: (ID:24200) ICMP ping: (icmpping): Up (1)\n事件ID:  164467', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (119, '2022-01-04 20:57:24.780881', 'text', '【故障恢复】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-04 20:50:35\n恢复时间：2022-01-04 20:57:18\n持续时间：403\n告警状态: (ID:24154) ICMP ping: (icmpping): Up (1)\n事件ID:  164469', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (120, '2022-01-04 21:01:24.069546', 'text', '【故障恢复】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 20:48:45\n恢复时间：2022-01-04 21:01:19\n持续时间：754\n告警状态: (ID:24131) ICMP ping: (icmpping): Up (1)\n事件ID:  164468', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (121, '2022-01-04 21:01:27.062376', 'text', '【故障产生】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 21:01:24\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  164781', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (122, '2022-01-04 21:03:27.204512', 'text', '【故障恢复】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 21:01:24\n恢复时间：2022-01-04 21:03:24\n持续时间：120\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  164781', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (123, '2022-01-04 23:52:04.174308', 'text', '【故障产生】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 23:51:58\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24131) ICMP ping: (icmpping): Down (0)\n事件ID:  164936', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (124, '2022-01-04 23:58:51.534540', 'text', '【故障恢复】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 23:51:58\n恢复时间：2022-01-04 23:58:46\n持续时间：408\n告警状态: (ID:24131) ICMP ping: (icmpping): Up (1)\n事件ID:  164936', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (125, '2022-01-04 23:59:28.021651', 'text', '【故障产生】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 23:59:24\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  164940', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (126, '2022-01-05 00:01:27.096982', 'text', '【故障恢复】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-04 23:59:24\n恢复时间：2022-01-05 00:01:24\n持续时间：120\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  164940', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (127, '2022-01-05 00:43:29.505606', 'text', '【故障产生】BJ-DHCP-SW: Unavailable by ICMP ping\n告警主机：BJ-DHCP-SW\n主机 IP：172.16.30.251\n告警时间：2022-01-05 00:43:23\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24200) ICMP ping: (icmpping): Down (0)\n事件ID:  165084', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (128, '2022-01-05 01:01:09.346420', 'text', '【故障恢复】BJ-DHCP-SW: Unavailable by ICMP ping\n告警主机：BJ-DHCP-SW\n主机 IP：172.16.30.251\n告警时间：2022-01-05 00:43:23\n恢复时间：2022-01-05 01:01:04\n持续时间：1061\n告警状态: (ID:24200) ICMP ping: (icmpping): Up (1)\n事件ID:  165084', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (129, '2022-01-05 06:01:58.041424', 'text', '【故障产生】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-05 06:01:50\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24154) ICMP ping: (icmpping): Down (0)\n事件ID:  165430', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (130, '2022-01-05 06:02:33.084924', 'text', '【故障产生】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-05 06:02:25\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24131) ICMP ping: (icmpping): Down (0)\n事件ID:  165431', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (131, '2022-01-05 06:03:57.866575', 'text', '【故障恢复】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-05 06:01:50\n恢复时间：2022-01-05 06:03:50\n持续时间：120\n告警状态: (ID:24154) ICMP ping: (icmpping): Up (1)\n事件ID:  165430', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (132, '2022-01-05 06:10:24.423264', 'text', '【故障恢复】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-05 06:02:25\n恢复时间：2022-01-05 06:10:19\n持续时间：474\n告警状态: (ID:24131) ICMP ping: (icmpping): Up (1)\n事件ID:  165431', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (133, '2022-01-05 06:13:29.998993', 'text', '【故障产生】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-05 06:13:24\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  165730', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (134, '2022-01-05 06:14:30.659154', 'text', '【故障恢复】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-05 06:13:24\n恢复时间：2022-01-05 06:14:24\n持续时间：60\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  165730', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (135, '2022-01-05 07:33:51.385174', 'text', '【故障产生】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-05 07:33:44\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24154) ICMP ping: (icmpping): Down (0)\n事件ID:  165884', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (136, '2022-01-05 07:34:18.586623', 'text', '【故障产生】BJ-DHCP-SW: Unavailable by ICMP ping\n告警主机：BJ-DHCP-SW\n主机 IP：172.16.30.251\n告警时间：2022-01-05 07:34:11\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24200) ICMP ping: (icmpping): Down (0)\n事件ID:  165885', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (137, '2022-01-05 07:34:38.831187', 'text', '【故障产生】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-05 07:34:33\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24131) ICMP ping: (icmpping): Down (0)\n事件ID:  165886', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (138, '2022-01-05 07:39:39.687832', 'text', '【故障恢复】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-05 07:34:33\n恢复时间：2022-01-05 07:39:33\n持续时间：300\n告警状态: (ID:24131) ICMP ping: (icmpping): Up (1)\n事件ID:  165886', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (139, '2022-01-05 07:42:27.226539', 'text', '【故障产生】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-05 07:42:24\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  165896', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (140, '2022-01-05 07:45:26.772029', 'text', '【故障恢复】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-05 07:42:24\n恢复时间：2022-01-05 07:45:24\n持续时间：180\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  165896', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (141, '2022-01-05 07:50:23.549952', 'text', '【故障恢复】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-05 07:33:44\n恢复时间：2022-01-05 07:50:18\n持续时间：994\n告警状态: (ID:24154) ICMP ping: (icmpping): Up (1)\n事件ID:  165884', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (142, '2022-01-05 07:51:09.235519', 'text', '【故障产生】BJ-To-BDcloud-SW: No SNMP data collection\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-05 07:51:05\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24161) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  166050', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (143, '2022-01-05 07:52:08.589812', 'text', '【故障恢复】BJ-To-BDcloud-SW: No SNMP data collection\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-05 07:51:05\n恢复时间：2022-01-05 07:52:05\n持续时间：60\n告警状态: (ID:24161) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  166050', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (144, '2022-01-05 07:52:09.577004', 'text', '【故障恢复】BJ-DHCP-SW: Unavailable by ICMP ping\n告警主机：BJ-DHCP-SW\n主机 IP：172.16.30.251\n告警时间：2022-01-05 07:34:11\n恢复时间：2022-01-05 07:52:03\n持续时间：1072\n告警状态: (ID:24200) ICMP ping: (icmpping): Up (1)\n事件ID:  165885', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (145, '2022-01-05 08:13:03.381477', 'text', '【故障产生】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-05 08:12:57\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24154) ICMP ping: (icmpping): Down (0)\n事件ID:  166601', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (146, '2022-01-05 08:13:35.466000', 'text', '【故障产生】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-05 08:13:28\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24131) ICMP ping: (icmpping): Down (0)\n事件ID:  166602', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (147, '2022-01-05 08:16:27.075180', 'text', '【故障恢复】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-05 08:13:28\n恢复时间：2022-01-05 08:16:23\n持续时间：175\n告警状态: (ID:24131) ICMP ping: (icmpping): Up (1)\n事件ID:  166602', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (148, '2022-01-05 08:17:47.853489', 'text', '【故障产生】BJ-DHCP-SW: Unavailable by ICMP ping\n告警主机：BJ-DHCP-SW\n主机 IP：172.16.30.251\n告警时间：2022-01-05 08:17:41\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24200) ICMP ping: (icmpping): Down (0)\n事件ID:  166669', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (149, '2022-01-05 08:18:27.190293', 'text', '【故障恢复】BJ-DHCP-SW: Unavailable by ICMP ping\n告警主机：BJ-DHCP-SW\n主机 IP：172.16.30.251\n告警时间：2022-01-05 08:17:41\n恢复时间：2022-01-05 08:18:21\n持续时间：40\n告警状态: (ID:24200) ICMP ping: (icmpping): Up (1)\n事件ID:  166669', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (150, '2022-01-05 08:27:44.352456', 'text', '【故障恢复】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-05 08:12:57\n恢复时间：2022-01-05 08:27:40\n持续时间：883\n告警状态: (ID:24154) ICMP ping: (icmpping): Up (1)\n事件ID:  166601', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (151, '2022-01-05 09:45:09.662148', 'text', '【故障产生】BJ-DHCP-SW: Unavailable by ICMP ping\n告警主机：BJ-DHCP-SW\n主机 IP：172.16.30.251\n告警时间：2022-01-05 09:45:01\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24200) ICMP ping: (icmpping): Down (0)\n事件ID:  167176', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (152, '2022-01-05 09:45:51.105789', 'text', '【故障恢复】BJ-DHCP-SW: Unavailable by ICMP ping\n告警主机：BJ-DHCP-SW\n主机 IP：172.16.30.251\n告警时间：2022-01-05 09:45:01\n恢复时间：2022-01-05 09:45:46\n持续时间：45\n告警状态: (ID:24200) ICMP ping: (icmpping): Up (1)\n事件ID:  167176', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (153, '2022-01-05 09:49:39.305210', 'text', '【故障产生】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-05 09:49:32\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24154) ICMP ping: (icmpping): Down (0)\n事件ID:  167470', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (154, '2022-01-05 09:51:03.050130', 'text', '【故障恢复】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-05 09:49:32\n恢复时间：2022-01-05 09:50:57\n持续时间：85\n告警状态: (ID:24154) ICMP ping: (icmpping): Up (1)\n事件ID:  167470', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (155, '2022-01-05 12:58:30.666478', 'text', '【故障产生】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-05 12:58:24\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  167640', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (156, '2022-01-05 12:58:33.299509', 'text', '【故障产生】BJ-DHCP-SW: No SNMP data collection\n告警主机：BJ-DHCP-SW\n主机 IP：172.16.30.251\n告警时间：2022-01-05 12:58:27\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24207) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  167641', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (157, '2022-01-05 13:00:29.544153', 'text', '【故障恢复】BJ互联网接入SW: No SNMP data collection\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-05 12:58:24\n恢复时间：2022-01-05 13:00:24\n持续时间：120\n告警状态: (ID:24138) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  167640', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (158, '2022-01-05 13:00:32.585404', 'text', '【故障恢复】BJ-DHCP-SW: No SNMP data collection\n告警主机：BJ-DHCP-SW\n主机 IP：172.16.30.251\n告警时间：2022-01-05 12:58:27\n恢复时间：2022-01-05 13:00:27\n持续时间：120\n告警状态: (ID:24207) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  167641', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (159, '2022-01-05 13:43:09.600878', 'text', '【故障产生】BJ-To-BDcloud-SW: No SNMP data collection\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-05 13:43:05\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24161) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  168091', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (160, '2022-01-05 13:45:08.777046', 'text', '【故障恢复】BJ-To-BDcloud-SW: No SNMP data collection\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-05 13:43:05\n恢复时间：2022-01-05 13:45:05\n持续时间：120\n告警状态: (ID:24161) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  168091', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (161, '2022-01-06 03:19:07.053252', 'text', '【故障产生】BJ互联网接入SW: High ICMP ping loss\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-06 03:19:00\n告警等级：Warning\n告警信息：High ICMP ping loss\n告警状态: (ID:24132) ICMP loss: (icmppingloss): 100 %\n事件ID:  170239', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (162, '2022-01-06 03:20:27.609023', 'text', '【故障恢复】BJ互联网接入SW: High ICMP ping loss\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-06 03:19:00\n恢复时间：2022-01-06 03:20:20\n持续时间：80\n告警状态: (ID:24132) ICMP loss: (icmppingloss): 100 %\n事件ID:  170239', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (163, '2022-01-06 03:24:46.022653', 'text', '【故障产生】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-06 03:24:40\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24154) ICMP ping: (icmpping): Down (0)\n事件ID:  170399', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (164, '2022-01-06 03:25:51.647348', 'text', '【故障恢复】BJ-To-BDcloud-SW: Unavailable by ICMP ping\n告警主机：BJ-To-BDcloud-SW\n主机 IP：172.16.30.243\n告警时间：2022-01-06 03:24:40\n恢复时间：2022-01-06 03:25:45\n持续时间：65\n告警状态: (ID:24154) ICMP ping: (icmpping): Up (1)\n事件ID:  170399', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (165, '2022-01-06 03:27:22.428796', 'text', '【故障产生】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-06 03:27:15\n告警等级：High\n告警信息：Unavailable by ICMP ping\n告警状态: (ID:24131) ICMP ping: (icmpping): Down (0)\n事件ID:  170402', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (166, '2022-01-06 03:30:07.057446', 'text', '【故障恢复】BJ互联网接入SW: Unavailable by ICMP ping\n告警主机：BJ互联网接入SW\n主机 IP：172.16.30.244\n告警时间：2022-01-06 03:27:15\n恢复时间：2022-01-06 03:30:00\n持续时间：165\n告警状态: (ID:24131) ICMP ping: (icmpping): Up (1)\n事件ID:  170402', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (167, '2022-01-06 14:41:42.050586', 'text', '【故障产生】BJ-Aruba-WLC-vrrp: Server 172.16.10.205 Timeouts on BJ-Aruba-WLC-vrrp\n告警主机：BJ-Aruba-WLC-vrrp\n主机 IP：172.16.30.240\n告警时间：2022-01-06 14:41:39\n告警等级：High\n告警信息：Server 172.16.10.205 Timeouts on BJ-Aruba-WLC-vrrp\n告警状态: (ID:25143) Server Timeouts 172.16.10.205: (aos.authSrvTimeouts.[172.16.10.205]): 290\n事件ID:  177011', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (168, '2022-01-06 14:42:42.410990', 'text', '【故障恢复】BJ-Aruba-WLC-vrrp: Server 172.16.10.205 Timeouts on BJ-Aruba-WLC-vrrp\n告警主机：BJ-Aruba-WLC-vrrp\n主机 IP：172.16.30.240\n告警时间：2022-01-06 14:41:39\n恢复时间：2022-01-06 14:42:39\n持续时间：60\n告警状态: (ID:25143) Server Timeouts 172.16.10.205: (aos.authSrvTimeouts.[172.16.10.205]): 290\n事件ID:  177011', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (169, '2022-01-06 16:12:51.006457', 'text', '【故障产生】BJ-Aruba-WLC-vrrp: Server 172.16.10.205 Timeouts on BJ-Aruba-WLC-vrrp\n告警主机：BJ-Aruba-WLC-vrrp\n主机 IP：172.16.30.240\n告警时间：2022-01-06 16:12:48\n告警等级：High\n告警信息：Server 172.16.10.205 Timeouts on BJ-Aruba-WLC-vrrp\n告警状态: (ID:25143) Server Timeouts 172.16.10.205: (aos.authSrvTimeouts.[172.16.10.205]): 314\n事件ID:  177615', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (170, '2022-01-06 16:13:42.552790', 'text', '【故障恢复】BJ-Aruba-WLC-vrrp: Server 172.16.10.205 Timeouts on BJ-Aruba-WLC-vrrp\n告警主机：BJ-Aruba-WLC-vrrp\n主机 IP：172.16.30.240\n告警时间：2022-01-06 16:12:48\n恢复时间：2022-01-06 16:13:40\n持续时间：52\n告警状态: (ID:25143) Server Timeouts 172.16.10.205: (aos.authSrvTimeouts.[172.16.10.205]): 314\n事件ID:  177615', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (171, '2022-01-07 17:41:06.519225', 'text', '【故障产生】虹桥-吉利电信线路: 出向流量大于  30M\n告警主机：虹桥-吉利电信线路\n主机 IP：172.21.30.51\n告警时间：2022-01-07 17:41:03\n告警等级：Average\n告警信息：出向流量大于  30M\n告警状态: (ID:27026) 172.21.30.51 MultiGE 0/0/2 Out: (ifHCOutOctets[MultiGE 0/0/2]): 101.57 Mb/s\n事件ID:  182921', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (172, '2022-01-07 17:42:05.866689', 'text', '【故障恢复】虹桥-吉利电信线路: 出向流量大于  30M\n告警主机：虹桥-吉利电信线路\n主机 IP：172.21.30.51\n告警时间：2022-01-07 17:41:03\n恢复时间：2022-01-07 17:42:02\n持续时间：59\n告警状态: (ID:27026) 172.21.30.51 MultiGE 0/0/2 Out: (ifHCOutOctets[MultiGE 0/0/2]): 0 b/s\n事件ID:  182921', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (173, '2022-01-07 17:43:05.498787', 'text', '【故障产生】虹桥-吉利电信线路: 出向流量大于  30M\n告警主机：虹桥-吉利电信线路\n主机 IP：172.21.30.51\n告警时间：2022-01-07 17:43:03\n告警等级：Average\n告警信息：出向流量大于  30M\n告警状态: (ID:27026) 172.21.30.51 MultiGE 0/0/2 Out: (ifHCOutOctets[MultiGE 0/0/2]): 32.03 Mb/s\n事件ID:  182923', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (174, '2022-01-07 17:45:06.640916', 'text', '【故障恢复】虹桥-吉利电信线路: 出向流量大于  30M\n告警主机：虹桥-吉利电信线路\n主机 IP：172.21.30.51\n告警时间：2022-01-07 17:43:03\n恢复时间：2022-01-07 17:45:02\n持续时间：119\n告警状态: (ID:27026) 172.21.30.51 MultiGE 0/0/2 Out: (ifHCOutOctets[MultiGE 0/0/2]): 346.52 Kb/s\n事件ID:  182923', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (175, '2022-01-08 09:16:09.373360', 'text', '【故障产生】BJDC001: Zabbix agent is not available (for 3m)\n告警主机：BJDC001\n主机 IP：172.16.10.203\n告警时间：2022-01-08 09:16:04\n告警等级：Average\n告警信息：Zabbix agent is not available (for 3m)\n告警状态: (ID:26073) Zabbix agent availability: (zabbix[host,agent,available]): not available (0)\n事件ID:  183043', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (176, '2022-01-08 09:16:21.257301', 'text', '【故障产生】BJNPS001: Zabbix agent is not available (for 3m)\n告警主机：BJNPS001\n主机 IP：172.16.10.205\n告警时间：2022-01-08 09:16:16\n告警等级：Average\n告警信息：Zabbix agent is not available (for 3m)\n告警状态: (ID:26955) Zabbix agent availability: (zabbix[host,agent,available]): not available (0)\n事件ID:  183044', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (177, '2022-01-08 09:18:08.202841', 'text', '【故障恢复】BJDC001: Zabbix agent is not available (for 3m)\n告警主机：BJDC001\n主机 IP：172.16.10.203\n告警时间：2022-01-08 09:16:04\n恢复时间：2022-01-08 09:18:04\n持续时间：120\n告警状态: (ID:26073) Zabbix agent availability: (zabbix[host,agent,available]): available (1)\n事件ID:  183043', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (178, '2022-01-08 09:18:20.285920', 'text', '【故障恢复】BJNPS001: Zabbix agent is not available (for 3m)\n告警主机：BJNPS001\n主机 IP：172.16.10.205\n告警时间：2022-01-08 09:16:16\n恢复时间：2022-01-08 09:18:16\n持续时间：120\n告警状态: (ID:26955) Zabbix agent availability: (zabbix[host,agent,available]): available (1)\n事件ID:  183044', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (179, '2022-01-08 09:18:24.404148', 'text', '【故障产生】BJ-Sangfor-AC-02: No SNMP data collection\n告警主机：BJ-Sangfor-AC-02\n主机 IP：172.16.31.4\n告警时间：2022-01-08 09:18:20\n告警等级：Warning\n告警信息：No SNMP data collection\n告警状态: (ID:24250) SNMP agent availability: (zabbix[host,snmp,available]): not available (0)\n事件ID:  183052', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
INSERT INTO `msg_wxmsglogs` VALUES (180, '2022-01-08 09:19:23.955323', 'text', '【故障恢复】BJ-Sangfor-AC-02: No SNMP data collection\n告警主机：BJ-Sangfor-AC-02\n主机 IP：172.16.31.4\n告警时间：2022-01-08 09:18:20\n恢复时间：2022-01-08 09:19:20\n持续时间：60\n告警状态: (ID:24250) SNMP agent availability: (zabbix[host,snmp,available]): available (1)\n事件ID:  183052', 'success', '{\'success_userlist\': [\'wei.xu\', \'liang.zhao\', \'tao.sun\', \'dandan.fan\', \'xing.liu\', \'weijie.chen\', \'yirui.wei\', \'yan.tang\', \'wenliang.yan\'], \'error_userlist\': []}', 23);
COMMIT;

-- ----------------------------
-- Table structure for mtask_cmdexexhistory
-- ----------------------------
DROP TABLE IF EXISTS `mtask_cmdexexhistory`;
CREATE TABLE `mtask_cmdexexhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exec_time` datetime(6) NOT NULL,
  `hosts_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mtask_cmdexexhistory_hosts_id_346c1f54_fk_host_host_id` (`hosts_id`),
  KEY `mtask_cmdexexhistory_template_id_b9f833dd_fk_mtask_cmd` (`template_id`),
  CONSTRAINT `mtask_cmdexexhistory_hosts_id_346c1f54_fk_host_host_id` FOREIGN KEY (`hosts_id`) REFERENCES `host_host` (`id`),
  CONSTRAINT `mtask_cmdexexhistory_template_id_b9f833dd_fk_mtask_cmd` FOREIGN KEY (`template_id`) REFERENCES `mtask_cmdtemplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of mtask_cmdexexhistory
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mtask_cmdtemplate
-- ----------------------------
DROP TABLE IF EXISTS `mtask_cmdtemplate`;
CREATE TABLE `mtask_cmdtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(32) DEFAULT NULL,
  `cmd` longtext NOT NULL,
  `desc` longtext,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mtask_cmdtemplate_category_id_f84b69de_fk_mtask_cmd` (`category_id`),
  CONSTRAINT `mtask_cmdtemplate_category_id_f84b69de_fk_mtask_cmd` FOREIGN KEY (`category_id`) REFERENCES `mtask_cmdtemplatecategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of mtask_cmdtemplate
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mtask_cmdtemplatecategory
-- ----------------------------
DROP TABLE IF EXISTS `mtask_cmdtemplatecategory`;
CREATE TABLE `mtask_cmdtemplatecategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of mtask_cmdtemplatecategory
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for newrelease_releaseapp
-- ----------------------------
DROP TABLE IF EXISTS `newrelease_releaseapp`;
CREATE TABLE `newrelease_releaseapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(32) NOT NULL,
  `app_id` varchar(32) NOT NULL,
  `remark` longtext,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `newrelease_releaseapp_user_id_978583cd_fk_user_userprofile_id` (`user_id`),
  CONSTRAINT `newrelease_releaseapp_user_id_978583cd_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of newrelease_releaseapp
-- ----------------------------
BEGIN;
INSERT INTO `newrelease_releaseapp` VALUES (1, 1, 1, 0, '2022-02-16 21:07:24.759152', '2022-02-18 05:09:55.117760', '购物车', 'M99IZKOQ', '测试', 1);
INSERT INTO `newrelease_releaseapp` VALUES (2, 1, 1, 0, '2022-02-16 21:42:48.781330', '2022-02-18 05:10:13.311302', '订单', 'SWTGMFTT', '测试2', 1);
INSERT INTO `newrelease_releaseapp` VALUES (4, 1, 1, 0, '2022-02-19 02:49:35.020167', '2022-02-19 02:49:35.020191', '漂流瓶', 'IMABFZEM', '奥术大师多', 1);
COMMIT;

-- ----------------------------
-- Table structure for newrelease_releaseapply
-- ----------------------------
DROP TABLE IF EXISTS `newrelease_releaseapply`;
CREATE TABLE `newrelease_releaseapply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `apply_title` varchar(64) NOT NULL,
  `git_release_branch_or_tag` varchar(128) NOT NULL,
  `git_release_version` varchar(128) NOT NULL,
  `git_release_commit_id` varchar(256) DEFAULT NULL,
  `release_status` varchar(32) NOT NULL,
  `release_desc` longtext,
  `release_record_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `release_user_id` int(11) DEFAULT NULL,
  `review_desc` varchar(128) DEFAULT NULL,
  `review_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `newrelease_releaseap_release_record_id_1db88629_fk_newreleas` (`release_record_id`),
  KEY `newrelease_releaseapply_user_id_ecb00a38_fk_user_userprofile_id` (`user_id`),
  KEY `newrelease_releaseap_release_user_id_2b613079_fk_user_user` (`release_user_id`),
  KEY `newrelease_releaseap_review_user_id_f027ad37_fk_user_user` (`review_user_id`),
  CONSTRAINT `newrelease_releaseap_release_record_id_1db88629_fk_newreleas` FOREIGN KEY (`release_record_id`) REFERENCES `newrelease_releaserecord` (`id`),
  CONSTRAINT `newrelease_releaseap_release_user_id_2b613079_fk_user_user` FOREIGN KEY (`release_user_id`) REFERENCES `user_userprofile` (`id`),
  CONSTRAINT `newrelease_releaseap_review_user_id_f027ad37_fk_user_user` FOREIGN KEY (`review_user_id`) REFERENCES `user_userprofile` (`id`),
  CONSTRAINT `newrelease_releaseapply_user_id_ecb00a38_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of newrelease_releaseapply
-- ----------------------------
BEGIN;
INSERT INTO `newrelease_releaseapply` VALUES (1, 1, 1, 0, '2022-02-18 05:11:38.000000', '2022-02-19 20:23:08.405867', '订单发布申请', '1', 'master', 'xssdsda', '2', 'xxxx', 1, 1, NULL, '通过', NULL);
INSERT INTO `newrelease_releaseapply` VALUES (2, 1, 1, 0, '2022-02-19 02:42:17.000000', '2022-02-19 20:23:40.234060', '购物车发布申请', '1', 'master', 'asdasd', '2', 'xxxx', 2, 1, NULL, '再说吧', NULL);
INSERT INTO `newrelease_releaseapply` VALUES (3, 1, 1, 0, '2022-02-19 06:21:33.598536', '2022-02-19 06:21:33.598570', '测试发布', '1', 'master', NULL, '1', NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO `newrelease_releaseapply` VALUES (6, 1, 1, 0, '2022-02-19 06:33:56.208372', '2022-02-19 20:23:57.427856', 'dsfdsfsdf', '1', 'master', NULL, '1', NULL, 1, 1, NULL, '不行', NULL);
INSERT INTO `newrelease_releaseapply` VALUES (7, 1, 1, 0, '2022-02-19 14:54:09.745768', '2022-02-19 14:54:09.745805', 'xxxasd', '1', 'master', NULL, '1', NULL, 1, 1, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for newrelease_releaserecord
-- ----------------------------
DROP TABLE IF EXISTS `newrelease_releaserecord`;
CREATE TABLE `newrelease_releaserecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `code_git_addr` varchar(128) NOT NULL,
  `msg_notice_status` tinyint(1) NOT NULL,
  `msg_type` int(11) NOT NULL,
  `msg_content` varchar(128) NOT NULL,
  `target_host_pub_path` varchar(128) NOT NULL,
  `target_host_repository_path` varchar(128) NOT NULL,
  `keep_history_count` int(11) NOT NULL,
  `filefilterway` int(11) NOT NULL,
  `file_filter_cmd_content` longtext,
  `before_code_check_out_value` longtext NOT NULL,
  `before_release_content` longtext,
  `custom_global_variable` longtext,
  `after_code_check_out_value` longtext,
  `after_release_value` longtext,
  `env_id` int(11) NOT NULL,
  `release_app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `newrelease_releasere_env_id_075bf0ec_fk_confcente` (`env_id`),
  KEY `newrelease_releasere_release_app_id_7f0d1d5f_fk_newreleas` (`release_app_id`),
  CONSTRAINT `newrelease_releasere_env_id_075bf0ec_fk_confcente` FOREIGN KEY (`env_id`) REFERENCES `confcenter_environment` (`id`),
  CONSTRAINT `newrelease_releasere_release_app_id_7f0d1d5f_fk_newreleas` FOREIGN KEY (`release_app_id`) REFERENCES `newrelease_releaseapp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of newrelease_releaserecord
-- ----------------------------
BEGIN;
INSERT INTO `newrelease_releaserecord` VALUES (1, 1, 1, 0, '2022-02-18 01:50:51.475480', '2022-02-18 01:50:51.475505', 'git@gitee.com:gtdong/nginx-consul-frontend.git', 0, 0, '', '/www/projects', '/www/history', 5, 2, 'readme.md', 'ls', 'ls', 'a=10', 'tar czvf', 'ls', 1, 1);
INSERT INTO `newrelease_releaserecord` VALUES (2, 1, 1, 0, '2022-02-18 02:40:26.134360', '2022-02-18 02:40:26.134402', 'git@gitee.com:gtdong/nginx-consul-frontend.git', 1, 2, 'xxx', '/www/projects', '/www/history', 5, 2, 'readme.md', 'ls', 'ls', 'a=10', 'tar czvf', 'ls', 2, 2);
INSERT INTO `newrelease_releaserecord` VALUES (3, 1, 1, 0, '2022-02-19 02:49:15.824129', '2022-02-19 02:49:15.826435', 'sss', 0, 0, '', '/asd', '/asdas', 5, 2, 'readme.md', 'ls', 'ls', 'a=10', 'tar czvf ', 'ls', 1, 4);
COMMIT;

-- ----------------------------
-- Table structure for newrelease_releaserecorddetail
-- ----------------------------
DROP TABLE IF EXISTS `newrelease_releaserecorddetail`;
CREATE TABLE `newrelease_releaserecorddetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `orders` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `hosts_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `newrelease_releaserecorddetail_hosts_id_b064215e_fk_host_host_id` (`hosts_id`),
  KEY `newrelease_releasere_record_id_364b904a_fk_newreleas` (`record_id`),
  CONSTRAINT `newrelease_releasere_record_id_364b904a_fk_newreleas` FOREIGN KEY (`record_id`) REFERENCES `newrelease_releaserecord` (`id`),
  CONSTRAINT `newrelease_releaserecorddetail_hosts_id_b064215e_fk_host_host_id` FOREIGN KEY (`hosts_id`) REFERENCES `host_host` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of newrelease_releaserecorddetail
-- ----------------------------
BEGIN;
INSERT INTO `newrelease_releaserecorddetail` VALUES (1, 1, 1, 0, '2022-02-18 01:50:51.479368', '2022-02-18 01:50:51.479390', 19, 1);
INSERT INTO `newrelease_releaserecorddetail` VALUES (2, 1, 1, 0, '2022-02-18 01:50:51.483163', '2022-02-18 01:50:51.483187', 21, 1);
INSERT INTO `newrelease_releaserecorddetail` VALUES (3, 1, 1, 0, '2022-02-18 02:40:26.136873', '2022-02-18 02:40:26.136891', 19, 2);
INSERT INTO `newrelease_releaserecorddetail` VALUES (4, 1, 1, 0, '2022-02-18 02:40:26.138016', '2022-02-18 02:40:26.138032', 21, 2);
INSERT INTO `newrelease_releaserecorddetail` VALUES (5, 1, 1, 0, '2022-02-19 02:49:15.832238', '2022-02-19 02:49:15.832262', 20, 3);
COMMIT;

-- ----------------------------
-- Table structure for release_deploy
-- ----------------------------
DROP TABLE IF EXISTS `release_deploy`;
CREATE TABLE `release_deploy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `version` varchar(40) NOT NULL,
  `info` varchar(100) DEFAULT NULL,
  `detail` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `console_output` longtext NOT NULL,
  `apply_time` datetime(6) NOT NULL,
  `deploy_name` datetime(6) NOT NULL,
  `applicant_id` int(11) DEFAULT NULL,
  `assign_to_id` int(11) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `release_deploy_applicant_id_31a1ce00_fk_user_userprofile_id` (`applicant_id`),
  KEY `release_deploy_assign_to_id_e3395415_fk_user_userprofile_id` (`assign_to_id`),
  KEY `release_deploy_reviewer_id_670b25bd_fk_user_userprofile_id` (`reviewer_id`),
  CONSTRAINT `release_deploy_applicant_id_31a1ce00_fk_user_userprofile_id` FOREIGN KEY (`applicant_id`) REFERENCES `user_userprofile` (`id`),
  CONSTRAINT `release_deploy_assign_to_id_e3395415_fk_user_userprofile_id` FOREIGN KEY (`assign_to_id`) REFERENCES `user_userprofile` (`id`),
  CONSTRAINT `release_deploy_reviewer_id_670b25bd_fk_user_userprofile_id` FOREIGN KEY (`reviewer_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of release_deploy
-- ----------------------------
BEGIN;
INSERT INTO `release_deploy` VALUES (1, '2', 'v1.2', '尝试第二次打标签', 'xxx', 4, '', '2022-01-29 04:06:04.908410', '2022-01-29 04:06:04.908465', 1, NULL, 1);
INSERT INTO `release_deploy` VALUES (2, '1', 'v1.1', '111', 'xxx', 4, '', '2022-01-29 14:51:28.460974', '2022-01-29 14:51:28.461030', 1, NULL, 1);
INSERT INTO `release_deploy` VALUES (3, 'stargate', 'v1.1', 'xxx', 'xxx', 3, 'Started by user admin\nRunning as SYSTEM\nBuilding in workspace /var/jenkins_home/workspace/stargate\nThe recommended git tool is: NONE\nusing credential 1\nCloning the remote Git repository\nCloning repository http://192.168.1.2:8090/root/stargate.git\n > git init /var/jenkins_home/workspace/stargate # timeout=10\nFetching upstream changes from http://192.168.1.2:8090/root/stargate.git\n > git --version # timeout=10\n > git --version # \'git version 2.34.1\'\nusing GIT_ASKPASS to set credentials test\n > git fetch --tags --force --progress -- http://192.168.1.2:8090/root/stargate.git +refs/heads/*:refs/remotes/origin/* # timeout=10\n > git config remote.origin.url http://192.168.1.2:8090/root/stargate.git # timeout=10\n > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10\nAvoid second fetch\n > git rev-parse refs/remotes/origin/master^{commit} # timeout=10\nChecking out Revision 0f42b4f0c920e2735cc1b751f4d4d9f7da1a64f0 (refs/remotes/origin/master)\n > git config core.sparsecheckout # timeout=10\n > git checkout -f 0f42b4f0c920e2735cc1b751f4d4d9f7da1a64f0 # timeout=10\nCommit message: \"增加project\"\n > git rev-list --no-walk 0f42b4f0c920e2735cc1b751f4d4d9f7da1a64f0 # timeout=10\n[stargate] $ /bin/bash /tmp/jenkins10289621860840134485.sh\nFinished: SUCCESS\n', '2022-01-29 17:46:58.385837', '2022-01-29 17:46:58.385868', 1, NULL, 1);
INSERT INTO `release_deploy` VALUES (4, 'stargate', 'v1.2', 'xxx', 'xxx', 3, 'Started by user admin\nRunning as SYSTEM\nBuilding in workspace /var/jenkins_home/workspace/stargate\nThe recommended git tool is: NONE\nusing credential 1\nCloning the remote Git repository\nCloning repository http://192.168.1.2:8090/root/stargate.git\n > git init /var/jenkins_home/workspace/stargate # timeout=10\nFetching upstream changes from http://192.168.1.2:8090/root/stargate.git\n > git --version # timeout=10\n > git --version # \'git version 2.34.1\'\nusing GIT_ASKPASS to set credentials test\n > git fetch --tags --force --progress -- http://192.168.1.2:8090/root/stargate.git +refs/heads/*:refs/remotes/origin/* # timeout=10\n > git config remote.origin.url http://192.168.1.2:8090/root/stargate.git # timeout=10\n > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10\nAvoid second fetch\n > git rev-parse refs/remotes/origin/master^{commit} # timeout=10\nChecking out Revision 0f42b4f0c920e2735cc1b751f4d4d9f7da1a64f0 (refs/remotes/origin/master)\n > git config core.sparsecheckout # timeout=10\n > git checkout -f 0f42b4f0c920e2735cc1b751f4d4d9f7da1a64f0 # timeout=10\nCommit message: \"增加project\"\n > git rev-list --no-walk 0f42b4f0c920e2735cc1b751f4d4d9f7da1a64f0 # timeout=10\n[stargate] $ /bin/bash /tmp/jenkins13204365494374421011.sh\nFinished: SUCCESS\n', '2022-01-29 20:20:40.148383', '2022-01-29 20:20:40.148483', 1, 1, 1);
INSERT INTO `release_deploy` VALUES (5, 'stargate', 'v1.2', '尝试第二次打标签', '测试完成', 0, '', '2022-01-29 20:51:33.754148', '2022-01-29 20:51:33.754176', 1, NULL, 19);
INSERT INTO `release_deploy` VALUES (6, 'stargate', 'v1.1', NULL, 'sdasdas', 0, '', '2022-01-29 20:54:00.055889', '2022-01-29 20:54:00.055915', 1, NULL, 19);
INSERT INTO `release_deploy` VALUES (7, 'stargate', 'v1.2', '尝试第二次打标签', '上线申请', 2, '', '2022-01-29 22:27:50.649630', '2022-01-29 22:27:50.650186', 1, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for schedule_taskhost
-- ----------------------------
DROP TABLE IF EXISTS `schedule_taskhost`;
CREATE TABLE `schedule_taskhost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hosts_id` int(11) NOT NULL,
  `tasks_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_taskhost_hosts_id_81828fb9_fk_host_host_id` (`hosts_id`),
  KEY `schedule_taskhost_tasks_id_81f4b8eb_fk_schedule_taskschedule_id` (`tasks_id`),
  CONSTRAINT `schedule_taskhost_hosts_id_81828fb9_fk_host_host_id` FOREIGN KEY (`hosts_id`) REFERENCES `host_host` (`id`),
  CONSTRAINT `schedule_taskhost_tasks_id_81f4b8eb_fk_schedule_taskschedule_id` FOREIGN KEY (`tasks_id`) REFERENCES `schedule_taskschedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of schedule_taskhost
-- ----------------------------
BEGIN;
INSERT INTO `schedule_taskhost` VALUES (1, 19, 1);
INSERT INTO `schedule_taskhost` VALUES (2, 20, 1);
INSERT INTO `schedule_taskhost` VALUES (3, 19, 2);
INSERT INTO `schedule_taskhost` VALUES (4, 20, 2);
INSERT INTO `schedule_taskhost` VALUES (5, 19, 3);
INSERT INTO `schedule_taskhost` VALUES (6, 20, 3);
COMMIT;

-- ----------------------------
-- Table structure for schedule_taskschedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule_taskschedule`;
CREATE TABLE `schedule_taskschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_beat` int(11) DEFAULT NULL,
  `task_name` varchar(32) NOT NULL,
  `task_cmd` longtext NOT NULL,
  `period_way` varchar(32) NOT NULL,
  `period_content` varchar(32) NOT NULL,
  `period_status` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of schedule_taskschedule
-- ----------------------------
BEGIN;
INSERT INTO `schedule_taskschedule` VALUES (1, 6, 'test', 'ls', '1', '10', '1');
INSERT INTO `schedule_taskschedule` VALUES (2, 7, 'test2', 'ls', '1', '5', '1');
INSERT INTO `schedule_taskschedule` VALUES (3, 8, 'test3', 'ls', '1', '5', '1');
COMMIT;

-- ----------------------------
-- Table structure for user_organization
-- ----------------------------
DROP TABLE IF EXISTS `user_organization`;
CREATE TABLE `user_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_user` varchar(64) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(60) NOT NULL,
  `type` varchar(20) NOT NULL,
  `pid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `user_organization_pid_id_7d20d5b9_fk_user_organization_id` (`pid_id`),
  CONSTRAINT `user_organization_pid_id_7d20d5b9_fk_user_organization_id` FOREIGN KEY (`pid_id`) REFERENCES `user_organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_organization
-- ----------------------------
BEGIN;
INSERT INTO `user_organization` VALUES (1, 'admin', '2021-11-04 15:48:54.000000', '2021-11-04 15:48:56.000000', 'Infra', 'department', NULL);
INSERT INTO `user_organization` VALUES (2, 'admin', '2021-11-04 15:50:06.000000', '2021-11-04 15:50:08.000000', 'devops', 'department', NULL);
INSERT INTO `user_organization` VALUES (5, 'admin', '2021-11-11 08:42:36.767052', '2021-11-19 01:27:21.305167', 'help', 'department', NULL);
INSERT INTO `user_organization` VALUES (7, 'admin', '2021-11-22 00:29:40.929835', '2021-11-22 00:29:40.929930', 'helpdesk', 'department', 5);
INSERT INTO `user_organization` VALUES (8, 'admin', '2021-11-22 04:39:41.123762', '2021-11-22 04:39:41.123800', 'Test', 'department', NULL);
INSERT INTO `user_organization` VALUES (9, 'admin', '2021-11-22 04:47:28.314430', '2021-11-22 04:47:28.314568', 'Car', 'department', NULL);
INSERT INTO `user_organization` VALUES (10, 'admin', '2021-11-22 04:49:31.005731', '2021-11-22 04:49:31.005880', 'AutoDrive', 'department', NULL);
INSERT INTO `user_organization` VALUES (11, 'admin', '2021-11-22 04:50:12.258064', '2021-11-22 04:50:12.258106', 'People', 'department', NULL);
INSERT INTO `user_organization` VALUES (12, 'admin', '2021-11-22 04:51:01.597027', '2021-11-22 04:51:01.597161', 'Product', 'department', NULL);
INSERT INTO `user_organization` VALUES (13, 'admin', '2022-02-07 21:27:38.936823', '2022-02-07 21:27:38.936848', 'xxx', 'department', NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_permission
-- ----------------------------
DROP TABLE IF EXISTS `user_permission`;
CREATE TABLE `user_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_user` varchar(64) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sign` varchar(30) NOT NULL,
  `method` varchar(8) NOT NULL,
  `menu` tinyint(1) NOT NULL,
  `path` varchar(200) NOT NULL,
  `desc` varchar(30) DEFAULT NULL,
  `pid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `user_permission_pid_id_ab01d5b4_fk_user_permission_id` (`pid_id`),
  CONSTRAINT `user_permission_pid_id_ab01d5b4_fk_user_permission_id` FOREIGN KEY (`pid_id`) REFERENCES `user_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_permission
-- ----------------------------
BEGIN;
INSERT INTO `user_permission` VALUES (1, 'admin', '2021-11-02 18:03:45.000000', '2021-11-02 18:03:49.000000', '系统管理', 'system', '', 1, '', NULL, NULL);
INSERT INTO `user_permission` VALUES (2, 'admin', '2021-11-02 18:36:47.000000', '2021-11-02 18:36:50.000000', '用户管理', 'system-users', '', 1, '', NULL, 1);
INSERT INTO `user_permission` VALUES (3, 'admin', '2021-11-02 18:38:19.000000', '2021-11-02 18:38:22.000000', '角色管理', 'system-roles', '', 1, '', '', 1);
INSERT INTO `user_permission` VALUES (4, 'admin', '2021-11-02 18:39:41.000000', '2021-11-02 18:39:43.000000', '权限管理', 'system-permissions', ' ', 1, ' ', NULL, 1);
INSERT INTO `user_permission` VALUES (5, 'admin', '2021-11-03 18:07:46.000000', '2021-11-03 18:07:48.000000', '部门管理', 'system-organizations', '', 1, ' ', NULL, 1);
INSERT INTO `user_permission` VALUES (6, 'admin', '2021-11-03 18:12:54.000000', '2021-11-11 11:04:28.171954', '资源管理', 'cmdb', '', 1, '', NULL, NULL);
INSERT INTO `user_permission` VALUES (7, 'admin', '2021-11-03 18:13:30.000000', '2021-11-11 11:26:39.280657', '主机管理', 'cmdb-servers', '', 1, '', '', 6);
INSERT INTO `user_permission` VALUES (8, 'admin', '2021-11-03 18:14:11.000000', '2021-11-22 17:36:27.030395', '服务器新增', 'cmdb-servers-add', 'POST', 0, '/cmdb/servers/', NULL, 7);
INSERT INTO `user_permission` VALUES (9, 'admin', '2021-11-03 18:16:13.000000', '2021-11-03 18:16:16.000000', '服务器删除', 'cmdb-servers-del', 'DELETE', 0, '/cmdb/servers/\\d+/', NULL, 7);
INSERT INTO `user_permission` VALUES (10, 'admin', '2021-11-03 18:17:52.000000', '2021-11-03 18:17:54.000000', '服务器批量删除', 'cmdb-servers-mdel', 'DELETE', 0, '/cmdb/servers/', NULL, 7);
INSERT INTO `user_permission` VALUES (11, 'admin', '2021-11-03 18:19:07.000000', '2021-11-03 18:19:09.000000', '服务器编辑', 'cmdb-servers-update', 'PUT', 0, '/cmdb/servers/\\d+/', NULL, 7);
INSERT INTO `user_permission` VALUES (13, 'admin', '2021-11-03 18:28:34.000000', '2021-11-03 18:28:37.000000', '用户删除', 'system-users-del', 'DELETE', 0, '/system/user/\\d+/', NULL, 2);
INSERT INTO `user_permission` VALUES (14, 'admin', '2021-11-03 18:29:35.000000', '2021-11-03 18:29:37.000000', '用户批量删除', 'system-users-mdel', 'DELETE', 0, '/system/user/', NULL, 2);
INSERT INTO `user_permission` VALUES (15, 'admin', '2021-11-03 18:30:26.000000', '2021-11-03 18:30:28.000000', '用户编辑', 'system-users-update', 'PUT', 0, '/system/user/\\d+/', NULL, 2);
INSERT INTO `user_permission` VALUES (17, 'admin', '2021-11-04 15:28:12.000000', '2021-11-04 15:28:15.000000', '角色新增', 'system-roles-add', 'POST', 0, '/system/role/', NULL, 3);
INSERT INTO `user_permission` VALUES (18, 'admin', '2021-11-04 15:29:50.000000', '2021-11-04 15:29:48.000000', '角色删除', 'system-roles-del', 'DELETE', 0, '/system/role/\\d+/', NULL, 3);
INSERT INTO `user_permission` VALUES (19, 'admin', '2021-11-04 15:30:27.000000', '2021-11-04 15:30:29.000000', '角色批量删除', 'system-roles-mdel', 'DELETE', 0, '/system/role/', NULL, 3);
INSERT INTO `user_permission` VALUES (20, 'admin', '2021-11-04 15:31:59.000000', '2021-11-04 15:32:01.000000', '角色更新', 'system-roles-update', 'PUT', 0, '/system/role/\\d+/', NULL, 3);
INSERT INTO `user_permission` VALUES (21, 'admin', '2021-11-04 15:32:56.000000', '2021-11-04 15:32:58.000000', '角色授权', 'system-roles-auth', 'PATCH', 0, '/system/role/\\d+/', NULL, 3);
INSERT INTO `user_permission` VALUES (22, 'admin', '2021-11-04 15:33:49.000000', '2021-11-04 15:33:51.000000', '权限新增', 'system-permissions-add', 'POST', 0, '/system/permission/', NULL, 4);
INSERT INTO `user_permission` VALUES (23, 'admin', '2021-11-04 15:34:28.000000', '2021-11-04 15:34:29.000000', '权限删除', 'system-permissions-del', 'DELETE', 0, '/system/permission/\\d+/', NULL, 4);
INSERT INTO `user_permission` VALUES (24, 'admin', '2021-11-04 15:35:21.000000', '2021-11-04 15:35:23.000000', '权限批量删除', 'system-permissions-mdel', 'DELETE', 0, '/system/permission/', NULL, 4);
INSERT INTO `user_permission` VALUES (25, 'admin', '2021-11-04 15:36:12.000000', '2021-11-04 15:36:14.000000', '权限编辑', 'system-permissions-update', 'PUT', 0, '/system/permission/\\d+/', NULL, 4);
INSERT INTO `user_permission` VALUES (26, 'admin', '2021-11-04 15:37:13.000000', '2021-11-04 15:37:15.000000', '部门新增', 'system-organizations-add', 'POST', 0, '/system/org/', NULL, 5);
INSERT INTO `user_permission` VALUES (27, 'admin', '2021-11-04 15:37:58.000000', '2021-11-04 15:38:00.000000', '部门删除', 'system-organizations-del', 'DELETE', 0, '/system/org/\\d+/', NULL, 5);
INSERT INTO `user_permission` VALUES (28, 'admin', '2021-11-04 15:38:47.000000', '2021-11-04 15:38:50.000000', '部门批量删除', 'system-organizations-mdel', 'DELETE', 0, '/system/org/', NULL, 5);
INSERT INTO `user_permission` VALUES (29, 'admin', '2021-11-04 15:39:27.000000', '2021-11-04 15:39:29.000000', '部门编辑', 'system-organizations-update', 'PUT', 0, '/system/org/\\d+/', NULL, 5);
INSERT INTO `user_permission` VALUES (35, 'admin', '2021-11-19 10:40:01.439776', '2021-11-19 10:40:01.439917', '用户锁定/激活', 'system-users-lock', 'PATCH', 0, '/system/user/\\d+/', '用户锁定/激活', 2);
INSERT INTO `user_permission` VALUES (37, 'admin', '2021-11-23 03:35:53.134229', '2021-11-23 03:35:53.134804', 'test', 'test', 'POST', 0, '/test/', 'test', 1);
INSERT INTO `user_permission` VALUES (38, 'admin', '2021-11-23 03:36:44.838700', '2021-11-23 03:36:44.838847', 'test1', 'test1', 'GET', 0, '/test/', 'test1', 1);
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_user` varchar(64) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(32) NOT NULL,
  `desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` VALUES (1, 'admin', '2021-11-04 15:41:40.000000', '2021-11-04 15:41:42.000000', 'admin', '管理员');
INSERT INTO `user_role` VALUES (2, 'ops', '2021-11-04 15:41:59.000000', '2021-12-07 23:43:20.685084', 'ops', '系统运维');
INSERT INTO `user_role` VALUES (3, 'devops', '2021-11-04 15:42:21.000000', '2021-11-04 15:42:23.000000', 'devops', 'devops');
INSERT INTO `user_role` VALUES (7, 'admin', '2021-11-12 00:25:27.117354', '2021-11-22 05:08:35.020117', 'test', 'test');
INSERT INTO `user_role` VALUES (11, 'admin', '2021-11-12 02:36:50.177631', '2021-11-15 10:20:31.791178', 'test2', 'test2');
INSERT INTO `user_role` VALUES (12, 'admin', '2021-12-07 11:05:15.722947', '2021-12-07 11:05:15.730279', 'test3', 'test3');
COMMIT;

-- ----------------------------
-- Table structure for user_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_role_permissions`;
CREATE TABLE `user_role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_role_permissions_role_id_permissions_id_8d19e0b3_uniq` (`role_id`,`permission_id`),
  KEY `user_role_permission_permission_id_f8e771ef_fk_user_perm` (`permission_id`),
  CONSTRAINT `user_role_permission_permission_id_f8e771ef_fk_user_perm` FOREIGN KEY (`permission_id`) REFERENCES `user_permission` (`id`),
  CONSTRAINT `user_role_permissions_role_id_b8961a0b_fk_user_role_id` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_role_permissions
-- ----------------------------
BEGIN;
INSERT INTO `user_role_permissions` VALUES (1, 1, 1);
INSERT INTO `user_role_permissions` VALUES (2, 1, 2);
INSERT INTO `user_role_permissions` VALUES (3, 1, 3);
INSERT INTO `user_role_permissions` VALUES (4, 1, 4);
INSERT INTO `user_role_permissions` VALUES (5, 1, 5);
INSERT INTO `user_role_permissions` VALUES (6, 1, 6);
INSERT INTO `user_role_permissions` VALUES (7, 1, 7);
INSERT INTO `user_role_permissions` VALUES (8, 1, 8);
INSERT INTO `user_role_permissions` VALUES (9, 1, 9);
INSERT INTO `user_role_permissions` VALUES (10, 1, 10);
INSERT INTO `user_role_permissions` VALUES (11, 1, 11);
INSERT INTO `user_role_permissions` VALUES (13, 1, 13);
INSERT INTO `user_role_permissions` VALUES (14, 1, 14);
INSERT INTO `user_role_permissions` VALUES (15, 1, 15);
INSERT INTO `user_role_permissions` VALUES (17, 1, 17);
INSERT INTO `user_role_permissions` VALUES (18, 1, 18);
INSERT INTO `user_role_permissions` VALUES (19, 1, 19);
INSERT INTO `user_role_permissions` VALUES (20, 1, 20);
INSERT INTO `user_role_permissions` VALUES (21, 1, 21);
INSERT INTO `user_role_permissions` VALUES (22, 1, 22);
INSERT INTO `user_role_permissions` VALUES (23, 1, 23);
INSERT INTO `user_role_permissions` VALUES (24, 1, 24);
INSERT INTO `user_role_permissions` VALUES (25, 1, 25);
INSERT INTO `user_role_permissions` VALUES (26, 1, 26);
INSERT INTO `user_role_permissions` VALUES (27, 1, 27);
INSERT INTO `user_role_permissions` VALUES (28, 1, 28);
INSERT INTO `user_role_permissions` VALUES (29, 1, 29);
INSERT INTO `user_role_permissions` VALUES (98, 2, 1);
INSERT INTO `user_role_permissions` VALUES (99, 2, 2);
INSERT INTO `user_role_permissions` VALUES (103, 2, 3);
INSERT INTO `user_role_permissions` VALUES (91, 2, 6);
INSERT INTO `user_role_permissions` VALUES (92, 2, 7);
INSERT INTO `user_role_permissions` VALUES (93, 2, 8);
INSERT INTO `user_role_permissions` VALUES (94, 2, 9);
INSERT INTO `user_role_permissions` VALUES (95, 2, 10);
INSERT INTO `user_role_permissions` VALUES (96, 2, 11);
INSERT INTO `user_role_permissions` VALUES (104, 2, 17);
INSERT INTO `user_role_permissions` VALUES (105, 2, 18);
INSERT INTO `user_role_permissions` VALUES (106, 2, 19);
INSERT INTO `user_role_permissions` VALUES (107, 2, 20);
INSERT INTO `user_role_permissions` VALUES (108, 2, 21);
INSERT INTO `user_role_permissions` VALUES (109, 7, 1);
INSERT INTO `user_role_permissions` VALUES (112, 7, 2);
INSERT INTO `user_role_permissions` VALUES (110, 7, 5);
INSERT INTO `user_role_permissions` VALUES (113, 7, 13);
INSERT INTO `user_role_permissions` VALUES (111, 7, 26);
INSERT INTO `user_role_permissions` VALUES (55, 11, 6);
INSERT INTO `user_role_permissions` VALUES (56, 11, 7);
INSERT INTO `user_role_permissions` VALUES (57, 11, 8);
INSERT INTO `user_role_permissions` VALUES (58, 11, 9);
INSERT INTO `user_role_permissions` VALUES (59, 11, 10);
INSERT INTO `user_role_permissions` VALUES (60, 11, 11);
COMMIT;

-- ----------------------------
-- Table structure for user_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile`;
CREATE TABLE `user_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `change_user` varchar(64) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(150) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `position` varchar(50) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `superior_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_userprofile_department_id_d60a64b8_fk_user_organization_id` (`department_id`),
  KEY `user_userprofile_superior_id_310ebc05_fk_user_userprofile_id` (`superior_id`),
  CONSTRAINT `user_userprofile_department_id_d60a64b8_fk_user_organization_id` FOREIGN KEY (`department_id`) REFERENCES `user_organization` (`id`),
  CONSTRAINT `user_userprofile_superior_id_310ebc05_fk_user_userprofile_id` FOREIGN KEY (`superior_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_userprofile
-- ----------------------------
BEGIN;
INSERT INTO `user_userprofile` VALUES (1, 'pbkdf2_sha256$150000$5SaBiyWrndYK$+3s84L1in9jNrVZZWWgLE4o5AuCqEv4f+595TCTNLFQ=', '2021-12-13 11:32:53.744565', 1, 'admin', '', '', 1, 1, '2021-10-21 16:11:03.230360', 'admin', '2021-10-21 16:11:03.367497', '2021-11-22 01:14:22.367055', '', '', 'wenliang.yan@jiduauto.com', NULL, 1, NULL);
INSERT INTO `user_userprofile` VALUES (2, 'pbkdf2_sha256$150000$5SaBiyWrndYK$+3s84L1in9jNrVZZWWgLE4o5AuCqEv4f+595TCTNLFQ=', '2021-11-04 15:44:33.000000', 0, 'ops', ' ', ' ', 1, 1, '2021-11-04 15:44:46.000000', 'ops', '2021-11-04 15:44:55.000000', '2021-12-07 23:46:15.082206', ' ', ' ', 'ops@jiduauto.com', NULL, 2, NULL);
INSERT INTO `user_userprofile` VALUES (18, 'pbkdf2_sha256$150000$5SaBiyWrndYK$+3s84L1in9jNrVZZWWgLE4o5AuCqEv4f+595TCTNLFQ=', NULL, 0, 'weijie.chen', '', '', 0, 1, '2021-12-22 11:34:42.226798', 'admin', '2021-12-22 11:34:42.227176', '2022-01-09 11:56:18.368277', '', '', 'weijie.chen@jiduauto.com', NULL, 1, NULL);
INSERT INTO `user_userprofile` VALUES (19, 'pbkdf2_sha256$150000$5SaBiyWrndYK$+3s84L1in9jNrVZZWWgLE4o5AuCqEv4f+595TCTNLFQ=', NULL, 0, 'wenliang.yan', '', '', 0, 1, '2021-12-30 15:58:44.609337', 'admin', '2021-12-30 15:58:44.609710', '2021-12-30 17:29:19.376879', '', '', 'wenliang.yan@jiduauto.com', NULL, 1, NULL);
INSERT INTO `user_userprofile` VALUES (20, 'pbkdf2_sha256$150000$5SaBiyWrndYK$+3s84L1in9jNrVZZWWgLE4o5AuCqEv4f+595TCTNLFQ=', NULL, 0, 'yirui.wei', '', '', 0, 1, '2021-12-30 16:09:45.595291', 'admin', '2021-12-30 16:09:45.595560', '2021-12-30 17:28:55.332567', '', '', 'yirui.wei@jiduauto.com', NULL, 1, NULL);
INSERT INTO `user_userprofile` VALUES (21, 'pbkdf2_sha256$150000$5SaBiyWrndYK$+3s84L1in9jNrVZZWWgLE4o5AuCqEv4f+595TCTNLFQ=', NULL, 0, 'wei.xu', '', '', 0, 1, '2021-12-30 16:23:54.522673', 'admin', '2021-12-30 16:23:54.523037', '2022-01-06 14:39:44.219964', '', '', 'wei.xu@jiduauto.com', NULL, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile_groups`;
CREATE TABLE `user_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_userprofile_groups_userprofile_id_group_id_52847a61_uniq` (`userprofile_id`,`group_id`),
  KEY `user_userprofile_groups_group_id_98cc4038_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_userprofile_gro_userprofile_id_49724c40_fk_user_user` FOREIGN KEY (`userprofile_id`) REFERENCES `user_userprofile` (`id`),
  CONSTRAINT `user_userprofile_groups_group_id_98cc4038_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_userprofile_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_userprofile_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile_roles`;
CREATE TABLE `user_userprofile_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_userprofile_roles_userprofile_id_role_id_73dc3873_uniq` (`userprofile_id`,`role_id`),
  KEY `user_userprofile_roles_role_id_875cb2d8_fk_user_role_id` (`role_id`),
  CONSTRAINT `user_userprofile_rol_userprofile_id_153ebc6a_fk_user_user` FOREIGN KEY (`userprofile_id`) REFERENCES `user_userprofile` (`id`),
  CONSTRAINT `user_userprofile_roles_role_id_875cb2d8_fk_user_role_id` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_userprofile_roles
-- ----------------------------
BEGIN;
INSERT INTO `user_userprofile_roles` VALUES (1, 1, 1);
INSERT INTO `user_userprofile_roles` VALUES (8, 1, 2);
INSERT INTO `user_userprofile_roles` VALUES (2, 2, 2);
INSERT INTO `user_userprofile_roles` VALUES (12, 18, 1);
INSERT INTO `user_userprofile_roles` VALUES (15, 19, 2);
INSERT INTO `user_userprofile_roles` VALUES (13, 20, 2);
INSERT INTO `user_userprofile_roles` VALUES (14, 21, 2);
COMMIT;

-- ----------------------------
-- Table structure for user_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile_user_permissions`;
CREATE TABLE `user_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_userprofile_user_pe_userprofile_id_permissio_2e86ceca_uniq` (`userprofile_id`,`permission_id`),
  KEY `user_userprofile_use_permission_id_7f559b23_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_userprofile_use_permission_id_7f559b23_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_userprofile_use_userprofile_id_68dc814c_fk_user_user` FOREIGN KEY (`userprofile_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_userprofile_user_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for workorder_workorder
-- ----------------------------
DROP TABLE IF EXISTS `workorder_workorder`;
CREATE TABLE `workorder_workorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  `order_contents` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `result_desc` longtext,
  `apply_time` datetime(6) NOT NULL,
  `complete_time` datetime(6) NOT NULL,
  `applicant_id` int(11) DEFAULT NULL,
  `assign_to_id` int(11) DEFAULT NULL,
  `final_processor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workorder_workorder_applicant_id_3351de9c_fk_user_userprofile_id` (`applicant_id`),
  KEY `workorder_workorder_assign_to_id_3a4c4f8b_fk_user_userprofile_id` (`assign_to_id`),
  KEY `workorder_workorder_final_processor_id_e260f068_fk_user_user` (`final_processor_id`),
  CONSTRAINT `workorder_workorder_applicant_id_3351de9c_fk_user_userprofile_id` FOREIGN KEY (`applicant_id`) REFERENCES `user_userprofile` (`id`),
  CONSTRAINT `workorder_workorder_assign_to_id_3a4c4f8b_fk_user_userprofile_id` FOREIGN KEY (`assign_to_id`) REFERENCES `user_userprofile` (`id`),
  CONSTRAINT `workorder_workorder_final_processor_id_e260f068_fk_user_user` FOREIGN KEY (`final_processor_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of workorder_workorder
-- ----------------------------
BEGIN;
INSERT INTO `workorder_workorder` VALUES (1, '测试工单1', 4, '测试工单', 3, NULL, '2022-01-15 17:23:41.657977', '2022-01-15 17:23:41.660791', 1, 2, 1);
INSERT INTO `workorder_workorder` VALUES (2, '测试工单1', 4, '测试工单', 2, 'done', '2022-01-15 17:30:32.510265', '2022-01-15 17:30:32.512160', 1, 2, 1);
INSERT INTO `workorder_workorder` VALUES (3, '测试工单3', 4, '测试工单', 3, NULL, '2022-01-15 17:32:39.890996', '2022-01-15 17:32:39.892713', 19, 2, 19);
INSERT INTO `workorder_workorder` VALUES (4, '测试工单3', 4, '测试工单3', 3, NULL, '2022-01-15 17:32:58.429801', '2022-01-15 17:32:58.431695', 19, 18, 1);
INSERT INTO `workorder_workorder` VALUES (5, '测试工单4', 4, '测试工单4', 0, NULL, '2022-01-15 17:33:04.612340', '2022-01-15 17:33:04.613548', 19, 19, NULL);
INSERT INTO `workorder_workorder` VALUES (6, '测试工单5', 4, '测试工单5', 0, NULL, '2022-01-15 17:33:10.859415', '2022-01-15 17:33:10.860693', 19, 20, NULL);
INSERT INTO `workorder_workorder` VALUES (7, '测试工单6', 4, '测试工单6', 0, NULL, '2022-01-15 17:33:22.416859', '2022-01-15 17:33:22.418268', 19, 21, NULL);
INSERT INTO `workorder_workorder` VALUES (8, '测试工单7', 4, '测试工单7', 0, NULL, '2022-01-15 17:33:28.030540', '2022-01-15 17:33:28.031797', 19, 21, NULL);
INSERT INTO `workorder_workorder` VALUES (9, '测试工单7', 4, '测试工单7', 0, NULL, '2022-01-15 20:29:09.189332', '2022-01-15 20:29:09.192535', 19, 21, NULL);
INSERT INTO `workorder_workorder` VALUES (10, 'asdasd', 1, 'asdasd', 1, NULL, '2022-01-16 02:45:34.262457', '2022-01-16 02:45:34.273312', 1, 19, 1);
INSERT INTO `workorder_workorder` VALUES (11, '计划任务', 2, '萨达所大所多', 0, NULL, '2022-01-16 20:22:59.805770', '2022-01-16 20:22:59.810470', 1, 19, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
