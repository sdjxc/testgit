/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : jxcfast

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-05-24 09:12:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '分销商',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
INSERT INTO `fa_admin` VALUES ('1', '7393417', 'admin', 'Admin', '38902f0d0a34cf33944dcbf1e32bd884', '6c37ca', '/assets/img/avatar.png', 'admin@admin.com', '0', '1527123100', '1492186163', '1527123100', '3596e290-ba2e-4ea7-82c8-115ea8751cd2', 'normal');
INSERT INTO `fa_admin` VALUES ('2', '7393417', 'admin2', 'admin2', '9a28ce07ce875fbd14172a9ca5357d3c', '2dHDmj', '/assets/img/avatar.png', 'admin2@fastadmin.net', '0', '1505450906', '1492186163', '1526973399', 'df45fdd5-26f4-45ca-83b3-47e4491a315a', 'normal');
INSERT INTO `fa_admin` VALUES ('3', '0', 'admin3', 'admin3', '1c11f945dfcd808a130a8c2a8753fe62', 'WOKJEn', '/assets/img/avatar.png', 'admin3@fastadmin.net', '0', '1501980868', '1492186201', '1501982377', '', 'normal');
INSERT INTO `fa_admin` VALUES ('4', '0', 'admin22', 'admin22', '1c1a0aa0c3c56a8c1a908aab94519648', 'Aybcn5', '/assets/img/avatar.png', 'admin22@fastadmin.net', '0', '0', '1492186240', '1492186240', '', 'normal');
INSERT INTO `fa_admin` VALUES ('5', '0', 'admin32', 'admin32', 'ade94d5d7a7033afa7d84ac3066d0a02', 'FvYK0u', '/assets/img/avatar.png', 'admin32@fastadmin.net', '0', '0', '1492186263', '1492186263', '', 'normal');

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员日志表';

