
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出数据库结构
CREATE DATABASE IF NOT EXISTS `godspen_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `godspen_db`;

-- 导出  表 truck_editor.tb_category 结构
CREATE TABLE IF NOT EXISTS `tb_category` (
  `id` int(10) NOT NULL COMMENT '类别id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '类别名',
  `type` int(10) NOT NULL COMMENT '分类所属（1：项目   2：模板   3：资源）',
  `status` int(5) NOT NULL DEFAULT '1' COMMENT '项目状态（0删除，1正常，2禁用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '类别创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '类别更改时间',
  `desc` varchar(255) DEFAULT '' COMMENT '类别描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_company 结构
CREATE TABLE IF NOT EXISTS `tb_company` (
  `id` bigint(11) NOT NULL,
  `name` varchar(32) DEFAULT '',
  `address` varchar(64) DEFAULT '',
  `status` tinyint(1) DEFAULT '1',
  `update_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_company_and_user 结构
CREATE TABLE IF NOT EXISTS `tb_company_and_user` (
  `user_id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `update_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`company_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_component 结构
CREATE TABLE IF NOT EXISTS `tb_component` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '资源名称',
  `path` text NOT NULL COMMENT '资源内容（url、脚本）',
  `user_id` bigint(10) DEFAULT NULL COMMENT '用户id，外键',
  `version` varchar(15) NOT NULL COMMENT '版本号',
  `visibilitylevel` int(5) NOT NULL DEFAULT '1' COMMENT '显示状态（0私有，1公共开放）',
  `status` int(11) unsigned DEFAULT '1' COMMENT '删除状态',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `desc` varchar(200) DEFAULT NULL COMMENT '简单描述',
  `isnew` int(11) DEFAULT NULL COMMENT '是否是最新版本  1：是 0：否',
  `usenumber` bigint(20) unsigned DEFAULT '0' COMMENT '使用量',
  `type` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '组件类型，默认0，普通组件；1，flutter 组件；',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='组件列表';

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_component_use 结构
CREATE TABLE IF NOT EXISTS `tb_component_use` (
  `cid` bigint(10) NOT NULL COMMENT '用户id，外键',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `usenumber` bigint(20) unsigned DEFAULT '0' COMMENT '使用量',
  `love` bigint(20) unsigned DEFAULT '0' COMMENT '点赞数',
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='组件列表';

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_favorate_project 结构
CREATE TABLE IF NOT EXISTS `tb_favorate_project` (
  `project_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `update_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_group 结构
CREATE TABLE IF NOT EXISTS `tb_group` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `create_user_id` bigint(20) DEFAULT '0',
  `name` varchar(32) DEFAULT '',
  `status` tinyint(1) DEFAULT '1',
  `type` tinyint(1) DEFAULT '1' COMMENT '项目组类型, 1默认, 2新建',
  `description` varchar(100) DEFAULT '',
  `logo` varchar(200) DEFAULT '',
  `project_count` int(5) NOT NULL DEFAULT '0',
  `user_count` int(5) NOT NULL DEFAULT '0',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1146 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_group_and_project 结构
CREATE TABLE IF NOT EXISTS `tb_group_and_project` (
  `project_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_group_and_user 结构
CREATE TABLE IF NOT EXISTS `tb_group_and_user` (
  `user_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `role` tinyint(1) DEFAULT '1' COMMENT '用户在项目组中的角色, 1创建者, 2管理员, 3组员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_kaptcha 结构
CREATE TABLE IF NOT EXISTS `tb_kaptcha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deskey` varchar(11) DEFAULT NULL COMMENT '验证key',
  `code` varchar(255) DEFAULT NULL COMMENT '验证码',
  `expire_time` bigint(20) DEFAULT NULL COMMENT '过期时间',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `tk` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_login_log 结构
CREATE TABLE IF NOT EXISTS `tb_login_log` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL,
  `ip` varchar(255) DEFAULT NULL COMMENT '登录IP地址',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `INDEX_UPDATE_TIME` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_login_token 结构
CREATE TABLE IF NOT EXISTS `tb_login_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户ID',
  `get_time` varchar(255) DEFAULT NULL COMMENT '获取时间',
  `expire_time` varchar(255) DEFAULT NULL COMMENT '过期时间',
  `token` varchar(1023) DEFAULT NULL,
  `expires_in` int(20) NOT NULL COMMENT '有效期，单位秒',
  PRIMARY KEY (`id`),
  KEY `tk` (`token`(255)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_mock 结构
CREATE TABLE IF NOT EXISTS `tb_mock` (
  `interface_id` bigint(11) NOT NULL COMMENT '接口Id(历史接口或草稿接口)',
  `type` tinyint(4) NOT NULL COMMENT '接口类型：1-历史接口 2-草稿接口',
  `mock_request` text COMMENT '请求的mock规则',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`interface_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_pages 结构
CREATE TABLE IF NOT EXISTS `tb_pages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '页面id, hash值',
  `key` varchar(50) DEFAULT NULL COMMENT '页面key',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '页面名',
  `image` varchar(500) DEFAULT NULL COMMENT '页面logo图片地址',
  `desc` varchar(500) DEFAULT '' COMMENT '页面描述',
  `content` mediumtext COMMENT '页面json数据',
  `draft` mediumtext COMMENT '页面json数据-草稿',
  `project_id` bigint(10) DEFAULT NULL COMMENT '项目id，外键',
  `is_home_page` int(11) NOT NULL DEFAULT '0' COMMENT '是否为首页 （0否   1是）',
  `status` int(5) NOT NULL DEFAULT '1' COMMENT '页面状态（0删除，1正常，2禁用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '页面创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '页面更改时间',
  `visibilitylevel` int(5) NOT NULL DEFAULT '1' COMMENT '显示状态（0私有，1公共开放）',
  `type` TINYINT(1) UNSIGNED ZEROFILL NOT NULL DEFAULT '0' COMMENT '页面类型，默认0，普通页面；1，flutter 页面；',
  `fork` INT(1)     UNSIGNED ZEROFILL NOT NULL DEFAULT '0' COMMENT '页面fork数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `Index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COMMENT='abc';

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_pages_history 结构
CREATE TABLE IF NOT EXISTS `tb_pages_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '页面id, hash值',
  `content` mediumtext COMMENT '页面json数据',
  `page_id` bigint(10) DEFAULT NULL COMMENT '页面id，外键',
  `status` int(5) NOT NULL DEFAULT '1' COMMENT '历史状态（0删除，1正常）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '页面创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '页面更改时间',
  `user_id` bigint(10) DEFAULT NULL COMMENT '操作人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8mb4 COMMENT='页面历史记录';

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_project 结构
CREATE TABLE IF NOT EXISTS `tb_project` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '项目id, hash值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '项目名',
  `key` varchar(50) NOT NULL DEFAULT '' COMMENT ' ',
  `category_id` int(10) DEFAULT NULL COMMENT '项目的类别（外链，与tb_category相关联）',
  `desc` varchar(500) DEFAULT '' COMMENT '项目描述',
  `image` varchar(500) DEFAULT '' COMMENT '项目logo图片地址',
  `status` int(5) NOT NULL DEFAULT '1' COMMENT '项目状态（0删除，1正常，2禁用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '项目创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '项目更改时间',
  `visibilitylevel` int(5) NOT NULL DEFAULT '1' COMMENT '显示状态（0私有，1公共开放）',
  `create_user_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_resources 结构
CREATE TABLE IF NOT EXISTS `tb_resources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` int(11) NOT NULL COMMENT '分类',
  `name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `content` text COMMENT '资源内容（url、脚本）',
  `status` int(11) DEFAULT NULL COMMENT '1正常   0删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `visibilitylevel` int(5) NOT NULL DEFAULT '1' COMMENT '显示状态（0私有，1公共开放）',
  `user_id` bigint(10) DEFAULT NULL COMMENT '用户id，外键',
  `icon` varchar(200) DEFAULT NULL COMMENT '对应icon图标',
  `use_count` bigint(10) DEFAULT '0' COMMENT '使用量',
  `desc` text COMMENT '资源内容（url、脚本）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_res_tags_rel 结构
CREATE TABLE IF NOT EXISTS `tb_res_tags_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rid` bigint(20) NOT NULL COMMENT '资源表外键',
  `tid` bigint(20) DEFAULT NULL COMMENT '标签表外键',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cid` bigint(20) DEFAULT NULL COMMENT '标签分类id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_role 结构
CREATE TABLE IF NOT EXISTS `tb_role` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) NOT NULL COMMENT '角色名称',
  `alias_number` varchar(32) NOT NULL COMMENT '编号',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注信息',
  `del_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '删除状态：1-未删除 2-已删除',
  `create_time` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_tags 结构
CREATE TABLE IF NOT EXISTS `tb_tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '资源名称',
  `category_id` int(11) NOT NULL COMMENT '分类',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1正常   0删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usenumber` int(11) NOT NULL DEFAULT '1' COMMENT '使用次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_template 结构
CREATE TABLE IF NOT EXISTS `tb_template` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名',
  `category_id` int(10) NOT NULL COMMENT '模板的类别（外链，与tb_category相关联）',
  `content` text COMMENT '模板内容',
  `status` int(5) NOT NULL DEFAULT '1' COMMENT '模板状态（0删除，1正常，2禁用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '模板创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '模板更改时间',
  `desc` varchar(255) DEFAULT '' COMMENT '模板描述',
  `image` varchar(255) DEFAULT '' COMMENT '模板图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_user 结构
CREATE TABLE IF NOT EXISTS `tb_user` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) DEFAULT '',
  `email_status` tinyint(4) DEFAULT '1' COMMENT '邮箱激活状态 1-未激活 2-已激活',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `telephone` varchar(16) DEFAULT '',
  `photo` varchar(100) DEFAULT NULL COMMENT '头像地址',
  `project_count` int(11) DEFAULT '0',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `oauth` VARCHAR(64) NULL DEFAULT NULL COMMENT '第三方登录鉴权id：渠道_id',
  PRIMARY KEY (`id`),
  KEY `searchEmail` (`email`) USING BTREE,
  KEY `searchName` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_user_and_project 结构
CREATE TABLE IF NOT EXISTS `tb_user_and_project` (
  `project_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `role` tinyint(1) DEFAULT '1' COMMENT '用户在项目中的角色, 1Owner, 2Master, 3Dev, 4Guest',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_favor` tinyint(1) DEFAULT '0' COMMENT '是否关注，0未关注，1已关注',
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_user_grade 结构
CREATE TABLE IF NOT EXISTS `tb_user_grade` (
  `user_id` bigint(11) unsigned NOT NULL COMMENT '用户ID,为主键',
  `project_num` int(4) DEFAULT NULL COMMENT '剩余可创建的项目数',
  `group_num` int(4) DEFAULT NULL COMMENT '剩余可创建的组数目',
  `interface_num` int(4) DEFAULT NULL COMMENT '剩余可创建的接口数',
  `favorate_project_num` int(11) DEFAULT NULL COMMENT '关注项目数',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_user_login 结构
CREATE TABLE IF NOT EXISTS `tb_user_login` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(64) DEFAULT '',
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户信息表ID',
  `email` varchar(50) DEFAULT '',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否可用状态：1-可用 2-不可用',
  `last_ip` varchar(20) DEFAULT NULL COMMENT '上次登录IP',
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上次登录时间',
  `sso_uid` bigint(20) DEFAULT '0' COMMENT 'SSO登录映射用户ID',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `security` varchar(64) DEFAULT '' COMMENT '秘钥信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_user_notice 结构
CREATE TABLE IF NOT EXISTS `tb_user_notice` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `create_user_id` bigint(11) DEFAULT NULL COMMENT '通知创建者ID',
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户ID',
  `content` varchar(255) DEFAULT NULL COMMENT '消息内容',
  `title` varchar(50) DEFAULT NULL COMMENT '消息标题',
  `read_status` tinyint(1) DEFAULT '1' COMMENT '读取状态：1-未读 2-已读取',
  `type` int(4) DEFAULT NULL COMMENT '消息类型 ：101-用户添加组 102-组移除用户 103-组内用户权限变动 201-用户添加项目 202-项目移除成员 203-项目内成员权限变动 301-删除接口 302-接口发布申请 303-接口修改 304-审核接口',
  `join_id` bigint(11) DEFAULT NULL COMMENT '关联ID(取值 项目ID、分组ID、接口ID、审核日志ID)',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26906 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_user_notice_type 结构
CREATE TABLE IF NOT EXISTS `tb_user_notice_type` (
  `user_id` bigint(11) NOT NULL COMMENT '用户ID',
  `type` tinyint(1) NOT NULL COMMENT '类别：1-项目域 2-接口域',
  `message_notice` tinyint(1) DEFAULT '1' COMMENT '站内信是否开启通知：1-开启 2-不开启',
  `email_notice` tinyint(1) DEFAULT '2' COMMENT '邮件通知：1-开启 2-不开启',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 truck_editor.tb_valid_code 结构
CREATE TABLE IF NOT EXISTS `tb_valid_code` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `code` varchar(255) DEFAULT NULL COMMENT '验证码',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `expire_time` timestamp NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
