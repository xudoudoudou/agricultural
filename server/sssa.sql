-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.18 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 vue_cms 的数据库结构
CREATE DATABASE IF NOT EXISTS `vue_cms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `vue_cms`;

-- 导出  表 vue_cms.article 结构
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(10) NOT NULL DEFAULT '' COMMENT '文章标题',
  `description` char(255) NOT NULL DEFAULT '' COMMENT '文章描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文章内容',
  `passed` int(1) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `read_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '阅读权限（参阅用户类型）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发表时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `article_extend` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '扩展信息',
  `maincontent` text COMMENT '产品内容',
  PRIMARY KEY (`id`),
  KEY `sort_id` (`sort_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='文章数据库表';

-- 正在导出表  vue_cms.article 的数据：~22 rows (大约)
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`id`, `sort_id`, `user_id`, `title`, `description`, `content`, `passed`, `read_type`, `create_time`, `update_time`, `article_extend`, `maincontent`) VALUES
	(78, 6, 1, '大幅度', '', '<img src="http://localhost:3001/upFile/1525687132842.jpg"><div><br></div><h2>商品描述</h2><div>啊第三方拉萨的范德萨来看kl</div><div><br></div><div><br></div><div>啊是的弗兰克空间受到法律刻录机看了空间</div><div><br></div><div><img src="http://localhost:3001/upFile/1525687132842.jpg"><br></div><div><br></div><div>阿萨德风口浪尖啊立刻解放阿斯</div><div><br></div><div><br></div><div><br></div><img src="http://localhost:3001/upFile/1526286769326.jpg" />', 0, 4, '2018-05-07 17:59:07', '2018-05-14 16:32:54', '{"pic":"http://localhost:3001/upFile/1526286769326.jpg"}', '好平直'),
	(79, 6, 1, '斯蒂芬', '', '<img src="http://localhost:3001/upFile/1525687227371.jpg" />', 0, 4, '2018-05-07 18:00:29', '2018-05-10 13:03:23', '{"pic":"http://localhost:3001/upFile/1525687227371.jpg"}', '斯蒂芬'),
	(80, 6, 1, '哒哒哒', '', '<img src="http://localhost:3001/upFile/1525690053942.jpg" />', 0, 4, '2018-05-07 18:47:35', '2018-05-10 13:03:23', '{"pic":"http://localhost:3001/upFile/1525690053942.jpg"}', '地球极施化肥，主施生物肥等原生态种植方式。生产以原生态老挝香米、黑糯米农户合作模'),
	(83, 6, 1, '斯蒂芬撒旦法撒', '', '<img src="http://localhost:3001/upFile/1525693351384.jpg" /><img src="http://localhost:3001/upFile/1525693355472.jpg" />', 0, 4, '2018-05-07 19:42:50', '2018-05-10 14:32:16', '{"pic":"http://localhost:3001/upFile/1525693355472.jpg"}', '你好你好年后年后你好你好你好年后年后你好你好你好年后年后你好你好你好年后年后你好你好你好年后年后你好你好你好年后年后你好你好你好年后年后'),
	(91, 8, 1, '农家美味', '', '的是丰富的是的飞洒发送的发生飞洒的飞洒的发生分的撒<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src="http://localhost:3001/upFile/1525764965987.jpg"><img src="http://localhost:3001/upFile/1525764969731.jpg"><img src="http://localhost:3001/upFile/1525764974289.jpg"><img src="http://localhost:3001/upFile/1525764978901.jpg">防撒旦发</div><div><br></div><div><img src="http://localhost:3001/upFile/1525916324587.jpg"><br></div><div><br></div><div>分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分防撒旦发分是的发生的飞洒分萨芬撒的发生飞洒分<img src="http://localhost:3001/upFile/1525915724241.jpg"></div>', 0, 4, '2018-05-08 15:36:21', '2018-05-10 09:39:59', '{"pic":"http://localhost:3001/upFile/1525916324587.jpg"}', '所得发撒发撒地方是地方撒发撒发大赛撒旦发撒'),
	(92, 8, 1, '温室观光', '', '<img src="http://localhost:3001/upFile/1525765559831.jpg" /><img src="http://localhost:3001/upFile/1525765563144.jpg" />', 0, 4, '2018-05-08 15:46:06', '2018-05-10 09:22:54', '{"pic":"http://localhost:3001/upFile/1525765563144.jpg"}', '体验大棚种植，回归田园'),
	(93, 8, 1, '333333333', '', '<img src="http://localhost:3001/upFile/1525765884496.jpg"><font face="sans-serif">发生的地方撒旦法</font>', 0, 4, '2018-05-08 15:51:54', '2018-05-10 09:22:53', '{"pic":"http://localhost:3001/upFile/1525765884496.jpg"}', '是的发生的发生飞洒'),
	(94, 6, 1, '士大夫', '', '<img src="http://localhost:3001/upFile/1525782874206.jpg" /><img src="http://localhost:3001/upFile/1525845935314.jpg" /><img src="http://localhost:3001/upFile/1525846736591.jpg" /><img src="http://localhost:3001/upFile/1525919280447.jpg" />', 0, 4, '2018-05-08 20:35:00', '2018-05-10 14:33:03', '{"pic":"http://localhost:3001/upFile/1525919280447.jpg"}', '你好你好年后年后你好你好你好年后年后你好你好你好年后年后你好你好你好年后年后你好你好你好年后年后你好你好你好年后年后你好你好你好年后年后'),
	(97, 7, 1, '旅游板块', '', '<img src="http://localhost:3001/upFile/1525937796757.jpg" />', 0, 4, '2018-05-10 15:36:38', '2018-05-10 15:41:35', '{"pic":"http://localhost:3001/upFile/1525937796757.jpg"}', '水稻、水果、蔬菜、农副产品、农副土特产、经济作物、经济林木种植；家禽、家畜、水产品养殖及生产销售；农业生产资料的配送'),
	(98, 7, 1, '种植✌', '', '<img src="http://localhost:3001/upFile/1525937842332.jpg" />', 0, 4, '2018-05-10 15:37:24', '2018-05-10 15:41:34', '{"pic":"http://localhost:3001/upFile/1525937842332.jpg"}', '水稻、水果、蔬菜、农副产品、农副土特产、经济作物、经济林木种植；家禽、家畜、水产品养殖及生产销售；农业生产资料的配送'),
	(99, 7, 1, '养殖业✌(＾－＾)V', '', '<img src="http://localhost:3001/upFile/1525937993709.jpg" />', 0, 4, '2018-05-10 15:39:56', '2018-05-10 15:41:33', '{"pic":"http://localhost:3001/upFile/1525937993709.jpg"}', 'xiao?，鱼塘鱼翅xiao?，鱼塘鱼翅xiao?，鱼塘鱼翅xiao?，鱼塘鱼翅xiao?，鱼塘鱼翅xiao?，鱼'),
	(100, 8, 5, 'ceshi删除', '', '<img src="http://localhost:3001/upFile/1526032122567.jpg" /><img src="http://localhost:3001/upFile/1526032127631.jpg" />', 0, 4, '2018-05-11 16:20:32', '2018-05-11 17:48:52', '{"pic":"http://localhost:3001/upFile/1526032127631.jpg"}', '测试'),
	(101, 8, 5, '的萨芬', '', '<img src="http://localhost:3001/upFile/1526031615377.jpg" /><img src="http://localhost:3001/upFile/1526032108049.jpg" />', 0, 4, '2018-05-11 17:40:16', '2018-05-11 17:48:30', '{"pic":"http://localhost:3001/upFile/1526032108049.jpg"}', '斯蒂芬'),
	(103, 8, 1, '抒发抒发', '', '<img src="http://localhost:3001/upFile/1526032772346.jpg" /><img src="http://localhost:3001/upFile/1526032777275.jpg" /><img src="http://localhost:3001/upFile/1526032781980.jpg" />', 1, 4, '2018-05-11 17:59:55', '0000-00-00 00:00:00', '{"pic":"http://localhost:3001/upFile/1526032781980.jpg"}', '萨芬撒发生飞洒发送发生飞洒'),
	(104, 6, 1, '1111111', '', '<img src="http://localhost:3001/upFile/1526032878256.jpg"><div>3三大发射点发333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333三大发射点发333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333三大发射点发333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333三大发射点发333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333三大发射点发333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333三大发射点发333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333三大发射点发333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333三大发射点发333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333三大发射点发33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333</div>', 0, 4, '2018-05-11 18:01:20', '2018-05-11 18:01:48', '{"pic":"http://localhost:3001/upFile/1526032878256.jpg"}', '是的发生飞洒的发生的发生'),
	(105, 6, 1, '斯蒂芬', '', '<img src="http://localhost:3001/upFile/1526032964450.jpg" />', 0, 4, '2018-05-11 18:02:46', '2018-05-11 18:04:39', '{"pic":"http://localhost:3001/upFile/1526032964450.jpg"}', '三大发射点发'),
	(106, 8, 1, '温室观光', '', '<img src="http://localhost:3001/upFile/1525765559831.jpg" /><img src="http://localhost:3001/upFile/1525765563144.jpg" />', 0, 4, '2018-05-08 15:46:06', '2018-05-10 09:22:54', '{"pic":"http://localhost:3001/upFile/1525765563144.jpg"}', '体验大棚种植，回归田园'),
	(107, 8, 1, '温室观光', '', '<img src="http://localhost:3001/upFile/1525765559831.jpg" /><img src="http://localhost:3001/upFile/1525765563144.jpg" />', 0, 4, '2018-05-08 15:46:06', '2018-05-11 18:04:37', '{"pic":"http://localhost:3001/upFile/1525765563144.jpg"}', '体验大棚种植，回归田园'),
	(110, 6, 1, '测试1', '', '<img src="http://localhost:3001/upFile/1526526226366.jpg" />', 0, 4, '2018-05-17 11:03:48', '2018-05-17 11:03:48', '{"pic":"http://localhost:3001/upFile/1526526226366.jpg"}', '随风倒'),
	(111, 6, 1, '方式斯蒂芬', '', '<img src="http://localhost:3001/upFile/1526526245666.jpg" />', 0, 4, '2018-05-17 11:04:08', '2018-05-17 11:04:08', '{"pic":"http://localhost:3001/upFile/1526526245666.jpg"}', '斯蒂芬'),
	(112, 6, 1, '斯蒂芬', '', '<h1><img src="http://localhost:3001/upFile/1526526261630.jpg"><span style="font-size: 12px;">的撒发撒大<font color="#006633">方善待对方发隧道发生的<span style="font-size: 20px;">三大飞洒分</span></font></span><span style="font-size: 16px;"></span></h1><hr>斯蒂芬第三方的 斯蒂芬斯蒂芬森的<div><br></div><div><br></div><div><br></div><div><br></div><div style="line-height: 1.2;"><font color="#9900cc"><span style="font-size: 12px;">发大幅度</span><span style="font-size: 12px;"></span></font></div>', 0, 4, '2018-05-17 11:04:28', '2018-05-17 11:04:28', '{"pic":"http://localhost:3001/upFile/1526526261630.jpg"}', '斯蒂芬'),
	(113, 8, 1, '斯蒂芬', '', '<img src="http://localhost:3001/upFile/1526608256972.jpg" />', 0, 4, '2018-05-18 09:51:01', '2018-05-18 09:51:01', '{"pic":"http://localhost:3001/upFile/1526608256972.jpg"}', '斯蒂芬');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

-- 导出  表 vue_cms.company 结构
CREATE TABLE IF NOT EXISTS `company` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `company` text NOT NULL COMMENT '公司名称',
  `profile` text NOT NULL COMMENT '公司简介',
  `legal` text NOT NULL COMMENT '公司法人',
  `operation` text NOT NULL COMMENT '经营范围',
  `read_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '阅读权限（参阅用户类型）',
  `organ` text COMMENT '发证机关',
  `license` text COMMENT '营业执照号',
  `Registered` text COMMENT '注册资本',
  `operationStateL` text COMMENT '经营状态',
  `companycity` text COMMENT '所属城市',
  `code` text COMMENT '顺企编码',
  `type` text COMMENT '公司性质',
  `companytype` text COMMENT '公司类型',
  `Shareholder` text COMMENT '股东人=法人',
  `post` text COMMENT '股东职位',
  `Supervisorperson` text COMMENT '监事人',
  `establishment` text COMMENT '公司成立日期',
  `addres` text COMMENT '公司地址',
  `Supervisor` text COMMENT '职位监视',
  `phone` text COMMENT '电话',
  `caller` text COMMENT '联系人',
  `email` text COMMENT '邮件',
  `ems` text COMMENT '邮编',
  `introdction` text COMMENT '移动端公司简单介绍',
  `weburl` text COMMENT '网站域名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 正在导出表  vue_cms.company 的数据：1 rows
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`id`, `user_id`, `company`, `profile`, `legal`, `operation`, `read_type`, `organ`, `license`, `Registered`, `operationStateL`, `companycity`, `code`, `type`, `companytype`, `Shareholder`, `post`, `Supervisorperson`, `establishment`, `addres`, `Supervisor`, `phone`, `caller`, `email`, `ems`, `introdction`, `weburl`) VALUES
	(1, 1, '湖南祖源农业发展有限责任公司', '湖南祖源农业发展有限责任公司办公地址位于湖南交通枢纽，重要工业城市衡阳，衡阳 湖南省祁东县太和堂镇江口水库管理所，于2015-06-01 在衡阳工商局注册成立，注册资本为2000万人民币（万元），公司已经公司发展壮大的3年，愿与社会各界同仁携手合作，谋求共同发展，继续为新老客户提供最优秀的产品和服务。我公司主要经营水稻、水果、蔬菜、蔬果，农副产品、农副土特产、经济作物、经济林木种植；家禽、家畜、水产品养殖及生产销售；农业生产资料的配送（不含危险化学品）；农机销售与售后服务；农业技术研发及推广；农业技术咨询与交流；利用自有资金对农业观光休闲及生态旅游项目的投资开发与建设(依法须经批准的项目，经相关部门批准后方可开展...，，我公司与多家衡阳农业公司零售商和代理商建立了长期稳定的合作关系，品种齐全、价格合理，企业实力雄厚，重信用、守合同、保证产品质量，以多品种经营特色和薄利多销的原则，赢得了广大客户的信任，公司始终奉行“诚信求实、致力服务、唯求满意”的企业宗旨，全力跟随客户需求，不断进行产品创新和服务改进。 公司，联系电话为+86-18386293533，期待您的来电咨询！', '刘湘东', '水稻、水果、蔬菜、农副产品、农副土特产、经济作物、经济林木种植；家禽、家畜、水产品养殖及生产销售；农业生产资料的配送（不含危险化学品）；农机销售与售后服务；农业技术研发及推广；农业技术咨询与交流；利用自有资金对农业观光休闲及生态旅游项目的投资开发与建设(依法须经批准的项目，经相关部门批准后方可开展...', 4, '祁东县市场和质量监督管理局', '430426000032313', '\r\n2000万人民币 (万元)', '存续（在营、开业、在册）', '衡阳企业网、祁东县、祁东县太和堂镇', '23005075', '有限责任公司(自然人独资)', '农业公司', '刘湘东', '执行董事兼总经理', '陈田元', '\r\n2015-06-01', '\r\n湖南省祁东县太和堂镇江口水库管理所', '监事', '18386293533', '刘湘东(经理)', '1578771331@qq.com', '421000', '湖南祖源农业发展有限责任公司是一家专注于水稻、水果、蔬菜、蔬果，农副产品、农副土特产、经济作物、经济林木种植；家禽、家畜、水产品养殖及生产销售；农业生产资料的配送（不含危险化学品）；农机销售与售后服务；农业技术研发及推广；农业技术咨询与交流；利用自有资金对农业观光休闲及生态旅游项目的投资开发与建设等。', '\r\nwww.baidu.com');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;

