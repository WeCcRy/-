/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : studentdormitory

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 14/05/2024 18:57:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bxlb
-- ----------------------------
DROP TABLE IF EXISTS `bxlb`;
CREATE TABLE `bxlb`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lynumber` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sushe` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `uname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tel` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `bxdate` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `bxtime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `bxdel` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `switchon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bxlb
-- ----------------------------
INSERT INTO `bxlb` VALUES (1, '河南1号楼', '101', '贾玉', '13738275269', '2024-03-01', '	\r\n16:01:01', '空调坏了，不会转了', '1', '0');
INSERT INTO `bxlb` VALUES (2, '河南2号楼', '101', '111', '13738223323', '2024-03-01', '	\r\n16:01:01', '空调坏了，不会转了', '1', '1');
INSERT INTO `bxlb` VALUES (3, '河南1号楼', '102', '张天志', '15734567890', '2024-03-01', '17:30:20', '桌子坏了', '1', '1');
INSERT INTO `bxlb` VALUES (4, '河南1号楼', '103', '贾玉', '13782478900', '2024-03-01', '17:35:20', '灯泡坏了', '1', '1');
INSERT INTO `bxlb` VALUES (5, '河南1号楼', '101', '宋小宝', '13845678901', '2024-03-01', '17:37:33', '柜子坏了', '1', '1');
INSERT INTO `bxlb` VALUES (6, '河南1号楼', '102', '上官发财', '17934567890', '2024-03-01 ', '18:46:44', '风扇坏了', '1', '1');

-- ----------------------------
-- Table structure for bxtj
-- ----------------------------
DROP TABLE IF EXISTS `bxtj`;
CREATE TABLE `bxtj`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tel` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `bxsh` double NOT NULL,
  `clgm` double NOT NULL,
  `lywh` double NOT NULL,
  `total` double NOT NULL,
  `lynumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bxtj
-- ----------------------------
INSERT INTO `bxtj` VALUES (1, '贾宝玉', '137824567890', 1456.3, 1234, 111, 11111, '河南1号楼');
INSERT INTO `bxtj` VALUES (2, '林黛玉', '13782456789', 1234, 5678, 8834, 34567, '河南2号楼');
INSERT INTO `bxtj` VALUES (3, '张三', '13782456293', 111, 111, 111, 333, '河南3号楼');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `commentId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `topicId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hostId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 'c-HpiJ84yR', 'XHivWMLOQzbu', '是 是反差非常差是反恐就啃', '20221313039', '王宇', '2024-03-18 16:05:51');
INSERT INTO `comment` VALUES (2, '2tdIfpqXok', 'XHivWMLOQzbu', '你说的对', '20221313039', '王宇', '2024-03-18 16:06:39');
INSERT INTO `comment` VALUES (3, 'nJj2b0zms6', 'XHivWMLOQzbu', '你说的不对', '20221313039', '王宇', '2024-03-18 16:07:20');
INSERT INTO `comment` VALUES (4, 'Tx22pGi5p2', 'XHivWMLOQzbu', '没错', '20221313039', '王宇', '2024-03-19 14:54:39');
INSERT INTO `comment` VALUES (5, '03WAvYfaaV', 'XHivWMLOQzbu', '我觉得还行', '20221313039', '王宇', '2024-03-19 15:40:47');
INSERT INTO `comment` VALUES (6, 'qA7iqnwF0S', 'XHivWMLOQzbu', '你说的对', '20221313039', '王宇', '2024-03-19 16:03:27');
INSERT INTO `comment` VALUES (7, '5yUe2rQ7qv', 'XHivWMLOQzbu', '没错', '20221313039', '王宇', '2024-03-19 16:04:31');
INSERT INTO `comment` VALUES (8, 'aAuq99Avwv', 'XHivWMLOQzbu', '哈哈哈', '20221313039', '王宇', '2024-03-19 16:04:38');
INSERT INTO `comment` VALUES (9, 'Y_jx-QnaA_', 'XHivWMLOQzbu', '确实', '20221313039', '王宇', '2024-03-19 16:04:43');
INSERT INTO `comment` VALUES (10, 'B0AGrVRxJm', 'XHivWMLOQzbu', '你怎么看', '20221313039', '王宇', '2024-03-19 16:04:46');
INSERT INTO `comment` VALUES (11, 'JoDATO2F_X', 'XHivWMLOQzbu', '你说得对', '20221313039', '王宇', '2024-03-19 16:08:47');
INSERT INTO `comment` VALUES (12, 'm7skiuntJm', 'XHivWMLOQzbu', '我竟的很好', '20221313039', '王宇', '2024-03-19 16:21:47');
INSERT INTO `comment` VALUES (13, 'c_RkLHlRGO', 'nt2aJ1-y4uVr', '我报名', '10000000001', '管理员', '2024-03-20 14:21:52');
INSERT INTO `comment` VALUES (14, 'ATifv2JGiU', 'WcfQzvR8vKGl', '我报名', '20200103105', '鲁智深', '2024-04-10 21:22:26');
INSERT INTO `comment` VALUES (15, 'qHLRqroRB0', 'WcfQzvR8vKGl', '请问名额满了么', '20200102102', '宋小宝', '2024-04-10 21:22:42');
INSERT INTO `comment` VALUES (16, 'dBlQn-xz0g', 'WcfQzvR8vKGl', '微信联系了，麻烦同意一下', '20220102104', '林玖', '2024-04-10 21:26:14');
INSERT INTO `comment` VALUES (27, 'eA9qpLCN62', 'WcfQzvR8vKGl', '请有兴趣的同学添加微信', '10000000001', '管理员', '2024-04-10 21:51:29');

-- ----------------------------
-- Table structure for commentreply
-- ----------------------------
DROP TABLE IF EXISTS `commentreply`;
CREATE TABLE `commentreply`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `commentId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `replyId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reply` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fromId` bigint(0) NULL DEFAULT NULL,
  `fromName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `toId` bigint(0) NULL DEFAULT NULL,
  `toName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commentreply
-- ----------------------------
INSERT INTO `commentreply` VALUES (1, 'c-HpiJ84yR', 'HhjErMaayK', '是的', 20221313039, '王宇', 20221313039, '王宇', '2024-03-19 15:04:41');
INSERT INTO `commentreply` VALUES (2, 'c-HpiJ84yR', '7cwwAj5Ok4', '确实', 20221313039, '王宇', 20221313039, '王宇', '2024-03-19 15:18:45');
INSERT INTO `commentreply` VALUES (3, 'c_RkLHlRGO', 'mFTI4Z816R', '应该如何报名', 10000000001, '管理员', 10000000001, '管理员', '2024-03-20 14:22:07');
INSERT INTO `commentreply` VALUES (4, 'c_RkLHlRGO', 'QlI6rqTK54', '应该如何报名', 10000000001, '管理员', 10000000001, '管理员', '2024-03-20 14:24:05');
INSERT INTO `commentreply` VALUES (5, 'qHLRqroRB0', 'hXJ5va6hQy', '详情请联系微信', 10000000001, '管理员', 20200102102, '宋小宝', '2024-04-10 21:29:43');
INSERT INTO `commentreply` VALUES (6, 'ATifv2JGiU', '1OS2_y8EIx', '请同学添加微信', 10000000001, '管理员', 20200103105, '鲁智深', '2024-04-10 21:52:21');
INSERT INTO `commentreply` VALUES (8, 'ATifv2JGiU', 'IvDMmeDW0w', '已添加', 20221313039, '王宇', 10000000001, '管理员', '2024-04-11 10:43:34');

