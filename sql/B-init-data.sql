
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 godspen_db 的数据库结构
CREATE DATABASE IF NOT EXISTS `godspen_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `godspen_db`;

-- 导出  表 godspen_db.tb_category 结构
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

-- 正在导出表  godspen_db.tb_category 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;
INSERT INTO `tb_category` (`id`, `name`, `type`, `status`, `create_time`, `update_time`, `desc`) VALUES
	(1, 'page', 1, 0, '2017-12-18 17:46:00', '2018-09-11 15:54:16', '页面'),
	(2, 'combinedcomponent', 3, 1, '2017-12-18 17:47:02', '2018-09-11 15:54:21', '组合组件'),
	(3, 'component', 2, 1, '2017-12-19 10:17:02', '2018-09-11 15:55:10', '组件'),
	(4, 'image', 3, 1, '2018-01-18 15:02:48', '2018-09-11 15:54:29', '图片'),
	(5, 'audio', 3, 1, '2018-01-18 15:02:58', '2018-09-11 15:54:33', '音频'),
	(6, 'script', 3, 1, '2018-02-08 17:43:14', '2018-09-11 15:54:35', '脚本'),
	(7, 'video', 3, 1, '2018-03-02 16:56:04', '2018-09-11 15:54:39', '视频');
/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;

-- 导出  表 godspen_db.tb_component 结构
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='组件列表';

-- 正在导出表  godspen_db.tb_component 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `tb_component` DISABLE KEYS */;
INSERT INTO `tb_component` (`id`, `name`, `path`, `user_id`, `version`, `visibilitylevel`, `status`, `create_time`, `update_time`, `desc`, `isnew`, `usenumber`) VALUES
	(1, 'truck/image', 'https://ymm-maliang.oss-cn-hangzhou.aliyuncs.com/truck/image/0.1.6/index.js', 1, '0.1.6', 1, 1, '2019-01-03 10:40:07', '2019-04-22 07:04:07', '图片', 1, 2),
	(2, 'truck/text', 'https://ymm-maliang.oss-cn-hangzhou.aliyuncs.com/truck/text/0.1.6/index.js', 1, '0.1.6', 1, 1, '2018-11-15 05:34:09', '2019-04-22 07:04:07', '文本', 1, 1),
	(3, 'truck/button', 'https://ymm-maliang.oss-cn-hangzhou.aliyuncs.com/truck/button/0.1.5/index.js', 1, '0.1.5', 1, 1, '2018-11-15 05:23:00', '2019-04-22 07:04:07', '按钮', 1, 0),
	(4, 'truck/emptyContainer', 'https://ymm-maliang.oss-cn-hangzhou.aliyuncs.com/truck/emptyContainer/1.0.2/index.js', 1, '1.0.2', 1, 1, '2018-06-11 11:02:19', '2019-04-22 07:04:07', '空容器节点', 1, 0),
	(5, 'truck/richtext', 'https://ymm-maliang.oss-cn-hangzhou.aliyuncs.com/truck/richtext/1.1.5/index.js', 1, '1.1.5', 1, 1, '2018-06-29 03:38:42', '2019-04-22 07:04:07', '富文本', 1, 0),
	(6, 'truck/PageContainer', 'https://ymm-maliang.oss-cn-hangzhou.aliyuncs.com/truck/PageContainer/1.0.2/index.js', 1, '1.0.2', 1, 1, '2018-06-11 11:01:25', '2019-04-22 07:04:07', '页面容器组件', 1, 0),
	(7, 'truck/ListContainer', 'https://ymm-maliang.oss-cn-hangzhou.aliyuncs.com/truck/ListContainer/0.1.5/index.js', 1, '0.1.5', 1, 1, '2018-07-30 07:52:35', '2019-04-22 07:05:04', '列表容器', 1, 0),
	(8, 'truck/video', 'https://ymm-maliang.oss-cn-hangzhou.aliyuncs.com/truck/video/0.1.7/index.js', 1, '0.1.7', 1, 1, '2018-06-12 00:42:50', '2019-04-22 07:05:04', '视频组件，用于播放视频', 1, 0),
	(9, 'truck/audio', 'https://ymm-maliang.oss-cn-hangzhou.aliyuncs.com/truck/audio/0.1.3/index.js', 1, '0.1.3', 1, 1, '2018-06-12 00:46:47', '2019-04-22 07:05:04', '音频组件', 1, 0),
	(10, 'truck/drumPad', 'https://ymm-maliang.oss-cn-hangzhou.aliyuncs.com/truck/drumPad/1.0.0/index.js', 1, '1.0.0', 1, 1, '2018-12-27 07:43:39', '2019-04-22 07:05:04', '格子块，n行n列的块状区域，每个块有两个状态', 1, 0);
/*!40000 ALTER TABLE `tb_component` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
