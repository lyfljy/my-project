/*
 Navicat Premium Data Transfer

 Source Server         : zentao
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : video

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 07/10/2023 15:08:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '微信用户' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` int NULL DEFAULT 1 COMMENT '1-用户有效，0-用户无效',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `portrait` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '头像',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` bigint NULL DEFAULT 1 COMMENT '0:主管，1:用户',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '新建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1708008093636411393, '微信用户', NULL, NULL, 1, '新用户RgTqAH', NULL, NULL, 'oGsZU5Fdp3tuX7H58xGVYk2pU72o', 1, NULL);
INSERT INTO `tb_user` VALUES (1708281971034079233, '微信用户', NULL, NULL, 1, '新用户Wb9ETU', NULL, NULL, 'oGsZU5LWPIM_TLWrfsBPz5tMCwjU', 1, NULL);

-- ----------------------------
-- Table structure for tb_user_video
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_video`;
CREATE TABLE `tb_user_video`  (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL,
  `video_id` bigint NOT NULL,
  `like` int NULL DEFAULT 0 COMMENT '点赞状态',
  PRIMARY KEY (`id`, `user_id`, `video_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户, 视频关联表。关联用户对于视频的点赞，收藏信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_video
-- ----------------------------
INSERT INTO `tb_user_video` VALUES (1708008003211411458, 1707799328689491970, 1706896549218750466, 1);
INSERT INTO `tb_user_video` VALUES (1708008261874139138, 1707597426395713537, 1706896549218750466, 0);
INSERT INTO `tb_user_video` VALUES (1708281999404351489, 1708281971034079233, 1706896549218750466, 1);

-- ----------------------------
-- Table structure for tb_video
-- ----------------------------
DROP TABLE IF EXISTS `tb_video`;
CREATE TABLE `tb_video`  (
  `id` bigint NOT NULL,
  `vid_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '视频链接',
  `vid_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频标签',
  `love_cnt` int NULL DEFAULT 0 COMMENT '点赞数量',
  `vid_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `vid_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频名称',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '是否有效（0无效, 1有效）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_video
-- ----------------------------
INSERT INTO `tb_video` VALUES (1706896549097115650, 'https://video-mp.oss-cn-beijing.aliyuncs.com/a300ac52-cc43-4', 'red', 0, NULL, '202_一分钟看完刘伯承元帅：长达94年的传奇人生，15岁父亲去世辍学！ #铭记历史 #历史 #知识分享 #勿忘历史.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549218750467, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f8f323f9-9d7d-4', 'red', 0, NULL, '207807_#郑强教授 #爱国主义教育_66811.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549218750468, 'https://video-mp.oss-cn-beijing.aliyuncs.com/50416b3c-09da-4', 'red', 0, NULL, '238_这，就是中国青年#五四青年节 #五四精神传承有我 #中国青年 #学习新思想争做新青年_62352.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549218750469, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b78efd9e-77fe-4', 'red', 0, NULL, '24558_张维为：中国人的爱国主义是一种包容性极大的、既有个人志趣又有人类情怀的爱国主义❤️一起倾听🌸_1485078.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549218750470, 'https://video-mp.oss-cn-beijing.aliyuncs.com/a7080b0f-3442-4', 'red', 0, NULL, '172281_“虽身处他乡🇨🇳国永存心中”（Although in a foreign land, the country remains in the heart forever）#只有一个中国 #中华民族 #爱国主义教育_23046.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549218750471, 'https://video-mp.oss-cn-beijing.aliyuncs.com/7f68e7ad-d39a-4', 'red', 0, NULL, '18579_”我们在历史书中看到的寥寥几页，是革命先辈们浴血奋战的一生!“#致敬英雄 #保家卫国 #牢记历史.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549218750472, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e8704a47-c160-4', 'red', 0, NULL, '188_社会主义核心价值观#ppt #ppt模板 #PPT #思想品德 #社会主义 #核心价值观 #主题班会 #主题班会ppt模板 _3613.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549218750473, 'https://video-mp.oss-cn-beijing.aliyuncs.com/cbdca0fa-e3a0-4', 'red', 0, NULL, '19510_金庸小说是非常优秀的爱国主义教材｜六神磊磊 #小说 #价值观 #读书   @DOU+小助手_2579261.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549218750474, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e196cd92-db51-4', 'red', 0, NULL, '19555_不能多想，想多了会自闭 #徐涛 #考研政治 #思想史_33905.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549218750475, 'https://video-mp.oss-cn-beijing.aliyuncs.com/2bc617b1-bd02-4', 'red', 0, NULL, '343847_“山河无恙  吾辈当自强” #铭记历史  #勿忘国耻 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549218750476, 'https://video-mp.oss-cn-beijing.aliyuncs.com/428691a4-5694-4', 'red', 0, NULL, '37033_大家每天给国家做多少贡献？#罗翔 #张三法外狂徒 #罗翔人生哲理_8919.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549218750477, 'https://video-mp.oss-cn-beijing.aliyuncs.com/85472928-7169-4', 'red', 0, NULL, '408_什么是社会主义核心价值观，快来学习吧！#社会主义核心价值观_210276.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549218750478, 'https://video-mp.oss-cn-beijing.aliyuncs.com/cb94edb7-1249-4', 'red', 0, NULL, '436432_坚定信仰 砥砺前行#超燃混剪 #爱国正能量 #坚定信仰 #艾跃进教授 @DOU+小助手_43363.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549218750479, 'https://video-mp.oss-cn-beijing.aliyuncs.com/59e08d1b-2fcb-4', 'red', 0, NULL, '4380_真爱国与伪爱国#23考研 #考研 #徐涛 #励志 #成功上岸 _43705.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549218750480, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c04b2471-fe6a-4', 'red', 0, NULL, '453_爱国主义是五四精神的源泉，纪念五四运动，发扬五四精神，为振兴中华民族而努力奋斗！ #五四青年节 #勿忘历史吾辈自强 #学习新思想争做新青年_52939.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549218750481, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e82315c1-66a1-4', 'red', 0, NULL, '482128_商女怎么会不知亡国恨 #历史 #商女不知忘国恨 #历史故事_3341153.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665025, 'https://video-mp.oss-cn-beijing.aliyuncs.com/93b2701e-8b4d-4', 'red', 0, NULL, '519465_#战争 巍巍华夏,屹立不倒！#超燃混剪 #铭记历史 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665026, 'https://video-mp.oss-cn-beijing.aliyuncs.com/65903908-8aac-4', 'red', 0, NULL, '532044_接受了二十多年的教育，但是在此之前我从没听过这段历史#历史 #历史人物_688687.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665027, 'https://video-mp.oss-cn-beijing.aliyuncs.com/18dcceb6-ed4b-4', 'red', 0, NULL, '542960_#知识分享 世界历史知识点速记之俄国十月革命#历史 #每天学习一点点 做个热爱学习的好孩子#历史知多少.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665028, 'https://video-mp.oss-cn-beijing.aliyuncs.com/9a78e2e0-e9ca-4', 'red', 0, NULL, '2746_#918 #918勿忘国耻 作为中国人，都应该铭记的日子，今天不搞笑。_65107.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665029, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c75db08a-11d6-4', 'red', 0, NULL, '297421_军训方阵千人大合唱#军训大合唱 #人民日报 #央视网_3877.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665030, 'https://video-mp.oss-cn-beijing.aliyuncs.com/42ebd6dd-4036-4', 'red', 0, NULL, '32417_理性的、深沉的爱国主义｜刘擎 #爱国 #哲学 #人生感悟 @抖音小助手 @DOU+小助手 _2579261.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665031, 'https://video-mp.oss-cn-beijing.aliyuncs.com/4b769874-1370-4', 'red', 0, NULL, '32417_理性的、深沉的爱国主义｜刘擎 #爱国 #哲学 #人生感悟 @抖音小助手 @DOU+小助手 _2579262.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665032, 'https://video-mp.oss-cn-beijing.aliyuncs.com/aafd4eb3-285a-4', 'red', 0, NULL, '32596_爱国是人生的第一堂课#爱国#教育#传统文化#创作灵感 _716559.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665033, 'https://video-mp.oss-cn-beijing.aliyuncs.com/4fbd0d64-38c5-4', 'red', 0, NULL, '550721_向前 向前 向前！ #超燃剪辑 #这盛世如您所愿 _71888.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665034, 'https://video-mp.oss-cn-beijing.aliyuncs.com/47ed38bc-f2ed-4', 'red', 0, NULL, '632_“同志你不会还不知道521的意思吧”#科学脑洞上分赛 #热爱祖国传播正能量 #少年强则国强 #爱国主义教育 #为中华民族伟大的复兴而奋斗_175.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665035, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c0e6a80a-6db3-4', 'red', 0, NULL, '75746_“人类历史上的第一次”#十月革命 #列宁 #李大钊.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665036, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ecc7793e-0b04-4', 'red', 0, NULL, '82717_优秀的爱国电影不会消失，红色精神永存#战争 #混剪 #超燃 #爱国 #60帧_104434.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665037, 'https://video-mp.oss-cn-beijing.aliyuncs.com/2a940cdb-95ad-4', 'red', 0, NULL, '8555_抗美援朝，保家卫国  #高燃 #混剪 #历史 #抗美援朝 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665038, 'https://video-mp.oss-cn-beijing.aliyuncs.com/87cfebdf-0c7a-4', 'red', 0, NULL, '874416_今天，人民没有忘记！#毛主席诞辰128周年  #百年百人系列 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665039, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ac7b3829-a1d5-4', 'red', 0, NULL, '91803_#认知 抽烟越贵越爱国，大家每天都为国家做多少贡献呢？#认知思维 #罗翔_245367.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665040, 'https://video-mp.oss-cn-beijing.aliyuncs.com/faee5514-5b8f-4', 'red', 0, NULL, '93_大智慧知识点 - 部分人就是借所谓的爱国情怀，满足自己的私欲！#考研政治徐涛 #考研政治 #每天学习一点点 #干货分享_3240.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665041, 'https://video-mp.oss-cn-beijing.aliyuncs.com/2b91992b-8a56-4', 'red', 0, NULL, '9852_.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665042, 'https://video-mp.oss-cn-beijing.aliyuncs.com/17ce8322-07c5-4', 'red', 0, NULL, '9_#创建文明城市，你我同行！_9.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665043, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e8328cae-90b1-4', 'red', 0, NULL, '10274377_左手带金，右手戴银，父爱则母静，母静则子安，子安则家和，家和万事兴#二妮礼仪家风_2810206.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665044, 'https://video-mp.oss-cn-beijing.aliyuncs.com/4a75b45b-4850-4', 'red', 0, NULL, '143_践行社会主义核心价值观——诚信篇 @抖音小助手_34821.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665045, 'https://video-mp.oss-cn-beijing.aliyuncs.com/1ec44902-b822-4', 'red', 0, NULL, '151291_“所以历史的遗憾到底是什么呢？”#历史 #历史人物.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665046, 'https://video-mp.oss-cn-beijing.aliyuncs.com/48a08936-c27b-4', 'red', 0, NULL, '152_有信仰才有力量！解读社会主义核心价值观_180544.mp4', 1);
INSERT INTO `tb_video` VALUES (1706896549281665047, 'https://video-mp.oss-cn-beijing.aliyuncs.com/3ecdb803-67ad-4', 'red', 0, NULL, '167_爱国主义的意义 #祝祖国繁荣昌盛 #我爱我的祖国_106557.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280520941570, 'https://video-mp.oss-cn-beijing.aliyuncs.com/3d89704b-d349-4', 'affairs', 0, NULL, '213_只要200万，就能做到提前退休，躺平享受品质养老。 #理财 #养老 #提前退休 #知识科普 #存款_38842.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280671936513, 'https://video-mp.oss-cn-beijing.aliyuncs.com/3a5f0a38-e3fa-4', 'affairs', 0, NULL, '21_#创作灵感 跟着支付宝买基金第三天#基金 #基金小白 #投资理财 @抖音小助手 @DOU+小助手_19.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280671936514, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e9c50b85-cba6-4', 'affairs', 0, NULL, '241_货币基金新规来了！ #中老年理财 #小白理财 #关注陈露共同变富_334658.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280671936515, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d539f1d9-b76d-4', 'affairs', 0, NULL, '25112_52周存钱法，一年轻松存下几万块！#存钱 #理财  #银行小姐姐_685153.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280671936516, 'https://video-mp.oss-cn-beijing.aliyuncs.com/7e7183ab-89d2-4', 'affairs', 0, NULL, '2629_增终身寿险那么多人买？ 难道大家都是傻子？ #保险 #增额终身寿险_47237.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280671936517, 'https://video-mp.oss-cn-beijing.aliyuncs.com/06bcfea5-8dcc-4', 'affairs', 0, NULL, '2630_增终身寿险那么多人买？ 难道大家都是傻子？ #保险 #增额终身寿险_47236.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280671936518, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d5cb3c9f-db24-4', 'affairs', 0, NULL, '2688_一个操作，20万立马多一万#银行存款 #投资 #大额存单 #财经 #知识先锋计划 @抖音财经 _456288.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280671936519, 'https://video-mp.oss-cn-beijing.aliyuncs.com/953aac52-c243-4', 'affairs', 0, NULL, '309_现在赶紧囤黄金。比其他靠谱#黄金 #今日金价 #黄金回收_1083.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280739045377, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ea603fb6-a078-4', 'affairs', 0, NULL, '31669_不是才三岁的小孩吗，都这么会精打细算了吗-#小堂堂的社交生活 #人类幼崽到底有多聪明 #惠氏 #启赋 #惠氏启赋_3195633.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280739045378, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0debdc9b-5d56-4', 'affairs', 0, NULL, '31951_存款超过20万，不要只知道存定期，这样存收益更高#存钱有哪些技巧 #学会理财 #财经干货 #定期存款 #希望这个视频对大家有所帮助_223711.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280739045379, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e74b2507-4ffd-4', 'affairs', 0, NULL, '62_今日收益280💰 有网友不信我让我放截图，截图来了！#主打的就是一个真实 #自媒体_18367.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280739045380, 'https://video-mp.oss-cn-beijing.aliyuncs.com/7fa26b1b-7351-4', 'affairs', 0, NULL, '63207_10万存款该不该投资理财 #在石250 #老白不喝酒 #理财 #股票 #金融_978994.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280739045381, 'https://video-mp.oss-cn-beijing.aliyuncs.com/4b4579b1-0a62-4', 'affairs', 0, NULL, '634_如果你有五万块钱，会怎样理财呢？#投资 #理财 #基金 _584468.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280739045382, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d13593f2-a8d3-4', 'affairs', 0, NULL, '6415_你们心心念的大学生理财且听杨老师分析 #理财 #大学 #大学生_945341.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280739045383, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e5aa416e-ff44-4', 'affairs', 0, NULL, '6868_手里有100w怎么投资？#干货 #投资 #财富观 #良大_229270.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280739045384, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c1623554-5bfb-4', 'affairs', 0, NULL, '4742_手里有50万，是继续存着，还是咬着牙买房？#我在抖音说财经 #科普 #财经 _4140945.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280739045385, 'https://video-mp.oss-cn-beijing.aliyuncs.com/5a0360dd-9475-4', 'affairs', 0, NULL, '53880_200万怎么存才划算？#财经 #干货 #财经知识 _454689.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280739045386, 'https://video-mp.oss-cn-beijing.aliyuncs.com/a438590f-7ffd-4', 'affairs', 0, NULL, '5485_2kol2近期最值得抄底球员， 理财神器，亏了来骂我#蔚蓝档案#2kol2_1848.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280739045387, 'https://video-mp.oss-cn-beijing.aliyuncs.com/a9baefb8-f4c4-4', 'affairs', 0, NULL, '5611_银行退出，投资黄金还有啥靠谱渠道？#理财 #科普 #黄金 _4140946.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280801959938, 'https://video-mp.oss-cn-beijing.aliyuncs.com/beb63491-000e-4', 'affairs', 0, NULL, '5860_银行不保本理财#理财 #科普 #财经 _4140945.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280801959939, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c83e5dd0-d124-4', 'affairs', 0, NULL, '36_游戏ETF暴涨过后 谁会是下一个#知识分享 #干货分享 #股票 #投资理财 #财经 #博彩股_1118.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280801959940, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c8e448c0-c031-4', 'affairs', 0, NULL, '37194_5万存款放银行，五年后没利息倒亏3000，大妈：我钱放银行还能亏损？ (中)#纪实 #社会_1092092.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280801959941, 'https://video-mp.oss-cn-beijing.aliyuncs.com/453f9e3e-b987-4', 'affairs', 0, NULL, '37_A股再跌！跌跌不休何时到头？#金融#金融实习#金融理财#金融知识#经济学#金融学考研#金融求职#金融民工#金融专业#金融就业#理财#股票#经济#金融理财#投资理财#千万资产#财富自由.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280801959942, 'https://video-mp.oss-cn-beijing.aliyuncs.com/5e3ae76b-18fb-4', 'affairs', 0, NULL, '43414_教你三个在短时间内帮你存到20万块的技巧#理财#智慧#抖音小助手#梁宸瑜_755340.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280801959943, 'https://video-mp.oss-cn-beijing.aliyuncs.com/7f3e2c1d-2ebf-4', 'affairs', 0, NULL, '46725_都是自家人，我也不藏着掖着了！#理财 #投资 #宝藏博主推荐 _383876.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280801959944, 'https://video-mp.oss-cn-beijing.aliyuncs.com/8c38f757-2794-4', 'affairs', 0, NULL, '7834_简单讲讲银行的理财产品#理财 #理财有风险投资需谨慎_685154.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280801959945, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e1b9958b-e25e-4', 'affairs', 0, NULL, '7906_收益多少才能跑赢通胀？你有信心能跑赢吗？#理财 #抗通胀 #我在抖音说财经 @DOU+小助手 _408518.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280801959946, 'https://video-mp.oss-cn-beijing.aliyuncs.com/dea3a3f3-8090-4', 'affairs', 0, NULL, '87_有20万存款应该怎么理财？这样存，安全稳健，比银行固定存款收益高几倍！##财商教育 #干货分享 #金融常识 #投资理财 #财经_78425.mp4', 1);
INSERT INTO `tb_video` VALUES (1706897280801959947, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c6e1e950-a887-4', 'affairs', 0, NULL, '90071_银行理财大变天！不保本后还能买吗？#理财 #银行 #财经知识_2008256.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085575643137, 'https://video-mp.oss-cn-beijing.aliyuncs.com/31da2a38-d465-4', 'travel', 0, NULL, '2031874_#旅行vlog #在路上在远方 答案就在路上 自由都在风里.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085709860866, 'https://video-mp.oss-cn-beijing.aliyuncs.com/77678f6d-8b3e-4', 'travel', 0, NULL, '20997_只有湖北人才知道，湖北有多高端#让世界看见湖北 #抖音元气春游计划 @抖音旅行.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085709860867, 'https://video-mp.oss-cn-beijing.aliyuncs.com/252ff476-7c6a-4', 'travel', 0, NULL, '2148172_这首bgm想起的时候 你就该辞职了#旅行 #川西美景 #保持热爱奔赴山海 #治愈系风景.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085709860868, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d03c49e1-d26b-4', 'travel', 0, NULL, '22854_这是合肥小岭南的风景#骑行 #公路自行车_463.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085709860869, 'https://video-mp.oss-cn-beijing.aliyuncs.com/2314fd14-ce53-4', 'travel', 0, NULL, '269912_这并不是现实画面，而是游戏#steam游戏 #游戏风景 #游戏中的震撼瞬间 #单机游戏_11481.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085709860870, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c832426f-8841-4', 'travel', 0, NULL, '2855_夕阳下的海浪高清视频素材#海 #素材分享 _18259.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085709860871, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0c84336e-dd4e-4', 'travel', 0, NULL, '30749_中国十大最美村镇-清远千年瑶寨，驱车来回开了1100公里，就为了看一眼这个挂在半山腰上的千年瑶寨。#旅行推荐官 #古村落风景 #古建筑之美 #历史古迹 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085709860872, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6fd28e9f-1d7f-4', 'travel', 0, NULL, '307617_这么绝美罕见的晚霞  当然要分享给重要的人一起看. #治愈系风景 #旅行大玩家 #日落🌄 #日落收藏家_210502.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085709860873, 'https://video-mp.oss-cn-beijing.aliyuncs.com/959ceeb2-b354-4', 'travel', 0, NULL, '3146094_这么多好看的晚霞 当然是分享给你了.  #喷灌机卡点 #旅行大玩家  #治愈系风景 #一起看日落 _305962.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085709860874, 'https://video-mp.oss-cn-beijing.aliyuncs.com/eaf1d10d-1be4-4', 'travel', 0, NULL, '3172100_这么美的晚霞 当然要分享给你啦._704681.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085709860875, 'https://video-mp.oss-cn-beijing.aliyuncs.com/47e1d437-8c65-4', 'travel', 0, NULL, '500336_请以考试时的写作水平：不提及“雨”字却能表达雨很大#治愈系风景_715385.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085709860876, 'https://video-mp.oss-cn-beijing.aliyuncs.com/5174e2ae-195c-4', 'travel', 0, NULL, '500_72小时逃离城市计划｜浙江丽水Vlog📍#旅行推荐官 #旅行大玩家 #国庆小众旅游景点推荐 #国庆去哪儿最好玩 #开学科普季 @抖音青少年.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085709860877, 'https://video-mp.oss-cn-beijing.aliyuncs.com/3b270323-b98b-4', 'travel', 0, NULL, '51010_中国唯一一个什么都免费的城市，谁能告诉我怎么去这里定居！#三沙市 #旅行推荐 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085709860878, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d8a037b0-8e93-4', 'travel', 0, NULL, '527300_“比起夏日的晚霞 你更让我心动”  #治愈系风景 #最美火烧云 #晚霞_250354.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085709860879, 'https://video-mp.oss-cn-beijing.aliyuncs.com/a0b63594-9e7d-4', 'travel', 0, NULL, '580179_日落下果冻海浪美得窒息 丁达尔效应窒息的美 这么治愈的瞬间 当然要分享给你了 #治愈系风景_1225321.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085709860880, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b0d1ab04-f162-4', 'travel', 0, NULL, '3392_十一来静之湖玩呀#静之湖度假区 #静之湖爱丽丝魔术嘉年华#国庆小众宝藏旅行地#你心中完美度假空间是哪一个#这个秋天一起去环游世界.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775425, 'https://video-mp.oss-cn-beijing.aliyuncs.com/70df35ef-3916-4', 'travel', 0, NULL, '34095_有一天陪一朵玫瑰在山顶看了一场600年以来最长的月偏食。#旅行大玩家.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775426, 'https://video-mp.oss-cn-beijing.aliyuncs.com/046772ad-51ee-4', 'travel', 0, NULL, '36827_藏在深山里的古村，建村历史约500年，古色古香的徽派建筑循着山势而建，被誉为“中国最美村落”。#篁岭 #旅行推荐官 #旅行大玩家 #古村落风景  #上饶好乡音.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775427, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c339691c-0bbf-4', 'travel', 0, NULL, '3742415_是布达拉宫吗？ #西藏 #布达拉宫 #旅行.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775428, 'https://video-mp.oss-cn-beijing.aliyuncs.com/a9d02fad-f22c-4', 'travel', 0, NULL, '411639_“我在人间贩卖黄昏，只为收集世间温柔去见你。”#治愈系风景 #晚霞 #芦苇荡美景 _19407.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775429, 'https://video-mp.oss-cn-beijing.aliyuncs.com/92bd5157-0aec-4', 'travel', 0, NULL, '63032_独立寒秋，湘江北去，橘子洲头。诗中的橘子洲头就是我们眼前所看到的中国第一洲。#橘子洲头 #旅行推荐官 #祖国的大好河山.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775430, 'https://video-mp.oss-cn-beijing.aliyuncs.com/9c06aa2d-25e5-4', 'travel', 0, NULL, '7029_香格里拉周边有什么好玩的？#全能导游 #旅行大玩家 #梅朵爱旅行 #我在世界的香格里拉等你.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775431, 'https://video-mp.oss-cn-beijing.aliyuncs.com/99ea391b-5483-4', 'travel', 0, NULL, '78589_“始终沉迷于古人的审美” #苏州园林 #古建筑之美 #中式美学_38845.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775432, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b71157a1-f0fb-4', 'travel', 0, NULL, '8683_- 爱 意 在 落 日 泛 滥 -@DOU+小助手 #我的世界 #我的世界治愈系风景 #治愈 #视觉盛宴_22170.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775433, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f7570042-07de-4', 'travel', 0, NULL, '96773_48个地点是app的极限 不是我的极限  交通工具在我保存之后才发现有几个是错的，因为视频导出时间太长我不想重新再弄一次了很麻烦。凑合看吧#行程轨迹 #足迹地图 #旅行 #趁着年轻去想要去的地方 #我的21岁.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775434, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c674b683-dd4e-4', 'travel', 0, NULL, '121186_知道为啥这款游戏能称为艺术品了吗，因为它有一种独特的氛围感 #死亡搁浅 #游戏风景 #steam游戏 #单机游戏_25579.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775435, 'https://video-mp.oss-cn-beijing.aliyuncs.com/2b059543-1f84-4', 'travel', 0, NULL, '1224202_我们相遇在夏天，而夏天从末结束 #那拉提 #旅行大玩家 #治愈系风景 #一不小心就误入仙境了 #总要去一趟新疆吧 #这是我爱的夏天.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775436, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f4d90edf-1618-4', 'travel', 0, NULL, '1224717_我们相遇在夏天，而夏天从末结束 #那拉提 #旅行大玩家 #治愈系风景 #一不小心就误入仙境了 #总要去一趟新疆吧 #这是我爱的夏天_546692.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775437, 'https://video-mp.oss-cn-beijing.aliyuncs.com/209b6e0c-bb6f-4', 'travel', 0, NULL, '13768_海拔落差7000多米，一条路就是一个四季-山南错那县拿日雍措 #房车旅行 #川藏旅行 #拿日雍措.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775438, 'https://video-mp.oss-cn-beijing.aliyuncs.com/4b7c29a3-8601-4', 'travel', 0, NULL, '15202_四川凉山的悬崖村，在这个鸟都飞不上去的地方，村民们生活了200多年。#旅行推荐官 #旅行大玩家 #悬崖村 #四川凉山.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775439, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c9672ab7-4483-4', 'travel', 0, NULL, '1530574_“爱意随风起 风止爱难平 黄昏与落日 晚风也思你.” #旅行大玩家 #治愈了夏天的风景 _1673909.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775440, 'https://video-mp.oss-cn-beijing.aliyuncs.com/01e21166-f8df-4', 'travel', 0, NULL, '171155_收藏了这么多好看的海上晚霞 当然要第一时间分享给你了 #治愈系风景_1225321.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775441, 'https://video-mp.oss-cn-beijing.aliyuncs.com/57707f1c-3fa6-4', 'travel', 0, NULL, '173418_再美的风景不如亲眼所见，我们终究来到阿坝州四姑娘山，不负这阳光万里 ，东方有佳人，其名四姑娘。#川西大环线 #四姑娘风景区 #中秋旅行攻略 #国庆心动打卡地 #伸美大金总_261040.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775442, 'https://video-mp.oss-cn-beijing.aliyuncs.com/7e0cab2e-283f-4', 'travel', 0, NULL, '17539_始返楼兰国，还向朔方城，这是我的楼兰，一定会去的。#旅行 #旅行推荐官 #景点打卡 #楼兰古城 #楼兰.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775443, 'https://video-mp.oss-cn-beijing.aliyuncs.com/986d56d0-c0e2-4', 'travel', 0, NULL, '1842277_这么多好看的海边晚霞 当然分享给你啦.   #旅行大玩家 #治愈系风景  #喷灌机卡点 #一起看日落吧  #心动海岸线_1225321.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775444, 'https://video-mp.oss-cn-beijing.aliyuncs.com/8620e89b-ca21-4', 'travel', 0, NULL, '435400_原来动漫里的场景都是真实存在的. #浪漫的风景当然要分享给你  #治愈系风景  #旅行大玩家_3461698.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085772775445, 'https://video-mp.oss-cn-beijing.aliyuncs.com/77d21861-b6e2-4', 'travel', 0, NULL, '4417_ 一定要带你最爱的人 去卡瓦格博看一次#日照金山 #梅里雪山 #旅行推荐官  .mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085839884290, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6ae171a6-9941-4', 'travel', 0, NULL, '446621_画质拉满后 是现实还是游戏 #steam游戏 #地平线5 #地平线风景_6778.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085839884291, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f7ce08db-29bc-4', 'travel', 0, NULL, '44996_这一生，总要去追逐天山的风。#旅行大玩家 #新疆 #旅行.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898085839884292, 'https://video-mp.oss-cn-beijing.aliyuncs.com/2c7ed11c-436d-4', 'travel', 0, NULL, '4927_在湖南边界发现一个神秘之地，离凤凰古城只有30多公里，那就是贵州铜仁大峡谷，亿万年的洪荒之力，造就了这个神奇的峡谷。#旅行推荐官 #铜仁大峡谷 #心动五一 #凤凰古城.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712741523458, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e3e78cbc-f1b1-4', 'cultural_relic', 0, NULL, '10172_《正好遇见你》终于要来了！5月20号！一起来感受非遗传承之美~#正好遇见你定档520  #正好遇见你_1354323.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712930267137, 'https://video-mp.oss-cn-beijing.aliyuncs.com/915cbc23-1c51-4', 'cultural_relic', 0, NULL, '1108_你知道修复古籍有多难吗#古籍_1251023.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712930267138, 'https://video-mp.oss-cn-beijing.aliyuncs.com/40a548d4-145e-4', 'cultural_relic', 0, NULL, '1184_美术生文物修复专业！《我在故宫修文物》，喜欢就去做_100663.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712930267139, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c624f802-bfba-4', 'cultural_relic', 0, NULL, '12546_快来看，国家级非遗传承人八十多岁老人讲七十多年前的重庆城和重庆人。 #传统文化  #评书  #非物质文化遗产 _85514.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712930267140, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c0d3fdec-dc0f-4', 'cultural_relic', 0, NULL, '125910_三星堆一件修复了8年的文物，是同时期全世界最大青铜器，被禁止出国展览。_3920254.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712930267141, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b8a1a891-8d10-4', 'cultural_relic', 0, NULL, '34742_这种违背伦理的合葬意义到底是什么#考古 #墓葬_900609.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712930267142, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e9ca65cb-764d-4', 'cultural_relic', 0, NULL, '4012_戏曲观众很多都是中老年人，但是通过直播，让这些非遗表演重获关注#河南山沟沟里藏着宝藏剧团 #过去一年163个剧团抖音直播间再出道_4574245.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712993181698, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0f7f1857-b63d-4', 'cultural_relic', 0, NULL, '40137_给你三秒钟，你能看出来我是啥吗？#文物 #科普 #博物馆 @抖音小助手 _521960.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712993181699, 'https://video-mp.oss-cn-beijing.aliyuncs.com/93582271-eda7-4', 'cultural_relic', 0, NULL, '41435_#博物馆 #让文物抖起来 #历史 #导游 一分钟玩转成都博物馆 #旅行大玩家 #旅行推荐官 #萌知计划 #传统文化时光瓶 @抖音青少年_289492.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712993181700, 'https://video-mp.oss-cn-beijing.aliyuncs.com/7ce17cd1-0d4a-4', 'cultural_relic', 0, NULL, '4163_#古钱币 #考古发现 #让文物抖起来 老大爷建房子发现大量古币_284414.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712993181701, 'https://video-mp.oss-cn-beijing.aliyuncs.com/876c526e-0997-4', 'cultural_relic', 0, NULL, '13856_以衣为媒 #玉礼四方 劲霸茄克第四次登陆#米兰时装周 官方日程 #高端新国货 @劲霸男装  高端系列KB HONG携中国非遗走向世界 进口质感面料、精湛剪裁廓形、现代时尚设计语言演绎东方美学 展现高端品质与文化自信，满足中国男性商闲场景下精神风貌从内至外的着装新需求_972909.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712993181702, 'https://video-mp.oss-cn-beijing.aliyuncs.com/fc7274f2-7bb9-4', 'cultural_relic', 0, NULL, '15768_冯骥才：遗产需要呵护，不能任其消亡#非遗 #传统文化 #冯骥才文学艺术研究院 #文化遗产 #非遗传承_492724.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712993181703, 'https://video-mp.oss-cn-beijing.aliyuncs.com/190f43de-d291-4', 'cultural_relic', 0, NULL, '15895_你的家乡有哪些非遗文化？#dou来揭阳看非遗@广东共青团  _316281.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712993181704, 'https://video-mp.oss-cn-beijing.aliyuncs.com/10cac205-5f09-4', 'cultural_relic', 0, NULL, '18599_传扬非遗文化精神，做非遗焕新的传承者。让传统文化“活起来”，我是奋斗讲述人杨澜，邀请你一起来体验非遗文化的魅力！@新生万物 #非遗文化 #大有学问 #江苏卫视跨年演唱会_3407263.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712993181705, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6eee63d2-a388-4', 'cultural_relic', 0, NULL, '2077_捻金缂丝是要把金线和丝线捻起来的#非物质文化遗产手工制作 #国风合伙人 #国风合伙人 #非遗传承_132000.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712993181706, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c8c6ae76-d0bc-4', 'cultural_relic', 0, NULL, '30850_童年的回忆，手艺人自制翻花。一分钟翻出十八样花，每一朵花还对应一个成语！#非遗 #翻花 #手艺人 #非物质文化遗产 #童年的回忆 _1452911.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712993181707, 'https://video-mp.oss-cn-beijing.aliyuncs.com/eebb37c0-91e6-4', 'cultural_relic', 0, NULL, '3123_日本盗掘的中国文物究竟有多少？勿忘 勿忘  #文物 _479779.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898712993181708, 'https://video-mp.oss-cn-beijing.aliyuncs.com/5dcd2c8e-3033-4', 'cultural_relic', 0, NULL, '326_是时候表演真正的技术了！#保护文物传承文化 #让文物抖起来 #文物 #匠人精神 #青铜器_7004.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713060290562, 'https://video-mp.oss-cn-beijing.aliyuncs.com/81fde901-09f2-4', 'cultural_relic', 0, NULL, '332321_一个让人大开眼界的手艺，残破的古籍被焕然一新#古籍修复师#工匠精神  #民间手艺 #非遗传承 #科普一下 _115452.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713060290563, 'https://video-mp.oss-cn-beijing.aliyuncs.com/fed7f2b9-d030-4', 'cultural_relic', 0, NULL, '3356_ #抖音看世界 文物修复的巅峰，还得看中国！ #文物  #兵马俑  #纪录片充电计划  #涨知识 _370609.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713060290564, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0037ef50-8eb6-4', 'cultural_relic', 0, NULL, '5255_曹魏正始八年墓，我国唯一一座有明确纪年的曹魏墓，被盗墓贼遗弃的文物都是国宝级文物。 #古墓  #文物 _479779.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713060290565, 'https://video-mp.oss-cn-beijing.aliyuncs.com/228df714-eaad-4', 'cultural_relic', 0, NULL, '5264_流失到美国#大都会博物馆 的中国文物瓷器，每件都是精品#历史 #文物 #器物之美 #让文物抖起来  #明清瓷器 _169674.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713060290566, 'https://video-mp.oss-cn-beijing.aliyuncs.com/76a1a2fa-7830-4', 'cultural_relic', 0, NULL, '5352_武则天的唯一遗物，纯金丝线制作的裙子，唐朝人真有钱！#历史 #科普 #揭秘 #文物 _202651.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713060290567, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c03d1cec-5627-4', 'cultural_relic', 0, NULL, '5646_在三星堆修文物，是种什么体验？#三星堆 #文物 #大国文化 #考古 #实习生小天_176481.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713060290568, 'https://video-mp.oss-cn-beijing.aliyuncs.com/1d495574-1ca2-4', 'cultural_relic', 0, NULL, '607_古董烂字画，看小姐姐如何翻新成功#字画装裱 #古旧字画装裱修复 #手工装裱 #文物修复 #旧物修复_7952.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713060290569, 'https://video-mp.oss-cn-beijing.aliyuncs.com/12bcaa79-3197-4', 'cultural_relic', 0, NULL, '4730_能收藏一件国宝级文物是什么感受？西周重器兮甲盘海外归来成为顶级的私人收藏品  #文物#收藏  #捡漏 _479779.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713060290570, 'https://video-mp.oss-cn-beijing.aliyuncs.com/764806c5-52a2-4', 'cultural_relic', 0, NULL, '47822_三星堆到底出土了什么？当你看到这件文物一定会惊讶的！#旅行大玩家_4578790.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713060290571, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f4cc5dc5-1e79-4', 'cultural_relic', 0, NULL, '48502_为什么会有那么多“辣眼睛”的文物修复？#用25年书写一行简历 #致敬文物工作者 #抖音创作者大会 _3097024.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713060290572, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d5ed4a2c-4736-4', 'cultural_relic', 0, NULL, '4859_记忆里，重庆那些非遗文化～#潼南非遗文化节 #重庆探展_937954.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713060290573, 'https://video-mp.oss-cn-beijing.aliyuncs.com/4f22d61d-4b6b-4', 'cultural_relic', 0, NULL, '516_今天修复一张残破的地契。#文物修复#文物#地契_5978.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713060290574, 'https://video-mp.oss-cn-beijing.aliyuncs.com/1ecb823a-37ac-4', 'cultural_relic', 0, NULL, '20_一件物品修复好，不是残缺的隐藏，而是对残缺的一种认同。#文物修复_990.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713060290575, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e302fcbc-aec6-4', 'cultural_relic', 0, NULL, '2320_介是你从没见过的船新版本考古盲盒，和奶奶一起修复文物吧！！！#潮玩 #盲盒 #奶奶 #修复 #河南博物院 _126878.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713060290576, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0d18e7a1-4633-4', 'cultural_relic', 0, NULL, '236201_宋代的高端玩具，最早的万向支架原理，中国古代的黑科技 #非遗传承 #滚灯 #纪录片解说 _346151.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713127399426, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d9cd168d-e1ef-4', 'cultural_relic', 0, NULL, '25966_我不是故意的，给你举三个躬_4979.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713127399427, 'https://video-mp.oss-cn-beijing.aliyuncs.com/be1c8975-f0e9-4', 'cultural_relic', 0, NULL, '26301_非遗之美，美在初心匠心，传承非遗需要探索新的场景才能薪火不断。#遗见倾城_4092671.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713127399428, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b887483e-82c4-4', 'cultural_relic', 0, NULL, '811504_明星妆容课程大公开，普通人看完都能实现颜值飞跃，赶紧艾特的你的老姐妹进来学 #浓颜 #淡颜 #妆容 _2516917.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713127399429, 'https://video-mp.oss-cn-beijing.aliyuncs.com/acc3595d-8a8a-4', 'cultural_relic', 0, NULL, '82079_#非物质文化遗产 大口径，半成品。#最美手艺人_7216.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713127399430, 'https://video-mp.oss-cn-beijing.aliyuncs.com/236f31bf-80a0-4', 'cultural_relic', 0, NULL, '84_怀疑刚出土的，太可怕了，谁的部下，这么勇猛#青铜器 #危险 #鉴定 #文物 #勇士_21.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713127399431, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6b07204b-e3e5-4', 'cultural_relic', 0, NULL, '9679_为什么老有人想拿走中国文化？#传统文化 #非遗 #奇人匠心 _536740.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713127399432, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0c9260fb-05ff-4', 'cultural_relic', 0, NULL, '61091_长街曲巷，黛瓦粉墙，谁在等着你，你又在等着谁？#非遗#油纸伞#注定的缘分#爱情#青石小巷#古镇#泸州伞里 #与非遗同框 _968697.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713127399433, 'https://video-mp.oss-cn-beijing.aliyuncs.com/190fc92a-efc9-4', 'cultural_relic', 0, NULL, '616_你绝对没见过的湖南非遗文化！湖南人必看！  #湖南  #长沙  #非遗合伙人  #非遗_542.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713127399434, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0c528927-edea-4', 'cultural_relic', 0, NULL, '698617_#世界非物质文化遗产 泰顺木偶戏，#李白醉酒写诗，#千年的艺术传承 ，游泰顺，你值得一看！_87488.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713127399435, 'https://video-mp.oss-cn-beijing.aliyuncs.com/23ff338d-87e7-4', 'cultural_relic', 0, NULL, '77055_曾侯乙墓出土的最神秘的文物，战国金弹簧器，其用途至今无人知道#文物  #曾侯乙墓  _479779.mp4', 1);
INSERT INTO `tb_video` VALUES (1706898713127399436, 'https://video-mp.oss-cn-beijing.aliyuncs.com/8bd7fc8c-f0ef-4', 'cultural_relic', 0, NULL, '7731_《3-3》三星堆奇怪的青铜器 #青铜器 #探秘_151676.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900883805540353, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c254785a-cbf8-4', 'news', 0, NULL, '3480_#热点新闻事件 #真实事件 #恋爱 #感情 #新闻.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900883960729601, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f436b314-e99b-4', 'news', 0, NULL, '366_#内容过于真实.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900883960729602, 'https://video-mp.oss-cn-beijing.aliyuncs.com/64833e07-11a0-4', 'news', 0, NULL, '387_女子花8500元买Lv拖鞋、只穿2次就掉色，柜员：没想到会有人穿第二次#社会百态真实事件 #热点新闻事件.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900883960729603, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f9283229-68d8-4', 'news', 0, NULL, '4061_这种人才  见过多少？#内容过于真实#网约车.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900883960729604, 'https://video-mp.oss-cn-beijing.aliyuncs.com/a6bb808e-db49-4', 'news', 0, NULL, '45856_.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900883960729605, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e9fed225-98ce-4', 'news', 0, NULL, '29349_划过去了，又特意回来评论了一下：我那是电视吗？不是花钱买的广告屏吗？#关闭电视开机广告用了3天 #电视广告 #无语事件.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900883960729606, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d4ad9dee-e551-4', 'news', 0, NULL, '2938_评委质疑传统文化，被 #陈道明当众怒怼 #娱评大赏 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706900883960729607, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6630c0e2-99bf-4', 'news', 0, NULL, '30763_女博士带孩子参加淫乱聚会，导致孩子被虐待致死#普法 #反邪教宣传语 #社会新闻热点 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706900883960729608, 'https://video-mp.oss-cn-beijing.aliyuncs.com/84576209-b2a5-4', 'news', 0, NULL, '336582_#娱乐评论大赏 高中生体力就是好，要我跑完指定得在地上躺着哈哈哈。#高中生 #八百米 #体测 #学生时代.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900883960729609, 'https://video-mp.oss-cn-beijing.aliyuncs.com/904a0785-6472-4', 'news', 0, NULL, '33956_今日话题  外国男人有什么好，为何中国女孩都喜欢往老外身上凑呢  #崇洋媚外是一种病 #崇洋媚外被打脸 #崇洋媚外 #正能量传递.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900883960729610, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6b32fd78-9800-4', 'news', 0, NULL, '10528_#张颂文半夜醒来：不是 他有病吧#娱乐评论大赏#采访名场面#明星故事.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900883960729611, 'https://video-mp.oss-cn-beijing.aliyuncs.com/602129fa-5725-4', 'news', 0, NULL, '1082_房东扣下租客6000元押金，租客一气之下将房间灌满水，租客：押金不要了，送你了#社会百态真实事件 #案件故事解说 #热点新闻事件 #真实事件 #民生纪实.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884023644162, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d7a6ff98-226a-4', 'news', 0, NULL, '11380_#热点新闻 #正能量 #人间温暖.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884023644163, 'https://video-mp.oss-cn-beijing.aliyuncs.com/23a08198-b379-4', 'news', 0, NULL, '12503_下半年可能会出现的情况#内容过于真实.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884023644164, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ada06825-8ded-4', 'news', 0, NULL, '141304_奇葩新闻千千万，安徽卫视占一半....#有趣冷知识 #省流 #涨知识.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884023644165, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c94f5000-be42-4', 'news', 0, NULL, '24980_外交部：#中方决定对两家美国军工企业实施制裁 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884023644166, 'https://video-mp.oss-cn-beijing.aliyuncs.com/67564a8f-1c61-4', 'news', 0, NULL, '2510_闯一个红灯给一万 网友：为啥我没遇到#易车 #易车超级测评体系.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884023644167, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ecebe0c2-6eba-4', 'news', 0, NULL, '26481_如果当年吴京在场，高以翔就不会出事吧 #战狼2 #吴京.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884023644168, 'https://video-mp.oss-cn-beijing.aliyuncs.com/2babe2e4-8a64-4', 'news', 0, NULL, '2771_@抖音小助手.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884023644169, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6d6ce347-6a4f-4', 'news', 0, NULL, '284_#抖音创作者大会 #dou上热门 #三农.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884023644170, 'https://video-mp.oss-cn-beijing.aliyuncs.com/9ee5cff4-2bc8-4', 'news', 0, NULL, '9932_世界首富即将迎来一位中国人，而且还可能出现在你我身边#世界首富#期货#巴菲特#投资@抖音小助手@dou+小助手.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884023644171, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f2118505-62ca-4', 'news', 0, NULL, '15122_#不完美受害人开播  女孩遭遇职场侵犯，父母的做法真是绝了！施暴者不只有她的领导，还有这样让人窒息的父母。。#不完美受害人.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884023644172, 'https://video-mp.oss-cn-beijing.aliyuncs.com/fb4aac61-10e5-4', 'news', 0, NULL, '16735_对不努力、停播的员工，倪总很生气#海杉文化 #倪海杉#倪海杉助理#武汉户外.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884023644173, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f641688d-4531-4', 'news', 0, NULL, '2237_恐怖的石头，眨眼的功夫就把钉子干掉了#奇石 #恐怖事件 #古玩 #收藏 #不可思议.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884023644174, 'https://video-mp.oss-cn-beijing.aliyuncs.com/51dbbf26-7e24-4', 'news', 0, NULL, '23117_请不要把问题给带跑偏了.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884023644175, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d0589149-5230-4', 'news', 0, NULL, '2427_#江苏徐州#医院机器人 #大妈 #江苏新闻  砸机器人缘故！.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884023644176, 'https://video-mp.oss-cn-beijing.aliyuncs.com/bb14fa64-bdc1-4', 'news', 0, NULL, '68388_再没见过这样的绅士礼.. #张国荣#娱评大赏 #永远怀念张国荣 #张国荣逝世20周年  #唐鹤德  #梁朝伟 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884086558721, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0c7931e1-f327-4', 'news', 0, NULL, '77810_2022年上海十大女富豪排行榜#把正能量传递出去让更多人看到 #期货知识 #知识分享 #关注我每天坚持分享知识 #希望能帮到有需要的人 #热点新闻事件 #老百姓关心的话题.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884086558722, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ecea3854-35ec-4', 'news', 0, NULL, '9087_国外留学生将不能再进入国企或党政部门工作，出国留学不再是镀金的招牌。#留学生 #留学生回国 #间谍 #引人深思.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884086558723, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f3f96d24-c620-4', 'news', 0, NULL, '9197_哎...#内容过于真实 #主打的就是一个真实 #热点新闻事件 #请大家认真看完 #社会百态真实事件.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884086558724, 'https://video-mp.oss-cn-beijing.aliyuncs.com/cb2dc3b3-7760-4', 'news', 0, NULL, '94470_2010年广州女警乔装成便衣，果断开枪成功拯救人质真实录像 #真实案件  #真实影像  #案件故事 #历史故事.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884086558725, 'https://video-mp.oss-cn-beijing.aliyuncs.com/9c944c9b-d3aa-4', 'news', 0, NULL, '45869_白拿别人收藏的网站，国人全是精品#网站 #网站推荐 #网站分享 #网页 #电手.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884086558726, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d21f0620-0c38-4', 'news', 0, NULL, '505_目前年收入10万元以下的个人基本不缴纳或者仅缴纳少量的个人所得税，三项专项附加扣除标准提高以后4亿多中等收入群体受益最大#个人所得税 #3岁以下婴幼儿照护费进个税专项扣除 #子女教育 #赡养老人.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884086558727, 'https://video-mp.oss-cn-beijing.aliyuncs.com/36c3d562-1457-4', 'news', 0, NULL, '515_女子一脚油门干翻30多万凯迪拉克#交通安全 #女司机.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884086558728, 'https://video-mp.oss-cn-beijing.aliyuncs.com/a6f15823-598a-4', 'news', 0, NULL, '65189_#俄罗斯 #俄罗斯美女 #外国人 #外国小姐姐 #外国人在中国 #老外 #热门 #热门音乐🔥 #热门歌曲.mp4', 1);
INSERT INTO `tb_video` VALUES (1706900884086558729, 'https://video-mp.oss-cn-beijing.aliyuncs.com/bd049a0a-dce8-4', 'news', 0, NULL, '67805_一人犯错…全家受牵连！ #农村原创视频 #搞笑视频.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884434030594, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b4b8fc98-1136-4', 'red', 0, NULL, ' @感人事迹(O3xw94fz4ayckvyg) 的精彩视频.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884547276802, 'https://video-mp.oss-cn-beijing.aliyuncs.com/770aba52-fc5f-4', 'red', 0, NULL, ' @骑行天下2222(O3xy4xmz7w9x5ibc) 的精彩视频.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884547276803, 'https://video-mp.oss-cn-beijing.aliyuncs.com/da530959-dd90-4', 'red', 0, NULL, '#中国 #亚洲  亚洲四大强国.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884547276804, 'https://video-mp.oss-cn-beijing.aliyuncs.com/46c4bf84-22ab-4', 'red', 0, NULL, '#中国崛起 #世界强国 中国迟早会超越美国，成为世界第一大强国。.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884547276805, 'https://video-mp.oss-cn-beijing.aliyuncs.com/5c0be990-b562-4', 'red', 0, NULL, '#创作灵感 虽然25岁时就成了烈士，但他的事迹将永远不会被中国人民忘记 #历史 #铭记历史致敬英烈 @快手热点(O3xddgkd5fav5if9).mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884547276806, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c295bc53-0546-4', 'red', 0, NULL, '#致敬一代伟人 #影视剪辑 #清明节缅怀先烈 祭奠先烈,不忘忠魂,努力实现中国梦!.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884547276807, 'https://video-mp.oss-cn-beijing.aliyuncs.com/dd7a4b69-093b-4', 'red', 0, NULL, '#致敬那些革命前辈们  #致抗日英雄  #祖国永不忘记.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884547276808, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6a0d44ea-b88f-4', 'red', 0, NULL, '#英雄一路走好  #致敬英雄缅怀先烈  #铭记历史致敬英烈.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884547276809, 'https://video-mp.oss-cn-beijing.aliyuncs.com/a23b52ae-2df3-4', 'red', 0, NULL, '#集结吧光合创作者  #今日正能量 #致敬革命英雄.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385665, 'https://video-mp.oss-cn-beijing.aliyuncs.com/239160cf-a83b-4', 'red', 0, NULL, '4月4日，#巧家 社会各界开展“传承红色基因·2023#清明祭英烈 ”主题实践活。#网络中国节·清明.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385666, 'https://video-mp.oss-cn-beijing.aliyuncs.com/033732a3-1603-4', 'red', 0, NULL, '牢记历史， 致敬革命先辈们！#致敬英雄  #致敬革命先烈英勇无畏  #少年强则国强 @快手正能量(O3xzwm4cm5yxi55u) @快手粉条(O3xhcy6vhfzcu3qe) @快手创作者中心(O3xrgtux2ehryffe).mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385667, 'https://video-mp.oss-cn-beijing.aliyuncs.com/7266f164-1575-4', 'red', 0, NULL, '缅怀先烈，铭记历史，致敬英雄，牢记担当，赓续红色基因。#我们不曾忘记 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385668, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b2a25c2d-4733-4', 'red', 0, NULL, '缅怀革命先烈 #毛泽东思想永放光芒.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385669, 'https://video-mp.oss-cn-beijing.aliyuncs.com/23f528f3-b320-4', 'red', 0, NULL, '缅怀革命先烈 传承革命精神#2023清明祭英烈  #致敬公安英雄@河源公安@快手热点(O3xddgkd5fav5if9) .mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385670, 'https://video-mp.oss-cn-beijing.aliyuncs.com/a2f388db-c22d-4', 'red', 0, NULL, '缅怀革命先烈 赓续红色血脉 践行强国誓言.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385671, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6db95331-d7f9-4', 'red', 0, NULL, '@快手创作者中心(O3xrgtux2ehryffe) @快手热点(O3xddgkd5fav5if9) @快手管理员(O3x9cfpnukevu45a) #剪辑 #致敬英雄 #历史 历史.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385672, 'https://video-mp.oss-cn-beijing.aliyuncs.com/4f6ae2b0-965b-4', 'red', 0, NULL, '传承红色基因，缅怀革命先烈 #缅怀先烈.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385673, 'https://video-mp.oss-cn-beijing.aliyuncs.com/7c1400f2-f200-4', 'red', 0, NULL, '几十年革命，几十万中国人牺牲，我们的五星红旗，升起来的是我们的信仰，是象征着国家越来越好 #致敬英雄共悼逝者 #祝全国人民幸福安康 @快手粉条(O3xhcy6vhfzcu3qe) @快手热点(O3xddgkd5fav5if9) @快手创作者中心(O3xrgtux2ehryffe).mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385674, 'https://video-mp.oss-cn-beijing.aliyuncs.com/41e75a4d-55a6-4', 'red', 0, NULL, '各地官兵以多种形式祭奠革命先烈。 #永远记住你  #2023清明祭英烈.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385675, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ef2fdbc9-e772-4', 'red', 0, NULL, '平江县隆重举行清明祭扫活动，深切缅怀革命先烈的丰功伟绩，虔诚祭奠革命先烈的不朽英魂#今日平江 #追思英雄家国永念 #我们不曾忘记.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385676, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c73020b8-884a-4', 'red', 0, NULL, '#向革命先烈致敬，学习他们英勇顽强不怕死的革命精神保卫祖国。.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385677, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d8214cdb-4f51-4', 'red', 0, NULL, '#快手电影星熠计划 #电影推荐  致敬革命先烈 ，乡亲们莫要失望！.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385678, 'https://video-mp.oss-cn-beijing.aliyuncs.com/4ef404cb-c21d-4', 'red', 0, NULL, '#烈士永垂不朽 #缅怀革命先烈 传承红色基因@庙湾小学@柳林县广播电视台（新闻部） @快手热点(O3xddgkd5fav5if9).mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385679, 'https://video-mp.oss-cn-beijing.aliyuncs.com/3e68cf7c-a45b-4', 'red', 0, NULL, '#秋收起义 #缅怀革命先烈 #弘扬红军长征精神 @快手热点(O3xddgkd5fav5if9).mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385680, 'https://video-mp.oss-cn-beijing.aliyuncs.com/917f83e6-95c6-4', 'red', 0, NULL, '#网络中国节·清明  缅怀革命先烈，余庆开展清明祭扫活动.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385681, 'https://video-mp.oss-cn-beijing.aliyuncs.com/df2e7141-9a51-4', 'red', 0, NULL, '缅怀革命先烈，弘扬爱国精神 #清明  #缅怀先烈 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385682, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6e0d7cd1-88eb-4', 'red', 0, NULL, '缅怀革命先烈，重温光辉历程。4月4日，云南普洱。三代人在烈士纪念碑前红了眼眶！.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385683, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d79cdc22-b6d2-4', 'red', 0, NULL, '缅怀革命英烈、赓续精神血脉.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385684, 'https://video-mp.oss-cn-beijing.aliyuncs.com/248150a1-2c38-4', 'red', 0, NULL, '辽源市公安局开展“缅怀革命先烈 传承红色精神”祭扫活动。 #辽源  #公安  #清明节缅怀先烈 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385685, 'https://video-mp.oss-cn-beijing.aliyuncs.com/69a4b90e-a14c-4', 'red', 0, NULL, '那一抹中国红，今天愈发夺人心魄 #国人减速带  #BOOT剪辑社  #致敬革命先烈英勇无畏.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385686, 'https://video-mp.oss-cn-beijing.aliyuncs.com/dc665e5e-1b55-4', 'red', 0, NULL, '强国必须强军，军强才能国安！⭐️ #大国重器 #军事 #爱国正能量.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385687, 'https://video-mp.oss-cn-beijing.aliyuncs.com/394c0abb-a863-4', 'red', 0, NULL, '此生无悔入华夏.来生还做中国人！      #铭记历史勿忘国耻 #超燃混剪 #致敬先烈 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385688, 'https://video-mp.oss-cn-beijing.aliyuncs.com/3923271e-f3c5-4', 'red', 0, NULL, '清明祭英烈 吾辈当自强，祥云县革命英烈红军小学，到龙翔公园缅怀王德三烈士 #清明节缅怀先烈 #清明祭英烈 #网络中国节·清明.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385689, 'https://video-mp.oss-cn-beijing.aliyuncs.com/5d227763-89db-4', 'red', 0, NULL, '清明祭英烈活动，革命烈士永垂不朽#浙里是浙江消防.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385690, 'https://video-mp.oss-cn-beijing.aliyuncs.com/14ffa16b-64f1-4', 'red', 0, NULL, '清明节，祭英烈#清明缅怀先辈  #清明寄追思  #今日清明.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884614385691, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d05e986e-f3e8-4', 'red', 0, NULL, '钢七连 #致敬革命先烈英勇无畏 #勿忘历史吾辈自强.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884677300226, 'https://video-mp.oss-cn-beijing.aliyuncs.com/8299b8af-acbc-4', 'red', 0, NULL, '铭记历史致敬先烈 #致敬革命先烈 #铭记历史致敬英雄 #牢记历史勿忘国耻 @快手粉条(O3xhcy6vhfzcu3qe) @快手热点(O3xddgkd5fav5if9) @我要上热门(O3x8er38dpbhvbaa).mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884677300227, 'https://video-mp.oss-cn-beijing.aliyuncs.com/39a3d9d5-f24e-4', 'red', 0, NULL, '革命烈士，永垂不朽。 #铭记历史 #致敬先烈 #吾辈当自强  .mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884677300228, 'https://video-mp.oss-cn-beijing.aliyuncs.com/fe7b09ef-10d2-4', 'red', 0, NULL, '革命烈士，永垂不朽。.mp4', 1);
INSERT INTO `tb_video` VALUES (1706902884677300229, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ea3f073e-0421-4', 'red', 0, NULL, '革命英烈为祖国为党壮烈牺牲#人民英雄永垂不朽 。.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040550219778, 'https://video-mp.oss-cn-beijing.aliyuncs.com/3fc304b1-3e49-4', 'affairs', 0, NULL, '18 “投资理财”不怕你赚 怕你不来 #投资理财  #骗局 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134337, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6b87ebc0-09f1-4', 'affairs', 0, NULL, '2 #专家称月入五千就不要理财了 #来点财经范儿.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134338, 'https://video-mp.oss-cn-beijing.aliyuncs.com/4d47226b-9c1e-4', 'affairs', 0, NULL, '22年理财到底投哪里！ #理财.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134339, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f9702969-ed96-4', 'affairs', 0, NULL, '24 梭哈就完事 #基金 #理财 #小白理财.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134340, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ef41c00c-6e83-4', 'affairs', 0, NULL, '28 无意中看到这个骗子的理财广告，上个月这人打的是什么启牛理财，我进去听了几天课程，然后就让你买2980的理财课程，不买还天天微信轰炸，烦的我立马删除了。大家别信这种理财广告，假的！！.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134341, 'https://video-mp.oss-cn-beijing.aliyuncs.com/968e1821-b23e-4', 'affairs', 0, NULL, '#基金 #理财 #投资.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134342, 'https://video-mp.oss-cn-beijing.aliyuncs.com/7dee7426-44ba-4', 'affairs', 0, NULL, '1 3万元的压岁钱怎么花？学了理财课的学生拿去做了投资“没太大的目标只要能实现钱生钱就好！”.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134343, 'https://video-mp.oss-cn-beijing.aliyuncs.com/4be14945-29c6-4', 'affairs', 0, NULL, '10 普通人的理财方法 #理财 #我在快手涨知识 #财经  @快手财经科技(O3x752vu5zjzfjwa) .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134344, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0f468d2f-5380-4', 'affairs', 0, NULL, '1000万闲钱如何理财？2023年能💰多少？#基金 #投资 #理财 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134345, 'https://video-mp.oss-cn-beijing.aliyuncs.com/80a099b5-03f2-4', 'affairs', 0, NULL, '10万块怎么理财，能保底了可转Z来啦 #理财  #赚钱  #我在快手涨知识  @快手热点(O3xddgkd5fav5if9) .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134346, 'https://video-mp.oss-cn-beijing.aliyuncs.com/8b77355d-5558-4', 'affairs', 0, NULL, '36 站在无风险理财的角度，盘点一下适合普通人投资的产品 #理财  #投资 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134347, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d9341a22-067c-4', 'affairs', 0, NULL, '4 #财经自媒体.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134348, 'https://video-mp.oss-cn-beijing.aliyuncs.com/2f435cf1-1062-4', 'affairs', 0, NULL, '41 年轻人学习理财第三步   #财商思维.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134349, 'https://video-mp.oss-cn-beijing.aliyuncs.com/26d33037-80b4-4', 'affairs', 0, NULL, '5 我买基金不亏钱，全靠这3个习惯！.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134350, 'https://video-mp.oss-cn-beijing.aliyuncs.com/523f5122-f485-4', 'affairs', 0, NULL, '6 #财经知识 #财经 #基金.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134351, 'https://video-mp.oss-cn-beijing.aliyuncs.com/35705227-f470-4', 'affairs', 0, NULL, '13 短期大额资金该如何理财呢#财商思维 #投资理财 #短期资金.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134352, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6f004e44-c037-4', 'affairs', 0, NULL, '14 不怕！国家出手了 #财经  #理财  #股票 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134353, 'https://video-mp.oss-cn-beijing.aliyuncs.com/43a7184d-371d-4', 'affairs', 0, NULL, '15 收益图好起来了吗 #基金 #理财.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134354, 'https://video-mp.oss-cn-beijing.aliyuncs.com/64b05b49-d753-4', 'affairs', 0, NULL, '16 #财经 #财税 #会计.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134355, 'https://video-mp.oss-cn-beijing.aliyuncs.com/a53c5fdb-5308-4', 'affairs', 0, NULL, '16 挑战基金收益十万第161天，昨日收益-1843元！ #韭菜的自我修养 #金融理财.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134356, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b5d95534-0f87-4', 'affairs', 0, NULL, '你的钱还存在银行，拿着定期利息？了解这三种理财方式，让你躺着赚钱！ #决战财经之巅  #财经知识进万家  #理财    .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134357, 'https://video-mp.oss-cn-beijing.aliyuncs.com/025a4ff6-e37a-4', 'affairs', 0, NULL, '你能持有不动，拿到现在吗？选择大于努力！  #股市  #理财  #数据可视化 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040613134358, 'https://video-mp.oss-cn-beijing.aliyuncs.com/045772ce-e48a-4', 'affairs', 0, NULL, '叔只能说是一种很成功的营销策略，大侄子们有时候一个点子就能撬动一个产业#老李说网络 #理财 #金豆豆 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243201, 'https://video-mp.oss-cn-beijing.aliyuncs.com/60ae7f7f-5a5b-4', 'affairs', 0, NULL, '小投入，这样做理财最安心！#财经 #理财 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243202, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e9805aa4-aae8-4', 'affairs', 0, NULL, '市场在迅速扩张中💪💪💪.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243203, 'https://video-mp.oss-cn-beijing.aliyuncs.com/a953cd54-dd84-4', 'affairs', 0, NULL, '7 理财能致富吗？#理财.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243204, 'https://video-mp.oss-cn-beijing.aliyuncs.com/23da5c28-e569-4', 'affairs', 0, NULL, '8 新手如何理财？#理财 #基金 #快手财经南北之战 @快手财经科技(O3x752vu5zjzfjwa)   .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243205, 'https://video-mp.oss-cn-beijing.aliyuncs.com/24b8017b-b7ba-4', 'affairs', 0, NULL, '9 理财第一步，强制储蓄 #消费 #消费心理学 #理财.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243206, 'https://video-mp.oss-cn-beijing.aliyuncs.com/5f38e113-a859-4', 'affairs', 0, NULL, '不怕！国家出手了 #财经  #理财  #股票 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243207, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ffde4db0-95fc-4', 'affairs', 0, NULL, '亏了3年，我发现不买基金比什么都重要 #支付宝基金 #基金 #基金定投 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243208, 'https://video-mp.oss-cn-beijing.aliyuncs.com/db3f5488-2ad7-4', 'affairs', 0, NULL, '理财越理越穷？ #搞钱.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243209, 'https://video-mp.oss-cn-beijing.aliyuncs.com/7048a617-5716-4', 'affairs', 0, NULL, '视频不长！把它送给所有想做好事情的朋友，也包括我自己。加油！#认知 #负债人 #理财.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243210, 'https://video-mp.oss-cn-beijing.aliyuncs.com/9d2bc81a-1753-4', 'affairs', 0, NULL, '讲一个我在用的投资策略。#超级投资家2022 #基金 #理财 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243211, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ed1c9407-a52f-4', 'affairs', 0, NULL, '该存钱的年纪就，要学会存钱！#思维#存钱#认知#财富#理财.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243212, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ddbc0b12-7338-4', 'affairs', 0, NULL, '金融监督管理总局发布虚假网络投资理财风险提示：提醒广大消费者高度警惕此类诈骗，谨防财产损失。 #热点财经 #权威发布 #理财有风险投资需谨慎.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243213, 'https://video-mp.oss-cn-beijing.aliyuncs.com/cfbe5401-0af1-4', 'affairs', 0, NULL, '我买基金不亏钱，全靠这3个习惯！.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243214, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6fee0ba1-26e5-4', 'affairs', 0, NULL, '我这个股票账户开的一波三折，为了万一点三的手续费也是值得，蚊子腿在小也是肉呀，今天首次出摊，虽然亏了点钱，但是很开心啊，每天都有期待了 #股票 #财经.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243215, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6167ec59-3959-4', 'affairs', 0, NULL, '数字人为新手讲解10万元如何进行理财，分享实用的金融小知识，带给您最接地气的理财建议。#数字员工 #数字人 #金融理财.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243216, 'https://video-mp.oss-cn-beijing.aliyuncs.com/40a396c8-2a78-4', 'affairs', 0, NULL, '新快手创作者中心助我上热门 #理财的尽头是保险 #理财与保险 #热点财经.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903040680243217, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0d7b3e1c-8dd4-4', 'affairs', 0, NULL, '理财第一步，强制储蓄 #消费 #消费心理学 #理财.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258570141698, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f8bb7262-9be5-4', 'travel', 0, NULL, '“想去远一些的地方，去看看柔丽的山、清冽的水，在旅途上和同座聊聊梦想、谈谈生活，交换爱人的名字，天地辽阔，四处皆可流浪” #情感 #旅游 #涨知识 @快手情感(O3xmr6vuyyeedpj6).mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056258, 'https://video-mp.oss-cn-beijing.aliyuncs.com/276f77c7-5dc2-4', 'travel', 0, NULL, '一亿人已在贵州，五亿人奔跑在路上，球迷们有福了美女陪你看国际水平球赛，爽！快666私信我，给您安排上  #贵州组团旅游价格 #亿人游团队价格 #旅游.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056259, 'https://video-mp.oss-cn-beijing.aliyuncs.com/211f9629-9de5-4', 'travel', 0, NULL, '三个人的爱情就不是爱，就允许被背叛了吗？ #有声漫画  #漫画解说  #漫画 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056260, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d675b97d-da50-4', 'travel', 0, NULL, '三个人连夜爬到泰山山顶看日出，结果一觉睡到10点多。网友：日出没看成 自己成了景点#山东dou知道  #泰山会制服每一个嘴硬的人.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056261, 'https://video-mp.oss-cn-beijing.aliyuncs.com/8a48a84d-6edc-4', 'travel', 0, NULL, '中秋节抽取一位👧🏻一起搭个伴观看前任4  #前任4.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056262, 'https://video-mp.oss-cn-beijing.aliyuncs.com/1ae0fd30-9543-4', 'travel', 0, NULL, '#中秋国庆双节热门旅游城市排名 中秋国庆双节热门旅游城市排名～你最想去哪个城市旅游呢？🤩#娱乐显微镜观星计划.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056263, 'https://video-mp.oss-cn-beijing.aliyuncs.com/456cd75d-ee0b-4', 'travel', 0, NULL, '#全民看亚运  #万粉光影计划  #快手青年计划来了.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056264, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b93533aa-ca4c-4', 'travel', 0, NULL, '#夜景拍摄 #城市夜景 #城市夜景美图.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056265, 'https://video-mp.oss-cn-beijing.aliyuncs.com/344c4416-797f-4', 'travel', 0, NULL, '#很哇塞的周末 #十一去哪玩 #紫蒙湖旅游风景区.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056266, 'https://video-mp.oss-cn-beijing.aliyuncs.com/12379db6-3097-4', 'travel', 0, NULL, '#很哇塞的周末 #十一去哪玩##紫蒙湖旅游风景区#.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056267, 'https://video-mp.oss-cn-beijing.aliyuncs.com/51aa814f-a7d0-4', 'travel', 0, NULL, '什么叫旅游？？旅游就是从自己活腻的地方到别人活腻的地方去，把自己的钱花光光，让别人富裕起来，然后再满身疲惫的回到自己活腻的地方。再然后省吃俭用的，坚强不熄的生活下来！ #旅游 #街拍  #创作者中心.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056268, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c96058f4-60b5-4', 'travel', 0, NULL, '唉 生活真难.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056269, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b08928ff-125a-4', 'travel', 0, NULL, '四季更替 我们还是我们期待我们的1+1=4✌🏻.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056270, 'https://video-mp.oss-cn-beijing.aliyuncs.com/356b103c-499c-4', 'travel', 0, NULL, '在冷湖雅丹群中 有一处地貌很像火星 这里眼见之处皆是茫茫戈壁、漫天黄沙 除了一片黄土，再无其它 大自然的鬼斧神工 把这里雕刻成了人迹罕至的无人区 但这也正是大家想象中火星的模样 在这里 从不拒绝任何想象 来这里 拍摄属于自己的火星大片…… #打造国际生态旅游目的地  #大美青海生态旅游.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056271, 'https://video-mp.oss-cn-beijing.aliyuncs.com/dca44bd0-48a9-4', 'travel', 0, NULL, '好像和刚在一起没什么区别 甚至更爱了 #实况live.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056272, 'https://video-mp.oss-cn-beijing.aliyuncs.com/778d13a8-8ab8-4', 'travel', 0, NULL, '来云南旅游，这5个宝藏景点不去会后悔一辈子#云南美好推荐官 #宝藏景点 #旅行.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056273, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e6c093a1-7ce5-4', 'travel', 0, NULL, '欧冠A组首轮拜仁主场4比3战胜曼联，送曼联3连败！奥纳纳扑救黄油手，卡塞米罗双响难救主 #拜仁4比3曼联 #以球之名 #以球之名十万火集.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056274, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c3b217c4-752c-4', 'travel', 0, NULL, '江西又获国际荣誉！萍乡武功山户外穿越路线被授予国际山地徒步旅游示范线路，欢迎各位来江西玩～#向世界推介江西 #登上山顶看美景 #徒步.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056275, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e6ab22c4-f7ae-4', 'travel', 0, NULL, '没用大活动不敢惊动你，紫蒙湖太阳岛景区双人票只要在9月27日前购买只需要99元，不用随时可退。另外，十一期间每晚1900， 紫蒙湖太阳岛灯光秀、野人表演、篝火烟花晚会等表演精彩纷呈。#很哇塞的周末 #十一去哪玩 #紫蒙湖旅游风景区.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056276, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e790abf1-a7af-4', 'travel', 0, NULL, '生活有点调皮。 #90后的四婚小夫妻 #夫妻搞笑日常.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056277, 'https://video-mp.oss-cn-beijing.aliyuncs.com/7e643ae4-262e-4', 'travel', 0, NULL, '#很哇塞的周末#十一去哪玩#紫蒙湖旅游风景区.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056278, 'https://video-mp.oss-cn-beijing.aliyuncs.com/764ed858-d6a0-4', 'travel', 0, NULL, '#我在海边的日子 #看看这个景色.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056279, 'https://video-mp.oss-cn-beijing.aliyuncs.com/cde26c32-8705-4', 'travel', 0, NULL, '#旅游攻略 #旅游推荐 #旅游景点.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056280, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f071aa0c-3e02-4', 'travel', 0, NULL, '#游客吐槽黄山景区飞虫成灾直冲人脸  9月19日，安徽黄山。有游客发视频称黄山景区飞虫成灾直冲人脸，特别可怕。对此，景区回应称，已经跟园林部门沟通过了，近期会处理，这些飞虫一般不会对人造成影响。@快手热点(O3xddgkd5fav5if9) .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056281, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ba91bda8-3f7d-4', 'travel', 0, NULL, '9月28号那天，我会拿着一杯你喜欢喝的奶茶，坐在最后一排，等电影完了，奶茶喝完了，是时候跟你说再见了，我也要开始新的生活了 #前任4 #前任英年早逝.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056282, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b218e98d-d120-4', 'travel', 0, NULL, '好好生活 怀念不一定要见面 喜欢不一定在一起 每种遗憾和距离都有它存在的意义 #悲伤小狗上学日记2.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056283, 'https://video-mp.oss-cn-beijing.aliyuncs.com/9760014f-16bd-4', 'travel', 0, NULL, '寺口子旅游攻略来啦！ #旅游  #记录生活  #旅游景点.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056284, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b1dc9649-af25-4', 'travel', 0, NULL, '广州增城幸福田园稻田惊现山鸡，品尝稻谷美食享丰收喜悦 #旅游 #亲子 #动物鸟世界.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056285, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e55f5df0-7277-4', 'travel', 0, NULL, '搜索#快手小游戏 免下载 立即玩，关注@快手小游戏(O3x2d2ca2n9zj5pi)  ，获取超多好玩小游戏！ @快手小游戏(O3x2d2ca2n9zj5pi) @快手游戏(O3xqhn43krsnuvwm) #快手游戏给我流量 #龙兽争霸4.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056286, 'https://video-mp.oss-cn-beijing.aliyuncs.com/4869a5b0-068b-4', 'travel', 0, NULL, '新的一年要以快乐为主题展开 #机车  #ride4  #steam游戏 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056287, 'https://video-mp.oss-cn-beijing.aliyuncs.com/5ed9e3c9-2bfd-4', 'travel', 0, NULL, '画质在主页👗.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056288, 'https://video-mp.oss-cn-beijing.aliyuncs.com/39ca63a8-252f-4', 'travel', 0, NULL, '私人订制，激光刻字，防丢钥匙扣。 #防丢钥匙扣 #钥匙扣 #激光刻字.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056289, 'https://video-mp.oss-cn-beijing.aliyuncs.com/51c88f36-b680-4', 'travel', 0, NULL, '紫蒙湖旅游风景区#很哇塞的周末 #十一去哪玩 #紫蒙湖旅游风景区.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056290, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f437ac43-9fbb-4', 'travel', 0, NULL, '苹果4手机，改的探索版，功能按键一切正常，插卡即用，带原盒，110包邮！ #苹果4 #苹果4s.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056291, 'https://video-mp.oss-cn-beijing.aliyuncs.com/4600c398-612a-4', 'travel', 0, NULL, '茶马道三谷水丽世山居，融乡村宁静与景区活力促振兴 #舍不得的丽江  #有一种叫云南的生活 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056292, 'https://video-mp.oss-cn-beijing.aliyuncs.com/8ce8126b-bb8d-4', 'travel', 0, NULL, '路虎发现4外观硬朗、细节拉满，开出去也气势十足，当然价格也一直很坚挺.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056293, 'https://video-mp.oss-cn-beijing.aliyuncs.com/835999f4-e3f5-4', 'travel', 0, NULL, '连输入法都记得你，你让我怎么忘 #机车 #ride4.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056294, 'https://video-mp.oss-cn-beijing.aliyuncs.com/474e340d-e6bc-4', 'travel', 0, NULL, '需要视频同款数字练习电子版字帖的，评论666私信老师可领取 #幼小衔接 #一起来练字 #练字打卡.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903258633056295, 'https://video-mp.oss-cn-beijing.aliyuncs.com/670cd5f2-e429-4', 'travel', 0, NULL, '预算有限且人少的五个小众旅游胜地。人均2000玩到嗨 #一起看最美的自然风景 #快手旅游 #旅游攻略.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426820452353, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d0fd2812-e537-4', 'cultural_relic', 0, NULL, '你们甘肃省博物馆的文物，画风都这么清奇吗？？？#甘肃省博物馆  #文物  #搞笑.mp4.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755521, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b4d5d9c2-d6af-4', 'cultural_relic', 0, NULL, '农夫花一千买文物，被子孙后辈卖出一个亿，农夫眼光也很好 #历史  #文物  #古董 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755522, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b344d22d-8a4b-4', 'cultural_relic', 0, NULL, '十万文物露出真面 #文物.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755523, 'https://video-mp.oss-cn-beijing.aliyuncs.com/5dd84172-e187-4', 'cultural_relic', 0, NULL, '原来西周时期就有小黑子？从文物到古书全是铁证！网友：姬你太美 #爆笑  #文物  #IKun .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755524, 'https://video-mp.oss-cn-beijing.aliyuncs.com/fcf95eb7-0a00-4', 'cultural_relic', 0, NULL, '古人的审美，到底有多绝？国家博物馆中的国宝文物，哪一件最符合你的审美？#博物馆 #国家博物馆 #审美.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755525, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f33306d6-183b-4', 'cultural_relic', 0, NULL, '0001号文物 #冷知识 #文物 #中国.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755526, 'https://video-mp.oss-cn-beijing.aliyuncs.com/bd993810-9247-4', 'cultural_relic', 0, NULL, '“离谱”文物大盘点 #文物  #历史  #搞笑 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755527, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6a90dc82-65d7-4', 'cultural_relic', 0, NULL, '下一站，瑰葭路（归家路）！#逃出大英博物馆  #文物.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755528, 'https://video-mp.oss-cn-beijing.aliyuncs.com/399436e7-a129-4', 'cultural_relic', 0, NULL, '世界上最早的栽培稻和陶器都来自江西！这个重大考古发现你一定要了解一下#文物  #历史冷知识#赣地宝藏 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755529, 'https://video-mp.oss-cn-beijing.aliyuncs.com/7b533032-ecfb-4', 'cultural_relic', 0, NULL, '世界顶级文物，你知道几个？ #文物 @快手用户1692157829262(O3xenmd9866c3jqa) @快手粉条(O3xhcy6vhfzcu3qe) @快手娱乐(O3x7xgyh3xp3pd5m).mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755530, 'https://video-mp.oss-cn-beijing.aliyuncs.com/33343f93-fecd-4', 'cultural_relic', 0, NULL, '东汉博文铜镜 #甘肃镇原  #文物 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755531, 'https://video-mp.oss-cn-beijing.aliyuncs.com/06d288c5-90ee-4', 'cultural_relic', 0, NULL, '中国文物中的“兔子”，原来文物可以有这么可爱！ #新市井匠人  #传统文化  #文物  @快手艺术(O3xg9tckds64ghcy)  @快手热点(O3xddgkd5fav5if9) .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755532, 'https://video-mp.oss-cn-beijing.aliyuncs.com/dd66be4a-8443-4', 'cultural_relic', 0, NULL, '中国的九龙壁为什么会在大英博物馆？#大英博物馆里的中国文物  #文物 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755533, 'https://video-mp.oss-cn-beijing.aliyuncs.com/aab548ef-7427-4', 'cultural_relic', 0, NULL, '今天 ，又一批流失海外的文物回家！.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755534, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ad4548f4-b4c7-4', 'cultural_relic', 0, NULL, '传家宝 #古董古玩收藏 #文物.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755535, 'https://video-mp.oss-cn-beijing.aliyuncs.com/39481078-78c8-4', 'cultural_relic', 0, NULL, '干一票大的？ #九日坊 #文物回家 #大英博物馆.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755536, 'https://video-mp.oss-cn-beijing.aliyuncs.com/17a9eea1-9f7a-4', 'cultural_relic', 0, NULL, '年度“丑东西大赛”由博物馆文创拔得头“丑”，啥才算好的文创产品？ #国宝 #文物 #历史.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755537, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c793c075-cdee-4', 'cultural_relic', 0, NULL, '我国成功从美国追索12件文物艺术品，长路漫漫，欢迎回家 #中国 #文物.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755538, 'https://video-mp.oss-cn-beijing.aliyuncs.com/36d63e40-f634-4', 'cultural_relic', 0, NULL, '我国遗失的八件文物，你都了解嘛？ #文物 #古董 #铜钱.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755539, 'https://video-mp.oss-cn-beijing.aliyuncs.com/39c26e21-e4e4-4', 'cultural_relic', 0, NULL, '抢走中国文物最多的六个国家。 #中国文物 #牢记历史.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755540, 'https://video-mp.oss-cn-beijing.aliyuncs.com/55eec190-9e3b-4', 'cultural_relic', 0, NULL, '国家一级文物，唐代彩绘灰陶文官俑，来自千年前的大唐美男子！ #文物 #唐代陶俑  #华夏文明上下五千年.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755541, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0f70d159-b227-4', 'cultural_relic', 0, NULL, '大英博物馆藏有800多万件文物，其中99%还并未展出 #文物 #历史 #传统文化.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755542, 'https://video-mp.oss-cn-beijing.aliyuncs.com/a77ae98d-d366-4', 'cultural_relic', 0, NULL, '如果你打碎了国家文物，应该怎么办？ #科普 #文物 #看世界 @快手热点(O3xddgkd5fav5if9) @快手涨粉助手(O3xzyh4epbkwm6i6) @我要上热门(O3x8er38dpbhvbaa).mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755543, 'https://video-mp.oss-cn-beijing.aliyuncs.com/26fbdded-30c8-4', 'cultural_relic', 0, NULL, '如果文物们也有记忆… #冬日暴击 #cos巅峰对决 #文物.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755544, 'https://video-mp.oss-cn-beijing.aliyuncs.com/40ab4904-77ac-4', 'cultural_relic', 0, NULL, '它是怎么做到既雄壮又乖萌的？ #唐代  #兔年  #趣说文物 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755545, 'https://video-mp.oss-cn-beijing.aliyuncs.com/913841e3-87cf-4', 'cultural_relic', 0, NULL, '#拥抱每个独特的你    @快手热点(O3xddgkd5fav5if9)  @快手见宝(O3xg29wbxeuzmzc9)  @快手品牌助力官(O3x5szapguakeyum) 帮忙留下小红心.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426891755546, 'https://video-mp.oss-cn-beijing.aliyuncs.com/dcb11506-a49a-4', 'cultural_relic', 0, NULL, '#文物 #民间故事 #历史 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670081, 'https://video-mp.oss-cn-beijing.aliyuncs.com/49304cfa-3809-4', 'cultural_relic', 0, NULL, '#文物  #民间故事  #古玩收藏 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670082, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0022186f-acd3-4', 'cultural_relic', 0, NULL, '#歌曲风花秋雨夜 当文物遇上复原品，不仔细看还真分不清真假！ #古装汉服 #文物 @快手热点(O3xddgkd5fav5if9).mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670083, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f3e6108d-b35c-4', 'cultural_relic', 0, NULL, '#清华慕课 #新知如师说 #文物 @快手创作者小助手(O3xkzswpkrqacs8s) @快手文化(O3x3bhj6ddzwh4im) @快手国风(O3x58bcgn95ujue4).mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670084, 'https://video-mp.oss-cn-beijing.aliyuncs.com/59d65e20-9d3e-4', 'cultural_relic', 0, NULL, '#公益快普法 #文物 赶紧去我家后院看了看！.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670085, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6fdfaf78-2329-4', 'cultural_relic', 0, NULL, '#历史 #文物 #收藏爱好者.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670086, 'https://video-mp.oss-cn-beijing.aliyuncs.com/1b537e5b-87ac-4', 'cultural_relic', 0, NULL, '#历史 #文物 #考古发现 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670087, 'https://video-mp.oss-cn-beijing.aliyuncs.com/8cd00a90-b527-4', 'cultural_relic', 0, NULL, '#古墓 #文物 #考古.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670088, 'https://video-mp.oss-cn-beijing.aliyuncs.com/bdc31f9c-ec57-4', 'cultural_relic', 0, NULL, '#打击罪犯 #文物 #古墓 感谢您的关注，每天持续更新。.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670089, 'https://video-mp.oss-cn-beijing.aliyuncs.com/2f0c8b80-dd70-4', 'cultural_relic', 0, NULL, '施工竟然挖到文物。四川一村民疑似挖出文物   #文物 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670090, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e2301941-c55e-4', 'cultural_relic', 0, NULL, '日媒：德国7家博物馆正与北京故宫博物院调查八国联军侵华时被掠夺的文物，然后将其返还给中国。德国为何会这样做？#文物 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670091, 'https://video-mp.oss-cn-beijing.aliyuncs.com/7660115e-cc28-4', 'cultural_relic', 0, NULL, '沈从文讲文物，带你了解鉴赏文物的门道 #文物 #文化 #艺术.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670092, 'https://video-mp.oss-cn-beijing.aliyuncs.com/4bf8918a-d35d-4', 'cultural_relic', 0, NULL, '洛阳出土国宝级文物！全球仅20余套！#国宝 #文物 #洛阳.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670093, 'https://video-mp.oss-cn-beijing.aliyuncs.com/88833692-f37b-4', 'cultural_relic', 0, NULL, '清宫遗珍，失于孱弱晚清，归于盛世当下#博物馆 #文物 #历史.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670094, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b81e6247-0625-4', 'cultural_relic', 0, NULL, '探访最神秘的职业，你一定听说过没见过#快拍洛阳 #文物.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670095, 'https://video-mp.oss-cn-beijing.aliyuncs.com/3e85787c-7bff-4', 'cultural_relic', 0, NULL, '故宫敦煌特展｜菩萨残相。跨越时空，感受千年文物的厚重与庄严 #文物 #历史.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670096, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d6153a32-3072-4', 'cultural_relic', 0, NULL, '数字虚拟技术真人化复原北魏《文昭皇后礼佛图》，网友：好震撼！愿流落在外的文物早日回家！#文物.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670097, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6ad2ced8-7ec2-4', 'cultural_relic', 0, NULL, '文物保护法明确规定，有5种方式是可以合法收藏文物的，你知道吗？  #古玉收藏 #高古玉 #文物 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670098, 'https://video-mp.oss-cn-beijing.aliyuncs.com/88521f60-30ca-4', 'cultural_relic', 0, NULL, '文物能有多不正经？#文物  #马踏飞燕 #搞笑 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670099, 'https://video-mp.oss-cn-beijing.aliyuncs.com/315b3bf3-a83e-4', 'cultural_relic', 0, NULL, '热心市民踊跃捐赠 古城墙砖陆续回归#文物  #云南保山  #记录历史的痕迹  .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670100, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f3e429b7-636b-4', 'cultural_relic', 0, NULL, '盘一盘燕下都遗址出土的文物（一）——透雕龙凤纹铜铺首#古迹#历史#文物.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670101, 'https://video-mp.oss-cn-beijing.aliyuncs.com/6de69797-7e0c-4', 'cultural_relic', 0, NULL, '端平重宝 #古钱币鉴定评估  #古钱币爱好   #古泉收藏.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670102, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e7f0f32f-2eb0-4', 'cultural_relic', 0, NULL, '老人自称是皇帝后人 #历史 #文物 #上交文物.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903426954670103, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d08a3107-36b7-4', 'cultural_relic', 0, NULL, '那些颜值逆天的古代文物、每件都令人惊艳#快影万粉扶持计划 #国宝文物 #历史文化.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647489, 'https://video-mp.oss-cn-beijing.aliyuncs.com/814d6a36-c081-4', 'news', 0, NULL, '#新闻  #惊险一幕  #资讯.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647490, 'https://video-mp.oss-cn-beijing.aliyuncs.com/f7b25b26-6ae9-4', 'news', 0, NULL, '#新闻  全国共有27.4万名事实无人抚养儿童被纳入保障范围.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647491, 'https://video-mp.oss-cn-beijing.aliyuncs.com/bee7941d-f2c6-4', 'news', 0, NULL, '#新闻 #现实社会大实话.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647492, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ad757879-300b-4', 'news', 0, NULL, '10月30日，央视新闻报道，美国平均每1.2秒就有1人新冠阳性，每107秒就有1名美国人死于新冠肺炎.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647493, 'https://video-mp.oss-cn-beijing.aliyuncs.com/aa3f71b5-e634-4', 'news', 0, NULL, '19日，第78届联合国大会一般性辩论在纽约联合国总部开幕。当天美国总统拜登在拜登在联大演讲谈到俄乌冲突时，俄罗斯常驻联合国代表涅边贾低头玩手机，乌克兰总统泽连斯基认真听讲并鼓掌。.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647494, 'https://video-mp.oss-cn-beijing.aliyuncs.com/67677a8c-2486-4', 'news', 0, NULL, '小车高速隧道急刹车致后车追尾，黑车司机“神反应”极限躲过。交警：突然停车引发连环事故 承担全部责任.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647495, 'https://video-mp.oss-cn-beijing.aliyuncs.com/fb04f06f-2d97-4', 'news', 0, NULL, '广西柳州一小孩路边玩耍时触电  目击者：路灯下保险盖掉了  派出所：仍在调查中.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647496, 'https://video-mp.oss-cn-beijing.aliyuncs.com/3961e149-4a9a-4', 'news', 0, NULL, '情侣骑电单车被翘起的石板弹飞，重重摔在地上。网友： 别开太快 看着都疼！.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647497, 'https://video-mp.oss-cn-beijing.aliyuncs.com/a6ec681c-a1ef-4', 'news', 0, NULL, '房客用被子堵住浴室地漏，致酒店房间积水。.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647498, 'https://video-mp.oss-cn-beijing.aliyuncs.com/2efcafd0-186f-4', 'news', 0, NULL, '据多家外媒报道，当地时间19日在美国众议院听证会，雷蒙多回应议员质询她访华期间华为推出新手机一事。.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647499, 'https://video-mp.oss-cn-beijing.aliyuncs.com/fde35e52-b122-4', 'news', 0, NULL, '31岁当局长，他收了600多万，纪委监委两次找他谈话，他均表示没收过任何钱款！.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647500, 'https://video-mp.oss-cn-beijing.aliyuncs.com/80e129c5-c837-4', 'news', 0, NULL, '4岁孩子窗台玩耍时坠楼，邻居撑开被子稳稳接住。 #惊险一幕.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647501, 'https://video-mp.oss-cn-beijing.aliyuncs.com/cfa9f6be-07a1-4', 'news', 0, NULL, '4月16日，央视新闻报道，美国对俄罗斯实施大规模制裁并驱逐外交人员，俄罗斯外交部：必将“坚决回击”.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647502, 'https://video-mp.oss-cn-beijing.aliyuncs.com/cd9c5e87-85ae-4', 'news', 0, NULL, '7旬老人驾车疑操作失误，冲破护栏坠入河中！众人合力营救！ #惊险时刻  #车祸 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647503, 'https://video-mp.oss-cn-beijing.aliyuncs.com/2b7428f4-3708-4', 'news', 0, NULL, '9月16日，杭州亚运村正式开村。来自马尔代夫的塔穆赫表示，自从来了杭州，自己已经是移动支付的老手了。.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647504, 'https://video-mp.oss-cn-beijing.aliyuncs.com/893bd49c-45c5-4', 'news', 0, NULL, '又见恶俗婚闹？多人直接拿灭火器喷伴娘。知情人：有雨衣 他们之前商量好的.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647505, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c1a90ee7-9e35-4', 'news', 0, NULL, '四六级与学士学位证脱钩？西安交通大学回应.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647506, 'https://video-mp.oss-cn-beijing.aliyuncs.com/e761d477-1cff-4', 'news', 0, NULL, '外墙清洁工作业时突发意外，被绳索缠住倒吊半空。 #惊险一幕 #危险.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647507, 'https://video-mp.oss-cn-beijing.aliyuncs.com/9e220d13-d997-4', 'news', 0, NULL, '女子寄快递，快递员打开检查被吓懵！网友求心理阴影面积！ #活蛇 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647508, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0c4abc8d-51d4-4', 'news', 0, NULL, '家委会代表突查学校配餐公司，现场环境恶劣，菜式多为预制冻品。校方回应：市监部门已介入调查 #预制菜 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647509, 'https://video-mp.oss-cn-beijing.aliyuncs.com/60f0d1fc-cf4d-4', 'news', 0, NULL, '据央视新闻，当地时间9月18日，美国三大车企工人罢工进入第四天，工会警告或扩大罢工范围。.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647510, 'https://video-mp.oss-cn-beijing.aliyuncs.com/567a99ef-aea3-4', 'news', 0, NULL, '据日媒报道，截至当地时间19日上午，日本40多个地区共约100人由于食用“吉田屋”便当出现食物中毒症状。.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647511, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b5c18dec-86c4-4', 'news', 0, NULL, '江苏宿迁突发强龙卷风，造成5人死亡4人重伤，1646户房屋受损。.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647512, 'https://video-mp.oss-cn-beijing.aliyuncs.com/5b885392-11f0-4', 'news', 0, NULL, '江苏宿迁遭遇强龙卷风 灾情造成5人死亡4人重伤.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647513, 'https://video-mp.oss-cn-beijing.aliyuncs.com/009f8c08-c76a-4', 'news', 0, NULL, '江苏盐城阜宁县遭遇龙卷风致5死4伤.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647514, 'https://video-mp.oss-cn-beijing.aliyuncs.com/85278628-3b6e-4', 'news', 0, NULL, '9月20日（采访日期）， 湖北荆州，网友吐槽小区直饮水站水中发现死蚯蚓，工作人员：水站是封闭的，可能是蚯蚓在取水时爬过进去的.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647515, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0c9b26fa-cd1c-4', 'news', 0, NULL, '9月21日 国内重要新闻#国内 #重要新闻.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647516, 'https://video-mp.oss-cn-beijing.aliyuncs.com/8af52377-6c02-4', 'news', 0, NULL, '“不愿和俄罗斯正面冲突”，白宫官员“提醒”乌克兰：不希望用美制武器攻击俄领土.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647517, 'https://video-mp.oss-cn-beijing.aliyuncs.com/88037602-55ce-4', 'news', 0, NULL, '【跨越时空 美好传承】虚拟人谷小雨以蝶为引，在时光洪流中，看“木板水印技艺”这一非物质文化遗产的传承。#全国广电新媒体集结发光.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647518, 'https://video-mp.oss-cn-beijing.aliyuncs.com/727d680c-e5eb-4', 'news', 0, NULL, '乌克兰大势已去？西方媒体都不再争相报道战局？#俄乌冲突 #新闻 #国际.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647519, 'https://video-mp.oss-cn-beijing.aliyuncs.com/90e54d86-8b3c-4', 'news', 0, NULL, '阳间新闻使人心情愉悦！！#新闻  #爽  #审判.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647520, 'https://video-mp.oss-cn-beijing.aliyuncs.com/ddeeb881-e022-4', 'news', 0, NULL, '驾驶员行驶时 不慎将小汽车开下河 警民齐心协力成功营救。 #好心人  #社会  #新闻 .mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647521, 'https://video-mp.oss-cn-beijing.aliyuncs.com/a77fdf39-3c0f-4', 'news', 0, NULL, '注意防范！#江苏宿迁龙卷风灾害已造成1死3伤，52间房屋遭受不同程度损害.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647522, 'https://video-mp.oss-cn-beijing.aliyuncs.com/5302e41d-7777-4', 'news', 0, NULL, '男子为抄近路挪开围挡，直直“开”下高台…网友：捷径变“截径”！ #谜之操作 #离谱 #惊险一幕.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647523, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0506c080-16bd-4', 'news', 0, NULL, '疑因货车失控连撞多车后 ，撞向摩托车队！摩托车队：造成1死2重伤！ #惊险一幕 #交通事故.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496483647524, 'https://video-mp.oss-cn-beijing.aliyuncs.com/2b6aa899-f034-4', 'news', 0, NULL, '货车尾门未关牢，“铁巴掌”将路人拍倒在地！网友：隔着屏幕都觉得脑瓜疼… #惊险一幕 #危险瞬间.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496550756353, 'https://video-mp.oss-cn-beijing.aliyuncs.com/58064dd5-c1ba-4', 'news', 0, NULL, '车主下车未拉手刹溜车，好心摊主飞奔“搞定”。 #惊险一幕 #危险瞬间.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496550756354, 'https://video-mp.oss-cn-beijing.aliyuncs.com/64c4b00b-f66e-4', 'news', 0, NULL, '九月十八日新闻大事件 #新闻.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496550756355, 'https://video-mp.oss-cn-beijing.aliyuncs.com/49bdb72c-4314-4', 'news', 0, NULL, '今日#快看新鲜事 ：D2809殉职司机杨勇5秒内采取了紧急制动；俄罗斯限制芯片原材料气体出口…还有这些身边事，值得关注! #新闻 @快手热点(O3xddgkd5fav5if9) @快手主持人(O3xnewxpguishmsc) @快手粉条(O3xhcy6vhfzcu3qe).mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496550756356, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c6ca6e77-97d1-4', 'news', 0, NULL, '全国政协十四届一次会议新闻发布会即将举行 人民政协报记者在现场.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496550756357, 'https://video-mp.oss-cn-beijing.aliyuncs.com/b008b702-0268-4', 'news', 0, NULL, '全家八人都患上了红眼病，妈妈：大女儿从学校回来传染到家里，网友：只因在家多看了一眼😂就让你红了眼.mp4', 1);
INSERT INTO `tb_video` VALUES (1706903496550756358, 'https://video-mp.oss-cn-beijing.aliyuncs.com/2a44be85-e045-4', 'news', 0, NULL, '华春莹：北约至今还欠着中国人民一笔血债。#国际  #美国  #新闻.mp4', 1);
INSERT INTO `tb_video` VALUES (1706907592380776450, 'https://video-mp.oss-cn-beijing.aliyuncs.com/aff534f8-1da3-4', 'affairs', 0, NULL, '211__340525.mp4', 1);
INSERT INTO `tb_video` VALUES (1706907592481439746, 'https://video-mp.oss-cn-beijing.aliyuncs.com/9ea418aa-17fb-4', 'affairs', 0, NULL, '104866_15万存3年，每年利率4.35%，真的吗？#理财 #科普 #财经 _4140949.mp4', 1);
INSERT INTO `tb_video` VALUES (1706907592481439747, 'https://video-mp.oss-cn-beijing.aliyuncs.com/d33696fd-6ce9-4', 'affairs', 0, NULL, '105923_#创业 #金融 #理财 #涨知识 #干货 #干货分享 _608985.mp4', 1);
INSERT INTO `tb_video` VALUES (1706907592481439748, 'https://video-mp.oss-cn-beijing.aliyuncs.com/dbfb6fcf-53a6-4', 'affairs', 0, NULL, '10792_5年本金翻80倍，只因用这6招反复做T！#财经 #财经知识 #金融 #投资 _597600.mp4', 1);
INSERT INTO `tb_video` VALUES (1706907592481439749, 'https://video-mp.oss-cn-beijing.aliyuncs.com/5aab2bc4-4499-4', 'affairs', 0, NULL, '1085_有什么稳赚不赔的理财方式？#理财 #经济 #财富规划 _159123.mp4', 1);
INSERT INTO `tb_video` VALUES (1706907592481439750, 'https://video-mp.oss-cn-beijing.aliyuncs.com/5175617f-7bc2-4', 'affairs', 0, NULL, '13125_银行要大变天了！如果你的钱还放在银行，要特别小心##财经 #理财 #涨知识 _156369.mp4', 1);
INSERT INTO `tb_video` VALUES (1706907592481439751, 'https://video-mp.oss-cn-beijing.aliyuncs.com/3d74a249-40a4-4', 'affairs', 0, NULL, '1356_不交社保好像也不是不行，本灵活就业者想躺平了#社保 #打工人 #灵活就业_1192.mp4', 1);
INSERT INTO `tb_video` VALUES (1706907592481439752, 'https://video-mp.oss-cn-beijing.aliyuncs.com/0258f10e-cb73-4', 'affairs', 0, NULL, '1428_5000W量级的资产如何做到理财#收益 最大化？#财经 #投资理财#知识分享#商业思维@吕晓彤@吕晓彤的小号 _61820.mp4', 1);
INSERT INTO `tb_video` VALUES (1706907592544354306, 'https://video-mp.oss-cn-beijing.aliyuncs.com/df72e238-e533-4', 'affairs', 0, NULL, '147501_硬核存钱大法来了，适用于任何人#宝妈#女性成长 #生活#内容过于真实 #存款#励志_43294.mp4', 1);
INSERT INTO `tb_video` VALUES (1706907592544354307, 'https://video-mp.oss-cn-beijing.aliyuncs.com/c9e9a43a-88ad-4', 'affairs', 0, NULL, '16326_心塞！总是随手买的基金能赚钱！#财经 #基金 #理财 #永赢_616787.mp4', 1);
INSERT INTO `tb_video` VALUES (1706907592544354308, 'https://video-mp.oss-cn-beijing.aliyuncs.com/5d74507a-a5c1-4', 'affairs', 0, NULL, '1865_比存款还安全，赚的还高的投资方式来了！#干货 #投资 _584468.mp4', 1);

SET FOREIGN_KEY_CHECKS = 1;