-- ----------------------------
-- Table structure for dianfei
-- ----------------------------
DROP TABLE IF EXISTS `dianfei`;
CREATE TABLE `dianfei`  (
  `key` int(0) NOT NULL AUTO_INCREMENT,
  `lynumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sushe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dianfei` decimal(10, 2) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dianfei
-- ----------------------------
INSERT INTO `dianfei` VALUES (1, '河南1号楼', '101', 52.12, 0, '2024-01-20');
INSERT INTO `dianfei` VALUES (2, '河南1号楼', '501', 66.66, 1, '2024-02-25');
INSERT INTO `dianfei` VALUES (3, '河南1号楼', '501', 123.00, 0, '2024-02-28');
INSERT INTO `dianfei` VALUES (4, '河南1号楼', '101', 99.00, 1, '2024-03-03');
INSERT INTO `dianfei` VALUES (5, '河南1号楼', '101', 66.00, 0, '2024-03-03');
INSERT INTO `dianfei` VALUES (6, '河南1号楼', '101', 880.00, 1, '2024-03-03');
INSERT INTO `dianfei` VALUES (7, '河南1号楼', '501', 44.00, 0, '2024-04-10');

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `topicId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hostId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `type` int(0) NOT NULL,
  `state` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES (1, '20240312001', '测试', '10000000001', '测试', '2024-03-12 00:00:00', '测试', 0, 0);
INSERT INTO `forum` VALUES (2, 'RoDdgjWT-1ad', '侧视', '10000000001', '管理员', '2024-03-17 15:58:55', '久久久久久', 1, 0);
INSERT INTO `forum` VALUES (3, 'KxPReI2emohE', '侧视', '10000000001', '管理员', '2024-03-17 15:59:03', '久久久久久', 1, 0);
INSERT INTO `forum` VALUES (4, 'cJTyMXsBCdLd', '不好', '10000000001', '管理员', '2024-03-17 16:00:37', '感觉不是很好\n大家怎么看\n666', 0, 0);
INSERT INTO `forum` VALUES (5, 'RPtjMXyIyxE1', '不好', '10000000001', '管理员', '2024-03-17 16:00:38', '感觉不是很好\n大家怎么看\n666', 0, 0);
INSERT INTO `forum` VALUES (6, 'Ip3nAaVZ7HKX', '不好', '10000000001', '管理员', '2024-03-17 16:00:43', '感觉不是很好\n大家怎么看\n666', 0, 0);
INSERT INTO `forum` VALUES (7, '4iBF9JEbqzyP', '招募', '10000000001', '管理员', '2024-03-17 16:02:06', '学校招募员工', 0, 0);
INSERT INTO `forum` VALUES (8, 'CrU4GBXk1eSc', 'dsfsfaf', '10000000001', '管理员', '2024-03-17 16:02:46', '高数不会', 1, 0);
INSERT INTO `forum` VALUES (9, 'XHivWMLOQzbu', 'afa', '10000000001', '管理员', '2024-03-17 18:24:24', 'asfsa\nafa\nafsq\nqqw', 1, 0);
INSERT INTO `forum` VALUES (10, 'tuZybSVOVSKZ', '教材求购', '20221313039', '王宇', '2024-03-19 16:28:04', '有没有人高等数学书不需要了', 1, 1);
INSERT INTO `forum` VALUES (11, 'TtUpfTWYPBQ3', '哈哈哈', '20221313039', '王宇', '2024-03-19 16:28:50', '过线啦', 0, 0);
INSERT INTO `forum` VALUES (12, 'nt2aJ1-y4uVr', '招募', '20221313039', '王宇', '2024-03-19 19:34:31', '明天下午学校需要志愿者两名', 0, 1);
INSERT INTO `forum` VALUES (13, 'WcfQzvR8vKGl', '宿舍园区助手招聘', '10000000001', '管理员', '2024-04-10 21:07:33', '宿舍园区每周五需要志愿者服务，可加第二课堂学分，有意愿的联系微信10010', 1, 1);

-- ----------------------------
-- Table structure for lgpf
-- ----------------------------
DROP TABLE IF EXISTS `lgpf`;
CREATE TABLE `lgpf`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pgf` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fwf` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `zrx` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `total` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `lynumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lgpf
-- ----------------------------
INSERT INTO `lgpf` VALUES (1, '贾宝玉', '2024-03-06 08:34:34', '8', '8', '8', '24', '河南1号楼');
INSERT INTO `lgpf` VALUES (2, '林黛玉', '2024-03-06 09:18:25', '9', '9', '9', '27', '河南2号楼');
INSERT INTO `lgpf` VALUES (3, '张三', '2024-03-06 10:08:02', '9', '9', '9', '27', '河南3号楼');
INSERT INTO `lgpf` VALUES (4, '张柳', '2024-03-06 10:08:52', '9', '9', '9', '27', '河南6号楼');
INSERT INTO `lgpf` VALUES (5, '李四', '2024-03-06 10:17:15', '6', '7', '8', '21', '河南4号楼');
INSERT INTO `lgpf` VALUES (6, '王五', '2024-03-06 10:17:35', '6', '8', '8', '22', '河南5号楼');
INSERT INTO `lgpf` VALUES (7, '张无忌', '2024-03-06 10:18:01', '8', '9', '9', '26', '河南7号楼');
INSERT INTO `lgpf` VALUES (8, '王八', '2024-03-06 10:18:20', '7', '7', '7', '21', '河南8号楼');
INSERT INTO `lgpf` VALUES (9, '李九', '2024-03-06 10:18:37', '9', '9', '9', '27', '河南9号楼');
INSERT INTO `lgpf` VALUES (10, '贾宝玉', '2024-03-06 19:25:25', '9', '9', '9', '27', '河南1号楼');
INSERT INTO `lgpf` VALUES (11, '诸葛亮', '2024-03-12 16:48:17', '10', '10', '10', '30', '河东4号楼');
INSERT INTO `lgpf` VALUES (12, '武松', '2024-04-10 21:03:04', '10', '10', '10', '30', '河东1号楼');

-- ----------------------------
-- Table structure for lynumber
-- ----------------------------
DROP TABLE IF EXISTS `lynumber`;
CREATE TABLE `lynumber`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lynumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `leader` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tel` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `state` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lynumber`(`lynumber`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lynumber
-- ----------------------------
INSERT INTO `lynumber` VALUES (1, '河南1号楼', '贾宝玉', '男', '13812453261', 1);
INSERT INTO `lynumber` VALUES (2, '河南2号楼', '林黛玉', '女', '13812453261', 1);
INSERT INTO `lynumber` VALUES (3, '河南3号楼', '贾政', '男', '13812453261', 1);
INSERT INTO `lynumber` VALUES (4, '河南4号楼', '王熙凤', '女', '13812453261', 1);
INSERT INTO `lynumber` VALUES (5, '河南5号楼', '薛宝钗', '女', '13812453261', 1);
INSERT INTO `lynumber` VALUES (6, '河南6号楼', '孙悟空', '男', '13812453261', 1);
INSERT INTO `lynumber` VALUES (7, '河南7号楼', '猪八戒', '男', '13812453261', 1);
INSERT INTO `lynumber` VALUES (8, '河南8号楼', '唐三藏', '男', '13812453261', 1);
INSERT INTO `lynumber` VALUES (9, '河南9号楼', '沙和尚', '男', '13812453261', 1);
INSERT INTO `lynumber` VALUES (10, '河南10号楼', '宋江', '男', '13812453261', 1);
INSERT INTO `lynumber` VALUES (11, '河东1号楼', '武松', '男', '13812453261', 1);
INSERT INTO `lynumber` VALUES (12, '河东2号楼', '鲁智深', '男', '13812453261', 1);
INSERT INTO `lynumber` VALUES (13, '河东3号楼', '曹操', '男', '13812453261', 1);
INSERT INTO `lynumber` VALUES (14, '河东4号楼', '诸葛亮', '男', '13812453261', 1);
INSERT INTO `lynumber` VALUES (15, '河东5号楼', '刘备', '男', '13812453261', 1);
INSERT INTO `lynumber` VALUES (16, '河东6号楼', '张飞', '男', '13812453261', 1);
INSERT INTO `lynumber` VALUES (17, '河东7号楼', '赵云', '男', '13812453261', 1);
INSERT INTO `lynumber` VALUES (18, '河东8号楼', '貂蝉', '女', '13812453261', 1);
INSERT INTO `lynumber` VALUES (19, '河东9号楼', '西施', '女', '13822453261', 1);
INSERT INTO `lynumber` VALUES (20, '河东10号楼', '王思聪', '男', '13838238399', 1);

-- ----------------------------
-- Table structure for sspf
-- ----------------------------
DROP TABLE IF EXISTS `sspf`;
CREATE TABLE `sspf`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lynumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sushe` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `time` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `beizi` tinyint(0) NOT NULL,
  `zhuomian` tinyint(0) NOT NULL,
  `xiezi` tinyint(0) NOT NULL,
  `dimian` tinyint(0) NOT NULL,
  `yangtai` tinyint(0) NOT NULL,
  `taipen` tinyint(0) NOT NULL,
  `linyufang` tinyint(0) NOT NULL,
  `weishengjian` tinyint(0) NOT NULL,
  `total` tinyint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sspf
-- ----------------------------
INSERT INTO `sspf` VALUES (1, '河南1号楼', '101', '2024-1-9', 2, 3, 3, 2, 2, 2, 2, 2, 18);
INSERT INTO `sspf` VALUES (2, '河南1号楼', '102', '2024-1-9', 2, 3, 3, 2, 2, 2, 2, 1, 17);
INSERT INTO `sspf` VALUES (16, '河南1号楼', '501', '2024-03-17', 3, 3, 3, 3, 2, 2, 2, 2, 20);
INSERT INTO `sspf` VALUES (17, '河南1号楼', '501', '2024-04-10', 3, 3, 3, 3, 2, 2, 2, 2, 20);
INSERT INTO `sspf` VALUES (18, '河南1号楼', '102', '2024-04-10', 2, 2, 2, 2, 2, 2, 2, 2, 16);
INSERT INTO `sspf` VALUES (19, '河南1号楼', '201', '2024-04-10', 2, 2, 1, 2, 2, 2, 1, 1, 13);

-- ----------------------------
-- Table structure for sushe
-- ----------------------------
DROP TABLE IF EXISTS `sushe`;
CREATE TABLE `sushe`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `lynumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sushe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `maxsize` int(0) NOT NULL,
  `isFull` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 801 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sushe
-- ----------------------------
INSERT INTO `sushe` VALUES (2, '河南1号楼', '101', 4, 0);
INSERT INTO `sushe` VALUES (3, '河南1号楼', '102', 4, 1);
INSERT INTO `sushe` VALUES (4, '河南1号楼', '103', 4, 0);
INSERT INTO `sushe` VALUES (5, '河南1号楼', '104', 4, 0);
INSERT INTO `sushe` VALUES (6, '河南1号楼', '105', 4, 0);
INSERT INTO `sushe` VALUES (7, '河南1号楼', '106', 4, 0);
INSERT INTO `sushe` VALUES (8, '河南1号楼', '107', 4, 0);
INSERT INTO `sushe` VALUES (9, '河南1号楼', '108', 4, 0);
INSERT INTO `sushe` VALUES (10, '河南1号楼', '201', 4, 0);
INSERT INTO `sushe` VALUES (11, '河南1号楼', '202', 4, 0);
INSERT INTO `sushe` VALUES (12, '河南1号楼', '203', 4, 0);
INSERT INTO `sushe` VALUES (13, '河南1号楼', '204', 4, 0);
INSERT INTO `sushe` VALUES (14, '河南1号楼', '205', 4, 0);
INSERT INTO `sushe` VALUES (15, '河南1号楼', '206', 4, 0);
INSERT INTO `sushe` VALUES (16, '河南1号楼', '207', 4, 0);
INSERT INTO `sushe` VALUES (17, '河南1号楼', '208', 4, 0);
INSERT INTO `sushe` VALUES (18, '河南1号楼', '301', 4, 0);
INSERT INTO `sushe` VALUES (19, '河南1号楼', '302', 4, 0);
INSERT INTO `sushe` VALUES (20, '河南1号楼', '303', 4, 0);
INSERT INTO `sushe` VALUES (21, '河南1号楼', '304', 4, 0);
INSERT INTO `sushe` VALUES (22, '河南1号楼', '305', 4, 0);
INSERT INTO `sushe` VALUES (23, '河南1号楼', '306', 4, 0);
INSERT INTO `sushe` VALUES (24, '河南1号楼', '307', 4, 0);
INSERT INTO `sushe` VALUES (25, '河南1号楼', '308', 4, 0);
INSERT INTO `sushe` VALUES (26, '河南1号楼', '401', 4, 0);
INSERT INTO `sushe` VALUES (27, '河南1号楼', '402', 4, 0);
INSERT INTO `sushe` VALUES (28, '河南1号楼', '403', 4, 0);
INSERT INTO `sushe` VALUES (29, '河南1号楼', '404', 4, 0);
INSERT INTO `sushe` VALUES (30, '河南1号楼', '405', 4, 0);
INSERT INTO `sushe` VALUES (31, '河南1号楼', '406', 4, 0);
INSERT INTO `sushe` VALUES (32, '河南1号楼', '407', 4, 0);
INSERT INTO `sushe` VALUES (33, '河南1号楼', '408', 4, 0);
INSERT INTO `sushe` VALUES (34, '河南1号楼', '501', 4, 0);
INSERT INTO `sushe` VALUES (35, '河南1号楼', '502', 4, 0);
INSERT INTO `sushe` VALUES (36, '河南1号楼', '503', 4, 0);
INSERT INTO `sushe` VALUES (37, '河南1号楼', '504', 4, 0);
INSERT INTO `sushe` VALUES (38, '河南1号楼', '505', 4, 0);
INSERT INTO `sushe` VALUES (39, '河南1号楼', '506', 4, 0);
INSERT INTO `sushe` VALUES (40, '河南1号楼', '507', 4, 0);
INSERT INTO `sushe` VALUES (41, '河南1号楼', '508', 4, 0);
INSERT INTO `sushe` VALUES (42, '河南2号楼', '101', 4, 0);
INSERT INTO `sushe` VALUES (43, '河南2号楼', '102', 4, 0);
INSERT INTO `sushe` VALUES (44, '河南2号楼', '103', 4, 0);
INSERT INTO `sushe` VALUES (45, '河南2号楼', '104', 4, 0);
INSERT INTO `sushe` VALUES (46, '河南2号楼', '105', 4, 0);
INSERT INTO `sushe` VALUES (47, '河南2号楼', '106', 4, 0);
INSERT INTO `sushe` VALUES (48, '河南2号楼', '107', 4, 0);
INSERT INTO `sushe` VALUES (49, '河南2号楼', '108', 4, 0);
INSERT INTO `sushe` VALUES (50, '河南2号楼', '201', 4, 0);
INSERT INTO `sushe` VALUES (51, '河南2号楼', '202', 4, 0);
INSERT INTO `sushe` VALUES (52, '河南2号楼', '203', 4, 0);
INSERT INTO `sushe` VALUES (53, '河南2号楼', '204', 4, 0);
INSERT INTO `sushe` VALUES (54, '河南2号楼', '205', 4, 0);
INSERT INTO `sushe` VALUES (55, '河南2号楼', '206', 4, 0);
INSERT INTO `sushe` VALUES (56, '河南2号楼', '207', 4, 0);
INSERT INTO `sushe` VALUES (57, '河南2号楼', '208', 4, 0);
INSERT INTO `sushe` VALUES (58, '河南2号楼', '301', 4, 0);
INSERT INTO `sushe` VALUES (59, '河南2号楼', '302', 4, 0);
INSERT INTO `sushe` VALUES (60, '河南2号楼', '303', 4, 0);
INSERT INTO `sushe` VALUES (61, '河南2号楼', '304', 4, 0);
INSERT INTO `sushe` VALUES (62, '河南2号楼', '305', 4, 0);
INSERT INTO `sushe` VALUES (63, '河南2号楼', '306', 4, 0);
INSERT INTO `sushe` VALUES (64, '河南2号楼', '307', 4, 0);
INSERT INTO `sushe` VALUES (65, '河南2号楼', '308', 4, 0);
INSERT INTO `sushe` VALUES (66, '河南2号楼', '401', 4, 0);
INSERT INTO `sushe` VALUES (67, '河南2号楼', '402', 4, 0);
INSERT INTO `sushe` VALUES (68, '河南2号楼', '403', 4, 0);
INSERT INTO `sushe` VALUES (69, '河南2号楼', '404', 4, 0);
INSERT INTO `sushe` VALUES (70, '河南2号楼', '405', 4, 0);
INSERT INTO `sushe` VALUES (71, '河南2号楼', '406', 4, 0);
INSERT INTO `sushe` VALUES (72, '河南2号楼', '407', 4, 0);
INSERT INTO `sushe` VALUES (73, '河南2号楼', '408', 4, 0);
INSERT INTO `sushe` VALUES (74, '河南2号楼', '501', 4, 0);
INSERT INTO `sushe` VALUES (75, '河南2号楼', '502', 4, 0);
INSERT INTO `sushe` VALUES (76, '河南2号楼', '503', 4, 0);
INSERT INTO `sushe` VALUES (77, '河南2号楼', '504', 4, 0);
INSERT INTO `sushe` VALUES (78, '河南2号楼', '505', 4, 0);
INSERT INTO `sushe` VALUES (79, '河南2号楼', '506', 4, 0);
INSERT INTO `sushe` VALUES (80, '河南2号楼', '507', 4, 0);
INSERT INTO `sushe` VALUES (81, '河南2号楼', '508', 4, 0);
INSERT INTO `sushe` VALUES (82, '河南3号楼', '101', 4, 0);
INSERT INTO `sushe` VALUES (83, '河南3号楼', '102', 4, 0);
INSERT INTO `sushe` VALUES (84, '河南3号楼', '103', 4, 0);
INSERT INTO `sushe` VALUES (85, '河南3号楼', '104', 4, 0);
INSERT INTO `sushe` VALUES (86, '河南3号楼', '105', 4, 0);
INSERT INTO `sushe` VALUES (87, '河南3号楼', '106', 4, 0);
INSERT INTO `sushe` VALUES (88, '河南3号楼', '107', 4, 0);
INSERT INTO `sushe` VALUES (89, '河南3号楼', '108', 4, 0);
INSERT INTO `sushe` VALUES (90, '河南3号楼', '201', 4, 0);
INSERT INTO `sushe` VALUES (91, '河南3号楼', '202', 4, 0);
INSERT INTO `sushe` VALUES (92, '河南3号楼', '203', 4, 0);
INSERT INTO `sushe` VALUES (93, '河南3号楼', '204', 4, 0);
INSERT INTO `sushe` VALUES (94, '河南3号楼', '205', 4, 0);
INSERT INTO `sushe` VALUES (95, '河南3号楼', '206', 4, 0);
INSERT INTO `sushe` VALUES (96, '河南3号楼', '207', 4, 0);
INSERT INTO `sushe` VALUES (97, '河南3号楼', '208', 4, 0);
INSERT INTO `sushe` VALUES (98, '河南3号楼', '301', 4, 0);
INSERT INTO `sushe` VALUES (99, '河南3号楼', '302', 4, 0);
INSERT INTO `sushe` VALUES (100, '河南3号楼', '303', 4, 0);
INSERT INTO `sushe` VALUES (101, '河南3号楼', '304', 4, 0);
INSERT INTO `sushe` VALUES (102, '河南3号楼', '305', 4, 0);
INSERT INTO `sushe` VALUES (103, '河南3号楼', '306', 4, 0);
INSERT INTO `sushe` VALUES (104, '河南3号楼', '307', 4, 0);
INSERT INTO `sushe` VALUES (105, '河南3号楼', '308', 4, 0);
INSERT INTO `sushe` VALUES (106, '河南3号楼', '401', 4, 0);
INSERT INTO `sushe` VALUES (107, '河南3号楼', '402', 4, 0);
INSERT INTO `sushe` VALUES (108, '河南3号楼', '403', 4, 0);
INSERT INTO `sushe` VALUES (109, '河南3号楼', '404', 4, 0);
INSERT INTO `sushe` VALUES (110, '河南3号楼', '405', 4, 0);
INSERT INTO `sushe` VALUES (111, '河南3号楼', '406', 4, 0);
INSERT INTO `sushe` VALUES (112, '河南3号楼', '407', 4, 0);
INSERT INTO `sushe` VALUES (113, '河南3号楼', '408', 4, 0);
INSERT INTO `sushe` VALUES (114, '河南3号楼', '501', 4, 0);
INSERT INTO `sushe` VALUES (115, '河南3号楼', '502', 4, 0);
INSERT INTO `sushe` VALUES (116, '河南3号楼', '503', 4, 0);
INSERT INTO `sushe` VALUES (117, '河南3号楼', '504', 4, 0);
INSERT INTO `sushe` VALUES (118, '河南3号楼', '505', 4, 0);
INSERT INTO `sushe` VALUES (119, '河南3号楼', '506', 4, 0);
INSERT INTO `sushe` VALUES (120, '河南3号楼', '507', 4, 0);
INSERT INTO `sushe` VALUES (121, '河南3号楼', '508', 4, 0);
INSERT INTO `sushe` VALUES (122, '河南4号楼', '101', 4, 0);
INSERT INTO `sushe` VALUES (123, '河南4号楼', '102', 4, 0);
INSERT INTO `sushe` VALUES (124, '河南4号楼', '103', 4, 0);
INSERT INTO `sushe` VALUES (125, '河南4号楼', '104', 4, 0);
INSERT INTO `sushe` VALUES (126, '河南4号楼', '105', 4, 0);
INSERT INTO `sushe` VALUES (127, '河南4号楼', '106', 4, 0);
INSERT INTO `sushe` VALUES (128, '河南4号楼', '107', 4, 0);
INSERT INTO `sushe` VALUES (129, '河南4号楼', '108', 4, 0);
INSERT INTO `sushe` VALUES (130, '河南4号楼', '201', 4, 0);
INSERT INTO `sushe` VALUES (131, '河南4号楼', '202', 4, 0);
INSERT INTO `sushe` VALUES (132, '河南4号楼', '203', 4, 0);
INSERT INTO `sushe` VALUES (133, '河南4号楼', '204', 4, 0);
INSERT INTO `sushe` VALUES (134, '河南4号楼', '205', 4, 0);
INSERT INTO `sushe` VALUES (135, '河南4号楼', '206', 4, 0);
INSERT INTO `sushe` VALUES (136, '河南4号楼', '207', 4, 0);
INSERT INTO `sushe` VALUES (137, '河南4号楼', '208', 4, 0);
INSERT INTO `sushe` VALUES (138, '河南4号楼', '301', 4, 0);
INSERT INTO `sushe` VALUES (139, '河南4号楼', '302', 4, 0);
INSERT INTO `sushe` VALUES (140, '河南4号楼', '303', 4, 0);
INSERT INTO `sushe` VALUES (141, '河南4号楼', '304', 4, 0);
INSERT INTO `sushe` VALUES (142, '河南4号楼', '305', 4, 0);
INSERT INTO `sushe` VALUES (143, '河南4号楼', '306', 4, 0);
INSERT INTO `sushe` VALUES (144, '河南4号楼', '307', 4, 0);
INSERT INTO `sushe` VALUES (145, '河南4号楼', '308', 4, 0);
INSERT INTO `sushe` VALUES (146, '河南4号楼', '401', 4, 0);
INSERT INTO `sushe` VALUES (147, '河南4号楼', '402', 4, 0);
INSERT INTO `sushe` VALUES (148, '河南4号楼', '403', 4, 0);
INSERT INTO `sushe` VALUES (149, '河南4号楼', '404', 4, 0);
INSERT INTO `sushe` VALUES (150, '河南4号楼', '405', 4, 0);
INSERT INTO `sushe` VALUES (151, '河南4号楼', '406', 4, 0);
INSERT INTO `sushe` VALUES (152, '河南4号楼', '407', 4, 0);
INSERT INTO `sushe` VALUES (153, '河南4号楼', '408', 4, 0);
INSERT INTO `sushe` VALUES (154, '河南4号楼', '501', 4, 0);
INSERT INTO `sushe` VALUES (155, '河南4号楼', '502', 4, 0);
INSERT INTO `sushe` VALUES (156, '河南4号楼', '503', 4, 0);
INSERT INTO `sushe` VALUES (157, '河南4号楼', '504', 4, 0);
INSERT INTO `sushe` VALUES (158, '河南4号楼', '505', 4, 0);
INSERT INTO `sushe` VALUES (159, '河南4号楼', '506', 4, 0);
INSERT INTO `sushe` VALUES (160, '河南4号楼', '507', 4, 0);
INSERT INTO `sushe` VALUES (161, '河南4号楼', '508', 4, 0);
INSERT INTO `sushe` VALUES (162, '河南5号楼', '101', 4, 0);
INSERT INTO `sushe` VALUES (163, '河南5号楼', '102', 4, 0);
INSERT INTO `sushe` VALUES (164, '河南5号楼', '103', 4, 0);
INSERT INTO `sushe` VALUES (165, '河南5号楼', '104', 4, 0);
INSERT INTO `sushe` VALUES (166, '河南5号楼', '105', 4, 0);
INSERT INTO `sushe` VALUES (167, '河南5号楼', '106', 4, 0);
INSERT INTO `sushe` VALUES (168, '河南5号楼', '107', 4, 0);
INSERT INTO `sushe` VALUES (169, '河南5号楼', '108', 4, 0);
INSERT INTO `sushe` VALUES (170, '河南5号楼', '201', 4, 0);
INSERT INTO `sushe` VALUES (171, '河南5号楼', '202', 4, 0);
INSERT INTO `sushe` VALUES (172, '河南5号楼', '203', 4, 0);
INSERT INTO `sushe` VALUES (173, '河南5号楼', '204', 4, 0);
INSERT INTO `sushe` VALUES (174, '河南5号楼', '205', 4, 0);
INSERT INTO `sushe` VALUES (175, '河南5号楼', '206', 4, 0);
INSERT INTO `sushe` VALUES (176, '河南5号楼', '207', 4, 0);
INSERT INTO `sushe` VALUES (177, '河南5号楼', '208', 4, 0);
INSERT INTO `sushe` VALUES (178, '河南5号楼', '301', 4, 0);
INSERT INTO `sushe` VALUES (179, '河南5号楼', '302', 4, 0);
INSERT INTO `sushe` VALUES (180, '河南5号楼', '303', 4, 0);
INSERT INTO `sushe` VALUES (181, '河南5号楼', '304', 4, 0);
INSERT INTO `sushe` VALUES (182, '河南5号楼', '305', 4, 0);
INSERT INTO `sushe` VALUES (183, '河南5号楼', '306', 4, 0);
INSERT INTO `sushe` VALUES (184, '河南5号楼', '307', 4, 0);
INSERT INTO `sushe` VALUES (185, '河南5号楼', '308', 4, 0);
INSERT INTO `sushe` VALUES (186, '河南5号楼', '401', 4, 0);
INSERT INTO `sushe` VALUES (187, '河南5号楼', '402', 4, 0);
INSERT INTO `sushe` VALUES (188, '河南5号楼', '403', 4, 0);
INSERT INTO `sushe` VALUES (189, '河南5号楼', '404', 4, 0);
INSERT INTO `sushe` VALUES (190, '河南5号楼', '405', 4, 0);
INSERT INTO `sushe` VALUES (191, '河南5号楼', '406', 4, 0);
INSERT INTO `sushe` VALUES (192, '河南5号楼', '407', 4, 0);
INSERT INTO `sushe` VALUES (193, '河南5号楼', '408', 4, 0);
INSERT INTO `sushe` VALUES (194, '河南5号楼', '501', 4, 0);
INSERT INTO `sushe` VALUES (195, '河南5号楼', '502', 4, 0);
INSERT INTO `sushe` VALUES (196, '河南5号楼', '503', 4, 0);
INSERT INTO `sushe` VALUES (197, '河南5号楼', '504', 4, 0);
INSERT INTO `sushe` VALUES (198, '河南5号楼', '505', 4, 0);
INSERT INTO `sushe` VALUES (199, '河南5号楼', '506', 4, 0);
INSERT INTO `sushe` VALUES (200, '河南5号楼', '507', 4, 0);
INSERT INTO `sushe` VALUES (201, '河南5号楼', '508', 4, 0);
INSERT INTO `sushe` VALUES (202, '河南6号楼', '101', 4, 0);
INSERT INTO `sushe` VALUES (203, '河南6号楼', '102', 4, 0);
INSERT INTO `sushe` VALUES (204, '河南6号楼', '103', 4, 0);
INSERT INTO `sushe` VALUES (205, '河南6号楼', '104', 4, 0);
INSERT INTO `sushe` VALUES (206, '河南6号楼', '105', 4, 0);
INSERT INTO `sushe` VALUES (207, '河南6号楼', '106', 4, 0);
INSERT INTO `sushe` VALUES (208, '河南6号楼', '107', 4, 0);
INSERT INTO `sushe` VALUES (209, '河南6号楼', '108', 4, 0);
INSERT INTO `sushe` VALUES (210, '河南6号楼', '201', 4, 0);
INSERT INTO `sushe` VALUES (211, '河南6号楼', '202', 4, 0);
INSERT INTO `sushe` VALUES (212, '河南6号楼', '203', 4, 0);
INSERT INTO `sushe` VALUES (213, '河南6号楼', '204', 4, 0);
INSERT INTO `sushe` VALUES (214, '河南6号楼', '205', 4, 0);
INSERT INTO `sushe` VALUES (215, '河南6号楼', '206', 4, 0);
INSERT INTO `sushe` VALUES (216, '河南6号楼', '207', 4, 0);
INSERT INTO `sushe` VALUES (217, '河南6号楼', '208', 4, 0);
INSERT INTO `sushe` VALUES (218, '河南6号楼', '301', 4, 0);
INSERT INTO `sushe` VALUES (219, '河南6号楼', '302', 4, 0);
INSERT INTO `sushe` VALUES (220, '河南6号楼', '303', 4, 0);
INSERT INTO `sushe` VALUES (221, '河南6号楼', '304', 4, 0);
INSERT INTO `sushe` VALUES (222, '河南6号楼', '305', 4, 0);
INSERT INTO `sushe` VALUES (223, '河南6号楼', '306', 4, 0);
INSERT INTO `sushe` VALUES (224, '河南6号楼', '307', 4, 0);
INSERT INTO `sushe` VALUES (225, '河南6号楼', '308', 4, 0);
INSERT INTO `sushe` VALUES (226, '河南6号楼', '401', 4, 0);
INSERT INTO `sushe` VALUES (227, '河南6号楼', '402', 4, 0);
INSERT INTO `sushe` VALUES (228, '河南6号楼', '403', 4, 0);
INSERT INTO `sushe` VALUES (229, '河南6号楼', '404', 4, 0);
INSERT INTO `sushe` VALUES (230, '河南6号楼', '405', 4, 0);
INSERT INTO `sushe` VALUES (231, '河南6号楼', '406', 4, 0);
INSERT INTO `sushe` VALUES (232, '河南6号楼', '407', 4, 0);
INSERT INTO `sushe` VALUES (233, '河南6号楼', '408', 4, 0);
INSERT INTO `sushe` VALUES (234, '河南6号楼', '501', 4, 0);
INSERT INTO `sushe` VALUES (235, '河南6号楼', '502', 4, 0);
INSERT INTO `sushe` VALUES (236, '河南6号楼', '503', 4, 0);
INSERT INTO `sushe` VALUES (237, '河南6号楼', '504', 4, 0);
INSERT INTO `sushe` VALUES (238, '河南6号楼', '505', 4, 0);
INSERT INTO `sushe` VALUES (239, '河南6号楼', '506', 4, 0);
INSERT INTO `sushe` VALUES (240, '河南6号楼', '507', 4, 0);
INSERT INTO `sushe` VALUES (241, '河南6号楼', '508', 4, 0);
INSERT INTO `sushe` VALUES (242, '河南7号楼', '101', 4, 0);
INSERT INTO `sushe` VALUES (243, '河南7号楼', '102', 4, 0);
INSERT INTO `sushe` VALUES (244, '河南7号楼', '103', 4, 0);
INSERT INTO `sushe` VALUES (245, '河南7号楼', '104', 4, 0);
INSERT INTO `sushe` VALUES (246, '河南7号楼', '105', 4, 0);
INSERT INTO `sushe` VALUES (247, '河南7号楼', '106', 4, 0);
INSERT INTO `sushe` VALUES (248, '河南7号楼', '107', 4, 0);
INSERT INTO `sushe` VALUES (249, '河南7号楼', '108', 4, 0);
INSERT INTO `sushe` VALUES (250, '河南7号楼', '201', 4, 0);
INSERT INTO `sushe` VALUES (251, '河南7号楼', '202', 4, 0);
INSERT INTO `sushe` VALUES (252, '河南7号楼', '203', 4, 0);
INSERT INTO `sushe` VALUES (253, '河南7号楼', '204', 4, 0);
INSERT INTO `sushe` VALUES (254, '河南7号楼', '205', 4, 0);
INSERT INTO `sushe` VALUES (255, '河南7号楼', '206', 4, 0);
INSERT INTO `sushe` VALUES (256, '河南7号楼', '207', 4, 0);
INSERT INTO `sushe` VALUES (257, '河南7号楼', '208', 4, 0);
INSERT INTO `sushe` VALUES (258, '河南7号楼', '301', 4, 0);
INSERT INTO `sushe` VALUES (259, '河南7号楼', '302', 4, 0);
INSERT INTO `sushe` VALUES (260, '河南7号楼', '303', 4, 0);
INSERT INTO `sushe` VALUES (261, '河南7号楼', '304', 4, 0);
INSERT INTO `sushe` VALUES (262, '河南7号楼', '305', 4, 0);
INSERT INTO `sushe` VALUES (263, '河南7号楼', '306', 4, 0);
INSERT INTO `sushe` VALUES (264, '河南7号楼', '307', 4, 0);
INSERT INTO `sushe` VALUES (265, '河南7号楼', '308', 4, 0);
INSERT INTO `sushe` VALUES (266, '河南7号楼', '401', 4, 0);
INSERT INTO `sushe` VALUES (267, '河南7号楼', '402', 4, 0);
INSERT INTO `sushe` VALUES (268, '河南7号楼', '403', 4, 0);
INSERT INTO `sushe` VALUES (269, '河南7号楼', '404', 4, 0);
INSERT INTO `sushe` VALUES (270, '河南7号楼', '405', 4, 0);
INSERT INTO `sushe` VALUES (271, '河南7号楼', '406', 4, 0);
INSERT INTO `sushe` VALUES (272, '河南7号楼', '407', 4, 0);
INSERT INTO `sushe` VALUES (273, '河南7号楼', '408', 4, 0);
INSERT INTO `sushe` VALUES (274, '河南7号楼', '501', 4, 0);
INSERT INTO `sushe` VALUES (275, '河南7号楼', '502', 4, 0);
INSERT INTO `sushe` VALUES (276, '河南7号楼', '503', 4, 0);
INSERT INTO `sushe` VALUES (277, '河南7号楼', '504', 4, 0);
INSERT INTO `sushe` VALUES (278, '河南7号楼', '505', 4, 0);
INSERT INTO `sushe` VALUES (279, '河南7号楼', '506', 4, 0);
INSERT INTO `sushe` VALUES (280, '河南7号楼', '507', 4, 0);
INSERT INTO `sushe` VALUES (281, '河南7号楼', '508', 4, 0);
INSERT INTO `sushe` VALUES (282, '河南8号楼', '101', 4, 0);
INSERT INTO `sushe` VALUES (283, '河南8号楼', '102', 4, 0);
INSERT INTO `sushe` VALUES (284, '河南8号楼', '103', 4, 0);
INSERT INTO `sushe` VALUES (285, '河南8号楼', '104', 4, 0);
INSERT INTO `sushe` VALUES (286, '河南8号楼', '105', 4, 0);
INSERT INTO `sushe` VALUES (287, '河南8号楼', '106', 4, 0);
INSERT INTO `sushe` VALUES (288, '河南8号楼', '107', 4, 0);
INSERT INTO `sushe` VALUES (289, '河南8号楼', '108', 4, 0);
INSERT INTO `sushe` VALUES (290, '河南8号楼', '201', 4, 0);
INSERT INTO `sushe` VALUES (291, '河南8号楼', '202', 4, 0);
INSERT INTO `sushe` VALUES (292, '河南8号楼', '203', 4, 0);
INSERT INTO `sushe` VALUES (293, '河南8号楼', '204', 4, 0);
INSERT INTO `sushe` VALUES (294, '河南8号楼', '205', 4, 0);
INSERT INTO `sushe` VALUES (295, '河南8号楼', '206', 4, 0);
INSERT INTO `sushe` VALUES (296, '河南8号楼', '207', 4, 0);
INSERT INTO `sushe` VALUES (297, '河南8号楼', '208', 4, 0);
INSERT INTO `sushe` VALUES (298, '河南8号楼', '301', 4, 0);
INSERT INTO `sushe` VALUES (299, '河南8号楼', '302', 4, 0);
INSERT INTO `sushe` VALUES (300, '河南8号楼', '303', 4, 0);
INSERT INTO `sushe` VALUES (301, '河南8号楼', '304', 4, 0);
INSERT INTO `sushe` VALUES (302, '河南8号楼', '305', 4, 0);
INSERT INTO `sushe` VALUES (303, '河南8号楼', '306', 4, 0);
INSERT INTO `sushe` VALUES (304, '河南8号楼', '307', 4, 0);
INSERT INTO `sushe` VALUES (305, '河南8号楼', '308', 4, 0);
INSERT INTO `sushe` VALUES (306, '河南8号楼', '401', 4, 0);
INSERT INTO `sushe` VALUES (307, '河南8号楼', '402', 4, 0);
INSERT INTO `sushe` VALUES (308, '河南8号楼', '403', 4, 0);
INSERT INTO `sushe` VALUES (309, '河南8号楼', '404', 4, 0);
INSERT INTO `sushe` VALUES (310, '河南8号楼', '405', 4, 0);
INSERT INTO `sushe` VALUES (311, '河南8号楼', '406', 4, 0);
INSERT INTO `sushe` VALUES (312, '河南8号楼', '407', 4, 0);
INSERT INTO `sushe` VALUES (313, '河南8号楼', '408', 4, 0);
INSERT INTO `sushe` VALUES (314, '河南8号楼', '501', 4, 0);
INSERT INTO `sushe` VALUES (315, '河南8号楼', '502', 4, 0);
INSERT INTO `sushe` VALUES (316, '河南8号楼', '503', 4, 0);
INSERT INTO `sushe` VALUES (317, '河南8号楼', '504', 4, 0);
INSERT INTO `sushe` VALUES (318, '河南8号楼', '505', 4, 0);
INSERT INTO `sushe` VALUES (319, '河南8号楼', '506', 4, 0);
INSERT INTO `sushe` VALUES (320, '河南8号楼', '507', 4, 0);
INSERT INTO `sushe` VALUES (321, '河南8号楼', '508', 4, 0);
INSERT INTO `sushe` VALUES (322, '河南9号楼', '101', 4, 0);
INSERT INTO `sushe` VALUES (323, '河南9号楼', '102', 4, 0);
INSERT INTO `sushe` VALUES (324, '河南9号楼', '103', 4, 0);
INSERT INTO `sushe` VALUES (325, '河南9号楼', '104', 4, 0);
INSERT INTO `sushe` VALUES (326, '河南9号楼', '105', 4, 0);
INSERT INTO `sushe` VALUES (327, '河南9号楼', '106', 4, 0);
INSERT INTO `sushe` VALUES (328, '河南9号楼', '107', 4, 0);
INSERT INTO `sushe` VALUES (329, '河南9号楼', '108', 4, 0);
INSERT INTO `sushe` VALUES (330, '河南9号楼', '201', 4, 0);
INSERT INTO `sushe` VALUES (331, '河南9号楼', '202', 4, 0);
INSERT INTO `sushe` VALUES (332, '河南9号楼', '203', 4, 0);
INSERT INTO `sushe` VALUES (333, '河南9号楼', '204', 4, 0);
INSERT INTO `sushe` VALUES (334, '河南9号楼', '205', 4, 0);
INSERT INTO `sushe` VALUES (335, '河南9号楼', '206', 4, 0);
INSERT INTO `sushe` VALUES (336, '河南9号楼', '207', 4, 0);
INSERT INTO `sushe` VALUES (337, '河南9号楼', '208', 4, 0);
INSERT INTO `sushe` VALUES (338, '河南9号楼', '301', 4, 0);
INSERT INTO `sushe` VALUES (339, '河南9号楼', '302', 4, 0);
INSERT INTO `sushe` VALUES (340, '河南9号楼', '303', 4, 0);
INSERT INTO `sushe` VALUES (341, '河南9号楼', '304', 4, 0);
INSERT INTO `sushe` VALUES (342, '河南9号楼', '305', 4, 0);
INSERT INTO `sushe` VALUES (343, '河南9号楼', '306', 4, 0);
INSERT INTO `sushe` VALUES (344, '河南9号楼', '307', 4, 0);
INSERT INTO `sushe` VALUES (345, '河南9号楼', '308', 4, 0);
INSERT INTO `sushe` VALUES (346, '河南9号楼', '401', 4, 0);
INSERT INTO `sushe` VALUES (347, '河南9号楼', '402', 4, 0);
INSERT INTO `sushe` VALUES (348, '河南9号楼', '403', 4, 0);
INSERT INTO `sushe` VALUES (349, '河南9号楼', '404', 4, 0);
INSERT INTO `sushe` VALUES (350, '河南9号楼', '405', 4, 0);
INSERT INTO `sushe` VALUES (351, '河南9号楼', '406', 4, 0);
INSERT INTO `sushe` VALUES (352, '河南9号楼', '407', 4, 0);
INSERT INTO `sushe` VALUES (353, '河南9号楼', '408', 4, 0);
INSERT INTO `sushe` VALUES (354, '河南9号楼', '501', 4, 0);
INSERT INTO `sushe` VALUES (355, '河南9号楼', '502', 4, 0);
INSERT INTO `sushe` VALUES (356, '河南9号楼', '503', 4, 0);
INSERT INTO `sushe` VALUES (357, '河南9号楼', '504', 4, 0);
INSERT INTO `sushe` VALUES (358, '河南9号楼', '505', 4, 0);
INSERT INTO `sushe` VALUES (359, '河南9号楼', '506', 4, 0);
INSERT INTO `sushe` VALUES (360, '河南9号楼', '507', 4, 0);
INSERT INTO `sushe` VALUES (361, '河南9号楼', '508', 4, 0);
INSERT INTO `sushe` VALUES (362, '河南10号楼', '101', 4, 0);
INSERT INTO `sushe` VALUES (363, '河南10号楼', '102', 4, 0);
INSERT INTO `sushe` VALUES (364, '河南10号楼', '103', 4, 0);
INSERT INTO `sushe` VALUES (365, '河南10号楼', '104', 4, 0);
INSERT INTO `sushe` VALUES (366, '河南10号楼', '105', 4, 0);
INSERT INTO `sushe` VALUES (367, '河南10号楼', '106', 4, 0);
INSERT INTO `sushe` VALUES (368, '河南10号楼', '107', 4, 0);
INSERT INTO `sushe` VALUES (369, '河南10号楼', '108', 4, 0);
INSERT INTO `sushe` VALUES (370, '河南10号楼', '201', 4, 0);
INSERT INTO `sushe` VALUES (371, '河南10号楼', '202', 4, 0);
INSERT INTO `sushe` VALUES (372, '河南10号楼', '203', 4, 0);
INSERT INTO `sushe` VALUES (373, '河南10号楼', '204', 4, 0);
INSERT INTO `sushe` VALUES (374, '河南10号楼', '205', 4, 0);
INSERT INTO `sushe` VALUES (375, '河南10号楼', '206', 4, 0);
INSERT INTO `sushe` VALUES (376, '河南10号楼', '207', 4, 0);
INSERT INTO `sushe` VALUES (377, '河南10号楼', '208', 4, 0);
INSERT INTO `sushe` VALUES (378, '河南10号楼', '301', 4, 0);
INSERT INTO `sushe` VALUES (379, '河南10号楼', '302', 4, 0);
INSERT INTO `sushe` VALUES (380, '河南10号楼', '303', 4, 0);
INSERT INTO `sushe` VALUES (381, '河南10号楼', '304', 4, 0);
INSERT INTO `sushe` VALUES (382, '河南10号楼', '305', 4, 0);
INSERT INTO `sushe` VALUES (383, '河南10号楼', '306', 4, 0);
INSERT INTO `sushe` VALUES (384, '河南10号楼', '307', 4, 0);
INSERT INTO `sushe` VALUES (385, '河南10号楼', '308', 4, 0);
INSERT INTO `sushe` VALUES (386, '河南10号楼', '401', 4, 0);
INSERT INTO `sushe` VALUES (387, '河南10号楼', '402', 4, 0);
INSERT INTO `sushe` VALUES (388, '河南10号楼', '403', 4, 0);
INSERT INTO `sushe` VALUES (389, '河南10号楼', '404', 4, 0);
INSERT INTO `sushe` VALUES (390, '河南10号楼', '405', 4, 0);
INSERT INTO `sushe` VALUES (391, '河南10号楼', '406', 4, 0);
INSERT INTO `sushe` VALUES (392, '河南10号楼', '407', 4, 0);
INSERT INTO `sushe` VALUES (393, '河南10号楼', '408', 4, 0);
INSERT INTO `sushe` VALUES (394, '河南10号楼', '501', 4, 0);
INSERT INTO `sushe` VALUES (395, '河南10号楼', '502', 4, 0);
INSERT INTO `sushe` VALUES (396, '河南10号楼', '503', 4, 0);
INSERT INTO `sushe` VALUES (397, '河南10号楼', '504', 4, 0);
INSERT INTO `sushe` VALUES (398, '河南10号楼', '505', 4, 0);
INSERT INTO `sushe` VALUES (399, '河南10号楼', '506', 4, 0);
INSERT INTO `sushe` VALUES (400, '河南10号楼', '507', 4, 0);
INSERT INTO `sushe` VALUES (401, '河南10号楼', '508', 4, 0);
INSERT INTO `sushe` VALUES (402, '河东1号楼', '101', 6, 0);
INSERT INTO `sushe` VALUES (403, '河东1号楼', '102', 6, 0);
INSERT INTO `sushe` VALUES (404, '河东1号楼', '103', 6, 0);
INSERT INTO `sushe` VALUES (405, '河东1号楼', '104', 6, 0);
INSERT INTO `sushe` VALUES (406, '河东1号楼', '105', 6, 0);
INSERT INTO `sushe` VALUES (407, '河东1号楼', '106', 6, 0);
INSERT INTO `sushe` VALUES (408, '河东1号楼', '107', 6, 0);
INSERT INTO `sushe` VALUES (409, '河东1号楼', '108', 6, 0);
INSERT INTO `sushe` VALUES (410, '河东1号楼', '201', 6, 0);
INSERT INTO `sushe` VALUES (411, '河东1号楼', '202', 6, 0);
INSERT INTO `sushe` VALUES (412, '河东1号楼', '203', 6, 0);
INSERT INTO `sushe` VALUES (413, '河东1号楼', '204', 6, 0);
INSERT INTO `sushe` VALUES (414, '河东1号楼', '205', 6, 0);
INSERT INTO `sushe` VALUES (415, '河东1号楼', '206', 6, 0);
INSERT INTO `sushe` VALUES (416, '河东1号楼', '207', 6, 0);
INSERT INTO `sushe` VALUES (417, '河东1号楼', '208', 6, 0);
INSERT INTO `sushe` VALUES (418, '河东1号楼', '301', 6, 0);
INSERT INTO `sushe` VALUES (419, '河东1号楼', '302', 6, 0);
INSERT INTO `sushe` VALUES (420, '河东1号楼', '303', 6, 0);
INSERT INTO `sushe` VALUES (421, '河东1号楼', '304', 6, 0);
INSERT INTO `sushe` VALUES (422, '河东1号楼', '305', 6, 0);
INSERT INTO `sushe` VALUES (423, '河东1号楼', '306', 6, 0);
INSERT INTO `sushe` VALUES (424, '河东1号楼', '307', 6, 0);
INSERT INTO `sushe` VALUES (425, '河东1号楼', '308', 6, 0);
INSERT INTO `sushe` VALUES (426, '河东1号楼', '401', 6, 0);
INSERT INTO `sushe` VALUES (427, '河东1号楼', '402', 6, 0);
INSERT INTO `sushe` VALUES (428, '河东1号楼', '403', 6, 0);
INSERT INTO `sushe` VALUES (429, '河东1号楼', '404', 6, 0);
INSERT INTO `sushe` VALUES (430, '河东1号楼', '405', 6, 0);
INSERT INTO `sushe` VALUES (431, '河东1号楼', '406', 6, 0);
INSERT INTO `sushe` VALUES (432, '河东1号楼', '407', 6, 0);
INSERT INTO `sushe` VALUES (433, '河东1号楼', '408', 6, 0);
INSERT INTO `sushe` VALUES (434, '河东1号楼', '501', 6, 0);
INSERT INTO `sushe` VALUES (435, '河东1号楼', '502', 6, 0);
INSERT INTO `sushe` VALUES (436, '河东1号楼', '503', 6, 0);
INSERT INTO `sushe` VALUES (437, '河东1号楼', '504', 6, 0);
INSERT INTO `sushe` VALUES (438, '河东1号楼', '505', 6, 0);
INSERT INTO `sushe` VALUES (439, '河东1号楼', '506', 6, 0);
INSERT INTO `sushe` VALUES (440, '河东1号楼', '507', 6, 0);
INSERT INTO `sushe` VALUES (441, '河东1号楼', '508', 6, 0);
INSERT INTO `sushe` VALUES (442, '河东2号楼', '101', 6, 0);
INSERT INTO `sushe` VALUES (443, '河东2号楼', '102', 6, 0);
INSERT INTO `sushe` VALUES (444, '河东2号楼', '103', 6, 0);
INSERT INTO `sushe` VALUES (445, '河东2号楼', '104', 6, 0);
INSERT INTO `sushe` VALUES (446, '河东2号楼', '105', 6, 0);
INSERT INTO `sushe` VALUES (447, '河东2号楼', '106', 6, 0);
INSERT INTO `sushe` VALUES (448, '河东2号楼', '107', 6, 0);
INSERT INTO `sushe` VALUES (449, '河东2号楼', '108', 6, 0);
INSERT INTO `sushe` VALUES (450, '河东2号楼', '201', 6, 0);
INSERT INTO `sushe` VALUES (451, '河东2号楼', '202', 6, 0);
INSERT INTO `sushe` VALUES (452, '河东2号楼', '203', 6, 0);
INSERT INTO `sushe` VALUES (453, '河东2号楼', '204', 6, 0);
INSERT INTO `sushe` VALUES (454, '河东2号楼', '205', 6, 0);
INSERT INTO `sushe` VALUES (455, '河东2号楼', '206', 6, 0);
INSERT INTO `sushe` VALUES (456, '河东2号楼', '207', 6, 0);
INSERT INTO `sushe` VALUES (457, '河东2号楼', '208', 6, 0);
INSERT INTO `sushe` VALUES (458, '河东2号楼', '301', 6, 0);
INSERT INTO `sushe` VALUES (459, '河东2号楼', '302', 6, 0);
INSERT INTO `sushe` VALUES (460, '河东2号楼', '303', 6, 0);
INSERT INTO `sushe` VALUES (461, '河东2号楼', '304', 6, 0);
INSERT INTO `sushe` VALUES (462, '河东2号楼', '305', 6, 0);
INSERT INTO `sushe` VALUES (463, '河东2号楼', '306', 6, 0);
INSERT INTO `sushe` VALUES (464, '河东2号楼', '307', 6, 0);
INSERT INTO `sushe` VALUES (465, '河东2号楼', '308', 6, 0);
INSERT INTO `sushe` VALUES (466, '河东2号楼', '401', 6, 0);
INSERT INTO `sushe` VALUES (467, '河东2号楼', '402', 6, 0);
INSERT INTO `sushe` VALUES (468, '河东2号楼', '403', 6, 0);
INSERT INTO `sushe` VALUES (469, '河东2号楼', '404', 6, 0);
INSERT INTO `sushe` VALUES (470, '河东2号楼', '405', 6, 0);
INSERT INTO `sushe` VALUES (471, '河东2号楼', '406', 6, 0);
INSERT INTO `sushe` VALUES (472, '河东2号楼', '407', 6, 0);
INSERT INTO `sushe` VALUES (473, '河东2号楼', '408', 6, 0);
INSERT INTO `sushe` VALUES (474, '河东2号楼', '501', 6, 0);
INSERT INTO `sushe` VALUES (475, '河东2号楼', '502', 6, 0);
INSERT INTO `sushe` VALUES (476, '河东2号楼', '503', 6, 0);
INSERT INTO `sushe` VALUES (477, '河东2号楼', '504', 6, 0);
INSERT INTO `sushe` VALUES (478, '河东2号楼', '505', 6, 0);
INSERT INTO `sushe` VALUES (479, '河东2号楼', '506', 6, 0);
INSERT INTO `sushe` VALUES (480, '河东2号楼', '507', 6, 0);
INSERT INTO `sushe` VALUES (481, '河东2号楼', '508', 6, 0);
INSERT INTO `sushe` VALUES (482, '河东3号楼', '101', 6, 0);
INSERT INTO `sushe` VALUES (483, '河东3号楼', '102', 6, 0);
INSERT INTO `sushe` VALUES (484, '河东3号楼', '103', 6, 0);
INSERT INTO `sushe` VALUES (485, '河东3号楼', '104', 6, 0);
INSERT INTO `sushe` VALUES (486, '河东3号楼', '105', 6, 0);
INSERT INTO `sushe` VALUES (487, '河东3号楼', '106', 6, 0);
INSERT INTO `sushe` VALUES (488, '河东3号楼', '107', 6, 0);
INSERT INTO `sushe` VALUES (489, '河东3号楼', '108', 6, 0);
INSERT INTO `sushe` VALUES (490, '河东3号楼', '201', 6, 0);
INSERT INTO `sushe` VALUES (491, '河东3号楼', '202', 6, 0);
INSERT INTO `sushe` VALUES (492, '河东3号楼', '203', 6, 0);
INSERT INTO `sushe` VALUES (493, '河东3号楼', '204', 6, 0);
INSERT INTO `sushe` VALUES (494, '河东3号楼', '205', 6, 0);
INSERT INTO `sushe` VALUES (495, '河东3号楼', '206', 6, 0);
INSERT INTO `sushe` VALUES (496, '河东3号楼', '207', 6, 0);
INSERT INTO `sushe` VALUES (497, '河东3号楼', '208', 6, 0);
INSERT INTO `sushe` VALUES (498, '河东3号楼', '301', 6, 0);
INSERT INTO `sushe` VALUES (499, '河东3号楼', '302', 6, 0);
INSERT INTO `sushe` VALUES (500, '河东3号楼', '303', 6, 0);
INSERT INTO `sushe` VALUES (501, '河东3号楼', '304', 6, 0);
INSERT INTO `sushe` VALUES (502, '河东3号楼', '305', 6, 0);
INSERT INTO `sushe` VALUES (503, '河东3号楼', '306', 6, 0);
INSERT INTO `sushe` VALUES (504, '河东3号楼', '307', 6, 0);
INSERT INTO `sushe` VALUES (505, '河东3号楼', '308', 6, 0);
INSERT INTO `sushe` VALUES (506, '河东3号楼', '401', 6, 0);
INSERT INTO `sushe` VALUES (507, '河东3号楼', '402', 6, 0);
INSERT INTO `sushe` VALUES (508, '河东3号楼', '403', 6, 0);
INSERT INTO `sushe` VALUES (509, '河东3号楼', '404', 6, 0);
INSERT INTO `sushe` VALUES (510, '河东3号楼', '405', 6, 0);
INSERT INTO `sushe` VALUES (511, '河东3号楼', '406', 6, 0);
INSERT INTO `sushe` VALUES (512, '河东3号楼', '407', 6, 0);
INSERT INTO `sushe` VALUES (513, '河东3号楼', '408', 6, 0);
INSERT INTO `sushe` VALUES (514, '河东3号楼', '501', 6, 0);
INSERT INTO `sushe` VALUES (515, '河东3号楼', '502', 6, 0);
INSERT INTO `sushe` VALUES (516, '河东3号楼', '503', 6, 0);
INSERT INTO `sushe` VALUES (517, '河东3号楼', '504', 6, 0);
INSERT INTO `sushe` VALUES (518, '河东3号楼', '505', 6, 0);
INSERT INTO `sushe` VALUES (519, '河东3号楼', '506', 6, 0);
INSERT INTO `sushe` VALUES (520, '河东3号楼', '507', 6, 0);
INSERT INTO `sushe` VALUES (521, '河东3号楼', '508', 6, 0);
INSERT INTO `sushe` VALUES (522, '河东4号楼', '101', 6, 0);
INSERT INTO `sushe` VALUES (523, '河东4号楼', '102', 6, 0);
INSERT INTO `sushe` VALUES (524, '河东4号楼', '103', 6, 0);
INSERT INTO `sushe` VALUES (525, '河东4号楼', '104', 6, 0);
INSERT INTO `sushe` VALUES (526, '河东4号楼', '105', 6, 0);
INSERT INTO `sushe` VALUES (527, '河东4号楼', '106', 6, 0);
INSERT INTO `sushe` VALUES (528, '河东4号楼', '107', 6, 0);
INSERT INTO `sushe` VALUES (529, '河东4号楼', '108', 6, 0);
INSERT INTO `sushe` VALUES (530, '河东4号楼', '201', 6, 0);
INSERT INTO `sushe` VALUES (531, '河东4号楼', '202', 6, 0);
INSERT INTO `sushe` VALUES (532, '河东4号楼', '203', 6, 0);
INSERT INTO `sushe` VALUES (533, '河东4号楼', '204', 6, 0);
INSERT INTO `sushe` VALUES (534, '河东4号楼', '205', 6, 0);
INSERT INTO `sushe` VALUES (535, '河东4号楼', '206', 6, 0);
INSERT INTO `sushe` VALUES (536, '河东4号楼', '207', 6, 0);
INSERT INTO `sushe` VALUES (537, '河东4号楼', '208', 6, 0);
INSERT INTO `sushe` VALUES (538, '河东4号楼', '301', 6, 0);
INSERT INTO `sushe` VALUES (539, '河东4号楼', '302', 6, 0);
INSERT INTO `sushe` VALUES (540, '河东4号楼', '303', 6, 0);
INSERT INTO `sushe` VALUES (541, '河东4号楼', '304', 6, 0);
INSERT INTO `sushe` VALUES (542, '河东4号楼', '305', 6, 0);
INSERT INTO `sushe` VALUES (543, '河东4号楼', '306', 6, 0);
INSERT INTO `sushe` VALUES (544, '河东4号楼', '307', 6, 0);
INSERT INTO `sushe` VALUES (545, '河东4号楼', '308', 6, 0);
INSERT INTO `sushe` VALUES (546, '河东4号楼', '401', 6, 0);
INSERT INTO `sushe` VALUES (547, '河东4号楼', '402', 6, 0);
INSERT INTO `sushe` VALUES (548, '河东4号楼', '403', 6, 0);
INSERT INTO `sushe` VALUES (549, '河东4号楼', '404', 6, 0);
INSERT INTO `sushe` VALUES (550, '河东4号楼', '405', 6, 0);
INSERT INTO `sushe` VALUES (551, '河东4号楼', '406', 6, 0);
INSERT INTO `sushe` VALUES (552, '河东4号楼', '407', 6, 0);
INSERT INTO `sushe` VALUES (553, '河东4号楼', '408', 6, 0);
INSERT INTO `sushe` VALUES (554, '河东4号楼', '501', 6, 0);
INSERT INTO `sushe` VALUES (555, '河东4号楼', '502', 6, 0);
INSERT INTO `sushe` VALUES (556, '河东4号楼', '503', 6, 0);
INSERT INTO `sushe` VALUES (557, '河东4号楼', '504', 6, 0);
INSERT INTO `sushe` VALUES (558, '河东4号楼', '505', 6, 0);
INSERT INTO `sushe` VALUES (559, '河东4号楼', '506', 6, 0);
INSERT INTO `sushe` VALUES (560, '河东4号楼', '507', 6, 0);
INSERT INTO `sushe` VALUES (561, '河东4号楼', '508', 6, 0);
INSERT INTO `sushe` VALUES (562, '河东5号楼', '101', 6, 0);
INSERT INTO `sushe` VALUES (563, '河东5号楼', '102', 6, 0);
INSERT INTO `sushe` VALUES (564, '河东5号楼', '103', 6, 0);
INSERT INTO `sushe` VALUES (565, '河东5号楼', '104', 6, 0);
INSERT INTO `sushe` VALUES (566, '河东5号楼', '105', 6, 0);
INSERT INTO `sushe` VALUES (567, '河东5号楼', '106', 6, 0);
INSERT INTO `sushe` VALUES (568, '河东5号楼', '107', 6, 0);
INSERT INTO `sushe` VALUES (569, '河东5号楼', '108', 6, 0);
INSERT INTO `sushe` VALUES (570, '河东5号楼', '201', 6, 0);
INSERT INTO `sushe` VALUES (571, '河东5号楼', '202', 6, 0);
INSERT INTO `sushe` VALUES (572, '河东5号楼', '203', 6, 0);
INSERT INTO `sushe` VALUES (573, '河东5号楼', '204', 6, 0);
INSERT INTO `sushe` VALUES (574, '河东5号楼', '205', 6, 0);
INSERT INTO `sushe` VALUES (575, '河东5号楼', '206', 6, 0);
INSERT INTO `sushe` VALUES (576, '河东5号楼', '207', 6, 0);
INSERT INTO `sushe` VALUES (577, '河东5号楼', '208', 6, 0);
INSERT INTO `sushe` VALUES (578, '河东5号楼', '301', 6, 0);
INSERT INTO `sushe` VALUES (579, '河东5号楼', '302', 6, 0);
INSERT INTO `sushe` VALUES (580, '河东5号楼', '303', 6, 0);
INSERT INTO `sushe` VALUES (581, '河东5号楼', '304', 6, 0);
INSERT INTO `sushe` VALUES (582, '河东5号楼', '305', 6, 0);
INSERT INTO `sushe` VALUES (583, '河东5号楼', '306', 6, 0);
INSERT INTO `sushe` VALUES (584, '河东5号楼', '307', 6, 0);
INSERT INTO `sushe` VALUES (585, '河东5号楼', '308', 6, 0);
INSERT INTO `sushe` VALUES (586, '河东5号楼', '401', 6, 0);
INSERT INTO `sushe` VALUES (587, '河东5号楼', '402', 6, 0);
INSERT INTO `sushe` VALUES (588, '河东5号楼', '403', 6, 0);
INSERT INTO `sushe` VALUES (589, '河东5号楼', '404', 6, 0);
INSERT INTO `sushe` VALUES (590, '河东5号楼', '405', 6, 0);
INSERT INTO `sushe` VALUES (591, '河东5号楼', '406', 6, 0);
INSERT INTO `sushe` VALUES (592, '河东5号楼', '407', 6, 0);
INSERT INTO `sushe` VALUES (593, '河东5号楼', '408', 6, 0);
INSERT INTO `sushe` VALUES (594, '河东5号楼', '501', 6, 0);
INSERT INTO `sushe` VALUES (595, '河东5号楼', '502', 6, 0);
INSERT INTO `sushe` VALUES (596, '河东5号楼', '503', 6, 0);
INSERT INTO `sushe` VALUES (597, '河东5号楼', '504', 6, 0);
INSERT INTO `sushe` VALUES (598, '河东5号楼', '505', 6, 0);
INSERT INTO `sushe` VALUES (599, '河东5号楼', '506', 6, 0);
INSERT INTO `sushe` VALUES (600, '河东5号楼', '507', 6, 0);
INSERT INTO `sushe` VALUES (601, '河东5号楼', '508', 6, 0);
INSERT INTO `sushe` VALUES (602, '河东6号楼', '101', 6, 0);
INSERT INTO `sushe` VALUES (603, '河东6号楼', '102', 6, 0);
INSERT INTO `sushe` VALUES (604, '河东6号楼', '103', 6, 0);
INSERT INTO `sushe` VALUES (605, '河东6号楼', '104', 6, 0);
INSERT INTO `sushe` VALUES (606, '河东6号楼', '105', 6, 0);
INSERT INTO `sushe` VALUES (607, '河东6号楼', '106', 6, 0);
INSERT INTO `sushe` VALUES (608, '河东6号楼', '107', 6, 0);
INSERT INTO `sushe` VALUES (609, '河东6号楼', '108', 6, 0);
INSERT INTO `sushe` VALUES (610, '河东6号楼', '201', 6, 0);
INSERT INTO `sushe` VALUES (611, '河东6号楼', '202', 6, 0);
INSERT INTO `sushe` VALUES (612, '河东6号楼', '203', 6, 0);
INSERT INTO `sushe` VALUES (613, '河东6号楼', '204', 6, 0);
INSERT INTO `sushe` VALUES (614, '河东6号楼', '205', 6, 0);
INSERT INTO `sushe` VALUES (615, '河东6号楼', '206', 6, 0);
INSERT INTO `sushe` VALUES (616, '河东6号楼', '207', 6, 0);
INSERT INTO `sushe` VALUES (617, '河东6号楼', '208', 6, 0);
INSERT INTO `sushe` VALUES (618, '河东6号楼', '301', 6, 0);
INSERT INTO `sushe` VALUES (619, '河东6号楼', '302', 6, 0);
INSERT INTO `sushe` VALUES (620, '河东6号楼', '303', 6, 0);
INSERT INTO `sushe` VALUES (621, '河东6号楼', '304', 6, 0);
INSERT INTO `sushe` VALUES (622, '河东6号楼', '305', 6, 0);
INSERT INTO `sushe` VALUES (623, '河东6号楼', '306', 6, 0);
INSERT INTO `sushe` VALUES (624, '河东6号楼', '307', 6, 0);
INSERT INTO `sushe` VALUES (625, '河东6号楼', '308', 6, 0);
INSERT INTO `sushe` VALUES (626, '河东6号楼', '401', 6, 0);
INSERT INTO `sushe` VALUES (627, '河东6号楼', '402', 6, 0);
INSERT INTO `sushe` VALUES (628, '河东6号楼', '403', 6, 0);
INSERT INTO `sushe` VALUES (629, '河东6号楼', '404', 6, 0);
INSERT INTO `sushe` VALUES (630, '河东6号楼', '405', 6, 0);
INSERT INTO `sushe` VALUES (631, '河东6号楼', '406', 6, 0);
INSERT INTO `sushe` VALUES (632, '河东6号楼', '407', 6, 0);
INSERT INTO `sushe` VALUES (633, '河东6号楼', '408', 6, 0);
INSERT INTO `sushe` VALUES (634, '河东6号楼', '501', 6, 0);
INSERT INTO `sushe` VALUES (635, '河东6号楼', '502', 6, 0);
INSERT INTO `sushe` VALUES (636, '河东6号楼', '503', 6, 0);
INSERT INTO `sushe` VALUES (637, '河东6号楼', '504', 6, 0);
INSERT INTO `sushe` VALUES (638, '河东6号楼', '505', 6, 0);
INSERT INTO `sushe` VALUES (639, '河东6号楼', '506', 6, 0);
INSERT INTO `sushe` VALUES (640, '河东6号楼', '507', 6, 0);
INSERT INTO `sushe` VALUES (641, '河东6号楼', '508', 6, 0);
INSERT INTO `sushe` VALUES (642, '河东7号楼', '101', 6, 0);
INSERT INTO `sushe` VALUES (643, '河东7号楼', '102', 6, 0);
INSERT INTO `sushe` VALUES (644, '河东7号楼', '103', 6, 0);
INSERT INTO `sushe` VALUES (645, '河东7号楼', '104', 6, 0);
INSERT INTO `sushe` VALUES (646, '河东7号楼', '105', 6, 0);
INSERT INTO `sushe` VALUES (647, '河东7号楼', '106', 6, 0);
INSERT INTO `sushe` VALUES (648, '河东7号楼', '107', 6, 0);
INSERT INTO `sushe` VALUES (649, '河东7号楼', '108', 6, 0);
INSERT INTO `sushe` VALUES (650, '河东7号楼', '201', 6, 0);
INSERT INTO `sushe` VALUES (651, '河东7号楼', '202', 6, 0);
INSERT INTO `sushe` VALUES (652, '河东7号楼', '203', 6, 0);
INSERT INTO `sushe` VALUES (653, '河东7号楼', '204', 6, 0);
INSERT INTO `sushe` VALUES (654, '河东7号楼', '205', 6, 0);
INSERT INTO `sushe` VALUES (655, '河东7号楼', '206', 6, 0);
INSERT INTO `sushe` VALUES (656, '河东7号楼', '207', 6, 0);
INSERT INTO `sushe` VALUES (657, '河东7号楼', '208', 6, 0);
INSERT INTO `sushe` VALUES (658, '河东7号楼', '301', 6, 0);
INSERT INTO `sushe` VALUES (659, '河东7号楼', '302', 6, 0);
INSERT INTO `sushe` VALUES (660, '河东7号楼', '303', 6, 0);
INSERT INTO `sushe` VALUES (661, '河东7号楼', '304', 6, 0);
INSERT INTO `sushe` VALUES (662, '河东7号楼', '305', 6, 0);
INSERT INTO `sushe` VALUES (663, '河东7号楼', '306', 6, 0);
INSERT INTO `sushe` VALUES (664, '河东7号楼', '307', 6, 0);
INSERT INTO `sushe` VALUES (665, '河东7号楼', '308', 6, 0);
INSERT INTO `sushe` VALUES (666, '河东7号楼', '401', 6, 0);
INSERT INTO `sushe` VALUES (667, '河东7号楼', '402', 6, 0);
INSERT INTO `sushe` VALUES (668, '河东7号楼', '403', 6, 0);
INSERT INTO `sushe` VALUES (669, '河东7号楼', '404', 6, 0);
INSERT INTO `sushe` VALUES (670, '河东7号楼', '405', 6, 0);
INSERT INTO `sushe` VALUES (671, '河东7号楼', '406', 6, 0);
INSERT INTO `sushe` VALUES (672, '河东7号楼', '407', 6, 0);
INSERT INTO `sushe` VALUES (673, '河东7号楼', '408', 6, 0);
INSERT INTO `sushe` VALUES (674, '河东7号楼', '501', 6, 0);
INSERT INTO `sushe` VALUES (675, '河东7号楼', '502', 6, 0);
INSERT INTO `sushe` VALUES (676, '河东7号楼', '503', 6, 0);
INSERT INTO `sushe` VALUES (677, '河东7号楼', '504', 6, 0);
INSERT INTO `sushe` VALUES (678, '河东7号楼', '505', 6, 0);
INSERT INTO `sushe` VALUES (679, '河东7号楼', '506', 6, 0);
INSERT INTO `sushe` VALUES (680, '河东7号楼', '507', 6, 0);
INSERT INTO `sushe` VALUES (681, '河东7号楼', '508', 6, 0);
INSERT INTO `sushe` VALUES (682, '河东8号楼', '101', 6, 0);
INSERT INTO `sushe` VALUES (683, '河东8号楼', '102', 6, 0);
INSERT INTO `sushe` VALUES (684, '河东8号楼', '103', 6, 0);
INSERT INTO `sushe` VALUES (685, '河东8号楼', '104', 6, 0);
INSERT INTO `sushe` VALUES (686, '河东8号楼', '105', 6, 0);
INSERT INTO `sushe` VALUES (687, '河东8号楼', '106', 6, 0);
INSERT INTO `sushe` VALUES (688, '河东8号楼', '107', 6, 0);
INSERT INTO `sushe` VALUES (689, '河东8号楼', '108', 6, 0);
INSERT INTO `sushe` VALUES (690, '河东8号楼', '201', 6, 0);
INSERT INTO `sushe` VALUES (691, '河东8号楼', '202', 6, 0);
INSERT INTO `sushe` VALUES (692, '河东8号楼', '203', 6, 0);
INSERT INTO `sushe` VALUES (693, '河东8号楼', '204', 6, 0);
INSERT INTO `sushe` VALUES (694, '河东8号楼', '205', 6, 0);
INSERT INTO `sushe` VALUES (695, '河东8号楼', '206', 6, 0);
INSERT INTO `sushe` VALUES (696, '河东8号楼', '207', 6, 0);
INSERT INTO `sushe` VALUES (697, '河东8号楼', '208', 6, 0);
INSERT INTO `sushe` VALUES (698, '河东8号楼', '301', 6, 0);
INSERT INTO `sushe` VALUES (699, '河东8号楼', '302', 6, 0);
INSERT INTO `sushe` VALUES (700, '河东8号楼', '303', 6, 0);
INSERT INTO `sushe` VALUES (701, '河东8号楼', '304', 6, 0);
INSERT INTO `sushe` VALUES (702, '河东8号楼', '305', 6, 0);
INSERT INTO `sushe` VALUES (703, '河东8号楼', '306', 6, 0);
INSERT INTO `sushe` VALUES (704, '河东8号楼', '307', 6, 0);
INSERT INTO `sushe` VALUES (705, '河东8号楼', '308', 6, 0);
INSERT INTO `sushe` VALUES (706, '河东8号楼', '401', 6, 0);
INSERT INTO `sushe` VALUES (707, '河东8号楼', '402', 6, 0);
INSERT INTO `sushe` VALUES (708, '河东8号楼', '403', 6, 0);
INSERT INTO `sushe` VALUES (709, '河东8号楼', '404', 6, 0);
INSERT INTO `sushe` VALUES (710, '河东8号楼', '405', 6, 0);
INSERT INTO `sushe` VALUES (711, '河东8号楼', '406', 6, 0);
INSERT INTO `sushe` VALUES (712, '河东8号楼', '407', 6, 0);
INSERT INTO `sushe` VALUES (713, '河东8号楼', '408', 6, 0);
INSERT INTO `sushe` VALUES (714, '河东8号楼', '501', 6, 0);
INSERT INTO `sushe` VALUES (715, '河东8号楼', '502', 6, 0);
INSERT INTO `sushe` VALUES (716, '河东8号楼', '503', 6, 0);
INSERT INTO `sushe` VALUES (717, '河东8号楼', '504', 6, 0);
INSERT INTO `sushe` VALUES (718, '河东8号楼', '505', 6, 0);
INSERT INTO `sushe` VALUES (719, '河东8号楼', '506', 6, 0);
INSERT INTO `sushe` VALUES (720, '河东8号楼', '507', 6, 0);
INSERT INTO `sushe` VALUES (721, '河东8号楼', '508', 6, 0);
INSERT INTO `sushe` VALUES (722, '河东9号楼', '101', 6, 0);
INSERT INTO `sushe` VALUES (723, '河东9号楼', '102', 6, 0);
INSERT INTO `sushe` VALUES (724, '河东9号楼', '103', 6, 0);
INSERT INTO `sushe` VALUES (725, '河东9号楼', '104', 6, 0);
INSERT INTO `sushe` VALUES (726, '河东9号楼', '105', 6, 0);
INSERT INTO `sushe` VALUES (727, '河东9号楼', '106', 6, 0);
INSERT INTO `sushe` VALUES (728, '河东9号楼', '107', 6, 0);
INSERT INTO `sushe` VALUES (729, '河东9号楼', '108', 6, 0);
INSERT INTO `sushe` VALUES (730, '河东9号楼', '201', 6, 0);
INSERT INTO `sushe` VALUES (731, '河东9号楼', '202', 6, 0);
INSERT INTO `sushe` VALUES (732, '河东9号楼', '203', 6, 0);
INSERT INTO `sushe` VALUES (733, '河东9号楼', '204', 6, 0);
INSERT INTO `sushe` VALUES (734, '河东9号楼', '205', 6, 0);
INSERT INTO `sushe` VALUES (735, '河东9号楼', '206', 6, 0);
INSERT INTO `sushe` VALUES (736, '河东9号楼', '207', 6, 0);
INSERT INTO `sushe` VALUES (737, '河东9号楼', '208', 6, 0);
INSERT INTO `sushe` VALUES (738, '河东9号楼', '301', 6, 0);
INSERT INTO `sushe` VALUES (739, '河东9号楼', '302', 6, 0);
INSERT INTO `sushe` VALUES (740, '河东9号楼', '303', 6, 0);
INSERT INTO `sushe` VALUES (741, '河东9号楼', '304', 6, 0);
INSERT INTO `sushe` VALUES (742, '河东9号楼', '305', 6, 0);
INSERT INTO `sushe` VALUES (743, '河东9号楼', '306', 6, 0);
INSERT INTO `sushe` VALUES (744, '河东9号楼', '307', 6, 0);
INSERT INTO `sushe` VALUES (745, '河东9号楼', '308', 6, 0);
INSERT INTO `sushe` VALUES (746, '河东9号楼', '401', 6, 0);
INSERT INTO `sushe` VALUES (747, '河东9号楼', '402', 6, 0);
INSERT INTO `sushe` VALUES (748, '河东9号楼', '403', 6, 0);
INSERT INTO `sushe` VALUES (749, '河东9号楼', '404', 6, 0);
INSERT INTO `sushe` VALUES (750, '河东9号楼', '405', 6, 0);
INSERT INTO `sushe` VALUES (751, '河东9号楼', '406', 6, 0);
INSERT INTO `sushe` VALUES (752, '河东9号楼', '407', 6, 0);
INSERT INTO `sushe` VALUES (753, '河东9号楼', '408', 6, 0);
INSERT INTO `sushe` VALUES (754, '河东9号楼', '501', 6, 0);
INSERT INTO `sushe` VALUES (755, '河东9号楼', '502', 6, 0);
INSERT INTO `sushe` VALUES (756, '河东9号楼', '503', 6, 0);
INSERT INTO `sushe` VALUES (757, '河东9号楼', '504', 6, 0);
INSERT INTO `sushe` VALUES (758, '河东9号楼', '505', 6, 0);
INSERT INTO `sushe` VALUES (759, '河东9号楼', '506', 6, 0);
INSERT INTO `sushe` VALUES (760, '河东9号楼', '507', 6, 0);
INSERT INTO `sushe` VALUES (761, '河东9号楼', '508', 6, 0);
INSERT INTO `sushe` VALUES (762, '河东10号楼', '101', 6, 0);
INSERT INTO `sushe` VALUES (763, '河东10号楼', '102', 6, 0);
INSERT INTO `sushe` VALUES (764, '河东10号楼', '103', 6, 0);
INSERT INTO `sushe` VALUES (765, '河东10号楼', '104', 6, 0);
INSERT INTO `sushe` VALUES (766, '河东10号楼', '105', 6, 0);
INSERT INTO `sushe` VALUES (767, '河东10号楼', '106', 6, 0);
INSERT INTO `sushe` VALUES (768, '河东10号楼', '107', 6, 0);
INSERT INTO `sushe` VALUES (769, '河东10号楼', '108', 6, 0);
INSERT INTO `sushe` VALUES (770, '河东10号楼', '201', 6, 0);
INSERT INTO `sushe` VALUES (771, '河东10号楼', '202', 6, 0);
INSERT INTO `sushe` VALUES (772, '河东10号楼', '203', 6, 0);
INSERT INTO `sushe` VALUES (773, '河东10号楼', '204', 6, 0);
INSERT INTO `sushe` VALUES (774, '河东10号楼', '205', 6, 0);
INSERT INTO `sushe` VALUES (775, '河东10号楼', '206', 6, 0);
INSERT INTO `sushe` VALUES (776, '河东10号楼', '207', 6, 0);
INSERT INTO `sushe` VALUES (777, '河东10号楼', '208', 6, 0);
INSERT INTO `sushe` VALUES (778, '河东10号楼', '301', 6, 0);
INSERT INTO `sushe` VALUES (779, '河东10号楼', '302', 6, 0);
INSERT INTO `sushe` VALUES (780, '河东10号楼', '303', 6, 0);
INSERT INTO `sushe` VALUES (781, '河东10号楼', '304', 6, 0);
INSERT INTO `sushe` VALUES (782, '河东10号楼', '305', 6, 0);
INSERT INTO `sushe` VALUES (783, '河东10号楼', '306', 6, 0);
INSERT INTO `sushe` VALUES (784, '河东10号楼', '307', 6, 0);
INSERT INTO `sushe` VALUES (785, '河东10号楼', '308', 6, 0);
INSERT INTO `sushe` VALUES (786, '河东10号楼', '401', 6, 0);
INSERT INTO `sushe` VALUES (787, '河东10号楼', '402', 6, 0);
INSERT INTO `sushe` VALUES (788, '河东10号楼', '403', 6, 0);
INSERT INTO `sushe` VALUES (789, '河东10号楼', '404', 6, 0);
INSERT INTO `sushe` VALUES (790, '河东10号楼', '405', 6, 0);
INSERT INTO `sushe` VALUES (791, '河东10号楼', '406', 6, 0);
INSERT INTO `sushe` VALUES (792, '河东10号楼', '407', 6, 0);
INSERT INTO `sushe` VALUES (793, '河东10号楼', '408', 6, 0);
INSERT INTO `sushe` VALUES (794, '河东10号楼', '501', 6, 0);
INSERT INTO `sushe` VALUES (795, '河东10号楼', '502', 6, 0);
INSERT INTO `sushe` VALUES (796, '河东10号楼', '503', 6, 0);
INSERT INTO `sushe` VALUES (797, '河东10号楼', '504', 6, 0);
INSERT INTO `sushe` VALUES (798, '河东10号楼', '505', 6, 0);
INSERT INTO `sushe` VALUES (799, '河东10号楼', '506', 6, 0);
INSERT INTO `sushe` VALUES (800, '河东10号楼', '507', 6, 0);
INSERT INTO `sushe` VALUES (801, '河东10号楼', '508', 6, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '123456',
  `name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `xueyuan` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `banji` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `tel` char(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sushe` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '',
  `lynumber` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fdy` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fdytel` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `state` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `family` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `familytel` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `roler` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uname`(`uname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '20200102101', '123456', '贾玉', '男', '智能制造与控制工程学院', '20机械A1', '13738275269', '101', '河东2号楼', '李世民', '17382456788', '1', '贾天下', '18221653333', '2');
INSERT INTO `user` VALUES (2, '20200102102', '123456', '宋小宝', '男', '国际交流学院', '20日语A1', '13733333333', '101', '河南1号楼', '李世民', '17382456788', '1', '宋大宝', '18221653333', '2');
INSERT INTO `user` VALUES (3, '20221313033', '123', '林黛玉', '女', '数理与统计学院', '20应统A1', '15738444444', '103', '河南1号楼', '李世民', '17382456788', '1', '林父', '18221653333', '0');
INSERT INTO `user` VALUES (4, '10000000001', '123456', '管理员', '男', '', '', '18221652222', '', '', '', '18221653333', '1', '', '18221653333', '0');
INSERT INTO `user` VALUES (5, '20220102104', '123456', '林玖', '女', '应用艺术设计学院', '20美术A1', '17343333333', '503', '河南1号楼', '李世民', '17382456788', '1', '洛父', '18221653333', '2');
INSERT INTO `user` VALUES (6, '20220102151', '123456', '林冲', '男', '应用艺术设计学院', '20美术A2', '13722222222', '403', '河南2号楼', '李世民', '17382456788', '1', '林父', '18221653333', '2');
INSERT INTO `user` VALUES (7, '20200102104', '123456', '武松', '男', '资源与环境工程学院', '20建筑A1', '13722222222', '304', '河南2号楼', '李世民', '17382456788', '1', '张三', '18221653333', '2');
INSERT INTO `user` VALUES (8, '20210101105', '123456', '宋江', '男', '经济与管理学院', '20外贸A2', '15733333333', '333', '河南2号楼', '李世民', '17382456788', '1', '张三', '18221653333', '2');
INSERT INTO `user` VALUES (9, '20200103105', '123456', '鲁智深', '男', '艺术设计学院', '20美术A1', '13422222222', '503', '河南3号楼', '李世民', '17382456788', '1', '张三', '18221653333', '2');
INSERT INTO `user` VALUES (10, '20210104201', '123456', '武则天', '女', '经济与管理学院', '20会计A2', '17922222222', '111', '河南3号楼', '李世民', '17382456788', '1', '张三', '18221653333', '2');
INSERT INTO `user` VALUES (20, '20200102201', '123456', '李小南', '男', '智能制造与控制工程学院', '20光电A1', '17319797088', '102', '河南1号楼', '黄9梅', '17319797088', '1', '张三', '13738275269', '2');
INSERT INTO `user` VALUES (21, '20220101051', '123456', '王天霸', '男', '智能制造与控制工程学院', '20光电A2', '18237965423', '102', '河南1号楼', '战天雷', '18237965423', '1', '张三', '13738275269', '2');
INSERT INTO `user` VALUES (22, '20221315014', '123456', '陆小千', '男', '智能制造与控制工程学院', '20车辆A1', '15010210221', '102', '河南1号楼', '李世民', '15010210221', '1', '张三', '13738275269', '2');
INSERT INTO `user` VALUES (23, '20221645011', '123456', '王天福', '男', '计算机与信息工程学院', '20网络A1', '13978654232', '201', '河南1号楼', '唐僧', '13978654232', '1', '张三', '13738275269', '2');
INSERT INTO `user` VALUES (24, '20221350075', '123456', '屠心', '男', '计算机与信息工程学院', '20网络A2', '13785678900', '201', '河南1号楼', '唐僧', '13785678900', '1', '张三', '13738275269', '2');
INSERT INTO `user` VALUES (25, '20222040201', '123456', '孔利', '女', '计算机与信息工程学院', '20计科A1', '17312345678', '101', '河南2号楼', '张天爱', '17312345678', '1', '上官发财', '17312345678', '2');
INSERT INTO `user` VALUES (26, '20221350821', '123456', '陈咬金', '男', '计算机与信息工程学院', '20计科A2', '15212345678', '101', '河南3号楼', '李世民', '17010210112', '1', '陈父', '1701021011', '2');
INSERT INTO `user` VALUES (27, '20131313333', '123456', '李永乐', '男', NULL, NULL, '15317859110', NULL, '', NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `user` VALUES (28, '20221313039', '123456', '王宇', '男', '计算机与信息工程学院', '20网工A1', '18221653657', '501', '河南1号楼', 'aaa', '12345678911', '1', 'aaa', '123456', '2');
INSERT INTO `user` VALUES (30, '10000000002', '123456', '马超', '男', NULL, NULL, '18221654447', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1');
INSERT INTO `user` VALUES (63, '20111234251', '123456', '胡图图', '男', '计算机与信息工程学院', '20网工A1', '18214567511', '101', '河南1号楼', '胡英俊', '1531459971', '1', '张小丽', '13754124450', '2');
INSERT INTO `user` VALUES (64, '20111234241', '123456', '胡图图图', '男', '计算机与信息工程学院', '20网工A1', '18214567512', '102', '河南1号楼', '胡英俊', '1531459971', '1', '张小丽', '13754124450', '2');
INSERT INTO `user` VALUES (65, '20230000001', '123456', '张三', '男', '计算机与信息工程学院', '23网工A1', '18214567511', '', '河南1号楼', '李四', '1531459971', '1', '王五', '13754124450', '2');
INSERT INTO `user` VALUES (66, '20230000002', '123456', '张三丰', '男', '计算机与信息工程学院', '23网工A1', '18214567512', '', '河南1号楼', '李四', '1531459971', '1', '王五', '13754124450', '2');
INSERT INTO `user` VALUES (67, '20230000003', '123456', '张四丰', '男', '计算机与信息工程学院', '23网工A1', '18214567512', '', '河南1号楼', '李四', '1531459971', '1', '王五', '13754124450', '2');

-- ----------------------------
-- Table structure for xueyuan
-- ----------------------------
DROP TABLE IF EXISTS `xueyuan`;
CREATE TABLE `xueyuan`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `xueyuan` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xueyuan
-- ----------------------------
INSERT INTO `xueyuan` VALUES (1, '智能制造与控制工程学院');
INSERT INTO `xueyuan` VALUES (2, '计算机与信息工程学院');
INSERT INTO `xueyuan` VALUES (3, '资源与环境工程学院');
INSERT INTO `xueyuan` VALUES (4, '国际交流学院');
INSERT INTO `xueyuan` VALUES (5, '能源与材料学院');
INSERT INTO `xueyuan` VALUES (6, '数理与统计学院');
INSERT INTO `xueyuan` VALUES (7, '经济与管理学院');
INSERT INTO `xueyuan` VALUES (8, '应用艺术设计学院');
INSERT INTO `xueyuan` VALUES (9, '高等职业技术（国际）学院');
INSERT INTO `xueyuan` VALUES (10, '马克思主义学院');

SET FOREIGN_KEY_CHECKS = 1;