-- 导出  表 vue_cms.product 结构
CREATE TABLE IF NOT EXISTS `product` (
  `title` char(10) DEFAULT NULL COMMENT '产品名称',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` char(50) DEFAULT NULL COMMENT '产品内容',
  `description` char(50) DEFAULT NULL,
  `article_extend` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='产品列表';

-- 正在导出表  vue_cms.product 的数据：3 rows
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`title`, `id`, `content`, `description`, `article_extend`) VALUES
	('aaaaaaa', 1, 'aaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaa', NULL),
	('侧色侧色侧色侧色', 2, '侧色侧色侧色侧色侧色', '侧色侧色侧色侧色', NULL),
	(NULL, 3, '\02<img src="http://localhost:3001/upFile/15257875', NULL, NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 导出  表 vue_cms.sort 结构
CREATE TABLE IF NOT EXISTS `sort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort_name` char(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类父ID',
  `sort_type` char(10) NOT NULL DEFAULT '' COMMENT '分类类别（可定制成新闻、文章、教程等）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- 正在导出表  vue_cms.sort 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `sort` DISABLE KEYS */;
INSERT INTO `sort` (`id`, `sort_name`, `parent_id`, `sort_type`) VALUES
	(6, '产品列表', 0, 'news'),
	(7, '服务列表', 0, 'article'),
	(8, '旅游列表', 0, 'course');
/*!40000 ALTER TABLE `sort` ENABLE KEYS */;

-- 导出  表 vue_cms.upimg 结构
CREATE TABLE IF NOT EXISTS `upimg` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` text NOT NULL COMMENT '图片类型',
  `content` text NOT NULL COMMENT '文章内容',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `article_extend` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '扩展信息',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发表时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='上传图片';

-- 正在导出表  vue_cms.upimg 的数据：2 rows
/*!40000 ALTER TABLE `upimg` DISABLE KEYS */;
INSERT INTO `upimg` (`id`, `name`, `content`, `user_id`, `article_extend`, `create_time`) VALUES
	(29, '旅游版块轮播图', '<img src="http://localhost:3001/upFile/1525829299895.jpg"><img src="http://localhost:3001/upFile/1525846856335.jpg"><img src="http://localhost:3001/upFile/1525846956018.jpg">', 1, '{}', '2018-05-09 09:48:30'),
	(30, '首页轮播图', '<img src="http://localhost:3001/upFile/1525860606532.jpg"><img src="http://localhost:3001/upFile/1525860611350.jpg"><img src="http://localhost:3001/upFile/1525860617542.jpg"><img src="http://localhost:3001/upFile/1525860649083.jpg">11', 1, '{"pic":"http://localhost:3001/upFile/1525860649083.jpg"}', '2018-05-09 09:49:23');
/*!40000 ALTER TABLE `upimg` ENABLE KEYS */;

-- 导出  表 vue_cms.upload 结构
CREATE TABLE IF NOT EXISTS `upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `file_name` char(100) NOT NULL DEFAULT '' COMMENT '文件名称',
  `file_path` char(200) NOT NULL DEFAULT '' COMMENT '文件路径',
  `mime_type` char(50) NOT NULL DEFAULT '' COMMENT '文件类型',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小KB',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COMMENT='上传列表';

-- 正在导出表  vue_cms.upload 的数据：~148 rows (大约)
/*!40000 ALTER TABLE `upload` DISABLE KEYS */;
INSERT INTO `upload` (`id`, `user_id`, `file_name`, `file_path`, `mime_type`, `file_size`, `is_delete`, `create_time`) VALUES
	(34, 1, 'nong1.jpg', 'dist\\upFile\\1525687132842.jpg', 'image/jpeg', 65347, 0, '2018-05-07 17:58:52'),
	(35, 1, 'callbg.jpg', 'dist\\upFile\\1525687141347.jpg', 'image/jpeg', 37047, 0, '2018-05-07 17:59:01'),
	(36, 1, 'fish3.jpg', 'dist\\upFile\\1525687227371.jpg', 'image/jpeg', 33769, 0, '2018-05-07 18:00:27'),
	(37, 1, 'food3.jpg', 'dist\\upFile\\1525690053942.jpg', 'image/jpeg', 70496, 0, '2018-05-07 18:47:33'),
	(38, 1, 'ege.jpg', 'dist\\upFile\\1525691018604.jpg', 'image/jpeg', 605391, 0, '2018-05-07 19:03:38'),
	(39, 1, 'tab2.jpg', 'dist\\upFile\\1525691480473.jpg', 'image/jpeg', 28549, 0, '2018-05-07 19:11:20'),
	(40, 1, 'nong1.jpg', 'dist\\upFile\\1525692652432.jpg', 'image/jpeg', 65347, 0, '2018-05-07 19:30:52'),
	(41, 1, 'food3.jpg', 'dist\\upFile\\1525693126810.jpg', 'image/jpeg', 70496, 0, '2018-05-07 19:38:46'),
	(42, 1, 'banner3.jpg', 'dist\\upFile\\1525693351384.jpg', 'image/jpeg', 221546, 0, '2018-05-07 19:42:31'),
	(43, 1, 'fish3.jpg', 'dist\\upFile\\1525693355472.jpg', 'image/jpeg', 33769, 0, '2018-05-07 19:42:35'),
	(44, 1, 'tab5.jpg', 'dist\\upFile\\1525764867342.jpg', 'image/jpeg', 23472, 0, '2018-05-08 15:34:27'),
	(45, 1, 'food1.jpg', 'dist\\upFile\\1525764879258.jpg', 'image/jpeg', 124988, 0, '2018-05-08 15:34:39'),
	(46, 1, 'nong2.jpg', 'dist\\upFile\\1525764965987.jpg', 'image/jpeg', 71073, 0, '2018-05-08 15:36:06'),
	(47, 1, 'nong3.jpg', 'dist\\upFile\\1525764969731.jpg', 'image/jpeg', 42554, 0, '2018-05-08 15:36:09'),
	(48, 1, 'scenery.jpg', 'dist\\upFile\\1525764974289.jpg', 'image/jpeg', 61585, 0, '2018-05-08 15:36:14'),
	(49, 1, 'nong.jpg', 'dist\\upFile\\1525764978901.jpg', 'image/jpeg', 64396, 0, '2018-05-08 15:36:18'),
	(50, 1, 'tab4.jpg', 'dist\\upFile\\1525765559831.jpg', 'image/jpeg', 87866, 0, '2018-05-08 15:45:59'),
	(51, 1, 'fish3.jpg', 'dist\\upFile\\1525765563144.jpg', 'image/jpeg', 33769, 0, '2018-05-08 15:46:03'),
	(52, 1, 'nong1.jpg', 'dist\\upFile\\1525765884496.jpg', 'image/jpeg', 65347, 0, '2018-05-08 15:51:24'),
	(53, 1, 'food3.jpg', 'dist\\upFile\\1525767144009.jpg', 'image/jpeg', 70496, 0, '2018-05-08 16:12:24'),
	(54, 1, 'banner1.jpg', 'dist\\upFile\\1525772350764.jpg', 'image/jpeg', 217547, 0, '2018-05-08 17:39:10'),
	(55, 1, 'food1.jpg', 'dist\\upFile\\1525772462780.jpg', 'image/jpeg', 124988, 0, '2018-05-08 17:41:02'),
	(56, 1, 'banner1.jpg', 'dist\\upFile\\1525772755783.jpg', 'image/jpeg', 217547, 0, '2018-05-08 17:45:55'),
	(57, 1, 'banner1.jpg', 'dist\\upFile\\1525773752101.jpg', 'image/jpeg', 217547, 0, '2018-05-08 18:02:32'),
	(58, 1, 'fish3.jpg', 'dist\\upFile\\1525774270033.jpg', 'image/jpeg', 33769, 0, '2018-05-08 18:11:10'),
	(59, 1, 'food1.jpg', 'dist\\upFile\\1525774652338.jpg', 'image/jpeg', 124988, 0, '2018-05-08 18:17:32'),
	(60, 1, 'fish3.jpg', 'dist\\upFile\\1525775406934.jpg', 'image/jpeg', 33769, 0, '2018-05-08 18:30:06'),
	(61, 1, 'banner1.jpg', 'dist\\upFile\\1525776017055.jpg', 'image/jpeg', 217547, 0, '2018-05-08 18:40:17'),
	(62, 1, 'banner1.jpg', 'dist\\upFile\\1525777155301.jpg', 'image/jpeg', 217547, 0, '2018-05-08 18:59:15'),
	(63, 1, 'banner1.jpg', 'dist\\upFile\\1525777506432.jpg', 'image/jpeg', 217547, 0, '2018-05-08 19:05:06'),
	(64, 1, 'food1.jpg', 'dist\\upFile\\1525777874077.jpg', 'image/jpeg', 124988, 0, '2018-05-08 19:11:14'),
	(65, 1, 'banner1.jpg', 'dist\\upFile\\1525777949892.jpg', 'image/jpeg', 217547, 0, '2018-05-08 19:12:29'),
	(66, 1, 'banner1.jpg', 'dist\\upFile\\1525778060141.jpg', 'image/jpeg', 217547, 0, '2018-05-08 19:14:20'),
	(67, 1, 'banner1.jpg', 'dist\\upFile\\1525778172528.jpg', 'image/jpeg', 217547, 0, '2018-05-08 19:16:12'),
	(68, 1, 'banner1.jpg', 'dist\\upFile\\1525778842471.jpg', 'image/jpeg', 217547, 0, '2018-05-08 19:27:22'),
	(69, 1, 'banner3.jpg', 'dist\\upFile\\1525779083849.jpg', 'image/jpeg', 221546, 0, '2018-05-08 19:31:23'),
	(70, 1, 'banner3.jpg', 'dist\\upFile\\1525779196503.jpg', 'image/jpeg', 221546, 0, '2018-05-08 19:33:16'),
	(71, 1, 'tab1.jpg', 'dist\\upFile\\1525779217254.jpg', 'image/jpeg', 38340, 0, '2018-05-08 19:33:37'),
	(72, 1, 'banner2.jpg', 'dist\\upFile\\1525779312931.jpg', 'image/jpeg', 237652, 0, '2018-05-08 19:35:12'),
	(73, 1, 'banner3.jpg', 'dist\\upFile\\1525779330467.jpg', 'image/jpeg', 221546, 0, '2018-05-08 19:35:30'),
	(74, 1, 'callbg.jpg', 'dist\\upFile\\1525780119084.jpg', 'image/jpeg', 37047, 0, '2018-05-08 19:48:39'),
	(75, 1, 'banner1.jpg', 'dist\\upFile\\1525781663247.jpg', 'image/jpeg', 217547, 0, '2018-05-08 20:14:23'),
	(76, 1, 'banner3.jpg', 'dist\\upFile\\1525781731145.jpg', 'image/jpeg', 221546, 0, '2018-05-08 20:15:31'),
	(77, 1, 'banner1.jpg', 'dist\\upFile\\1525782040158.jpg', 'image/jpeg', 217547, 0, '2018-05-08 20:20:40'),
	(78, 1, 'food1.jpg', 'dist\\upFile\\1525782147674.jpg', 'image/jpeg', 124988, 0, '2018-05-08 20:22:27'),
	(79, 1, 'banner1.jpg', 'dist\\upFile\\1525782172866.jpg', 'image/jpeg', 217547, 0, '2018-05-08 20:22:52'),
	(80, 1, 'fish3.jpg', 'dist\\upFile\\1525782454136.jpg', 'image/jpeg', 33769, 0, '2018-05-08 20:27:34'),
	(81, 1, 'banner1.jpg', 'dist\\upFile\\1525782642649.jpg', 'image/jpeg', 217547, 0, '2018-05-08 20:30:42'),
	(82, 1, 'fish2.jpg', 'dist\\upFile\\1525782874206.jpg', 'image/jpeg', 44074, 0, '2018-05-08 20:34:34'),
	(83, 1, 'banner1.jpg', 'dist\\upFile\\1525783263067.jpg', 'image/jpeg', 217547, 0, '2018-05-08 20:41:03'),
	(84, 1, 'banner1.jpg', 'dist\\upFile\\1525784395885.jpg', 'image/jpeg', 217547, 0, '2018-05-08 20:59:55'),
	(85, 1, 'banner1.jpg', 'dist\\upFile\\1525784609488.jpg', 'image/jpeg', 217547, 0, '2018-05-08 21:03:29'),
	(86, 1, 'banner1.jpg', 'dist\\upFile\\1525784729762.jpg', 'image/jpeg', 217547, 0, '2018-05-08 21:05:29'),
	(87, 1, 'banner1.jpg', 'dist\\upFile\\1525784877734.jpg', 'image/jpeg', 217547, 0, '2018-05-08 21:07:57'),
	(88, 1, 'food3.jpg', 'dist\\upFile\\1525784900995.jpg', 'image/jpeg', 70496, 0, '2018-05-08 21:08:21'),
	(89, 1, 'food1.jpg', 'dist\\upFile\\1525784929470.jpg', 'image/jpeg', 124988, 0, '2018-05-08 21:08:49'),
	(90, 1, 'scenery.jpg', 'dist\\upFile\\1525785329338.jpg', 'image/jpeg', 61585, 0, '2018-05-08 21:15:29'),
	(91, 1, 'banner1.jpg', 'dist\\upFile\\1525786009520.jpg', 'image/jpeg', 217547, 0, '2018-05-08 21:26:49'),
	(92, 1, 'banner2.jpg', 'dist\\upFile\\1525786412854.jpg', 'image/jpeg', 237652, 0, '2018-05-08 21:33:32'),
	(93, 1, 'banner1.jpg', 'dist\\upFile\\1525786995957.jpg', 'image/jpeg', 217547, 0, '2018-05-08 21:43:16'),
	(94, 1, 'banner2.jpg', 'dist\\upFile\\1525787038277.jpg', 'image/jpeg', 237652, 0, '2018-05-08 21:43:58'),
	(95, 1, 'banner2.jpg', 'dist\\upFile\\1525787230884.jpg', 'image/jpeg', 237652, 0, '2018-05-08 21:47:10'),
	(96, 1, 'banner2.jpg', 'dist\\upFile\\1525787375806.jpg', 'image/jpeg', 237652, 0, '2018-05-08 21:49:35'),
	(97, 1, 'banner2.jpg', 'dist\\upFile\\1525787591076.jpg', 'image/jpeg', 237652, 0, '2018-05-08 21:53:11'),
	(98, 1, 'banner1.jpg', 'dist\\upFile\\1525788074135.jpg', 'image/jpeg', 217547, 0, '2018-05-08 22:01:14'),
	(99, 1, 'banner1.jpg', 'dist\\upFile\\1525788518630.jpg', 'image/jpeg', 217547, 0, '2018-05-08 22:08:38'),
	(100, 1, 'banner3.jpg', 'dist\\upFile\\1525788529757.jpg', 'image/jpeg', 221546, 0, '2018-05-08 22:08:49'),
	(101, 1, 'banner1.jpg', 'dist\\upFile\\1525788574871.jpg', 'image/jpeg', 217547, 0, '2018-05-08 22:09:34'),
	(102, 1, 'fish3.jpg', 'dist\\upFile\\1525788742449.jpg', 'image/jpeg', 33769, 0, '2018-05-08 22:12:22'),
	(103, 1, 'banner2.jpg', 'dist\\upFile\\1525788828575.jpg', 'image/jpeg', 237652, 0, '2018-05-08 22:13:48'),
	(104, 1, 'banner1.jpg', 'dist\\upFile\\1525788843272.jpg', 'image/jpeg', 217547, 0, '2018-05-08 22:14:03'),
	(105, 1, 'banner2.jpg', 'dist\\upFile\\1525788928573.jpg', 'image/jpeg', 237652, 0, '2018-05-08 22:15:28'),
	(106, 1, 'banner1.jpg', 'dist\\upFile\\1525829015262.jpg', 'image/jpeg', 217547, 0, '2018-05-09 09:23:35'),
	(107, 1, 'food1.jpg', 'dist\\upFile\\1525829242993.jpg', 'image/jpeg', 124988, 0, '2018-05-09 09:27:23'),
	(108, 1, 'banner1.jpg', 'dist\\upFile\\1525829299895.jpg', 'image/jpeg', 217547, 0, '2018-05-09 09:28:19'),
	(109, 1, 'callbg.jpg', 'dist\\upFile\\1525830561775.jpg', 'image/jpeg', 37047, 0, '2018-05-09 09:49:21'),
	(110, 1, 'food3.jpg', 'dist\\upFile\\1525842700619.jpg', 'image/jpeg', 70496, 0, '2018-05-09 13:11:40'),
	(111, 1, 'food2.jpg', 'dist\\upFile\\1525843756496.jpg', 'image/jpeg', 117284, 0, '2018-05-09 13:29:16'),
	(112, 1, 'callbg.jpg', 'dist\\upFile\\1525845015196.jpg', 'image/jpeg', 37047, 0, '2018-05-09 13:50:15'),
	(113, 1, 'food3.jpg', 'dist\\upFile\\1525845648752.jpg', 'image/jpeg', 70496, 0, '2018-05-09 14:00:48'),
	(114, 1, 'banner2.jpg', 'dist\\upFile\\1525845835344.jpg', 'image/jpeg', 237652, 0, '2018-05-09 14:03:55'),
	(115, 1, 'food1.jpg', 'dist\\upFile\\1525845935314.jpg', 'image/jpeg', 124988, 0, '2018-05-09 14:05:35'),
	(116, 1, 'tab4.jpg', 'dist\\upFile\\1525846545202.jpg', 'image/jpeg', 87866, 0, '2018-05-09 14:15:45'),
	(117, 1, 'tab1.jpg', 'dist\\upFile\\1525846554219.jpg', 'image/jpeg', 38340, 0, '2018-05-09 14:15:54'),
	(118, 1, 'tab3.jpg', 'dist\\upFile\\1525846569146.jpg', 'image/jpeg', 44970, 0, '2018-05-09 14:16:09'),
	(119, 1, 'banner2.jpg', 'dist\\upFile\\1525846613928.jpg', 'image/jpeg', 237652, 0, '2018-05-09 14:16:53'),
	(120, 1, 'banner3.jpg', 'dist\\upFile\\1525846622351.jpg', 'image/jpeg', 221546, 0, '2018-05-09 14:17:02'),
	(121, 1, 'nong2.jpg', 'dist\\upFile\\1525846736591.jpg', 'image/jpeg', 71073, 0, '2018-05-09 14:18:56'),
	(122, 1, 'banner2.jpg', 'dist\\upFile\\1525846777959.jpg', 'image/jpeg', 237652, 0, '2018-05-09 14:19:38'),
	(123, 1, 'banner3.jpg', 'dist\\upFile\\1525846791802.jpg', 'image/jpeg', 221546, 0, '2018-05-09 14:19:51'),
	(124, 1, 'banner2.jpg', 'dist\\upFile\\1525846856335.jpg', 'image/jpeg', 237652, 0, '2018-05-09 14:20:56'),
	(125, 1, 'banner3.jpg', 'dist\\upFile\\1525846956018.jpg', 'image/jpeg', 221546, 0, '2018-05-09 14:22:36'),
	(126, 1, 'fish1.jpg', 'dist\\upFile\\1525847864768.jpg', 'image/jpeg', 46910, 0, '2018-05-09 14:37:44'),
	(127, 1, 'fish1.jpg', 'dist\\upFile\\1525847930692.jpg', 'image/jpeg', 46910, 0, '2018-05-09 14:38:50'),
	(128, 1, 'fish2.jpg', 'dist\\upFile\\1525847950005.jpg', 'image/jpeg', 44074, 0, '2018-05-09 14:39:10'),
	(129, 1, 'banner3.jpg', 'dist\\upFile\\1525848147927.jpg', 'image/jpeg', 221546, 0, '2018-05-09 14:42:27'),
	(130, 1, 'banner1.jpg', 'dist\\upFile\\1525848807153.jpg', 'image/jpeg', 217547, 0, '2018-05-09 14:53:27'),
	(131, 1, 'banner3.jpg', 'dist\\upFile\\1525848918254.jpg', 'image/jpeg', 221546, 0, '2018-05-09 14:55:18'),
	(132, 1, 'ege.jpg', 'dist\\upFile\\1525848939482.jpg', 'image/jpeg', 605391, 0, '2018-05-09 14:55:39'),
	(133, 1, 'tab3.jpg', 'dist\\upFile\\1525849259474.jpg', 'image/jpeg', 44970, 0, '2018-05-09 15:00:59'),
	(134, 1, 'tab4.jpg', 'dist\\upFile\\1525849265807.jpg', 'image/jpeg', 87866, 0, '2018-05-09 15:01:05'),
	(135, 1, 'fish2.jpg', 'dist\\upFile\\1525849273699.jpg', 'image/jpeg', 44074, 0, '2018-05-09 15:01:13'),
	(136, 1, 'tab2.jpg', 'dist\\upFile\\1525858079497.jpg', 'image/jpeg', 28549, 0, '2018-05-09 17:27:59'),
	(137, 1, 'banner1.jpg', 'dist\\upFile\\1525860281557.jpg', 'image/jpeg', 217547, 0, '2018-05-09 18:04:41'),
	(138, 1, 'banner2.jpg', 'dist\\upFile\\1525860290136.jpg', 'image/jpeg', 237652, 0, '2018-05-09 18:04:50'),
	(139, 1, 'banner3.jpg', 'dist\\upFile\\1525860294129.jpg', 'image/jpeg', 221546, 0, '2018-05-09 18:04:54'),
	(140, 1, 'tab3.jpg', 'dist\\upFile\\1525860572799.jpg', 'image/jpeg', 44970, 0, '2018-05-09 18:09:32'),
	(141, 1, 'tab3.jpg', 'dist\\upFile\\1525860606532.jpg', 'image/jpeg', 44970, 0, '2018-05-09 18:10:06'),
	(142, 1, 'tab2.jpg', 'dist\\upFile\\1525860611350.jpg', 'image/jpeg', 28549, 0, '2018-05-09 18:10:11'),
	(143, 1, 'tab1.jpg', 'dist\\upFile\\1525860617542.jpg', 'image/jpeg', 38340, 0, '2018-05-09 18:10:17'),
	(144, 1, 'tab5.jpg', 'dist\\upFile\\1525860649083.jpg', 'image/jpeg', 23472, 0, '2018-05-09 18:10:49'),
	(145, 1, 'food4.jpg', 'dist\\upFile\\1525867430563.jpg', 'image/jpeg', 68141, 0, '2018-05-09 20:03:50'),
	(146, 1, 'food3.jpg', 'dist\\upFile\\1525869223464.jpg', 'image/jpeg', 70496, 0, '2018-05-09 20:33:43'),
	(147, 1, 'ege.jpg', 'dist\\upFile\\1525915724241.jpg', 'image/jpeg', 605391, 0, '2018-05-10 09:28:44'),
	(148, 1, 'banner1.jpg', 'dist\\upFile\\1525916324587.jpg', 'image/jpeg', 217547, 0, '2018-05-10 09:38:44'),
	(149, 1, 'ege.jpg', 'dist\\upFile\\1525919280447.jpg', 'image/jpeg', 605391, 0, '2018-05-10 10:28:00'),
	(150, 1, 'food3.jpg', 'dist\\upFile\\1525937796757.jpg', 'image/jpeg', 70496, 0, '2018-05-10 15:36:36'),
	(151, 1, 'ege.jpg', 'dist\\upFile\\1525937842332.jpg', 'image/jpeg', 605391, 0, '2018-05-10 15:37:22'),
	(152, 1, 'fish3.jpg', 'dist\\upFile\\1525937993709.jpg', 'image/jpeg', 33769, 0, '2018-05-10 15:39:53'),
	(153, 1, 'food2.jpg', 'dist\\upFile\\1525952764561.jpg', 'image/jpeg', 117284, 0, '2018-05-10 19:46:04'),
	(154, 1, 'nong.jpg', 'dist\\upFile\\1526026533744.jpg', 'image/jpeg', 64396, 0, '2018-05-11 16:15:33'),
	(155, 1, 'nong.jpg', 'dist\\upFile\\1526026717003.jpg', 'image/jpeg', 64396, 0, '2018-05-11 16:18:37'),
	(156, 5, 'banner1.jpg', 'dist\\upFile\\1526026830260.jpg', 'image/jpeg', 217547, 0, '2018-05-11 16:20:30'),
	(157, 5, 'zhutong.jpg', 'dist\\upFile\\1526030847295.jpg', 'image/jpeg', 112778, 0, '2018-05-11 17:27:27'),
	(158, 5, 'zhutong2.jpg', 'dist\\upFile\\1526030852216.jpg', 'image/jpeg', 74161, 0, '2018-05-11 17:27:32'),
	(159, 5, 'zhutong1.jpg', 'dist\\upFile\\1526030858493.jpg', 'image/jpeg', 93018, 0, '2018-05-11 17:27:38'),
	(160, 5, 'zhutong1.jpg', 'dist\\upFile\\1526030904427.jpg', 'image/jpeg', 93018, 0, '2018-05-11 17:28:24'),
	(161, 1, 'nong1.jpg', 'dist\\upFile\\1526031278672.jpg', 'image/jpeg', 65347, 0, '2018-05-11 17:34:38'),
	(162, 5, 'zhutong.jpg', 'dist\\upFile\\1526031615377.jpg', 'image/jpeg', 112778, 0, '2018-05-11 17:40:15'),
	(163, 5, 'zhutong1.jpg', 'dist\\upFile\\1526031630430.jpg', 'image/jpeg', 93018, 0, '2018-05-11 17:40:30'),
	(164, 5, 'zhutong1.jpg', 'dist\\upFile\\1526032108049.jpg', 'image/jpeg', 93018, 0, '2018-05-11 17:48:28'),
	(165, 5, 'zhutong2.jpg', 'dist\\upFile\\1526032122567.jpg', 'image/jpeg', 74161, 0, '2018-05-11 17:48:42'),
	(166, 5, 'zhutong1.jpg', 'dist\\upFile\\1526032127631.jpg', 'image/jpeg', 93018, 0, '2018-05-11 17:48:47'),
	(167, 5, 'fish3.jpg', 'dist\\upFile\\1526032199799.jpg', 'image/jpeg', 33769, 0, '2018-05-11 17:49:59'),
	(168, 1, 'fish3.jpg', 'dist\\upFile\\1526032724962.jpg', 'image/jpeg', 33769, 0, '2018-05-11 17:58:44'),
	(169, 1, 'zhutong2.jpg', 'dist\\upFile\\1526032772346.jpg', 'image/jpeg', 74161, 0, '2018-05-11 17:59:32'),
	(170, 1, 'zhutong1.jpg', 'dist\\upFile\\1526032777275.jpg', 'image/jpeg', 93018, 0, '2018-05-11 17:59:37'),
	(171, 1, 'zhutong.jpg', 'dist\\upFile\\1526032781980.jpg', 'image/jpeg', 112778, 0, '2018-05-11 17:59:42'),
	(172, 1, 'zhutong.jpg', 'dist\\upFile\\1526032878256.jpg', 'image/jpeg', 112778, 0, '2018-05-11 18:01:18'),
	(173, 1, 'zt.jpg', 'dist\\upFile\\1526032964450.jpg', 'image/jpeg', 112220, 0, '2018-05-11 18:02:44'),
	(174, 1, 'food4.jpg', 'dist\\upFile\\1526033069029.jpg', 'image/jpeg', 68141, 0, '2018-05-11 18:04:29'),
	(175, 1, 'fish2.jpg', 'dist\\upFile\\1526033129129.jpg', 'image/jpeg', 44074, 0, '2018-05-11 18:05:29'),
	(176, 1, 'food4.jpg', 'dist\\upFile\\1526261461726.jpg', 'image/jpeg', 68141, 0, '2018-05-14 09:31:01'),
	(177, 1, 'nong3.jpg', 'dist\\upFile\\1526286769326.jpg', 'image/jpeg', 42554, 0, '2018-05-14 16:32:49'),
	(178, 1, 'nong.jpg', 'dist\\upFile\\1526526226366.jpg', 'image/jpeg', 64396, 0, '2018-05-17 11:03:46'),
	(179, 1, 'fish2.jpg', 'dist\\upFile\\1526526245666.jpg', 'image/jpeg', 44074, 0, '2018-05-17 11:04:05'),
	(180, 1, 'food4.jpg', 'dist\\upFile\\1526526261630.jpg', 'image/jpeg', 68141, 0, '2018-05-17 11:04:21'),
	(181, 1, 'scenery.jpg', 'dist\\upFile\\1526608256972.jpg', 'image/jpeg', 61585, 0, '2018-05-18 09:50:56');
/*!40000 ALTER TABLE `upload` ENABLE KEYS */;

-- 导出  表 vue_cms.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` char(50) NOT NULL DEFAULT '' COMMENT '用户帐号',
  `pass_word` char(128) NOT NULL DEFAULT '' COMMENT '用户密码',
  `user_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户类型 0:未审核用户;1:超级管理员;2:普通管理员;3:VIP用户;4:普通用户',
  `user_email` char(128) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `user_extend` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户据库表';

-- 正在导出表  vue_cms.user 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `user_name`, `pass_word`, `user_type`, `user_email`, `create_time`, `login_ip`, `update_time`, `user_pic`, `user_extend`) VALUES
	(1, 'admin', '$2a$10$oe/ovruYdv0EmNsKWLJwfu6Na51whOBRJOAJxBO.yt/C6DxQhdDNK', 1, '10000@qq.com', '0000-00-00 00:00:00', '127.0.0.1', '2018-05-07 17:59:53', 'http://localhost:3001/upFile/1525687141347.jpg', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