-- ----------------------------
-- Records of fa_admin_log
-- ----------------------------
INSERT INTO `fa_admin_log` VALUES ('1', '1', 'admin', '/index.php/admin/index/login', '登录', '{\"__token__\":\"8fe5423b7e78c7e643f8f9c192b3494e\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525767558');
INSERT INTO `fa_admin_log` VALUES ('2', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"10317bc7990ffb59163007bd552b77a0\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525824758');
INSERT INTO `fa_admin_log` VALUES ('3', '1', 'admin', '/admin/index/login?url=%2Fadmin%2Fcategory%3Faddtabs%3D1', '登录', '{\"url\":\"\\/admin\\/category?addtabs=1\",\"__token__\":\"bfabe02a1d12d075d8d658b9c98f7501\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525827788');
INSERT INTO `fa_admin_log` VALUES ('4', '1', 'admin', '/admin/auth/rule/edit/ids/85?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"basic\",\"title\":\"\\u57fa\\u672c\\u8bbe\\u7f6e\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"85\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525830966');
INSERT INTO `fa_admin_log` VALUES ('5', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525830967');
INSERT INTO `fa_admin_log` VALUES ('6', '1', 'admin', '/admin/basic/storage/add?dialog=1', '基本设置 仓库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"SN2018050910271269065\",\"name\":\"\\u90af\\u90f8\\u4ed3\\u5e93\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"15029005621\",\"desc\":\"\\u90af\\u90f8\\u4ed3\\u5e93\",\"address\":\"\\u6cb3\\u5317\\u7701\\u90af\\u90f8\\u5e02\\u90af\\u5c71\\u533a\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525832875');
INSERT INTO `fa_admin_log` VALUES ('7', '1', 'admin', '/admin/basic/storage/add?dialog=1', '基本设置 仓库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"SN2018050910292115328\",\"name\":\"\\u90af\\u90f8\\u4ed3\\u5e93\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"15026002145\",\"desc\":\"\\u90af\\u90f8\\u4ed3\\u5e93\",\"address\":\"\\u6cb3\\u5317\\u7701\\u90af\\u90f8\\u5e02\\u90af\\u5c71\\u533a\",\"add_time\":\"2018-05-09 10:29:21\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525832997');
INSERT INTO `fa_admin_log` VALUES ('8', '1', 'admin', '/admin/index/login', '登录', '{\"__token__\":\"0fdaea6230ff051e0cf1e0db1349775a\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525833979');
INSERT INTO `fa_admin_log` VALUES ('9', '1', 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"1,2,6,7,8,3,5,9,10,11,12,4,66,67,73,79,85,86,116,92,98,104,110\",\"changeid\":\"116\",\"pid\":\"85\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525834668');
INSERT INTO `fa_admin_log` VALUES ('10', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525834669');
INSERT INTO `fa_admin_log` VALUES ('11', '1', 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"4,66,67,73,79,85,86,116,92,98,104,110,5,12,11,10,9,3,2,8,7,6,1\",\"changeid\":\"116\",\"pid\":\"85\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525834720');
INSERT INTO `fa_admin_log` VALUES ('12', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525834721');
INSERT INTO `fa_admin_log` VALUES ('13', '1', 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"4,66,67,73,79,85,86,116,104,92,98,110,5,12,11,10,9,3,2,8,7,6,1\",\"changeid\":\"104\",\"pid\":\"85\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525834733');
INSERT INTO `fa_admin_log` VALUES ('14', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525834734');
INSERT INTO `fa_admin_log` VALUES ('15', '1', 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"4,66,67,73,79,85,86,116,104,92,110,98,5,12,11,10,9,3,2,8,7,6,1\",\"changeid\":\"110\",\"pid\":\"85\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525834740');
INSERT INTO `fa_admin_log` VALUES ('16', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525834741');
INSERT INTO `fa_admin_log` VALUES ('17', '1', 'admin', '/admin/basic/location/add?dialog=1', '基本设置 库位管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"18050911251267661\",\"name\":\"\\u4e1b\\u53f0\\u533a\",\"storage_id\":\"2\",\"desc\":\"\\u90af\\u90f8\\u4e1b\\u53f0\\u533a\\u4ed3\\u5e93\",\"add_time\":\"2018-05-09 11:25:12\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525836357');
INSERT INTO `fa_admin_log` VALUES ('18', '1', 'admin', '/admin/basic/location/add?dialog=1', '基本设置 库位管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"18050911543692007\",\"name\":\"\\u590d\\u5174\\u533a\",\"storage\":\"2\",\"desc\":\"\\u90af\\u90f8\\u590d\\u5174\\u533a\\u4ed3\\u5e93\",\"add_time\":\"2018-05-09 11:54:36\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525838104');
INSERT INTO `fa_admin_log` VALUES ('19', '1', 'admin', '/admin/basic/storage/add?dialog=1', '基本设置 仓库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"SN2018050903091548630\",\"name\":\"\\u77f3\\u5bb6\\u5e84\\u4ed3\\u5e93\",\"contact\":\"\\u674e\\u56db\",\"phone\":\"18610254205\",\"desc\":\"\\u77f3\\u5bb6\\u5e84\\u4ed3\\u5e93\",\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\",\"add_time\":\"2018-05-09 15:09:15\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525849787');
INSERT INTO `fa_admin_log` VALUES ('20', '1', 'admin', '/admin/basic/location/add?dialog=1', '基本设置 库位管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"18050903100060946\",\"name\":\"\\u65b0\\u534e\\u533a\",\"storage\":\"3\",\"desc\":\"\\u77f3\\u5bb6\\u5e84\\u65b0\\u534e\\u533a\\u4ed3\\u5e93\",\"add_time\":\"2018-05-09 15:10:00\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525849829');
INSERT INTO `fa_admin_log` VALUES ('21', '1', 'admin', '/admin/basic/unit/add?dialog=1', '基本设置 计量单位 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2a\",\"desc\":\"\",\"add_time\":\"2018-05-09 15:22:16\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525850543');
INSERT INTO `fa_admin_log` VALUES ('22', '1', 'admin', '/admin/basic/unit/add?dialog=1', '基本设置 计量单位 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u7bb1\",\"desc\":\"\",\"add_time\":\"2018-05-09 15:23:46\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525850633');
INSERT INTO `fa_admin_log` VALUES ('23', '1', 'admin', '/admin/basic/supplier/add?dialog=1', '基本设置 供应商管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"5af2a364448e5\",\"name\":\"\\u7f8e\\u7684\\u96c6\\u56e2\",\"contact\":\"\\u738b\\u4e94\",\"phone\":\"18510452032\",\"email\":\"18510452032@163.com\",\"fax\":\"18510452032\",\"address\":\"\\u6cb3\\u5317\\u7701\\u7f8e\\u7684\\u96c6\\u56e2\",\"desc\":\"\",\"add_time\":\"2018-05-09 15:29:40\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525851184');
INSERT INTO `fa_admin_log` VALUES ('24', '1', 'admin', '/admin/basic/leibie/add?dialog=1', '基本设置 商品类别 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u624b\\u673a\",\"pid\":\"0\",\"desc\":\"\",\"add_time\":\"2018-05-09 15:45:16\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525851925');
INSERT INTO `fa_admin_log` VALUES ('25', '1', 'admin', '/admin/basic/leibie/add?dialog=1', '基本设置 商品类别 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"oppo\",\"pid\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-09 15:55:03\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525852512');
INSERT INTO `fa_admin_log` VALUES ('26', '1', 'admin', '/admin/basic/leibie/add?dialog=1', '基本设置 商品类别 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"vivo\",\"pid\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-09 15:56:12\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525852586');
INSERT INTO `fa_admin_log` VALUES ('27', '1', 'admin', '/admin/auth/group/roletree', '', '{\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525853942');
INSERT INTO `fa_admin_log` VALUES ('28', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"41696b97d0ed299909d972a58267f385\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525912360');
INSERT INTO `fa_admin_log` VALUES ('29', '1', 'admin', '/admin/basic/goods/add?dialog=1', '基本设置 商品管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"5af3bc4bd5f68\",\"name\":\"OPPO  R15\",\"category\":\"2\",\"storage\":\"3\",\"location\":\"3\",\"unit\":\"\\u4e2a\",\"supplier\":\"1\",\"spec\":\"\",\"price\":\"3500\",\"num\":\"100\",\"status\":\"0\",\"desc\":\"\",\"add_time\":\"2018-05-10 11:28:11\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525922944');
INSERT INTO `fa_admin_log` VALUES ('30', '1', 'admin', '/admin/auth/rule/edit/ids/122?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"inventory\",\"title\":\"\\u8fdb\\u9500\\u5b58\\u7ba1\\u7406\",\"icon\":\"fa fa-sitemap\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"122\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525932654');
INSERT INTO `fa_admin_log` VALUES ('31', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525932655');
INSERT INTO `fa_admin_log` VALUES ('32', '1', 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"4,66,67,73,79,122,85,86,116,104,92,110,98,5,12,11,10,9,3,2,8,7,6,1,123\",\"changeid\":\"122\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525932668');
INSERT INTO `fa_admin_log` VALUES ('33', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525932669');
INSERT INTO `fa_admin_log` VALUES ('34', '1', 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"123,1,2,6,7,8,3,5,9,10,11,12,122,85,98,110,92,104,116,86,66,79,73,67,4\",\"changeid\":\"122\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525932693');
INSERT INTO `fa_admin_log` VALUES ('35', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525932694');
INSERT INTO `fa_admin_log` VALUES ('36', '1', 'admin', '/admin/auth/rule/edit/ids/130?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"datadictionary\",\"title\":\"\\u6570\\u636e\\u5b57\\u5178\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"130\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525934432');
INSERT INTO `fa_admin_log` VALUES ('37', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525934433');
INSERT INTO `fa_admin_log` VALUES ('38', '1', 'admin', '/admin/auth/rule/edit/ids/131?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"130\",\"name\":\"datadictionary\\/rutype\",\"title\":\"\\u5165\\u5e93\\u7c7b\\u578b\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"131\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525934446');
INSERT INTO `fa_admin_log` VALUES ('39', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525934447');
INSERT INTO `fa_admin_log` VALUES ('40', '1', 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"1,2,6,7,8,3,5,9,10,11,12,122,123,85,98,110,92,104,116,86,130,66,79,73,67,4,131\",\"changeid\":\"130\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525934455');
INSERT INTO `fa_admin_log` VALUES ('41', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525934457');
INSERT INTO `fa_admin_log` VALUES ('42', '1', 'admin', '/admin/datadictionary/rutype/add?dialog=1', '数据字典 入库类型 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u91c7\\u8d2d\\u5165\\u5e93\",\"add_time\":\"2018-05-10 14:41:36\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525934511');
INSERT INTO `fa_admin_log` VALUES ('43', '1', 'admin', '/admin/datadictionary/rutype/add?dialog=1', '数据字典 入库类型 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u91c7\\u8d2d\\u9000\\u8d27\",\"add_time\":\"2018-05-10 14:41:54\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525934522');
INSERT INTO `fa_admin_log` VALUES ('44', '1', 'admin', '/admin/datadictionary/rutype/add?dialog=1', '数据字典 入库类型 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u9500\\u552e\\u51fa\\u5e93\",\"add_time\":\"2018-05-10 14:42:04\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525934531');
INSERT INTO `fa_admin_log` VALUES ('45', '1', 'admin', '/admin/datadictionary/rutype/add?dialog=1', '数据字典 入库类型 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u9500\\u552e\\u9000\\u8d27\",\"add_time\":\"2018-05-10 14:42:13\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525934544');
INSERT INTO `fa_admin_log` VALUES ('46', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"492be250c3a55ba3ef98179b797ba8cf\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1525998527');
INSERT INTO `fa_admin_log` VALUES ('47', '1', 'admin', '/admin/basic/goods/add?dialog=1', '基本设置 商品管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"5af4ed003dc24\",\"name\":\"vivo x21\",\"category\":\"3\",\"storage\":\"2\",\"location\":\"2\",\"supplier\":\"1\",\"spec\":\"\",\"price\":\"4500\",\"num\":\"\",\"unit\":\"1\",\"status\":\"0\",\"desc\":\"\",\"add_time\":\"2018-05-11 09:08:16\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526000930');
INSERT INTO `fa_admin_log` VALUES ('48', '1', 'admin', '/admin/basic/goods/add?dialog=1', '基本设置 商品管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"5af4f3b12ab59\",\"name\":\"OPPO R9s\",\"category\":\"2\",\"storage\":\"2\",\"location\":\"1\",\"supplier\":\"1\",\"spec\":\"\",\"price\":\"2500\",\"unit\":\"1\",\"status\":\"0\",\"desc\":\"\",\"add_time\":\"2018-05-11 09:36:49\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526002642');
INSERT INTO `fa_admin_log` VALUES ('49', '1', 'admin', '/admin/inventory/ruku/add?dialog=1', '进销存管理 入库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"SN2018051109373276258\",\"author\":\"Admin\",\"type\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-11 09:37:32\"},\"goods\":[\"5af3bc4bd5f68_OPPO  R15_3500.00_3_1\",\"5af4ed003dc24_vivo x21_4500.00_2_1\",\"5af4f3b12ab59_OPPO R9s_2500.00_2_1\"],\"num\":[\"100\",\"100\",\"100\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526002707');
INSERT INTO `fa_admin_log` VALUES ('50', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"0dc2661c4cc8e4ba4931022377b3a910\",\"username\":\"admin\"}', '192.168.3.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526004081');
INSERT INTO `fa_admin_log` VALUES ('51', '1', 'admin', '/admin/inventory/ruku/add?dialog=1', '进销存管理 入库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"SN2018051110170260108\",\"author\":\"\",\"type\":\"2\",\"desc\":\"\",\"add_time\":\"2018-05-11 10:17:02\"},\"goods\":[\"5af3bc4bd5f68_OPPO  R15_3500.00_3_1\",\"5af4ed003dc24_vivo x21_4500.00_2_1\",\"5af4f3b12ab59_OPPO R9s_2500.00_2_1\"],\"num\":[\"1\",\"2\",\"3\"]}', '192.168.3.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526005037');
INSERT INTO `fa_admin_log` VALUES ('52', '1', 'admin', '/admin/basic/storage/add?dialog=1', '基本设置 仓库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"\\u4fdd\\u5b9a\\u4ed3\\u5e93\",\"contact\":\"\\u738b\\u67f3\",\"phone\":\"5086221504\",\"desc\":\"\",\"address\":\"\\u6cb3\\u5317\\u7701\\u4fdd\\u5b9a\\u5e02\",\"add_time\":\"2018-05-11 10:27:43\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526005692');
INSERT INTO `fa_admin_log` VALUES ('53', '1', 'admin', '/admin/basic/storage/add?dialog=1', '基本设置 仓库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"\\u4fdd\\u5b9a\\u4ed3\\u5e93\",\"contact\":\"\\u738b\\u67f3\",\"phone\":\"5086221504\",\"desc\":\"\",\"address\":\"\\u6cb3\\u5317\\u7701\\u4fdd\\u5b9a\\u5e02\",\"add_time\":\"2018-05-11 10:27:43\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526005706');
INSERT INTO `fa_admin_log` VALUES ('54', '1', 'admin', '/admin/basic/storage/add?dialog=1', '基本设置 仓库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"\\u4fdd\\u5b9a\\u4ed3\\u5e93\",\"contact\":\"\\u738b\\u67f3\",\"phone\":\"5086221504\",\"desc\":\"\",\"address\":\"\\u6cb3\\u5317\\u7701\\u4fdd\\u5b9a\\u5e02\",\"add_time\":\"2018-05-11 10:27:43\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526005779');
INSERT INTO `fa_admin_log` VALUES ('55', '1', 'admin', '/admin/basic/location/add?dialog=1', '基本设置 库位管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"\\u83b2\\u6c60\\u533a\",\"storage\":\"4\",\"desc\":\"\",\"add_time\":\"2018-05-11 10:34:16\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526006069');
INSERT INTO `fa_admin_log` VALUES ('56', '1', 'admin', '/admin/basic/supplier/add?dialog=1', '基本设置 供应商管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"\\u68ee\\u9a6c\\u96c6\\u56e2\",\"contact\":\"\\u674e\\u534e\",\"phone\":\"14025006532\",\"email\":\"14025006532@163.com\",\"fax\":\"14025006532\",\"address\":\"\\u6d59\\u6c5f\\u7701\",\"desc\":\"\",\"add_time\":\"2018-05-11 10:36:07\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526006294');
INSERT INTO `fa_admin_log` VALUES ('57', '1', 'admin', '/admin/basic/leibie/add?dialog=1', '基本设置 商品类别 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u670d\\u9970\",\"pid\":\"0\",\"desc\":\"\",\"add_time\":\"2018-05-11 10:40:57\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526006467');
INSERT INTO `fa_admin_log` VALUES ('58', '1', 'admin', '/admin/basic/leibie/add?dialog=1', '基本设置 商品类别 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u8863\",\"pid\":\"4\",\"desc\":\"\",\"add_time\":\"2018-05-11 10:41:09\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526006477');
INSERT INTO `fa_admin_log` VALUES ('59', '1', 'admin', '/admin/basic/unit/add?dialog=1', '基本设置 计量单位 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4ef6\",\"desc\":\"\",\"add_time\":\"2018-05-11 10:41:50\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526006517');
INSERT INTO `fa_admin_log` VALUES ('60', '1', 'admin', '/admin/basic/goods/add?dialog=1', '基本设置 商品管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"\\u68ee\\u9a6c\\u77ed\\u8896\",\"category\":\"5\",\"storage\":\"4\",\"location\":\"4\",\"supplier\":\"2\",\"spec\":\"\",\"price\":\"150\",\"unit\":\"2\",\"status\":\"0\",\"desc\":\"\",\"add_time\":\"2018-05-11 10:41:21\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526006531');
INSERT INTO `fa_admin_log` VALUES ('61', '1', 'admin', '/admin/basic/goods/edit/ids/4?dialog=1', '基本设置 商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180511001\",\"name\":\"\\u68ee\\u9a6c\\u77ed\\u8896\",\"category\":\"5\",\"storage\":\"4\",\"location\":\"4\",\"supplier\":\"2\",\"spec\":\"\",\"price\":\"150.00\",\"unit\":\"3\",\"status\":\"0\",\"desc\":\"\",\"add_time\":\"2018-05-11 10:41:21\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526006540');
INSERT INTO `fa_admin_log` VALUES ('62', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"f54594e99c0c660ebab7452eebf1d492\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526262077');
INSERT INTO `fa_admin_log` VALUES ('63', '1', 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/xiaoshou\",\"title\":\"\\u9500\\u552e\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526283323');
INSERT INTO `fa_admin_log` VALUES ('64', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526283324');
INSERT INTO `fa_admin_log` VALUES ('65', '1', 'admin', '/admin/auth/rule/edit/ids/145?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/xiaoshou\",\"title\":\"\\u9500\\u552e\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"3\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"145\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526283342');
INSERT INTO `fa_admin_log` VALUES ('66', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526283343');
INSERT INTO `fa_admin_log` VALUES ('67', '1', 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/kucun\",\"title\":\"\\u5e93\\u5b58\\u67e5\\u8be2\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"6\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526283373');
INSERT INTO `fa_admin_log` VALUES ('68', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526283374');
INSERT INTO `fa_admin_log` VALUES ('69', '1', 'admin', '/admin/auth/rule/edit/ids/123?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/ruku\",\"title\":\"\\u5165\\u5e93\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"9\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"123\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526283386');
INSERT INTO `fa_admin_log` VALUES ('70', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526283387');
INSERT INTO `fa_admin_log` VALUES ('71', '1', 'admin', '/admin/auth/rule/edit/ids/145?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/xiaoshou\",\"title\":\"\\u9500\\u552e\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"6\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"145\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526283399');
INSERT INTO `fa_admin_log` VALUES ('72', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526283400');
INSERT INTO `fa_admin_log` VALUES ('73', '1', 'admin', '/admin/auth/rule/edit/ids/146?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/kucun\",\"title\":\"\\u5e93\\u5b58\\u67e5\\u8be2\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"3\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"146\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526283409');
INSERT INTO `fa_admin_log` VALUES ('74', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526283410');
INSERT INTO `fa_admin_log` VALUES ('75', '1', 'admin', '/admin/inventory/ruku/add?dialog=1', '进销存管理 入库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-14 17:03:41\"},\"goods\":[\"5af3bc4bd5f68_OPPO  R15_3500.00_3_1\",\"5af4f3b12ab59_OPPO R9s_2500.00_2_1\"],\"num\":[\"50\",\"50\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526288634');
INSERT INTO `fa_admin_log` VALUES ('76', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"0ff1d39236b72506df46b6b2881ca0d1\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526345987');
INSERT INTO `fa_admin_log` VALUES ('77', '1', 'admin', '/admin/inventory/ruku/del/ids/2', '进销存管理 入库管理 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526348238');
INSERT INTO `fa_admin_log` VALUES ('78', '1', 'admin', '/admin/inventory/ruku/del/ids/1', '进销存管理 入库管理 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526348240');
INSERT INTO `fa_admin_log` VALUES ('79', '1', 'admin', '/admin/inventory/ruku/add?dialog=1', '进销存管理 入库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-15 09:37:31\"},\"goods\":[\"5af3bc4bd5f68_OPPO  R15_3500.00_3_1\",\"5af4f3b12ab59_OPPO R9s_2500.00_2_1\"],\"num\":[\"50\",\"60\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526348277');
INSERT INTO `fa_admin_log` VALUES ('80', '1', 'admin', '/admin/inventory/ruku/del/ids/3', '进销存管理 入库管理 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526348418');
INSERT INTO `fa_admin_log` VALUES ('81', '1', 'admin', '/admin/inventory/ruku/add?dialog=1', '进销存管理 入库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-15 10:04:23\"},\"goods\":[\"5af3bc4bd5f68_OPPO  R15_3500.00_3_1\",\"5af4f3b12ab59_OPPO R9s_2500.00_2_1\"],\"num\":[\"20\",\"20\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526350360');
INSERT INTO `fa_admin_log` VALUES ('82', '1', 'admin', '/admin/inventory/ruku/del/ids/4', '进销存管理 入库管理 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526350429');
INSERT INTO `fa_admin_log` VALUES ('83', '1', 'admin', '/admin/inventory/ruku/add?dialog=1', '进销存管理 入库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-15 10:14:38\"},\"goods\":[\"5af3bc4bd5f68_OPPO  R15_3500.00_3_1\",\"5af3bc4bd5f68_OPPO  R15_3500.00_3_1\"],\"num\":[\"20\",\"20\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526350602');
INSERT INTO `fa_admin_log` VALUES ('84', '1', 'admin', '/admin/inventory/ruku/del/ids/5', '进销存管理 入库管理 删除', '{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526350629');
INSERT INTO `fa_admin_log` VALUES ('85', '1', 'admin', '/admin/inventory/ruku/add?dialog=1', '进销存管理 入库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-15 10:17:10\"},\"goods\":[\"5af4ed003dc24_vivo x21_4500.00_2_1\",\"5af3bc4bd5f68_OPPO  R15_3500.00_3_1\"],\"num\":[\"50\",\"25\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526350642');
INSERT INTO `fa_admin_log` VALUES ('86', '1', 'admin', '/admin/inventory/ruku/add?dialog=1', '进销存管理 入库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-15 10:17:48\"},\"goods\":[\"20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_4_3\",\"5af4f3b12ab59_OPPO R9s_2500.00_2_1\"],\"num\":[\"90\",\"100\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526350686');
INSERT INTO `fa_admin_log` VALUES ('87', '1', 'admin', '/admin/inventory/ruku/del/ids/7', '进销存管理 入库管理 删除', '{\"action\":\"del\",\"ids\":\"7\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526350768');
INSERT INTO `fa_admin_log` VALUES ('88', '1', 'admin', '/admin/inventory/ruku/del/ids/6', '进销存管理 入库管理 删除', '{\"action\":\"del\",\"ids\":\"6\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526350769');
INSERT INTO `fa_admin_log` VALUES ('89', '1', 'admin', '/admin/inventory/ruku/add?dialog=1', '进销存管理 入库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-15 10:20:17\"},\"goods\":[\"5af3bc4bd5f68_OPPO  R15_3500.00_3_1\",\"5af4f3b12ab59_OPPO R9s_2500.00_2_1\"],\"num\":[\"50\",\"50\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526350845');
INSERT INTO `fa_admin_log` VALUES ('90', '1', 'admin', '/admin/inventory/ruku/del/ids/8', '进销存管理 入库管理 删除', '{\"action\":\"del\",\"ids\":\"8\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526350872');
INSERT INTO `fa_admin_log` VALUES ('91', '1', 'admin', '/admin/inventory/ruku/add?dialog=1', '进销存管理 入库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-15 10:21:13\"},\"goods\":[\"5af3bc4bd5f68_OPPO  R15_3500.00_3_1\",\"5af4f3b12ab59_OPPO R9s_2500.00_2_1\",\"20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_4_3\",\"5af4ed003dc24_vivo x21_4500.00_2_1\"],\"num\":[\"50\",\"60\",\"80\",\"30\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526350903');
INSERT INTO `fa_admin_log` VALUES ('92', '1', 'admin', '/admin/inventory/ruku/add?dialog=1', '进销存管理 入库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-15 10:22:41\"},\"goods\":[\"5af4f3b12ab59_OPPO R9s_2500.00_2_1\",\"20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_4_3\"],\"num\":[\"20\",\"20\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526350983');
INSERT INTO `fa_admin_log` VALUES ('93', '1', 'admin', '/admin/inventory/ruku/add?dialog=1', '进销存管理 入库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-15 10:23:56\"},\"goods\":[\"5af3bc4bd5f68_OPPO  R15_3500.00_3_1\",\"5af4ed003dc24_vivo x21_4500.00_2_1\"],\"num\":[\"20\",\"20\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526351045');
INSERT INTO `fa_admin_log` VALUES ('94', '1', 'admin', '/admin/inventory/ruku/add?dialog=1', '进销存管理 入库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-15 10:24:20\"},\"goods\":[\"5af3bc4bd5f68_OPPO  R15_3500.00_3_1\",\"5af4f3b12ab59_OPPO R9s_2500.00_2_1\"],\"num\":[\"10\",\"20\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526351078');
INSERT INTO `fa_admin_log` VALUES ('95', '1', 'admin', '/admin/inventory/ruku/add?dialog=1', '进销存管理 入库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-15 10:28:44\"},\"goods\":[\"5af4ed003dc24_vivo x21_4500.00_2_1\",\"5af4ed003dc24_vivo x21_4500.00_2_1\"],\"num\":[\"30\",\"20\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526351350');
INSERT INTO `fa_admin_log` VALUES ('96', '1', 'admin', '/admin/inventory/ruku/add?dialog=1', '进销存管理 入库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-15 10:36:31\"},\"goods\":[\"5af3bc4bd5f68_OPPO  R15_3500.00_3_1\",\"5af4f3b12ab59_OPPO R9s_2500.00_2_1\"],\"num\":[\"20\",\"20\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526352080');
INSERT INTO `fa_admin_log` VALUES ('97', '1', 'admin', '/admin/inventory/ruku/del/ids/13,12,11,10,9', '进销存管理 入库管理 删除', '{\"action\":\"del\",\"ids\":\"13,12,11,10,9\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526352095');
INSERT INTO `fa_admin_log` VALUES ('98', '1', 'admin', '/admin/index/login?url=%2Fadmin%2Finventory%2Fxiaoshou%2Fadd%3Fdialog%3D1', '登录', '{\"url\":\"\\/admin\\/inventory\\/xiaoshou\\/add?dialog=1\",\"__token__\":\"df53112d0fc403d35f5f3e6c1f94c073\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526376220');
INSERT INTO `fa_admin_log` VALUES ('99', '1', 'admin', '/admin/auth/rule/edit/ids/146?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/kucun\\/collect\",\"title\":\"\\u5e93\\u5b58\\u67e5\\u8be2\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"3\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"146\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526377317');
INSERT INTO `fa_admin_log` VALUES ('100', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526377318');
INSERT INTO `fa_admin_log` VALUES ('101', '1', 'admin', '/admin/auth/rule/edit/ids/146?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/kucun\",\"title\":\"\\u5e93\\u5b58\\u67e5\\u8be2\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"3\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"146\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526377398');
INSERT INTO `fa_admin_log` VALUES ('102', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526377399');
INSERT INTO `fa_admin_log` VALUES ('103', '1', 'admin', '/admin/auth/rule/edit/ids/145?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/xiaoshou\\/collect\",\"title\":\"\\u9500\\u552e\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"6\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"145\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526377407');
INSERT INTO `fa_admin_log` VALUES ('104', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526377408');
INSERT INTO `fa_admin_log` VALUES ('105', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"9e2dd6b6e7d78ef2c05dada46a4af3ff\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526432204');
INSERT INTO `fa_admin_log` VALUES ('106', '1', 'admin', '/admin/auth/rule/edit/ids/145?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/xiaoshou\",\"title\":\"\\u9500\\u552e\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"6\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"145\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526436021');
INSERT INTO `fa_admin_log` VALUES ('107', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526436022');
INSERT INTO `fa_admin_log` VALUES ('108', '1', 'admin', '/admin/auth/rule/edit/ids/145?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/xiaoshou\\/collect\",\"title\":\"\\u9500\\u552e\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"6\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"145\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526436539');
INSERT INTO `fa_admin_log` VALUES ('109', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526436540');
INSERT INTO `fa_admin_log` VALUES ('110', '1', 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/tiaoku\",\"title\":\"\\u8c03\\u5e93\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"2\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526438969');
INSERT INTO `fa_admin_log` VALUES ('111', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526438970');
INSERT INTO `fa_admin_log` VALUES ('112', '1', 'admin', '/admin/basic/goods/add?dialog=1', '基本设置 商品管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"\\u7537\\u58eb\\u957f\\u8896\",\"category\":\"5\",\"supplier\":\"2\",\"spec\":\"\",\"price\":\"220\",\"unit\":\"3\",\"status\":\"0\",\"desc\":\"\",\"add_time\":\"2018-05-16 11:12:21\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526440359');
INSERT INTO `fa_admin_log` VALUES ('113', '1', 'admin', '/admin/inventory/buy/add?dialog=1', '进销存管理 采购订单 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"buyer\":\"\\u660e\\u660e\",\"desc\":\"\",\"add_time\":\"2018-05-16 14:27:26\"},\"goods\":[\"5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"5af4f3b12ab59_OPPO R9s_2500.00_1_1\"],\"num\":[\"150\",\"150\"],\"purchase\":[\"2500\",\"2000\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526452141');
INSERT INTO `fa_admin_log` VALUES ('114', '1', 'admin', '/admin/inventory/buy/details/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180516001\",\"buyer\":\"\\u660e\\u660e\",\"desc\":\"\",\"add_time\":\"2018-05-16 14:27:26\",\"state\":\"\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526454316');
INSERT INTO `fa_admin_log` VALUES ('115', '1', 'admin', '/admin/inventory/buy/details/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180516001\",\"buyer\":\"\\u660e\\u660e\",\"desc\":\"\",\"add_time\":\"2018-05-16 14:27:26\",\"state\":\"\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526454793');
INSERT INTO `fa_admin_log` VALUES ('116', '1', 'admin', '/admin/inventory/buy/details/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180516001\",\"buyer\":\"\\u660e\\u660e\",\"desc\":\"\",\"add_time\":\"2018-05-16 14:27:26\",\"state\":\"\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526454799');
INSERT INTO `fa_admin_log` VALUES ('117', '1', 'admin', '/admin/inventory/buy/details/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180516001\",\"buyer\":\"\\u660e\\u660e\",\"desc\":\"\",\"add_time\":\"2018-05-16 14:27:26\",\"state\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526455137');
INSERT INTO `fa_admin_log` VALUES ('118', '1', 'admin', '/admin/inventory/buy/add?dialog=1', '进销存管理 采购订单 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"buyer\":\"\\u5c0f\\u5c0f\",\"desc\":\"\",\"add_time\":\"2018-05-16 15:56:24\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"140\",\"200\"],\"purchase\":[\"2000\",\"80\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526457421');
INSERT INTO `fa_admin_log` VALUES ('119', '1', 'admin', '/admin/inventory/buy/details/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180516002\",\"buyer\":\"\\u5c0f\\u5c0f\",\"desc\":\"\",\"add_time\":\"2018-05-16 15:56:24\",\"state\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526457601');
INSERT INTO `fa_admin_log` VALUES ('120', '1', 'admin', '/admin/inventory/buy/edit/ids/2?dialog=1', '进销存管理 采购订单 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180516002\",\"buyer\":\"\\u5c0f\\u5c0f\",\"desc\":\"\",\"add_time\":\"2018-05-16 15:56:24\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526457785');
INSERT INTO `fa_admin_log` VALUES ('121', '1', 'admin', '/admin/inventory/buy/details/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180516002\",\"buyer\":\"\\u5c0f\\u5c0f\",\"desc\":\"\",\"add_time\":\"2018-05-16 15:56:24\",\"state\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526457868');
INSERT INTO `fa_admin_log` VALUES ('122', '1', 'admin', '/admin/inventory/buy/edit/ids/2?dialog=1', '进销存管理 采购订单 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180516002\",\"buyer\":\"\\u5c0f\\u5c0f\",\"desc\":\"\",\"add_time\":\"2018-05-16 15:56:24\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526457875');
INSERT INTO `fa_admin_log` VALUES ('123', '1', 'admin', '/admin/inventory/buy/details/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180516001\",\"buyer\":\"\\u660e\\u660e\",\"desc\":\"\",\"add_time\":\"2018-05-16 14:27:26\",\"state\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526458423');
INSERT INTO `fa_admin_log` VALUES ('124', '1', 'admin', '/admin/inventory/buy/edit/ids/2?dialog=1', '进销存管理 采购订单 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180516003\",\"buyer\":\"\\u5c0f\\u5c0f\",\"desc\":\"\",\"add_time\":\"2018-05-16 15:56:24\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526458443');
INSERT INTO `fa_admin_log` VALUES ('125', '1', 'admin', '/admin/inventory/buy/edit/ids/2?dialog=1', '进销存管理 采购订单 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180516003\",\"buyer\":\"\\u5c0f\\u5c0f\",\"desc\":\"\",\"add_time\":\"2018-05-16 15:56:24\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526458486');
INSERT INTO `fa_admin_log` VALUES ('126', '1', 'admin', '/admin/inventory/buy/edit/ids/2?dialog=1', '进销存管理 采购订单 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180516003\",\"buyer\":\"\\u5c0f\\u5c0f\",\"desc\":\"\",\"add_time\":\"2018-05-16 15:56:24\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526459357');
INSERT INTO `fa_admin_log` VALUES ('127', '1', 'admin', '/admin/inventory/buy/edit/ids/2?dialog=1', '进销存管理 采购订单 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180516003\",\"buyer\":\"\\u5c0f\\u5c0f\",\"desc\":\"\",\"add_time\":\"2018-05-16 15:56:24\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526459394');
INSERT INTO `fa_admin_log` VALUES ('128', '1', 'admin', '/admin/inventory/ruku/edit/ids/2?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-16 16:55:18\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526460930');
INSERT INTO `fa_admin_log` VALUES ('129', '1', 'admin', '/admin/inventory/ruku/edit/ids/2?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"3\",\"location\":\"3\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:07:16\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526461646');
INSERT INTO `fa_admin_log` VALUES ('130', '1', 'admin', '/admin/inventory/ruku/edit/ids/2?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"3\",\"location\":\"3\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:10:44\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526461850');
INSERT INTO `fa_admin_log` VALUES ('131', '1', 'admin', '/admin/inventory/ruku/edit/ids/2?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"3\",\"location\":\"3\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:12:48\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526462073');
INSERT INTO `fa_admin_log` VALUES ('132', '1', 'admin', '/admin/inventory/ruku/edit/ids/2?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"3\",\"location\":\"3\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:12:48\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526462134');
INSERT INTO `fa_admin_log` VALUES ('133', '1', 'admin', '/admin/inventory/ruku/edit/ids/2?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"3\",\"location\":\"3\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:16:50\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526462252');
INSERT INTO `fa_admin_log` VALUES ('134', '1', 'admin', '/admin/inventory/ruku/edit/ids/2?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"3\",\"location\":\"3\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:16:50\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526462280');
INSERT INTO `fa_admin_log` VALUES ('135', '1', 'admin', '/admin/inventory/ruku/edit/ids/2?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"3\",\"location\":\"3\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:16:50\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526462353');
INSERT INTO `fa_admin_log` VALUES ('136', '1', 'admin', '/admin/inventory/ruku/edit/ids/2?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"3\",\"location\":\"3\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:20:19\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526462428');
INSERT INTO `fa_admin_log` VALUES ('137', '1', 'admin', '/admin/inventory/ruku/edit/ids/2?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"3\",\"location\":\"3\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:20:19\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526462489');
INSERT INTO `fa_admin_log` VALUES ('138', '1', 'admin', '/admin/inventory/ruku/edit/ids/2?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"3\",\"location\":\"3\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:27:25\",\"state\":\"\",\"id\":\"$_GET[\'ids\']\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526462852');
INSERT INTO `fa_admin_log` VALUES ('139', '1', 'admin', '/admin/inventory/ruku/edit/ids/2?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"3\",\"location\":\"3\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:30:55\",\"state\":\"\",\"id\":\"$_GET[\'ids\']\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526464023');
INSERT INTO `fa_admin_log` VALUES ('140', '1', 'admin', '/admin/inventory/ruku/edit/ids/2?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"3\",\"location\":\"3\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:47:28\",\"state\":\"\"},\"goods\":[\"1_5af3bc4bd5f68_OPPO  R15_3500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"100\",\"200\"],\"purchase\":[\"2000\",\"80\"],\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526464056');
INSERT INTO `fa_admin_log` VALUES ('141', '1', 'admin', '/admin/inventory/buy/add?dialog=1', '进销存管理 采购订单 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"buyer\":\"\\u82b1\\u82b1\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:54:21\"},\"goods\":[\"2_5af4ed003dc24_vivo x21_4500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"50\",\"100\"],\"purchase\":[\"2500\",\"150\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526464487');
INSERT INTO `fa_admin_log` VALUES ('142', '1', 'admin', '/admin/inventory/buy/details/ids/4?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180516003\",\"buyer\":\"\\u82b1\\u82b1\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:54:21\",\"state\":\"1\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526464493');
INSERT INTO `fa_admin_log` VALUES ('143', '1', 'admin', '/admin/inventory/ruku/edit/ids/4?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"3\",\"location\":\"3\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:55:07\",\"state\":\"\"},\"goods\":[\"2_5af4ed003dc24_vivo x21_4500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"50\",\"100\"],\"purchase\":[\"2500\",\"150\"],\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526464545');
INSERT INTO `fa_admin_log` VALUES ('144', '1', 'admin', '/admin/inventory/ruku/edit/ids/4?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"2\",\"location\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-16 17:56:32\",\"state\":\"\"},\"goods\":[\"2_5af4ed003dc24_vivo x21_4500.00_1_1\",\"4_20180511001_\\u68ee\\u9a6c\\u77ed\\u8896_150.00_2_3\"],\"num\":[\"50\",\"100\"],\"purchase\":[\"2500\",\"150\"],\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526464730');
INSERT INTO `fa_admin_log` VALUES ('145', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"66f987b9c69155b607838116a06e4208\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526518097');
INSERT INTO `fa_admin_log` VALUES ('146', '1', 'admin', '/admin/basic/leibie/add?dialog=1', '基本设置 商品类别 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u624b\\u673a\",\"pid\":\"0\",\"desc\":\"\",\"add_time\":\"2018-05-17 09:27:35\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526520463');
INSERT INTO `fa_admin_log` VALUES ('147', '1', 'admin', '/admin/basic/leibie/add?dialog=1', '基本设置 商品类别 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"oppo\",\"pid\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-17 09:27:46\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526520473');
INSERT INTO `fa_admin_log` VALUES ('148', '1', 'admin', '/admin/basic/leibie/add?dialog=1', '基本设置 商品类别 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"vivo\",\"pid\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-17 09:27:55\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526520483');
INSERT INTO `fa_admin_log` VALUES ('149', '1', 'admin', '/admin/basic/goods/add?dialog=1', '基本设置 商品管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"OPPO R15\",\"category\":\"2\",\"spec\":\"\",\"price\":\"4000\",\"unit\":\"1\",\"status\":\"0\",\"desc\":\"\",\"add_time\":\"2018-05-17 09:43:35\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526521437');
INSERT INTO `fa_admin_log` VALUES ('150', '1', 'admin', '/admin/basic/goods/add?dialog=1', '基本设置 商品管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"VIVO X21\",\"category\":\"3\",\"spec\":\"\",\"price\":\"4500\",\"unit\":\"1\",\"status\":\"0\",\"desc\":\"\",\"add_time\":\"2018-05-17 09:44:02\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526521458');
INSERT INTO `fa_admin_log` VALUES ('151', '1', 'admin', '/admin/basic/storage/add?dialog=1', '基本设置 仓库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"\\u77f3\\u5bb6\\u5e84\\u4ed3\\u5e93\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"15023001526\",\"desc\":\"\",\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\",\"add_time\":\"2018-05-17 09:44:29\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526521492');
INSERT INTO `fa_admin_log` VALUES ('152', '1', 'admin', '/admin/basic/storage/add?dialog=1', '基本设置 仓库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"\\u90af\\u90f8\\u4ed3\\u5e93\",\"contact\":\"\\u674e\\u601d\",\"phone\":\"18610452326\",\"desc\":\"\",\"address\":\"\\u6cb3\\u5317\\u7701\\u90af\\u90f8\\u5e02\",\"add_time\":\"2018-05-17 09:44:54\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526521517');
INSERT INTO `fa_admin_log` VALUES ('153', '1', 'admin', '/admin/basic/location/add?dialog=1', '基本设置 库位管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"\\u65b0\\u534e\\u533a\",\"storage\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-17 09:45:21\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526521527');
INSERT INTO `fa_admin_log` VALUES ('154', '1', 'admin', '/admin/basic/location/add?dialog=1', '基本设置 库位管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"\\u590d\\u5174\\u533a\",\"storage\":\"2\",\"desc\":\"\",\"add_time\":\"2018-05-17 09:45:42\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526521548');
INSERT INTO `fa_admin_log` VALUES ('155', '1', 'admin', '/admin/inventory/buy/add?dialog=1', '进销存管理 采购订单 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"buyer\":\"\\u660e\\u660e\",\"supplier\":\"2\",\"desc\":\"\",\"add_time\":\"2018-05-17 09:45:57\"},\"goods\":[\"1_20180517001_OPPO R15_4000.00_1\",\"2_20180517002_VIVO X21_4500.00_1\"],\"num\":[\"100\",\"100\"],\"purchase\":[\"3000\",\"3500\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526521586');
INSERT INTO `fa_admin_log` VALUES ('156', '1', 'admin', '/admin/inventory/buy/add?dialog=1', '进销存管理 采购订单 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"buyer\":\"\\u660e\\u660e\",\"supplier\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-17 09:52:59\"},\"goods\":[\"1_20180517001_OPPO R15_4000.00_1\",\"2_20180517002_VIVO X21_4500.00_1\"],\"num\":[\"100\",\"150\"],\"purchase\":[\"3000\",\"3500\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526522003');
INSERT INTO `fa_admin_log` VALUES ('157', '1', 'admin', '/admin/inventory/buy/details/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180517001\",\"buyer\":\"\\u660e\\u660e\",\"supplier\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-17 09:52:59\",\"state\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526522969');
INSERT INTO `fa_admin_log` VALUES ('158', '1', 'admin', '/admin/inventory/buy/edit/ids/1?dialog=1', '进销存管理 采购订单 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180517001\",\"buyer\":\"\\u660e\\u660e\",\"supplier\":\"\\u7f8e\\u7684\\u96c6\\u56e2\",\"desc\":\"\",\"add_time\":\"2018-05-17 09:52:59\",\"state\":\"\"},\"goods\":[\"1_20180517001_OPPO R15_4000.00_1\",\"2_20180517002_VIVO X21_4500.00_1\"],\"num\":[\"120\",\"150\"],\"purchase\":[\"3000\",\"3500\"],\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526523735');
INSERT INTO `fa_admin_log` VALUES ('159', '1', 'admin', '/admin/inventory/buy/edit/ids/1?dialog=1', '进销存管理 采购订单 编辑', '{\"dialog\":\"1\",\"goods\":[\"1_20180517001_OPPO R15_4000.00_1\",\"2_20180517002_VIVO X21_4500.00_1\"],\"num\":[\"220\",\"150\"],\"purchase\":[\"3000\",\"3500\"],\"row\":{\"desc\":\"\",\"state\":\"\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526523877');
INSERT INTO `fa_admin_log` VALUES ('160', '1', 'admin', '/admin/inventory/buy/add?dialog=1', '进销存管理 采购订单 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"buyer\":\"\\u5c0f\\u5c0f\",\"supplier\":\"2\",\"desc\":\"\",\"add_time\":\"2018-05-17 10:31:54\"},\"goods\":[\"2_20180517002_VIVO X21_4500.00_1\",\"1_20180517001_OPPO R15_4000.00_1\"],\"num\":[\"20\",\"30\"],\"purchase\":[\"3500\",\"3000\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526524382');
INSERT INTO `fa_admin_log` VALUES ('161', '1', 'admin', '/admin/inventory/ruku/edit/ids/1?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"1\",\"location\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-17 10:34:47\",\"state\":\"\"},\"goods\":[\"1_20180517001_OPPO R15_4000.00_1\",\"2_20180517002_VIVO X21_4500.00_1\"],\"num\":[\"220\",\"150\"],\"purchase\":[\"3000\",\"3500\"],\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526524502');
INSERT INTO `fa_admin_log` VALUES ('162', '1', 'admin', '/admin/inventory/ruku/edit/ids/1?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"1\",\"location\":\"1\",\"supplier\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-17 10:41:45\",\"state\":\"\"},\"goods\":[\"1_20180517001_OPPO R15_4000.00_1\",\"2_20180517002_VIVO X21_4500.00_1\"],\"num\":[\"220\",\"150\"],\"purchase\":[\"3000\",\"3500\"],\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526524917');
INSERT INTO `fa_admin_log` VALUES ('163', '1', 'admin', '/admin/inventory/buy/add?dialog=1', '进销存管理 采购订单 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"buyer\":\"\\u82b1\\u82b1\",\"supplier\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-17 10:51:04\"},\"goods\":[\"2_20180517002_VIVO X21_4500.00_1\"],\"num\":[\"10\"],\"purchase\":[\"3500\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '1526525479');
INSERT INTO `fa_admin_log` VALUES ('164', '1', 'admin', '/admin/inventory/buy/add?dialog=1', '进销存管理 采购订单 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"buyer\":\"\\u660e\\u660e\",\"supplier\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-17 10:52:35\"},\"goods\":[\"1_20180517001_OPPO R15_4000.00_1\",\"2_20180517002_VIVO X21_4500.00_1\"],\"num\":[\"100\",\"100\"],\"purchase\":[\"2500\",\"3000\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '1526525576');
INSERT INTO `fa_admin_log` VALUES ('165', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"4d64625aa592db1b5fcb2368e835a3c2\",\"username\":\"admin\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526525895');
INSERT INTO `fa_admin_log` VALUES ('166', '1', 'admin', '/admin/auth/rule/edit/ids/148?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/buy\",\"title\":\"\\u91c7\\u8d2d\\u8ba2\\u5355\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"12\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"148\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526526534');
INSERT INTO `fa_admin_log` VALUES ('167', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526526535');
INSERT INTO `fa_admin_log` VALUES ('168', '1', 'admin', '/jxc/public/admin/inventory/buy/details/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"desc\":\"\",\"state\":\"1\"},\"ids\":\"1\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526538965');
INSERT INTO `fa_admin_log` VALUES ('169', '1', 'admin', '/jxc/public/admin/inventory/buy/details/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"desc\":\"\",\"state\":\"1\"},\"ids\":\"1\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526539426');
INSERT INTO `fa_admin_log` VALUES ('170', '1', 'admin', '/jxc/public/admin/auth/rule/edit/ids/146?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/stock\",\"title\":\"\\u5e93\\u5b58\\u67e5\\u8be2\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"3\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"146\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526540606');
INSERT INTO `fa_admin_log` VALUES ('171', '1', 'admin', '/jxc/public/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526540607');
INSERT INTO `fa_admin_log` VALUES ('172', '1', 'admin', '/jxc/public/admin/auth/rule/del/ids/146', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"146\",\"params\":\"\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526541361');
INSERT INTO `fa_admin_log` VALUES ('173', '1', 'admin', '/jxc/public/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526541362');
INSERT INTO `fa_admin_log` VALUES ('174', '1', 'admin', '/jxc/public/admin/inventory/ruku/edit/ids/1?dialog=1', '进销存管理 入库管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"1\",\"location\":\"1\",\"supplier\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-17 15:18:51\",\"state\":\"\"},\"goods\":[\"1_20180517001_OPPO R15_4000.00_1\",\"2_20180517002_VIVO X21_4500.00_1\"],\"num\":[\"100\",\"100\"],\"purchase\":[\"2500\",\"3000\"],\"ids\":\"1\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526541578');
INSERT INTO `fa_admin_log` VALUES ('175', '1', 'admin', '/jxc/public/admin/index/login.html', '登录', '{\"__token__\":\"ae24bf2dcd5b61b9c690e2518dd5baf9\",\"username\":\"admin\"}', '110.228.225.233', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526542721');
INSERT INTO `fa_admin_log` VALUES ('176', '1', 'admin', '/jxc/public/admin/inventory/buy/add?dialog=1', '进销存管理 采购订单 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"buyer\":\"\\u738b\\u82b3\",\"supplier\":\"2\",\"desc\":\"\",\"add_time\":\"2018-05-17 15:43:38\"},\"goods\":[\"2_20180517002_VIVO X21_4500.00_1\"],\"num\":[\"150\"],\"purchase\":[\"3500\"]}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526543039');
INSERT INTO `fa_admin_log` VALUES ('177', '1', 'admin', '/jxc/public/admin/inventory/buy/details/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"desc\":\"\",\"state\":\"1\"},\"ids\":\"2\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526543052');
INSERT INTO `fa_admin_log` VALUES ('178', '1', 'admin', '/jxc/public/admin/inventory/buy/ruku/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"1\",\"location\":\"1\",\"supplier\":\"2\",\"desc\":\"\",\"add_time\":\"2018-05-17 15:53:28\",\"state\":\"\"},\"goods\":[\"2_20180517002_VIVO X21_4500.00_1\"],\"num\":[\"150\"],\"purchase\":[\"3500\"],\"ids\":\"2\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526543617');
INSERT INTO `fa_admin_log` VALUES ('179', '1', 'admin', '/jxc/public/admin/inventory/buy/add?dialog=1', '进销存管理 采购订单 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"buyer\":\"\\u8389\\u8389\",\"supplier\":\"2\",\"desc\":\"\",\"add_time\":\"2018-05-17 16:02:25\"},\"goods\":[\"1_20180517001_OPPO R15_4000.00_1\"],\"num\":[\"100\"],\"purchase\":[\"2500\"]}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526544162');
INSERT INTO `fa_admin_log` VALUES ('180', '1', 'admin', '/jxc/public/admin/inventory/buy/details/ids/3?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"desc\":\"\",\"state\":\"1\"},\"ids\":\"3\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526544193');
INSERT INTO `fa_admin_log` VALUES ('181', '1', 'admin', '/jxc/public/admin/inventory/buy/add?dialog=1', '进销存管理 采购订单 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"buyer\":\"\\u82b1\\u82b1\",\"supplier\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-17 16:07:14\"},\"goods\":[\"1_20180517001_OPPO R15_4000.00_1\",\"2_20180517002_VIVO X21_4500.00_1\"],\"num\":[\"100\",\"100\"],\"purchase\":[\"3000\",\"3500\"]}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526544478');
INSERT INTO `fa_admin_log` VALUES ('182', '1', 'admin', '/jxc/public/admin/inventory/buy/details/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"desc\":\"\",\"state\":\"1\"},\"ids\":\"1\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526544484');
INSERT INTO `fa_admin_log` VALUES ('183', '1', 'admin', '/jxc/public/admin/auth/rule/edit/ids/148?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/buy\",\"title\":\"\\u91c7\\u8d2d\\u5165\\u5e93\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"12\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"148\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526545436');
INSERT INTO `fa_admin_log` VALUES ('184', '1', 'admin', '/jxc/public/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526545437');
INSERT INTO `fa_admin_log` VALUES ('185', '1', 'admin', '/jxc/public/admin/auth/rule/edit/ids/123?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/ruku\",\"title\":\"\\u5165\\u5e93\\u8bb0\\u5f55\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"9\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"123\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526545447');
INSERT INTO `fa_admin_log` VALUES ('186', '1', 'admin', '/jxc/public/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526545447');
INSERT INTO `fa_admin_log` VALUES ('187', '1', 'admin', '/jxc/public/admin/inventory/buy/ruku/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"1\",\"location\":\"1\",\"supplier\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-17 16:37:19\",\"state\":\"\"},\"goods\":[\"1_20180517001_OPPO R15_4000.00_1\",\"2_20180517002_VIVO X21_4500.00_1\"],\"num\":[\"100\",\"100\"],\"purchase\":[\"3000\",\"3500\"],\"ids\":\"1\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526546279');
INSERT INTO `fa_admin_log` VALUES ('188', '1', 'admin', '/jxc/public/admin/inventory/buy/add?dialog=1', '进销存管理 采购入库 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"buyer\":\"\\u82b1\\u82b1\",\"supplier\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-17 16:40:16\"},\"goods\":[\"1_20180517001_OPPO R15_4000.00_1\",\"2_20180517002_VIVO X21_4500.00_1\"],\"num\":[\"100\",\"100\"],\"purchase\":[\"3000\",\"3500\"]}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526546434');
INSERT INTO `fa_admin_log` VALUES ('189', '1', 'admin', '/jxc/public/admin/inventory/buy/details/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"desc\":\"\",\"state\":\"1\"},\"ids\":\"1\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526546438');
INSERT INTO `fa_admin_log` VALUES ('190', '1', 'admin', '/jxc/public/admin/inventory/buy/ruku/ids/1?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"1\",\"location\":\"1\",\"supplier\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-17 16:40:40\",\"state\":\"\"},\"goods\":[\"1_20180517001_OPPO R15_4000.00_1\",\"2_20180517002_VIVO X21_4500.00_1\"],\"num\":[\"100\",\"100\"],\"purchase\":[\"3000\",\"3500\"],\"ids\":\"1\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526546554');
INSERT INTO `fa_admin_log` VALUES ('191', '1', 'admin', '/jxc/public/admin/index/login.html', '登录', '{\"__token__\":\"d17c58adcd420b27547aebb18ae5905a\",\"username\":\"admin\"}', '110.228.225.233', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.3964.2 Safari/537.36', '1526546825');
INSERT INTO `fa_admin_log` VALUES ('192', '1', 'admin', '/jxc/public/admin/inventory/buy/add?dialog=1', '进销存管理 采购入库 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"buyer\":\"\\u8389\\u8389\",\"supplier\":\"2\",\"desc\":\"\",\"add_time\":\"2018-05-17 17:50:20\"},\"goods\":[\"2_20180517002_VIVO X21_4500.00_1\",\"1_20180517001_OPPO R15_4000.00_1\"],\"num\":[\"100\",\"100\"],\"purchase\":[\"3500\",\"3000\"]}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526550640');
INSERT INTO `fa_admin_log` VALUES ('193', '1', 'admin', '/jxc/public/admin/inventory/buy/details/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"desc\":\"\",\"state\":\"1\"},\"ids\":\"2\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526550644');
INSERT INTO `fa_admin_log` VALUES ('194', '1', 'admin', '/jxc/public/admin/index/login?url=%2Fjxc%2Fpublic%2Fadmin%2Finventory%2Fstock%3Faddtabs%3D1', '登录', '{\"url\":\"\\/jxc\\/public\\/admin\\/inventory\\/stock?addtabs=1\",\"__token__\":\"ff31c87615b6a339da2d4da9ec131605\",\"username\":\"admin\"}', '110.228.225.233', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526550825');
INSERT INTO `fa_admin_log` VALUES ('195', '1', 'admin', '/jxc/public/admin/index/login.html', '登录', '{\"__token__\":\"c1af41b381cc702a33fa08866f066499\",\"username\":\"admin\"}', '106.117.148.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526606010');
INSERT INTO `fa_admin_log` VALUES ('196', '1', 'admin', '/jxc/public/admin/index/login.html', '登录', '{\"__token__\":\"7af43e8bdf69bb7f33b5f9e5d8ab5e8e\",\"username\":\"admin\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526633456');
INSERT INTO `fa_admin_log` VALUES ('197', '1', 'admin', '/jxc/public/admin/index/login.html', '登录', '{\"__token__\":\"29a3c0fec26efd2cc3a8fbd5b8ce0e88\",\"username\":\"admin\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526696968');
INSERT INTO `fa_admin_log` VALUES ('198', '1', 'admin', '/jxc/public/admin/inventory/buy/ruku/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"1\",\"storage\":\"2\",\"location\":\"2\",\"supplier\":\"2\",\"desc\":\"\",\"add_time\":\"2018-05-19 11:02:07\",\"state\":\"\"},\"goods\":[\"2_20180517002_VIVO X21_4500.00_1\",\"1_20180517001_OPPO R15_4000.00_1\"],\"num\":[\"100\",\"100\"],\"purchase\":[\"3500\",\"3000\"],\"ids\":\"2\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526698935');
INSERT INTO `fa_admin_log` VALUES ('199', '1', 'admin', '/jxc/public/admin/index/login.html', '登录', '{\"__token__\":\"56c441ff65241c37002b0dd6f2b52b5f\",\"username\":\"admin\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.3964.2 Safari/537.36', '1526715036');
INSERT INTO `fa_admin_log` VALUES ('200', '1', 'admin', '/admin/basic/goods/add?dialog=1', '基本设置 商品管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"OPPO R9S\",\"category\":\"2\",\"spec\":\"\",\"price\":\"2500\",\"unit\":\"1\",\"status\":\"0\",\"desc\":\"\",\"add_time\":\"2018-05-19 15:44:37\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526715897');
INSERT INTO `fa_admin_log` VALUES ('201', '1', 'admin', '/admin/basic/goods/add?dialog=1', '基本设置 商品管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"OPPO R11\",\"category\":\"2\",\"spec\":\"\",\"price\":\"3000\",\"unit\":\"1\",\"status\":\"0\",\"desc\":\"\",\"add_time\":\"2018-05-19 15:45:04\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526715992');
INSERT INTO `fa_admin_log` VALUES ('202', '1', 'admin', '/admin/basic/supplier/add?dialog=1', '基本设置 供应商管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"name\":\"\\u82cf\\u5b81\\u6613\\u8d2d\",\"contact\":\"\\u5f20\\u534e\",\"phone\":\"15028001450\",\"email\":\"15028001450@163.com\",\"fax\":\"15028001450\",\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\",\"desc\":\"\",\"add_time\":\"2018-05-19 15:48:10\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526716133');
INSERT INTO `fa_admin_log` VALUES ('203', '1', 'admin', '/admin/inventory/buy/add?dialog=1', '进销存管理 采购入库 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"buyer\":\"\\u738b\\u82b3\",\"supplier\":\"3\",\"desc\":\"\",\"add_time\":\"2018-05-19 15:49:13\"},\"goods\":[\"3_20180519001_OPPO R9S_2500.00_1\",\"4_20180519002_OPPO R11_3000.00_1\"],\"num\":[\"150\",\"100\"],\"purchase\":[\"1500\",\"2000\"]}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526716174');
INSERT INTO `fa_admin_log` VALUES ('204', '1', 'admin', '/admin/auth/rule/edit/ids/165?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/tui\",\"title\":\"\\u9000\\u8d27\\u8bb0\\u5f55\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"165\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526719486');
INSERT INTO `fa_admin_log` VALUES ('205', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526719487');
INSERT INTO `fa_admin_log` VALUES ('206', '1', 'admin', '/admin/auth/rule/edit/ids/165?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/tui\",\"title\":\"\\u9000\\u8d27\\u8bb0\\u5f55\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"8\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"165\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526719498');
INSERT INTO `fa_admin_log` VALUES ('207', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526719498');
INSERT INTO `fa_admin_log` VALUES ('208', '1', 'admin', '/admin/inventory/buy/tui/ids/3?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180519001\",\"author\":\"Admin\",\"type\":\"2\",\"supplier\":\"\\u82cf\\u5b81\\u6613\\u8d2d\",\"desc\":\"\",\"add_time\":\"2018-05-19 17:40:24\",\"state\":\"4\"},\"goods\":[\"3_20180519001_OPPO R9S_2500.00_1\",\"4_20180519002_OPPO R11_3000.00_1\"],\"num\":[\"150\",\"100\"],\"purchase\":[\"1500\",\"2000\"],\"ids\":\"3\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526722826');
INSERT INTO `fa_admin_log` VALUES ('209', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"2f40e05f8e6c5379041a5698260c0bd8\",\"username\":\"admin\"}', '101.16.124.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526868003');
INSERT INTO `fa_admin_log` VALUES ('210', '1', 'admin', '/admin/auth/rule/del/ids/147', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"147\",\"params\":\"\"}', '101.16.124.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526888838');
INSERT INTO `fa_admin_log` VALUES ('211', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.16.124.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526888839');
INSERT INTO `fa_admin_log` VALUES ('212', '1', 'admin', '/admin/index/login?url=%2Fadmin%2Finventory%2Fbuy%3Faddtabs%3D1', '登录', '{\"url\":\"\\/admin\\/inventory\\/buy?addtabs=1\",\"__token__\":\"2e559643483f38d438254820a9dad78c\",\"username\":\"admin\"}', '101.16.124.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526890920');
INSERT INTO `fa_admin_log` VALUES ('213', '1', 'admin', '/admin/inventory/buy/add?dialog=1', '进销存管理 采购入库 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"buyer\":\"\\u5f20\\u864e\",\"supplier\":\"3\",\"desc\":\"\",\"add_time\":\"2018-05-21 16:32:52\"},\"goods\":[\"2_20180517002_VIVO X21_4500.00_1\",\"3_20180519001_OPPO R9S_2500.00_1\"],\"num\":[\"150\",\"200\"],\"purchase\":[\"3000\",\"1500\"]}', '101.16.124.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526891600');
INSERT INTO `fa_admin_log` VALUES ('214', '1', 'admin', '/admin/datadictionary/rutype/add?dialog=1', '数据字典 入库类型 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4ed3\\u5e93\\u8c03\\u62e8\",\"status\":\"0\",\"add_time\":\"2018-05-21 16:42:08\"}}', '101.16.124.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526892149');
INSERT INTO `fa_admin_log` VALUES ('215', '1', 'admin', '/admin/auth/rule/edit/ids/177?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"122\",\"name\":\"inventory\\/tiaoku\",\"title\":\"\\u8c03\\u5e93\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"177\"}', '101.16.124.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526892496');
INSERT INTO `fa_admin_log` VALUES ('216', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.16.124.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526892497');
INSERT INTO `fa_admin_log` VALUES ('217', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"7ccb78cd462e74d62b09300b8b623e00\",\"username\":\"admin\"}', '101.16.124.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526947463');
INSERT INTO `fa_admin_log` VALUES ('218', '0', 'Unknown', '/admin/index/login?url=%2F', '登录', '{\"url\":\"\\/\",\"__token__\":\"8e7291176a2ea6f55fac024f6aaf9d43\",\"username\":\"admin\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526956030');
INSERT INTO `fa_admin_log` VALUES ('219', '1', 'admin', '/admin/index/login?url=%2F', '登录', '{\"url\":\"\\/\",\"__token__\":\"6ce4ae2df55e4a56022e0ad0c22fe28f\",\"username\":\"admin\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526956034');
INSERT INTO `fa_admin_log` VALUES ('220', '1', 'admin', '/admin/auth/rule/multi/ids/66', '', '{\"action\":\"\",\"ids\":\"66\",\"params\":\"ismenu=0\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526956067');
INSERT INTO `fa_admin_log` VALUES ('221', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526956068');
INSERT INTO `fa_admin_log` VALUES ('222', '1', 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"member\",\"title\":\"\\u4f1a\\u5458\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526956096');
INSERT INTO `fa_admin_log` VALUES ('223', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526956097');
INSERT INTO `fa_admin_log` VALUES ('224', '1', 'admin', '/admin/member/add?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"mobile\":\"15231015613\",\"password\":\"123456\",\"realname\":\"\\u8001\\u738b\",\"weixin\":\"15231015613\",\"membermobile\":\"15231015613\",\"bank_num\":\"\",\"bankname\":\"\",\"bank\":\"\",\"alipay\":\"\",\"alipayname\":\"\",\"gender\":\"1\",\"birthday\":\"\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526956464');
INSERT INTO `fa_admin_log` VALUES ('225', '1', 'admin', '/admin/member/add?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"mobile\":\"15231015613\",\"password\":\"123456\",\"realname\":\"\\u8001\\u738b\",\"weixin\":\"15231015613\",\"membermobile\":\"15231015613\",\"bank_num\":\"\",\"bankname\":\"\",\"bank\":\"\",\"alipay\":\"\",\"alipayname\":\"\",\"gender\":\"1\",\"birthday\":\"\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526956896');
INSERT INTO `fa_admin_log` VALUES ('226', '1', 'admin', '/admin/member/add?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"mobile\":\"15231015613\",\"password\":\"123456\",\"realname\":\"\\u8001\\u738b\",\"weixin\":\"15231015613\",\"membermobile\":\"15231015613\",\"bank_num\":\"\",\"bankname\":\"\",\"bank\":\"\",\"alipay\":\"\",\"alipayname\":\"\",\"gender\":\"1\",\"birthday\":\"\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526956918');
INSERT INTO `fa_admin_log` VALUES ('227', '1', 'admin', '/admin/member/add?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"mobile\":\"15231015613\",\"password\":\"123456\",\"realname\":\"\\u8001\\u738b\",\"weixin\":\"15231015613\",\"membermobile\":\"15231015613\",\"bank_num\":\"\",\"bankname\":\"\",\"bank\":\"\",\"alipay\":\"\",\"alipayname\":\"\",\"gender\":\"1\",\"birthday\":\"\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526956963');
INSERT INTO `fa_admin_log` VALUES ('228', '1', 'admin', '/admin/member/add?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"mobile\":\"15231015613\",\"password\":\"123456\",\"realname\":\"\\u8001\\u738b\",\"weixin\":\"15231015613\",\"membermobile\":\"15231015613\",\"bank_num\":\"\",\"bankname\":\"\",\"bank\":\"\",\"alipay\":\"\",\"alipayname\":\"\",\"gender\":\"1\",\"birthday\":\"\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526956980');
INSERT INTO `fa_admin_log` VALUES ('229', '1', 'admin', '/admin/member/add?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"mobile\":\"15231015613\",\"password\":\"123456\",\"realname\":\"\\u8001\\u738b\",\"weixin\":\"15231015613\",\"membermobile\":\"15231015613\",\"bank_num\":\"\",\"bankname\":\"\",\"bank\":\"\",\"alipay\":\"\",\"alipayname\":\"\",\"gender\":\"1\",\"birthday\":\"\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526957081');
INSERT INTO `fa_admin_log` VALUES ('230', '1', 'admin', '/admin/member/add?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"mobile\":\"15231015613\",\"password\":\"123456\",\"realname\":\"\\u8001\\u738b\",\"weixin\":\"15231015613\",\"membermobile\":\"15231015613\",\"bank_num\":\"\",\"bankname\":\"\",\"bank\":\"\",\"alipay\":\"\",\"alipayname\":\"\",\"gender\":\"1\",\"birthday\":\"\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526957354');
INSERT INTO `fa_admin_log` VALUES ('231', '1', 'admin', '/admin/member/add?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"mobile\":\"15231015613\",\"password\":\"123456\",\"realname\":\"\\u8001\\u738b\",\"weixin\":\"15231015613\",\"membermobile\":\"15231015613\",\"bank_num\":\"\",\"bankname\":\"\",\"bank\":\"\",\"alipay\":\"\",\"alipayname\":\"\",\"gender\":\"1\",\"birthday\":\"\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526957368');
INSERT INTO `fa_admin_log` VALUES ('232', '1', 'admin', '/admin/member/add?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"mobile\":\"15231015613\",\"password\":\"123456\",\"realname\":\"\\u8001\\u738b\",\"weixin\":\"15231015613\",\"membermobile\":\"15231015613\",\"bank_num\":\"\",\"bankname\":\"\",\"bank\":\"\",\"alipay\":\"\",\"alipayname\":\"\",\"gender\":\"1\",\"birthday\":\"\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526957409');
INSERT INTO `fa_admin_log` VALUES ('233', '1', 'admin', '/admin/member/add?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"mobile\":\"15231015613\",\"password\":\"123456\",\"realname\":\"\\u8001\\u738b\",\"weixin\":\"15231015613\",\"membermobile\":\"15231015613\",\"bank_num\":\"\",\"bankname\":\"\",\"bank\":\"\",\"alipay\":\"\",\"alipayname\":\"\",\"gender\":\"1\",\"birthday\":\"\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526957413');
INSERT INTO `fa_admin_log` VALUES ('234', '1', 'admin', '/admin/member/add?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"mobile\":\"15231015613\",\"password\":\"123456\",\"realname\":\"\\u8001\\u738b\",\"weixin\":\"15231015613\",\"membermobile\":\"15231015613\",\"bank_num\":\"\",\"bankname\":\"\",\"bank\":\"\",\"alipay\":\"\",\"alipayname\":\"\",\"gender\":\"1\",\"birthday\":\"\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526957698');
INSERT INTO `fa_admin_log` VALUES ('235', '1', 'admin', '/admin/member/login', '', '{\"mobile\":\"18134005613\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526957778');
INSERT INTO `fa_admin_log` VALUES ('236', '1', 'admin', '/admin/member/login', '', '{\"mobile\":\"18134005613\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526957890');
INSERT INTO `fa_admin_log` VALUES ('237', '1', 'admin', '/admin/member/edit?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"mobile\":\"18134005613\",\"password\":\"123456\",\"realname\":\"\\u6d4b\\u8bd5\",\"weixin\":\"18134005613\",\"membermobile\":\"18134005613\",\"bank_num\":\"\",\"bankname\":\"\",\"bank\":\"\",\"alipay\":\"\",\"alipayname\":\"\",\"gender\":\"2\",\"birthday\":\"\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526959102');
INSERT INTO `fa_admin_log` VALUES ('238', '1', 'admin', '/admin/member/login', '', '{\"mobile\":\"15231015613\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526959112');
INSERT INTO `fa_admin_log` VALUES ('239', '1', 'admin', '/admin/member/login', '', '{\"mobile\":\"15231015613\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526959123');
INSERT INTO `fa_admin_log` VALUES ('240', '1', 'admin', '/admin/member/edit?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"mobile\":\"15231015613\",\"password\":\"123456\",\"realname\":\"\\u8001\\u738b\",\"weixin\":\"15231015613\",\"membermobile\":\"15231015613\",\"bank_num\":\"\",\"bankname\":\"\",\"bank\":\"\",\"alipay\":\"\",\"alipayname\":\"\",\"gender\":\"2\",\"birthday\":\"1970-01-01\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526959127');
INSERT INTO `fa_admin_log` VALUES ('241', '1', 'admin', '/admin/member/login', '', '{\"mobile\":\"15231015613\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526959133');
INSERT INTO `fa_admin_log` VALUES ('242', '1', 'admin', '/admin/auth/admin/add?dialog=1', '权限管理 管理员管理 添加', '{\"dialog\":\"1\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526972368');
INSERT INTO `fa_admin_log` VALUES ('243', '1', 'admin', '/admin/auth/admin/add?dialog=1', '权限管理 管理员管理 添加', '{\"dialog\":\"1\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526972375');
INSERT INTO `fa_admin_log` VALUES ('244', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526973106');
INSERT INTO `fa_admin_log` VALUES ('245', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526973110');
INSERT INTO `fa_admin_log` VALUES ('246', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526973111');
INSERT INTO `fa_admin_log` VALUES ('247', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526973126');
INSERT INTO `fa_admin_log` VALUES ('248', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526973144');
INSERT INTO `fa_admin_log` VALUES ('249', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"\\u8001\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\\u8001\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526973147');
INSERT INTO `fa_admin_log` VALUES ('250', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526973275');
INSERT INTO `fa_admin_log` VALUES ('251', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"123\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"123\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526973276');
INSERT INTO `fa_admin_log` VALUES ('252', '1', 'admin', '/admin/Agent/index', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"realname\",\"ASC\"]],\"showField\":\"realname\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"realname\"]}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526973397');
INSERT INTO `fa_admin_log` VALUES ('253', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526973397');
INSERT INTO `fa_admin_log` VALUES ('254', '1', 'admin', '/admin/auth/admin/edit/ids/2?dialog=1', '权限管理 管理员管理 编辑', '{\"dialog\":\"1\",\"group\":[\"2\"],\"row\":{\"username\":\"admin2\",\"agent_id\":\"7393417\",\"email\":\"admin2@fastadmin.net\",\"nickname\":\"admin2\",\"password\":\"\",\"loginfailure\":\"0\",\"status\":\"normal\"},\"ids\":\"2\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526973399');
INSERT INTO `fa_admin_log` VALUES ('255', '1', 'admin', '/admin/Agent/index', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"7393417\",\"orderBy\":[[\"realname\",\"ASC\"]],\"showField\":\"realname\",\"keyField\":\"id\",\"keyValue\":\"7393417\",\"searchField\":[\"realname\"]}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526973401');
INSERT INTO `fa_admin_log` VALUES ('256', '1', 'admin', '/admin/Agent/index', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"7393417\",\"orderBy\":[[\"realname\",\"ASC\"]],\"showField\":\"realname\",\"keyField\":\"id\",\"keyValue\":\"7393417\",\"searchField\":[\"realname\"]}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526973409');
INSERT INTO `fa_admin_log` VALUES ('257', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526973410');
INSERT INTO `fa_admin_log` VALUES ('258', '1', 'admin', '/admin/index/login', '登录', '{\"__token__\":\"b2628989ac8843e988beb29dd467e2d4\",\"username\":\"admin\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526973490');
INSERT INTO `fa_admin_log` VALUES ('259', '1', 'admin', '/admin/member/recharge_credit1/ids/7393417?dialog=1', '', '{\"dialog\":\"1\",\"credit1\":\"1200\",\"ids\":\"7393417\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526974835');
INSERT INTO `fa_admin_log` VALUES ('260', '1', 'admin', '/admin/member/recharge_credit1/ids/7393417?dialog=1', '', '{\"dialog\":\"1\",\"credit1\":\"1200\",\"ids\":\"7393417\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526974866');
INSERT INTO `fa_admin_log` VALUES ('261', '1', 'admin', '/admin/member/recharge_credit1/ids/7393417?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"credit1\":\"1200\"},\"ids\":\"7393417\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526975234');
INSERT INTO `fa_admin_log` VALUES ('262', '1', 'admin', '/admin/member/recharge_credit1/ids/7393417?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"credit1\":\"1\"},\"ids\":\"7393417\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526975240');
INSERT INTO `fa_admin_log` VALUES ('263', '1', 'admin', '/admin/member/recharge_credit1/ids/7393417?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"credit1\":\"2\"},\"ids\":\"7393417\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526975244');
INSERT INTO `fa_admin_log` VALUES ('264', '1', 'admin', '/admin/member/recharge_credit1/ids/7393417?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"credit1\":\"3\"},\"ids\":\"7393417\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526975248');
INSERT INTO `fa_admin_log` VALUES ('265', '1', 'admin', '/admin/member/recharge_credit1/ids/7393417?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"credit1\":\"1\"},\"ids\":\"7393417\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526975252');
INSERT INTO `fa_admin_log` VALUES ('266', '1', 'admin', '/admin/member/recharge_credit1/ids/7393417?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"credit1\":\"1\"},\"ids\":\"7393417\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526975255');
INSERT INTO `fa_admin_log` VALUES ('267', '1', 'admin', '/admin/member/recharge_credit1/ids/7393417?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"credit1\":\"1\"},\"ids\":\"7393417\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526975526');
INSERT INTO `fa_admin_log` VALUES ('268', '1', 'admin', '/admin/member/recharge_credit1/ids/7393417?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"credit1\":\"1\"},\"ids\":\"7393417\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526975531');
INSERT INTO `fa_admin_log` VALUES ('269', '1', 'admin', '/admin/member/recharge_credit1/ids/7393417?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"credit1\":\"9000\"},\"ids\":\"7393417\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526975710');
INSERT INTO `fa_admin_log` VALUES ('270', '1', 'admin', '/admin/member/recharge_credit1/ids/7393417?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"credit1\":\"1\"},\"ids\":\"7393417\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526975713');
INSERT INTO `fa_admin_log` VALUES ('271', '1', 'admin', '/admin/member/recharge_credit2/ids/7393417?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"credit2\":\"1\"},\"ids\":\"7393417\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526975864');
INSERT INTO `fa_admin_log` VALUES ('272', '1', 'admin', '/admin/member/recharge_credit2/ids/7393417?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"credit2\":\"300\"},\"ids\":\"7393417\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526975869');
INSERT INTO `fa_admin_log` VALUES ('273', '1', 'admin', '/admin/member/recharge_credit2/ids/7393417?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"credit2\":\"2\"},\"ids\":\"7393417\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526975873');
INSERT INTO `fa_admin_log` VALUES ('274', '1', 'admin', '/admin/index/login?url=%2Fadmin%2Fmember%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/member?ref=addtabs\",\"__token__\":\"a6375b7d2ca82c7c57540f28f91316d1\",\"username\":\"admin\"}', '223.104.13.22', 'Mozilla/5.0 (Linux; U; Android 6.0.1; zh-cn; OPPO R9sk Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/53.0.2785.134 Mobile Safari/537.36 OppoBrowser/4.6.3', '1526976062');
INSERT INTO `fa_admin_log` VALUES ('275', '1', 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"cashregister\",\"title\":\"\\u6536\\u94f6\\u53f0\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526977160');
INSERT INTO `fa_admin_log` VALUES ('276', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526977160');
INSERT INTO `fa_admin_log` VALUES ('277', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526980809');
INSERT INTO `fa_admin_log` VALUES ('278', '1', 'admin', '/admin/cashregister/setmember/member_id/0?dialog=1', '', '{\"dialog\":\"1\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"member_id\":\"0\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526980909');
INSERT INTO `fa_admin_log` VALUES ('279', '1', 'admin', '/admin/cashregister/setmember/member_id/0?dialog=1', '', '{\"dialog\":\"1\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"member_id\":\"0\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526980943');
INSERT INTO `fa_admin_log` VALUES ('280', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526980946');
INSERT INTO `fa_admin_log` VALUES ('281', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526980949');
INSERT INTO `fa_admin_log` VALUES ('282', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526980951');
INSERT INTO `fa_admin_log` VALUES ('283', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526980958');
INSERT INTO `fa_admin_log` VALUES ('284', '1', 'admin', '/admin/Agent/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526980976');
INSERT INTO `fa_admin_log` VALUES ('285', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981152');
INSERT INTO `fa_admin_log` VALUES ('286', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981190');
INSERT INTO `fa_admin_log` VALUES ('287', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981239');
INSERT INTO `fa_admin_log` VALUES ('288', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981269');
INSERT INTO `fa_admin_log` VALUES ('289', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981297');
INSERT INTO `fa_admin_log` VALUES ('290', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981421');
INSERT INTO `fa_admin_log` VALUES ('291', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"888555222\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"888555222\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981428');
INSERT INTO `fa_admin_log` VALUES ('292', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981480');
INSERT INTO `fa_admin_log` VALUES ('293', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981509');
INSERT INTO `fa_admin_log` VALUES ('294', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"8\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"8\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981510');
INSERT INTO `fa_admin_log` VALUES ('295', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"8\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"8\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981512');
INSERT INTO `fa_admin_log` VALUES ('296', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"$\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"$\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981514');
INSERT INTO `fa_admin_log` VALUES ('297', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"r\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"r\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981515');
INSERT INTO `fa_admin_log` VALUES ('298', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"9\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"9\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981538');
INSERT INTO `fa_admin_log` VALUES ('299', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"9\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"9\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981538');
INSERT INTO `fa_admin_log` VALUES ('300', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"1\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"1\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981540');
INSERT INTO `fa_admin_log` VALUES ('301', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"1\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"1\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981542');
INSERT INTO `fa_admin_log` VALUES ('302', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981545');
INSERT INTO `fa_admin_log` VALUES ('303', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981545');
INSERT INTO `fa_admin_log` VALUES ('304', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981546');
INSERT INTO `fa_admin_log` VALUES ('305', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"1\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"1\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981547');
INSERT INTO `fa_admin_log` VALUES ('306', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981548');
INSERT INTO `fa_admin_log` VALUES ('307', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981549');
INSERT INTO `fa_admin_log` VALUES ('308', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"1\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"1\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981550');
INSERT INTO `fa_admin_log` VALUES ('309', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981551');
INSERT INTO `fa_admin_log` VALUES ('310', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981603');
INSERT INTO `fa_admin_log` VALUES ('311', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"6\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"6\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981604');
INSERT INTO `fa_admin_log` VALUES ('312', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"6\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"6\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981606');
INSERT INTO `fa_admin_log` VALUES ('313', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"6\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"6\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981607');
INSERT INTO `fa_admin_log` VALUES ('314', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"6\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"6\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981608');
INSERT INTO `fa_admin_log` VALUES ('315', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"6\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"6\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981609');
INSERT INTO `fa_admin_log` VALUES ('316', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981988');
INSERT INTO `fa_admin_log` VALUES ('317', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"7\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"7\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981989');
INSERT INTO `fa_admin_log` VALUES ('318', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"7\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"7\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981990');
INSERT INTO `fa_admin_log` VALUES ('319', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"7\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"7\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981990');
INSERT INTO `fa_admin_log` VALUES ('320', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"4\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"4\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981991');
INSERT INTO `fa_admin_log` VALUES ('321', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"4\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"4\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981991');
INSERT INTO `fa_admin_log` VALUES ('322', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"5\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"5\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981992');
INSERT INTO `fa_admin_log` VALUES ('323', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"5\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"5\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981992');
INSERT INTO `fa_admin_log` VALUES ('324', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"5\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"5\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981992');
INSERT INTO `fa_admin_log` VALUES ('325', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"5\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"5\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981992');
INSERT INTO `fa_admin_log` VALUES ('326', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"5\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"5\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981993');
INSERT INTO `fa_admin_log` VALUES ('327', '1', 'admin', '/admin/Member/index', '', '{\"q_word\":[\"5\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"realname\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"realname\",\"keyField\":\"id\",\"searchField\":[\"realname\"],\"realname\":\"5\",\"all\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1526981993');
INSERT INTO `fa_admin_log` VALUES ('328', '1', 'admin', '/admin/index/login?url=%2F', '登录', '{\"url\":\"\\/\",\"__token__\":\"80991d8f887c45eb3e167e67428495bb\",\"username\":\"admin\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527038130');
INSERT INTO `fa_admin_log` VALUES ('329', '0', 'Unknown', '/admin/index/login?url=%2F', '登录', '{\"url\":\"\\/\",\"__token__\":\"a331396396367550ccd4d561f8ba1515\",\"username\":\"admin\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527039398');
INSERT INTO `fa_admin_log` VALUES ('330', '0', 'Unknown', '/admin/index/login?url=%2F', '登录', '{\"url\":\"\\/\",\"__token__\":\"68278d4b231cdcc2b1cae044d5e7230d\",\"username\":\"admin\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527039401');
INSERT INTO `fa_admin_log` VALUES ('331', '1', 'admin', '/admin/index/login?url=%2F', '登录', '{\"url\":\"\\/\",\"__token__\":\"a9974fb2354960ae5a98d68f2c68eb9c\",\"username\":\"admin\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527039404');
INSERT INTO `fa_admin_log` VALUES ('332', '1', 'admin', '/admin/inventory/tiaoku/add?dialog=1', '进销存管理 调库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"5\",\"storage\":\"1\",\"storageru\":\"2\",\"desc\":\"\",\"add_time\":\"2018-05-23 12:01:37\"},\"goods\":[\"1\",\"2\"],\"num\":[\"20\",\"30\"]}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527048133');
INSERT INTO `fa_admin_log` VALUES ('333', '1', 'admin', '/admin/basic/goods/edit/ids/4?dialog=1', '基本设置 商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180519002\",\"barcode\":\"123456\",\"name\":\"OPPO R11\",\"category\":\"2\",\"spec\":\"\\u4e2a\",\"price\":\"3000.00\",\"unit\":\"1\",\"status\":\"0\",\"desc\":\"\",\"add_time\":\"2018-05-19 15:45:04\"},\"ids\":\"4\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527055412');
INSERT INTO `fa_admin_log` VALUES ('334', '1', 'admin', '/admin/inventory/tiaoku/del/ids/1', '进销存管理 调库管理 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527056740');
INSERT INTO `fa_admin_log` VALUES ('335', '1', 'admin', '/admin/inventory/tiaoku/add?dialog=1', '进销存管理 调库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"5\",\"storage\":\"1\",\"storageru\":\"2\",\"desc\":\"\",\"add_time\":\"2018-05-23 14:25:48\"},\"goods\":[\"1_OPPO R15\",\"2_VIVO X21\"],\"num\":[\"50\",\"30\"]}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527056761');
INSERT INTO `fa_admin_log` VALUES ('336', '1', 'admin', '/admin/inventory/tiaoku/del/ids/2', '进销存管理 调库管理 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527056818');
INSERT INTO `fa_admin_log` VALUES ('337', '1', 'admin', '/admin/inventory/tiaoku/add?dialog=1', '进销存管理 调库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"5\",\"storage\":\"1\",\"storageru\":\"2\",\"desc\":\"\",\"add_time\":\"2018-05-23 14:26:59\"},\"goods\":[\"1_OPPO R15\",\"2_VIVO X21\"],\"num\":[\"50\",\"30\"]}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527056832');
INSERT INTO `fa_admin_log` VALUES ('338', '1', 'admin', '/admin/inventory/tiaoku/prints/ids/3?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180523001\",\"author\":\"Admin\",\"desc\":\"\",\"add_time\":\"2018-05-23 14:26:59\"},\"ids\":\"3\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527057331');
INSERT INTO `fa_admin_log` VALUES ('339', '1', 'admin', '/admin/inventory/tiaoku/prints/ids/3?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180523001\",\"author\":\"Admin\",\"desc\":\"\",\"add_time\":\"2018-05-23 14:26:59\"},\"ids\":\"3\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527057340');
INSERT INTO `fa_admin_log` VALUES ('340', '1', 'admin', '/admin/inventory/tiaoku/add?dialog=1', '进销存管理 调库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"5\",\"storage\":\"2\",\"storageru\":\"1\",\"desc\":\"\",\"add_time\":\"2018-05-23 14:53:16\"},\"goods\":[\"1_OPPO R15\"],\"num\":[\"30\"]}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527058404');
INSERT INTO `fa_admin_log` VALUES ('341', '1', 'admin', '/admin/inventory/tiaoku/del/ids/4', '进销存管理 调库管理 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527058954');
INSERT INTO `fa_admin_log` VALUES ('342', '1', 'admin', '/admin/inventory/tiaoku/del/ids/5', '进销存管理 调库管理 删除', '{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527058955');
INSERT INTO `fa_admin_log` VALUES ('343', '1', 'admin', '/admin/inventory/tiaoku/del/ids/3', '进销存管理 调库管理 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527058957');
INSERT INTO `fa_admin_log` VALUES ('344', '1', 'admin', '/admin/inventory/tiaoku/add?dialog=1', '进销存管理 调库管理 添加', '{\"dialog\":\"1\",\"row\":{\"sn\":\"\\u4fdd\\u5b58\\u540e\\u81ea\\u52a8\\u751f\\u6210\",\"author\":\"Admin\",\"type\":\"5\",\"storage\":\"1\",\"storageru\":\"2\",\"desc\":\"\",\"add_time\":\"2018-05-23 16:00:14\"},\"goods\":[\"1_OPPO R15\",\"2_VIVO X21\"],\"num\":[\"10\",\"20\"]}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527062426');
INSERT INTO `fa_admin_log` VALUES ('345', '1', 'admin', '/admin/basic/goods/edit/ids/1?dialog=1', '基本设置 商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"sn\":\"20180517001\",\"barcode\":\"456789\",\"name\":\"OPPO R15\",\"category\":\"2\",\"spec\":\"\\u4e2a\",\"price\":\"4000.00\",\"unit\":\"1\",\"status\":\"0\",\"desc\":\"\",\"add_time\":\"2018-05-17 09:43:35\"},\"ids\":\"1\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527064861');
INSERT INTO `fa_admin_log` VALUES ('346', '1', 'admin', '/admin/index/login?url=%2F', '登录', '{\"url\":\"\\/\",\"__token__\":\"8675b8c8aebd8092383d6c7425d5bd12\",\"username\":\"admin\"}', '106.117.136.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1527123100');

-- ----------------------------
-- Table structure for fa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fa_attachment`;
CREATE TABLE `fa_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';

-- ----------------------------
-- Records of fa_attachment
-- ----------------------------
INSERT INTO `fa_attachment` VALUES ('1', '1', '0', '/assets/img/qrcode.png', '150', '150', 'png', '0', '21859', 'image/png', '', '1499681848', '1499681848', '1499681848', 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分组表';

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
INSERT INTO `fa_auth_group` VALUES ('1', '0', 'Admin group', '*', '1490883540', '149088354', 'normal');
INSERT INTO `fa_auth_group` VALUES ('2', '1', 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', '1490883540', '1505465692', 'normal');
INSERT INTO `fa_auth_group` VALUES ('3', '2', 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', '1490883540', '1502205322', 'normal');
INSERT INTO `fa_auth_group` VALUES ('4', '1', 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', '1490883540', '1502205350', 'normal');
INSERT INTO `fa_auth_group` VALUES ('5', '2', 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', '1490883540', '1502205344', 'normal');

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表';

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
INSERT INTO `fa_auth_group_access` VALUES ('1', '1');
INSERT INTO `fa_auth_group_access` VALUES ('2', '2');
INSERT INTO `fa_auth_group_access` VALUES ('3', '3');
INSERT INTO `fa_auth_group_access` VALUES ('4', '5');
INSERT INTO `fa_auth_group_access` VALUES ('5', '5');

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
INSERT INTO `fa_auth_rule` VALUES ('1', 'file', '0', 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', '1', '1497429920', '1497429920', '1', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('2', 'file', '0', 'general', 'General', 'fa fa-cogs', '', '', '1', '1497429920', '1497430169', '9', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('3', 'file', '0', 'category', 'Category', 'fa fa-list', '', 'Category tips', '1', '1497429920', '1497429920', '15', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('4', 'file', '0', 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', '1', '1502035509', '1502035509', '129', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('5', 'file', '0', 'auth', 'Auth', 'fa fa-group', '', '', '1', '1497429920', '1497430092', '21', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('6', 'file', '2', 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', '1', '1497429920', '1497430683', '42', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('7', 'file', '2', 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', '1', '1497429920', '1497430699', '49', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('8', 'file', '2', 'general/profile', 'Profile', 'fa fa-user', '', '', '1', '1497429920', '1497429920', '55', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('9', 'file', '5', 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', '1', '1497429920', '1497430320', '22', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('10', 'file', '5', 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', '1', '1497429920', '1497430307', '27', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('11', 'file', '5', 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', '1', '1497429920', '1497429920', '31', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('12', 'file', '5', 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', '1', '1497429920', '1497430581', '36', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('13', 'file', '1', 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '16', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('14', 'file', '1', 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '17', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('15', 'file', '1', 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '19', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('16', 'file', '1', 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '18', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('17', 'file', '1', 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '20', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('18', 'file', '6', 'general/config/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '50', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('19', 'file', '6', 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '51', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('20', 'file', '6', 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '52', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('21', 'file', '6', 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '53', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('22', 'file', '6', 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '54', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('23', 'file', '7', 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', '0', '1497429920', '1497429920', '43', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('24', 'file', '7', 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '44', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('25', 'file', '7', 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '45', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('26', 'file', '7', 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '46', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('27', 'file', '7', 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '47', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('28', 'file', '7', 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '48', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('29', 'file', '8', 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '56', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('30', 'file', '8', 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '57', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('31', 'file', '8', 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '58', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('32', 'file', '8', 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '59', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('33', 'file', '8', 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '60', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('34', 'file', '8', 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '61', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('35', 'file', '3', 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', '0', '1497429920', '1497429920', '10', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('36', 'file', '3', 'category/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '11', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('37', 'file', '3', 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '12', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('38', 'file', '3', 'category/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '13', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('39', 'file', '3', 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '14', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('40', 'file', '9', 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', '0', '1497429920', '1497429920', '23', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('41', 'file', '9', 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '24', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('42', 'file', '9', 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '25', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('43', 'file', '9', 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '26', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('44', 'file', '10', 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', '0', '1497429920', '1497429920', '28', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('45', 'file', '10', 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '29', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('46', 'file', '10', 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '30', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('47', 'file', '11', 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', '0', '1497429920', '1497429920', '32', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('48', 'file', '11', 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '33', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('49', 'file', '11', 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '34', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('50', 'file', '11', 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '35', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('51', 'file', '12', 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', '0', '1497429920', '1497429920', '37', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('52', 'file', '12', 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '38', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('53', 'file', '12', 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '39', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('54', 'file', '12', 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '40', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('55', 'file', '4', 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', '0', '1502035509', '1502035509', '128', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('56', 'file', '4', 'addon/add', 'Add', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '127', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('57', 'file', '4', 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '126', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('58', 'file', '4', 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '125', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('59', 'file', '4', 'addon/local', 'Local install', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '124', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('60', 'file', '4', 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '123', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('61', 'file', '4', 'addon/install', 'Install', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '122', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('62', 'file', '4', 'addon/uninstall', 'Uninstall', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '121', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('63', 'file', '4', 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '120', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('64', 'file', '4', 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '119', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('65', 'file', '4', 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '118', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('66', 'file', '0', 'user', 'User', 'fa fa-list', '', '', '0', '1516374729', '1526956067', '117', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('67', 'file', '66', 'user/user', 'User', 'fa fa-user', '', '', '1', '1516374729', '1516374729', '116', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('68', 'file', '67', 'user/user/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '115', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('69', 'file', '67', 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '114', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('70', 'file', '67', 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '113', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('71', 'file', '67', 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '112', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('72', 'file', '67', 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '111', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('73', 'file', '66', 'user/group', 'User group', 'fa fa-users', '', '', '1', '1516374729', '1516374729', '110', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('74', 'file', '73', 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '109', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('75', 'file', '73', 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '108', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('76', 'file', '73', 'user/group/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '107', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('77', 'file', '73', 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '106', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('78', 'file', '73', 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '105', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('79', 'file', '66', 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '1', '1516374729', '1516374729', '104', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('80', 'file', '79', 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '103', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('81', 'file', '79', 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '102', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('82', 'file', '79', 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '101', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('83', 'file', '79', 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '100', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('84', 'file', '79', 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '99', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('85', 'file', '0', 'basic', '基本设置', 'fa fa-list', '', '', '1', '1525830119', '1525830966', '98', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('86', 'file', '85', 'basic/storage', '仓库管理', 'fa fa-circle-o', '', '', '1', '1525830119', '1525830119', '97', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('87', 'file', '86', 'basic/storage/index', '查看', 'fa fa-circle-o', '', '', '0', '1525830119', '1525830119', '96', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('88', 'file', '86', 'basic/storage/add', '添加', 'fa fa-circle-o', '', '', '0', '1525830119', '1525830119', '95', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('89', 'file', '86', 'basic/storage/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1525830119', '1525830119', '94', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('90', 'file', '86', 'basic/storage/del', '删除', 'fa fa-circle-o', '', '', '0', '1525830119', '1525830119', '93', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('91', 'file', '86', 'basic/storage/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1525830119', '1525830119', '92', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('92', 'file', '85', 'basic/supplier', '供应商管理', 'fa fa-circle-o', '', '', '1', '1525830213', '1525830213', '79', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('93', 'file', '92', 'basic/supplier/index', '查看', 'fa fa-circle-o', '', '', '0', '1525830213', '1525830213', '90', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('94', 'file', '92', 'basic/supplier/add', '添加', 'fa fa-circle-o', '', '', '0', '1525830213', '1525830213', '89', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('95', 'file', '92', 'basic/supplier/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1525830213', '1525830213', '88', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('96', 'file', '92', 'basic/supplier/del', '删除', 'fa fa-circle-o', '', '', '0', '1525830213', '1525830213', '87', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('97', 'file', '92', 'basic/supplier/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1525830213', '1525830213', '86', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('98', 'file', '85', 'basic/goods', '商品管理', 'fa fa-circle-o', '', '', '1', '1525830262', '1525830262', '67', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('99', 'file', '98', 'basic/goods/index', '查看', 'fa fa-circle-o', '', '', '0', '1525830262', '1525830262', '84', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('100', 'file', '98', 'basic/goods/add', '添加', 'fa fa-circle-o', '', '', '0', '1525830262', '1525830262', '83', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('101', 'file', '98', 'basic/goods/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1525830262', '1525830262', '82', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('102', 'file', '98', 'basic/goods/del', '删除', 'fa fa-circle-o', '', '', '0', '1525830262', '1525830262', '81', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('103', 'file', '98', 'basic/goods/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1525830262', '1525830262', '80', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('104', 'file', '85', 'basic/unit', '计量单位', 'fa fa-circle-o', '', '', '1', '1525830310', '1525830310', '85', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('105', 'file', '104', 'basic/unit/index', '查看', 'fa fa-circle-o', '', '', '0', '1525830310', '1525830310', '78', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('106', 'file', '104', 'basic/unit/add', '添加', 'fa fa-circle-o', '', '', '0', '1525830310', '1525830310', '77', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('107', 'file', '104', 'basic/unit/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1525830310', '1525830310', '76', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('108', 'file', '104', 'basic/unit/del', '删除', 'fa fa-circle-o', '', '', '0', '1525830310', '1525830310', '75', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('109', 'file', '104', 'basic/unit/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1525830310', '1525830310', '74', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('110', 'file', '85', 'basic/leibie', '商品类别', 'fa fa-circle-o', '', '', '1', '1525830672', '1525830672', '73', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('111', 'file', '110', 'basic/leibie/index', '查看', 'fa fa-circle-o', '', '', '0', '1525830672', '1525830672', '72', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('112', 'file', '110', 'basic/leibie/add', '添加', 'fa fa-circle-o', '', '', '0', '1525830672', '1525830672', '71', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('113', 'file', '110', 'basic/leibie/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1525830672', '1525830672', '70', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('114', 'file', '110', 'basic/leibie/del', '删除', 'fa fa-circle-o', '', '', '0', '1525830672', '1525830672', '69', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('115', 'file', '110', 'basic/leibie/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1525830672', '1525830672', '68', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('116', 'file', '85', 'basic/location', '库位管理', 'fa fa-circle-o', '', '', '1', '1525830860', '1525830860', '91', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('117', 'file', '116', 'basic/location/index', '查看', 'fa fa-circle-o', '', '', '0', '1525830860', '1525830860', '66', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('118', 'file', '116', 'basic/location/add', '添加', 'fa fa-circle-o', '', '', '0', '1525830860', '1525830860', '65', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('119', 'file', '116', 'basic/location/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1525830860', '1525830860', '64', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('120', 'file', '116', 'basic/location/del', '删除', 'fa fa-circle-o', '', '', '0', '1525830860', '1525830860', '63', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('121', 'file', '116', 'basic/location/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1525830860', '1525830860', '62', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('122', 'file', '0', 'inventory', '进销存管理', 'fa fa-sitemap', '', '', '1', '1525932525', '1525932654', '41', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('123', 'file', '122', 'inventory/ruku', '入库记录', 'fa fa-circle-o', '', '', '1', '1525932525', '1526545447', '9', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('124', 'file', '123', 'inventory/ruku/index', '查看', 'fa fa-circle-o', '', '', '0', '1525932525', '1525932525', '3', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('125', 'file', '123', 'inventory/ruku/init_configs', 'Init_configs', 'fa fa-circle-o', '', '', '0', '1525932525', '1525932525', '4', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('126', 'file', '123', 'inventory/ruku/add', '添加', 'fa fa-circle-o', '', '', '0', '1525932525', '1525932525', '5', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('127', 'file', '123', 'inventory/ruku/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1525932525', '1525932525', '6', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('128', 'file', '123', 'inventory/ruku/del', '删除', 'fa fa-circle-o', '', '', '0', '1525932525', '1525932525', '7', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('129', 'file', '123', 'inventory/ruku/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1525932525', '1525932525', '8', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('130', 'file', '0', 'datadictionary', '数据字典', 'fa fa-list', '', '', '1', '1525934375', '1525934432', '137', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('138', 'file', '130', 'datadictionary/rutype', '入库类型', 'fa fa-circle-o', '', '', '1', '1525934888', '1525934888', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('139', 'file', '138', 'datadictionary/rutype/index', '查看', 'fa fa-circle-o', '', '', '0', '1525934888', '1525934888', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('140', 'file', '138', 'datadictionary/rutype/init_configs', 'Init_configs', 'fa fa-circle-o', '', '', '0', '1525934888', '1525934888', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('141', 'file', '138', 'datadictionary/rutype/add', '添加', 'fa fa-circle-o', '', '', '0', '1525934888', '1525934888', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('142', 'file', '138', 'datadictionary/rutype/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1525934888', '1525934888', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('143', 'file', '138', 'datadictionary/rutype/del', '删除', 'fa fa-circle-o', '', '', '0', '1525934888', '1525934888', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('144', 'file', '138', 'datadictionary/rutype/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1525934888', '1525934888', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('145', 'file', '122', 'inventory/xiaoshou/collect', '销售管理', 'fa fa-circle-o', '', '', '1', '1526283323', '1526436539', '6', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('148', 'file', '122', 'inventory/buy', '采购入库', 'fa fa-circle-o', '', '', '1', '1526441337', '1526545436', '12', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('149', 'file', '148', 'inventory/buy/index', '查看', 'fa fa-circle-o', '', '', '0', '1526441337', '1526441337', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('150', 'file', '148', 'inventory/buy/init_configs', 'Init_configs', 'fa fa-circle-o', '', '', '0', '1526441337', '1526441337', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('151', 'file', '148', 'inventory/buy/add', '添加', 'fa fa-circle-o', '', '', '0', '1526441337', '1526441337', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('152', 'file', '148', 'inventory/buy/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1526441337', '1526441337', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('153', 'file', '148', 'inventory/buy/getcode', '编号', 'fa fa-circle-o', '', '', '0', '1526441337', '1526441337', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('154', 'file', '148', 'inventory/buy/del', '删除', 'fa fa-circle-o', '', '', '0', '1526441337', '1526441337', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('155', 'file', '148', 'inventory/buy/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1526441337', '1526441337', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('156', 'file', '122', 'inventory/stock', '库存查询', 'fa fa-circle-o', '', '', '1', '1526541479', '1526541479', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('157', 'file', '156', 'inventory/stock/index', '查看', 'fa fa-circle-o', '', '', '0', '1526541479', '1526541479', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('158', 'file', '156', 'inventory/stock/init_configs', 'Init_configs', 'fa fa-circle-o', '', '', '0', '1526541479', '1526541479', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('159', 'file', '156', 'inventory/stock/add', '添加', 'fa fa-circle-o', '', '', '0', '1526541479', '1526541479', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('160', 'file', '156', 'inventory/stock/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1526541479', '1526541479', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('161', 'file', '156', 'inventory/stock/getcode', '编号', 'fa fa-circle-o', '', '', '0', '1526541479', '1526541479', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('162', 'file', '156', 'inventory/stock/del', '删除', 'fa fa-circle-o', '', '', '0', '1526541479', '1526541479', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('163', 'file', '156', 'inventory/stock/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1526541479', '1526541479', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('164', 'file', '156', 'inventory/stock/getsupplierbyid', 'GetSupplierById', 'fa fa-circle-o', '', '', '0', '1526541479', '1526541479', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('165', 'file', '122', 'inventory/tui', '退货记录', 'fa fa-circle-o', '', '', '1', '1526719311', '1526719498', '8', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('166', 'file', '165', 'inventory/tui/index', '查看', 'fa fa-circle-o', '', '', '0', '1526719311', '1526719311', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('167', 'file', '165', 'inventory/tui/init_configs', 'Init_configs', 'fa fa-circle-o', '', '', '0', '1526719311', '1526719311', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('168', 'file', '165', 'inventory/tui/add', '添加', 'fa fa-circle-o', '', '', '0', '1526719311', '1526719311', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('169', 'file', '165', 'inventory/tui/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1526719311', '1526719311', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('170', 'file', '165', 'inventory/tui/getcode', '编号', 'fa fa-circle-o', '', '', '0', '1526719311', '1526719311', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('171', 'file', '165', 'inventory/tui/del', '删除', 'fa fa-circle-o', '', '', '0', '1526719311', '1526719311', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('172', 'file', '165', 'inventory/tui/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1526719311', '1526719311', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('173', 'file', '165', 'inventory/tui/getsupplierbyid', 'GetSupplierById', 'fa fa-circle-o', '', '', '0', '1526719311', '1526719311', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('174', 'file', '165', 'inventory/tui/getgoodsbyid', 'GetGoodsById', 'fa fa-circle-o', '', '', '0', '1526719311', '1526719311', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('175', 'file', '165', 'inventory/tui/getlocationbyid', 'GetLocationById', 'fa fa-circle-o', '', '', '0', '1526719311', '1526719311', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('176', 'file', '165', 'inventory/tui/getstoragebyid', 'GetStorageById', 'fa fa-circle-o', '', '', '0', '1526719311', '1526719311', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('177', 'file', '122', 'inventory/tiaoku', '调库管理', 'fa fa-circle-o', '', '', '1', '1526889240', '1526892496', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('178', 'file', '177', 'inventory/tiaoku/index', '查看', 'fa fa-circle-o', '', '', '0', '1526889240', '1526889240', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('179', 'file', '177', 'inventory/tiaoku/init_configs', 'Init_configs', 'fa fa-circle-o', '', '', '0', '1526889240', '1526889240', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('180', 'file', '177', 'inventory/tiaoku/add', '添加', 'fa fa-circle-o', '', '', '0', '1526889240', '1526889240', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('181', 'file', '177', 'inventory/tiaoku/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1526889240', '1526889240', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('182', 'file', '177', 'inventory/tiaoku/getcode', '编号', 'fa fa-circle-o', '', '', '0', '1526889240', '1526889240', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('183', 'file', '177', 'inventory/tiaoku/del', '删除', 'fa fa-circle-o', '', '', '0', '1526889240', '1526889240', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('184', 'file', '177', 'inventory/tiaoku/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1526889240', '1526889240', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('185', 'file', '177', 'inventory/tiaoku/getsupplierbyid', 'GetSupplierById', 'fa fa-circle-o', '', '', '0', '1526889240', '1526889240', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('186', 'file', '177', 'inventory/tiaoku/getgoodsbyid', 'GetGoodsById', 'fa fa-circle-o', '', '', '0', '1526889240', '1526889240', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('187', 'file', '177', 'inventory/tiaoku/getlocationbyid', 'GetLocationById', 'fa fa-circle-o', '', '', '0', '1526889240', '1526889240', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('188', 'file', '177', 'inventory/tiaoku/getstoragebyid', 'GetStorageById', 'fa fa-circle-o', '', '', '0', '1526889240', '1526889240', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('189', 'file', '0', 'member', '会员管理', 'fa fa-circle-o', '', '', '1', '1526956096', '1526956096', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('190', 'file', '0', 'cashregister', '收银台', 'fa fa-circle-o', '', '', '1', '1526977160', '1526977160', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('191', 'file', '122', 'inventory/pandian', '库存盘点', 'fa fa-circle-o', '', '', '1', '1527065491', '1527065491', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('192', 'file', '191', 'inventory/pandian/index', '查看', 'fa fa-circle-o', '', '', '0', '1527065491', '1527065491', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('193', 'file', '191', 'inventory/pandian/init_configs', 'Init_configs', 'fa fa-circle-o', '', '', '0', '1527065491', '1527065491', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('194', 'file', '191', 'inventory/pandian/add', '添加', 'fa fa-circle-o', '', '', '0', '1527065491', '1527065491', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('195', 'file', '191', 'inventory/pandian/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1527065491', '1527065491', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('196', 'file', '191', 'inventory/pandian/getcode', '编号', 'fa fa-circle-o', '', '', '0', '1527065491', '1527065491', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('197', 'file', '191', 'inventory/pandian/del', '删除', 'fa fa-circle-o', '', '', '0', '1527065491', '1527065491', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('198', 'file', '191', 'inventory/pandian/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1527065491', '1527065491', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('199', 'file', '191', 'inventory/pandian/getsupplierbyid', 'GetSupplierById', 'fa fa-circle-o', '', '', '0', '1527065491', '1527065491', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('200', 'file', '191', 'inventory/pandian/getgoodsbyid', 'GetGoodsById', 'fa fa-circle-o', '', '', '0', '1527065491', '1527065491', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('201', 'file', '191', 'inventory/pandian/getlocationbyid', 'GetLocationById', 'fa fa-circle-o', '', '', '0', '1527065491', '1527065491', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('202', 'file', '191', 'inventory/pandian/getstoragebyid', 'GetStorageById', 'fa fa-circle-o', '', '', '0', '1527065491', '1527065491', '0', 'normal');

-- ----------------------------
-- Table structure for fa_balance
-- ----------------------------
DROP TABLE IF EXISTS `fa_balance`;
CREATE TABLE `fa_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引',
  `agent_id` int(11) NOT NULL DEFAULT '0' COMMENT '分销商',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `integration` int(10) NOT NULL DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fa_balance
-- ----------------------------
INSERT INTO `fa_balance` VALUES ('1', '7393417', '197.00', '4997');

-- ----------------------------
-- Table structure for fa_buy
-- ----------------------------
DROP TABLE IF EXISTS `fa_buy`;
CREATE TABLE `fa_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(30) DEFAULT NULL COMMENT '编码',
  `buyer` varchar(100) DEFAULT NULL COMMENT '采购员',
  `purchase` varchar(100) DEFAULT NULL COMMENT '进价',
  `supplier` varchar(100) DEFAULT NULL COMMENT '供应商',
  `res` mediumtext,
  `desc` mediumtext COMMENT '备注',
  `state` tinyint(1) DEFAULT '0' COMMENT '状态',
  `add_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='采购订单';

-- ----------------------------
-- Records of fa_buy
-- ----------------------------
INSERT INTO `fa_buy` VALUES ('1', '20180517001', '花花', null, '1', '[[\"1\",\"20180517001\",\"100\",\"3000\",\"OPPO R15\",\"4000.00\",\"1\"],[\"2\",\"20180517002\",\"100\",\"3500\",\"VIVO X21\",\"4500.00\",\"1\"]]', '', '2', '1526546416');
INSERT INTO `fa_buy` VALUES ('2', '20180517002', '莉莉', null, '2', '[[\"2\",\"20180517002\",\"100\",\"3500\",\"VIVO X21\",\"4500.00\",\"1\"],[\"1\",\"20180517001\",\"100\",\"3000\",\"OPPO R15\",\"4000.00\",\"1\"]]', '', '2', '1526550620');
INSERT INTO `fa_buy` VALUES ('3', '20180519001', '王芳', null, '3', '[[\"3\",\"20180519001\",\"150\",\"1500\",\"OPPO R9S\",\"2500.00\",\"1\"],[\"4\",\"20180519002\",\"100\",\"2000\",\"OPPO R11\",\"3000.00\",\"1\"]]', '', '4', '1526716153');
INSERT INTO `fa_buy` VALUES ('4', '20180521001', '张虎', null, '3', '[[\"2\",\"20180517002\",\"150\",\"3000\",\"VIVO X21\",\"4500.00\",\"1\"],[\"3\",\"20180519001\",\"200\",\"1500\",\"OPPO R9S\",\"2500.00\",\"1\"]]', '', '0', '1526891572');

-- ----------------------------
-- Table structure for fa_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_category`;
CREATE TABLE `fa_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

-- ----------------------------
-- Records of fa_category
-- ----------------------------
INSERT INTO `fa_category` VALUES ('1', '0', 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', '1495262190', '1495262190', '1', 'normal');
INSERT INTO `fa_category` VALUES ('2', '0', 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', '1495262244', '1495262244', '2', 'normal');
INSERT INTO `fa_category` VALUES ('3', '2', 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', '1495262288', '1495262288', '3', 'normal');
INSERT INTO `fa_category` VALUES ('4', '2', 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', '1495262317', '1495262317', '4', 'normal');
INSERT INTO `fa_category` VALUES ('5', '0', 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', '1495262336', '1499681850', '5', 'normal');
INSERT INTO `fa_category` VALUES ('6', '5', 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', '1495262357', '1495262357', '6', 'normal');
INSERT INTO `fa_category` VALUES ('7', '5', 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', '1495262391', '1495262391', '7', 'normal');
INSERT INTO `fa_category` VALUES ('8', '6', 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', '1495262424', '1495262424', '8', 'normal');
INSERT INTO `fa_category` VALUES ('9', '6', 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', '1495262456', '1495262456', '9', 'normal');
INSERT INTO `fa_category` VALUES ('10', '7', 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', '1495262487', '1495262487', '10', 'normal');
INSERT INTO `fa_category` VALUES ('11', '7', 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', '1495262515', '1495262515', '11', 'normal');
INSERT INTO `fa_category` VALUES ('12', '0', 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', '1497015727', '1497015727', '12', 'normal');
INSERT INTO `fa_category` VALUES ('13', '0', 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', '1497015738', '1497015738', '13', 'normal');

-- ----------------------------
-- Table structure for fa_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_config`;
CREATE TABLE `fa_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Records of fa_config
-- ----------------------------
INSERT INTO `fa_config` VALUES ('1', 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'FastAdmin', '', 'required', '');
INSERT INTO `fa_config` VALUES ('2', 'beian', 'basic', 'Beian', '粤ICP备15054802号-4', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES ('3', 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES ('4', 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `fa_config` VALUES ('5', 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `fa_config` VALUES ('6', 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `fa_config` VALUES ('7', 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `fa_config` VALUES ('8', 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `fa_config` VALUES ('9', 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `fa_config` VALUES ('10', 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `fa_config` VALUES ('11', 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `fa_config` VALUES ('12', 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `fa_config` VALUES ('13', 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `fa_config` VALUES ('14', 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `fa_config` VALUES ('15', 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `fa_config` VALUES ('16', 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `fa_config` VALUES ('17', 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- ----------------------------
-- Table structure for fa_ems
-- ----------------------------
DROP TABLE IF EXISTS `fa_ems`;
CREATE TABLE `fa_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱验证码表';

-- ----------------------------
-- Records of fa_ems
-- ----------------------------

-- ----------------------------
-- Table structure for fa_goods
-- ----------------------------
DROP TABLE IF EXISTS `fa_goods`;
CREATE TABLE `fa_goods` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) DEFAULT NULL COMMENT '条形码',
  `sn` varchar(40) NOT NULL COMMENT '商品编号',
  `name` varchar(20) NOT NULL COMMENT '商品名称',
  `nbsn` varchar(40) DEFAULT NULL COMMENT '内部编号',
  `cjsn` varchar(40) DEFAULT NULL COMMENT '厂家编号',
  `category` varchar(20) DEFAULT NULL COMMENT '商品类别',
  `storage` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `location` varchar(20) DEFAULT NULL COMMENT '库位',
  `unit` varchar(20) DEFAULT NULL COMMENT '产品单位',
  `supplier` varchar(40) DEFAULT NULL COMMENT '供应商名称',
  `customer` varchar(40) DEFAULT NULL COMMENT '客户',
  `spec` varchar(40) DEFAULT NULL COMMENT '商品规格',
  `price` decimal(10,2) unsigned DEFAULT NULL COMMENT '商品价格',
  `num` mediumint(9) unsigned DEFAULT '0' COMMENT '商品数量',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '商品状态',
  `desc` mediumtext COMMENT '备注',
  `add_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品管理';

-- ----------------------------
-- Records of fa_goods
-- ----------------------------
INSERT INTO `fa_goods` VALUES ('1', '456789', '20180517001', 'OPPO R15', null, null, '2', null, null, '1', '2', null, '个', '4000.00', '0', '0', '', '1526521415');
INSERT INTO `fa_goods` VALUES ('2', null, '20180517002', 'VIVO X21', null, null, '3', null, null, '1', '2', null, '', '4500.00', '0', '0', '', '1526521442');
INSERT INTO `fa_goods` VALUES ('3', null, '20180519001', 'OPPO R9S', null, null, '2', null, null, '1', null, null, '', '2500.00', '0', '0', '', '1526715877');
INSERT INTO `fa_goods` VALUES ('4', '123456', '20180519002', 'OPPO R11', null, null, '2', null, null, '1', null, null, '个', '3000.00', '0', '0', '', '1526715904');

-- ----------------------------
-- Table structure for fa_leibie
-- ----------------------------
DROP TABLE IF EXISTS `fa_leibie`;
CREATE TABLE `fa_leibie` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(9) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID',
  `name` varchar(40) NOT NULL COMMENT '类别名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `desc` mediumtext COMMENT '备注',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品类别';

-- ----------------------------
-- Records of fa_leibie
-- ----------------------------
INSERT INTO `fa_leibie` VALUES ('1', '0', '手机', '0', '', '1526520455');
INSERT INTO `fa_leibie` VALUES ('2', '1', 'oppo', '0', '', '1526520466');
INSERT INTO `fa_leibie` VALUES ('3', '1', 'vivo', '0', '', '1526520475');

-- ----------------------------
-- Table structure for fa_location
-- ----------------------------
DROP TABLE IF EXISTS `fa_location`;
CREATE TABLE `fa_location` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) NOT NULL COMMENT '仓库编码',
  `name` varchar(40) NOT NULL COMMENT '仓库名称',
  `storage` mediumint(5) unsigned NOT NULL COMMENT '所属仓库的ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `desc` varchar(200) DEFAULT NULL COMMENT '备注',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='库位管理';

-- ----------------------------
-- Records of fa_location
-- ----------------------------
INSERT INTO `fa_location` VALUES ('1', '20180517001', '新华区', '1', '0', '', '1526521521');
INSERT INTO `fa_location` VALUES ('2', '20180517002', '复兴区', '2', '0', '', '1526521542');

-- ----------------------------
-- Table structure for fa_pandian
-- ----------------------------
DROP TABLE IF EXISTS `fa_pandian`;
CREATE TABLE `fa_pandian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商',
  `jinjia` varchar(255) DEFAULT NULL COMMENT '商品进价',
  `num` int(11) DEFAULT '0' COMMENT '入库数量',
  `pdnum` int(11) DEFAULT NULL COMMENT '盘点数量',
  `cynum` int(11) DEFAULT NULL COMMENT '差异数量',
  `start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `add_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='库存盘点';

-- ----------------------------
-- Records of fa_pandian
-- ----------------------------

-- ----------------------------
-- Table structure for fa_ruku
-- ----------------------------
DROP TABLE IF EXISTS `fa_ruku`;
CREATE TABLE `fa_ruku` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) DEFAULT NULL COMMENT '编号',
  `author` varchar(20) DEFAULT NULL COMMENT '制单者',
  `supplier` varchar(40) DEFAULT NULL COMMENT '供应商',
  `storage` varchar(100) DEFAULT NULL COMMENT '仓库',
  `location` varchar(50) DEFAULT NULL COMMENT '库位',
  `state` tinyint(1) unsigned DEFAULT '0' COMMENT '状态',
  `type` varchar(40) DEFAULT NULL COMMENT '类型',
  `res` mediumtext COMMENT '物件',
  `desc` mediumtext COMMENT '备注',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='入库管理';

-- ----------------------------
-- Records of fa_ruku
-- ----------------------------
INSERT INTO `fa_ruku` VALUES ('1', '20180517002', 'Admin', '1', '1', '1', '0', '1', '[[\"1\",\"20180517001\",\"100\",\"3000\",\"OPPO R15\",\"4000.00\",\"1\"],[\"2\",\"20180517002\",\"100\",\"3500\",\"VIVO X21\",\"4500.00\",\"1\"]]', '', '1526546440');
INSERT INTO `fa_ruku` VALUES ('2', '20180519001', 'Admin', '2', '2', '2', '0', '1', '[[\"2\",\"20180517002\",\"100\",\"3500\",\"VIVO X21\",\"4500.00\",\"1\"],[\"1\",\"20180517001\",\"100\",\"3000\",\"OPPO R15\",\"4000.00\",\"1\"]]', '', '1526698927');

-- ----------------------------
-- Table structure for fa_rutype
-- ----------------------------
DROP TABLE IF EXISTS `fa_rutype`;
CREATE TABLE `fa_rutype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '入库类型',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `add_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='入库类型';

-- ----------------------------
-- Records of fa_rutype
-- ----------------------------
INSERT INTO `fa_rutype` VALUES ('1', '采购入库', '0', '1525934496');
INSERT INTO `fa_rutype` VALUES ('2', '采购退货', '0', '1525934514');
INSERT INTO `fa_rutype` VALUES ('3', '销售出库', '0', '1525934524');
INSERT INTO `fa_rutype` VALUES ('4', '销售退货', '0', '1525934533');
INSERT INTO `fa_rutype` VALUES ('5', '仓库调拨', '0', '1526892128');

-- ----------------------------
-- Table structure for fa_sms
-- ----------------------------
DROP TABLE IF EXISTS `fa_sms`;
CREATE TABLE `fa_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信验证码表';

-- ----------------------------
-- Records of fa_sms
-- ----------------------------

-- ----------------------------
-- Table structure for fa_stock
-- ----------------------------
DROP TABLE IF EXISTS `fa_stock`;
CREATE TABLE `fa_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商',
  `jinjia` varchar(255) DEFAULT NULL COMMENT '商品进价',
  `num` int(11) DEFAULT '0' COMMENT '入库数量',
  `add_time` int(11) DEFAULT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='库存查询';

-- ----------------------------
-- Records of fa_stock
-- ----------------------------
INSERT INTO `fa_stock` VALUES ('1', '1', '1', '1', '3000', '90', '1526546554');
INSERT INTO `fa_stock` VALUES ('2', '1', '2', '1', '3500', '80', '1526546554');
INSERT INTO `fa_stock` VALUES ('5', '2', '2', '2', '3500', '120', '1526698935');
INSERT INTO `fa_stock` VALUES ('6', '2', '1', '2', '3000', '110', '1526698935');

-- ----------------------------
-- Table structure for fa_storage
-- ----------------------------
DROP TABLE IF EXISTS `fa_storage`;
CREATE TABLE `fa_storage` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) NOT NULL COMMENT '仓库编号',
  `name` varchar(40) NOT NULL COMMENT '仓库名称',
  `contact` varchar(16) NOT NULL COMMENT '联系人',
  `phone` varchar(12) NOT NULL COMMENT '电话',
  `desc` mediumtext COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态： 0正常 1禁用',
  `address` varchar(40) DEFAULT NULL COMMENT '仓库地址',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='仓库管理';

-- ----------------------------
-- Records of fa_storage
-- ----------------------------
INSERT INTO `fa_storage` VALUES ('1', '20180517001', '石家庄仓库', '张三', '15023001526', '', '0', '河北省石家庄市', '1526521469');
INSERT INTO `fa_storage` VALUES ('2', '20180517002', '邯郸仓库', '李思', '18610452326', '', '0', '河北省邯郸市', '1526521494');

-- ----------------------------
-- Table structure for fa_supplier
-- ----------------------------
DROP TABLE IF EXISTS `fa_supplier`;
CREATE TABLE `fa_supplier` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) NOT NULL COMMENT '编号',
  `name` varchar(40) NOT NULL COMMENT '名称',
  `contact` varchar(20) NOT NULL COMMENT '联系人',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `email` varchar(40) NOT NULL COMMENT '邮箱',
  `fax` varchar(20) NOT NULL COMMENT '传真',
  `address` varchar(40) NOT NULL COMMENT '地址',
  `desc` mediumtext COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='供应商管理';

-- ----------------------------
-- Records of fa_supplier
-- ----------------------------
INSERT INTO `fa_supplier` VALUES ('1', '5af2a364448e5', '美的集团', '王五', '18510452032', '18510452032@163.com', '18510452032', '河北省美的集团', '', '0', '1525850980');
INSERT INTO `fa_supplier` VALUES ('2', '20180511001', '森马集团', '李华', '14025006532', '14025006532@163.com', '14025006532', '浙江省', '', '0', '1526006167');
INSERT INTO `fa_supplier` VALUES ('3', '20180519001', '苏宁易购', '张华', '15028001450', '15028001450@163.com', '15028001450', '河北省石家庄市', '', '0', '1526716090');

-- ----------------------------
-- Table structure for fa_test
-- ----------------------------
DROP TABLE IF EXISTS `fa_test`;
CREATE TABLE `fa_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '刷新时间(int)',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='测试表';

-- ----------------------------
-- Records of fa_test
-- ----------------------------
INSERT INTO `fa_test` VALUES ('1', '0', '12', '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '0.00', '0', '2017-07-10', '2017-07-10 18:24:45', '2017', '18:24:45', '1499682285', '1499682526', '1499682526', '0', '1', 'normal', '1');

-- ----------------------------
-- Table structure for fa_tiaoku
-- ----------------------------
DROP TABLE IF EXISTS `fa_tiaoku`;
CREATE TABLE `fa_tiaoku` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) DEFAULT NULL COMMENT '编号',
  `author` varchar(20) DEFAULT NULL COMMENT '制单者',
  `supplier` varchar(40) DEFAULT NULL COMMENT '供应商',
  `storage` varchar(100) DEFAULT NULL COMMENT '调出仓库',
  `storageru` varchar(255) DEFAULT NULL COMMENT '调入仓库',
  `location` varchar(50) DEFAULT NULL COMMENT '库位',
  `state` tinyint(1) unsigned DEFAULT '0' COMMENT '状态',
  `type` varchar(40) DEFAULT NULL COMMENT '类型',
  `res` mediumtext COMMENT '物件',
  `desc` mediumtext COMMENT '备注',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '调库时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='调库记录';

-- ----------------------------
-- Records of fa_tiaoku
-- ----------------------------
INSERT INTO `fa_tiaoku` VALUES ('6', '20180523001', 'Admin', null, '1', '2', null, '0', '5', '[[\"1\",\"OPPO R15\",\"10\"],[\"2\",\"VIVO X21\",\"20\"]]', '', '1527062414');

-- ----------------------------
-- Table structure for fa_tui
-- ----------------------------
DROP TABLE IF EXISTS `fa_tui`;
CREATE TABLE `fa_tui` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) DEFAULT NULL COMMENT '编号',
  `buyer` varchar(255) DEFAULT NULL COMMENT '采购者',
  `author` varchar(20) DEFAULT NULL COMMENT '制单者',
  `supplier` varchar(40) DEFAULT NULL COMMENT '供应商',
  `storage` varchar(100) DEFAULT NULL COMMENT '仓库',
  `location` varchar(50) DEFAULT NULL COMMENT '库位',
  `state` tinyint(1) unsigned DEFAULT '0' COMMENT '状态',
  `type` varchar(40) DEFAULT NULL COMMENT '类型',
  `res` mediumtext COMMENT '物件',
  `desc` mediumtext COMMENT '备注',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '退货时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='退货记录';

-- ----------------------------
-- Records of fa_tui
-- ----------------------------
INSERT INTO `fa_tui` VALUES ('1', '20180519002', '王芳', 'Admin', '苏宁易购', null, null, '0', '2', '[[\"3\",\"20180519001\",\"150\",\"1500\",\"OPPO R9S\",\"2500.00\",\"1\"],[\"4\",\"20180519002\",\"100\",\"2000\",\"OPPO R11\",\"3000.00\",\"1\"]]', '', '1526722763');

-- ----------------------------
-- Table structure for fa_unit
-- ----------------------------
DROP TABLE IF EXISTS `fa_unit`;
CREATE TABLE `fa_unit` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '单位名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `desc` mediumtext COMMENT '备注',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='计量单位';

-- ----------------------------
-- Records of fa_unit
-- ----------------------------
INSERT INTO `fa_unit` VALUES ('1', '个', '0', '', '1525850536');
INSERT INTO `fa_unit` VALUES ('2', '箱', '0', '', '1525850626');
INSERT INTO `fa_unit` VALUES ('3', '件', '0', '', '1526006510');

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) NOT NULL DEFAULT '' COMMENT '格言',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `loginip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '加入时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) NOT NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员表';

-- ----------------------------
-- Records of fa_user
-- ----------------------------
INSERT INTO `fa_user` VALUES ('1', '1', 'admin', 'admin', 'c13f62012fd6a8fdf06b3452a94430e5', 'rpR6Bv', 'admin@163.com', '13888888888', '/assets/img/avatar.png', '0', '0', '2017-04-15', '', '0', '1', '1', '1516170492', '1516171614', '127.0.0.1', '0', '127.0.0.1', '1491461418', '0', '1516171614', '', 'normal', '');

-- ----------------------------
-- Table structure for fa_user_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_group`;
CREATE TABLE `fa_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员组表';

-- ----------------------------
-- Records of fa_user_group
-- ----------------------------
INSERT INTO `fa_user_group` VALUES ('1', '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', '1515386468', '1516168298', 'normal');

-- ----------------------------
-- Table structure for fa_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_rule`;
CREATE TABLE `fa_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='会员规则表';

-- ----------------------------
-- Records of fa_user_rule
-- ----------------------------
INSERT INTO `fa_user_rule` VALUES ('1', '0', 'index', '前台', '', '1', '1516168079', '1516168079', '1', 'normal');
INSERT INTO `fa_user_rule` VALUES ('2', '0', 'api', 'API接口', '', '1', '1516168062', '1516168062', '2', 'normal');
INSERT INTO `fa_user_rule` VALUES ('3', '1', 'user', '会员模块', '', '1', '1515386221', '1516168103', '12', 'normal');
INSERT INTO `fa_user_rule` VALUES ('4', '2', 'user', '会员模块', '', '1', '1515386221', '1516168092', '11', 'normal');
INSERT INTO `fa_user_rule` VALUES ('5', '3', 'index/user/login', '登录', '', '0', '1515386247', '1515386247', '5', 'normal');
INSERT INTO `fa_user_rule` VALUES ('6', '3', 'index/user/register', '注册', '', '0', '1515386262', '1516015236', '7', 'normal');
INSERT INTO `fa_user_rule` VALUES ('7', '3', 'index/user/index', '会员中心', '', '0', '1516015012', '1516015012', '9', 'normal');
INSERT INTO `fa_user_rule` VALUES ('8', '3', 'index/user/profile', '个人资料', '', '0', '1516015012', '1516015012', '4', 'normal');
INSERT INTO `fa_user_rule` VALUES ('9', '4', 'api/user/login', '登录', '', '0', '1515386247', '1515386247', '6', 'normal');
INSERT INTO `fa_user_rule` VALUES ('10', '4', 'api/user/register', '注册', '', '0', '1515386262', '1516015236', '8', 'normal');
INSERT INTO `fa_user_rule` VALUES ('11', '4', 'api/user/index', '会员中心', '', '0', '1516015012', '1516015012', '10', 'normal');
INSERT INTO `fa_user_rule` VALUES ('12', '4', 'api/user/profile', '个人资料', '', '0', '1516015012', '1516015012', '3', 'normal');

-- ----------------------------
-- Table structure for fa_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_score_log`;
CREATE TABLE `fa_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员积分变动表';

-- ----------------------------
-- Records of fa_user_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for fa_user_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_token`;
CREATE TABLE `fa_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `expiretime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员Token表';

-- ----------------------------
-- Records of fa_user_token
-- ----------------------------

-- ----------------------------
-- Table structure for fa_version
-- ----------------------------
DROP TABLE IF EXISTS `fa_version`;
CREATE TABLE `fa_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='版本表';

-- ----------------------------
-- Records of fa_version
-- ----------------------------
INSERT INTO `fa_version` VALUES ('1', '1.1.1,2', '1.2.1', '20M', '更新内容', 'https://www.fastadmin.net/download.html', '1', '1520425318', '0', '0', 'normal');
