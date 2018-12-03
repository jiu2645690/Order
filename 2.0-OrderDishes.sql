/*
Navicat MySQL Data Transfer

Source Server         : 101.37.124.77
Source Server Version : 50722
Source Host           : 101.37.124.77:3306
Source Database       : OrderDb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-10-21 2:24:00
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for Address
-- 地址表
-- 说明：设置 系统中送餐地址，用户可通过 地址，邮编 来匹配 或设置 自己的默认送餐地址，用户只能设置一个默认送餐地址。商家可以关联多个送餐地址。
-- ----------------------------
DROP TABLE IF EXISTS `Address`;
CREATE TABLE `Address` (
  `addressId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '地址主键编号',
  `addressName` varchar(50) NOT NULL COMMENT '地址',
  `zipCode` varchar(50) NOT NULL COMMENT '邮编',
  `city` varchar(50) NOT NULL COMMENT '城市',
  `state` varchar(50) NOT NULL COMMENT '州',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  `isDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Address
-- ----------------------------



-- ----------------------------
-- Table structure for Combo
-- 用户的点的套餐 
-- ----------------------------
DROP TABLE IF EXISTS `Combo`;
CREATE TABLE `Combo` (
  `comboId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `comboTemplateId` bigint(20) NOT NULL   COMMENT 'ComboTemplate表主键id',
  PRIMARY KEY (`comboId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Combo
-- ----------------------------

-- ----------------------------
-- Table structure for ComboAndFoodItemAssociation
-- 记录用户的点的套餐 中对应了哪些菜品
-- ----------------------------
DROP TABLE IF EXISTS `ComboAndFoodItemAssociation`;
CREATE TABLE `ComboAndFoodItemAssociation` (
  `comboId` bigint(20) NOT NULL   COMMENT 'Combo表主键id',
  `foodItemId` bigint(20) NOT NULL COMMENT '菜品表主键编号',
  `foodItemCount` int(11) NOT NULL COMMENT '菜品份数',
  `isDeleted` bit NOT NULL DEFAULT FALSE COMMENT '是否删除',
  PRIMARY KEY (`comboId`,`foodItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ComboAndFoodItemAssociation
-- ----------------------------

-- ----------------------------
-- Table structure for ComboTemplate
-- 套餐表
-- 说明：设置 店铺中的套餐。一个店铺 可以 有多个套餐，套餐包括 需要多少菜品。
-- 可出售多少份。折扣比例。
-- ----------------------------
DROP TABLE IF EXISTS `ComboTemplate`;
CREATE TABLE `ComboTemplate` (
  `comboTemplateId` bigint(20) NOT NULL COMMENT '套餐主键编号',
  `comboTemplateName` varchar(20) NOT NULL COMMENT '套餐名称',
  `comboTemplateNumber` int(11) NOT NULL COMMENT '包含菜品分数',
  `comboTemplateDiscount` double NOT NULL COMMENT '折扣比例',
  `comboTemplateRemainingCount` int(11) NOT NULL COMMENT '可出售份数',
  `pictureId` varchar(20) NOT NULL COMMENT '套餐图片id',
  `storeId` bigint(20) NOT NULL COMMENT '店铺主键id',
  PRIMARY KEY (`comboTemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ComboTemplate
-- ----------------------------



-- ----------------------------
-- Table structure for Customer
-- 用户信息表
-- 说明：保存用户基本信息，如果默认送餐地址，注册时间，余额。
-- ----------------------------
DROP TABLE IF EXISTS `Customer`;
CREATE TABLE `Customer` (
  `customerId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
  `phoneNumber` varchar(25) NOT NULL DEFAULT '' COMMENT '电话号码',
  `email` varchar(25) NOT NULL DEFAULT '' COMMENT '邮箱',
  `wechatOpenid` varchar(25) NOT NULL DEFAULT '' COMMENT '微信id',
  `phoneNumberIsValidated` varchar(25) NOT NULL DEFAULT FALSE COMMENT '电话号码',
  `emailIsValidated` varchar(25) NOT NULL DEFAULT FALSE COMMENT '邮箱',
  `wechatOpenidIsValidated` varchar(25) NOT NULL DEFAULT FALSE COMMENT '微信id',
  `avatarPictureId` bigint(20) NOT NULL DEFAULT -1 COMMENT '头像对应图片id',
  `createdAt` datetime NOT NULL COMMENT '创建时间',
  `nickName` varchar(25) NOT NULL COMMENT '昵称',
  `firstName` varchar(50) NOT NULL COMMENT '名',
  `lastName` varchar(50) NOT NULL COMMENT '姓',
  `sex` bit(1) NOT NULL COMMENT '性别',
  `balance` decimal(10,0) NOT NULL DEFAULT 0 COMMENT '余额',
  `addressId` bigint(20) NOT NULL COMMENT '取餐地址id',
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Customer
-- ----------------------------

-- ----------------------------
-- Table structure for CustomerAuth
-- 用户账户表id
-- 说明：保存用户账户密码 和密钥  。是否被后台禁止登陆
-- ----------------------------
DROP TABLE IF EXISTS `CustomerAuth`;
CREATE TABLE `CustomerAuth` (
  `customerAuthId` bigint(20) NOT NULL  COMMENT '用户账户表id',
  `customerId` bigint(20) NOT NULL  COMMENT '用户主键id',
  `customerSecretkey` bigint(20) NOT NULL  COMMENT '用户秘钥',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '注册时间',
  `allowLogin` varchar(255) NOT NULL DEFAULT TRUE COMMENT '允许移动端登陆',
  PRIMARY KEY (`customerAuthId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of CustomerAuth
-- ----------------------------


-- ----------------------------
-- Table structure for CustomerStoreConversion
-- 用户商家转化表
-- 说明：
-- ----------------------------
DROP TABLE IF EXISTS `CustomerStoreConversion`;
CREATE TABLE `CustomerStoreConversion`(
  `customerId` bigint(20) NOT NULL COMMENT '用户主键id',
  `storeId` bigint(20) NOT NULL COMMENT '用户主键id',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  PRIMARY KEY (`customerId`,`storeId` )
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of CustomerStoreConversion
-- ----------------------------


-- ----------------------------
-- Table structure for Employee
-- 员工信息表
-- 说明：此表主要 管理后台员工，内设系统用户（admin  超级管理员 只能由一个超级管理员，包含后台所有权限。）
-- 其他 员工，有后台管理员添加 或者由 有添加员工权限的角色添加， 添加的员工可以 分配权限。分功管理模块。
-- ----------------------------
DROP TABLE IF EXISTS `Employee`;
CREATE TABLE `Employee` (
  `employeeId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '员工主键id',
  `loginName` varchar(255) NOT NULL COMMENT '登陆账号',
  `loginPassword` varchar(255) NOT NULL COMMENT '登陆密码',
  `roleId` bigint(20) NOT NULL COMMENT '角色编号',
  `realName` varchar(255) NOT NULL COMMENT '真实名称',
  `roleName` varchar(255) NOT NULL COMMENT '角色名称',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  `isAdmin` bit(1) NOT NULL DEFAULT FALSE COMMENT '是否是系统管理员',
  `isDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
  `allowLogin` bit(1) NOT NULL DEFAULT TRUE COMMENT '是否允许登陆',
  PRIMARY KEY (`employeeId`,`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Employee
-- ----------------------------

-- ----------------------------
-- Table structure for Favorite
-- 收藏表
-- 说明：用户收藏信息表 。此表只针对 用户，用户可以添加店铺或者菜品来进行收藏。
-- 根据favoriatetype 来判断 收藏的是店铺还是菜品。
-- ----------------------------
DROP TABLE IF EXISTS `Favorite`;
CREATE TABLE `Favorite` (
  `favoriteId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收藏主键id',
  `customerId` bigint(20) NOT NULL COMMENT '用户主键id',
  `storeId` bigint(20) NOT NULL DEFAULT -1 COMMENT '店铺主键id',
  `foodItemId` bigint(20) NOT NULL DEFAULT -1 COMMENT '菜品主键id',
  `comboTemplateId` bigint(20) NOT NULL DEFAULT -1 COMMENT '套餐主键id',
   PRIMARY KEY (`favoriteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Favorite
-- ----------------------------

-- ----------------------------
-- Table structure for Feedback
-- 消息反馈表
-- 说明：用于用户向系统 发送举报信息。或者系统向用户发送消息。
-- ----------------------------
DROP TABLE IF EXISTS `Feedback`;
CREATE TABLE `Feedback` (
  `feedbackId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息人主键id',
  `sendPeopleId` bigint(20) NOT NULL  COMMENT '发送消息人主键id',
  `sendPeopleType` int(11) NOT NULL COMMENT '消息发送人类型',
  `sendIsRead` bit NOT NULL DEFAULT FALSE COMMENT '消息发送人是否阅读',
  `receivePeopleId` bigint(20) NOT NULL  COMMENT '接受消息人主键id',
  `receivePeopleType` int(11) NOT NULL COMMENT '消息接受人类型',
  `receiveIsRead` bit NOT NULL COMMENT '消息接受人是否阅读',
  `beReportedStoreId` varchar(255) NOT NULL DEFAULT -1 COMMENT '被举报商家编号：来标示是否是举报信息 和被举报人的主键id，',
  `feedbackContent` varchar(255) NOT NULL COMMENT '聊天内容',
  PRIMARY KEY (`feedbackId`)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Feedback
-- ----------------------------

-- ----------------------------
-- Table structure for FeedbackPictureAssociation
-- 消息反馈表-图片关联表
-- 说明：用于用户向系统 发送举报信息。
-- 根据favoriatetype 来判断 收藏的是店铺还是菜品。
-- ----------------------------
DROP TABLE IF EXISTS `FeedbackPictureAssociation`;
CREATE TABLE `FeedbackPictureAssociation` (
  `feedbackId` bigint(20) NOT NULL  COMMENT '消息主键id',
  `pictureId` bigint(20) NOT NULL  COMMENT '图片主键id',
   PRIMARY KEY (`feedbackId`,`pictureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of FeedbackPictureAssociation
-- ----------------------------

-- ----------------------------
-- Table structure for FoodItem
-- 菜品表
-- 说明：店铺中的菜品表的基本信息。包含菜品的价格，名称，库存数量等
-- 通过店铺 主键id storeid 来关联所属店铺
-- ----------------------------
DROP TABLE IF EXISTS `FoodItem`;
CREATE TABLE `FoodItem` (
  `foodItemId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品主键id',
  `name` varchar(50) NOT NULL COMMENT '菜品名称',
  `price` decimal(10,0) NOT NULL COMMENT '价格',
  `remainingCount` int(11) NOT NULL DEFAULT 0 COMMENT '库存数量',
  `primaryIngredient` varchar(255) NOT NULL DEFAULT '' COMMENT '商品主材',
  `complementaryIngredient` varchar(255) NOT NULL DEFAULT '' COMMENT '商品辅材',
  `rank` int(11) NOT NULL COMMENT '商品排序',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `dailySpecialPrice` decimal(10,0) NOT NULL COMMENT '特惠价格',
  `isAvailable` bit(1) NOT NULL DEFAULT FALSE COMMENT '上下架',
  `storeId` bit(1) NOT NULL COMMENT '店铺主键id',
  `pictureId` bigint(20) NOT NULL DEFAULT -1 COMMENT '封面图片主键id',
  PRIMARY KEY (`fooditemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of FoodItem
-- ----------------------------

-- ----------------------------
-- Table structure for FoodItemAndTemplateAssociation
-- 菜品 -菜品模板关联表
-- ----------------------------
DROP TABLE IF EXISTS `FoodItemAndTemplateAssociation`;
CREATE TABLE `FoodItemAndTemplateAssociation` (
  `foodItemTemplateId` int(11) NOT NULL COMMENT '模板编号',
  `foodItemId` varchar(255) NOT NULL COMMENT '菜品编号',
 PRIMARY KEY (`foodItemTemplateId`,`foodItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of FoodItemAndTemplateAssociation
-- ----------------------------

-- ----------------------------
-- Table structure for FoodItemPictureAssociation
-- 菜品-图片关联表
-- 说明：主要关联菜品和图片 采用 一个菜品 对应 多张图片。
-- ----------------------------
DROP TABLE IF EXISTS `FoodItemPictureAssociation`;
CREATE TABLE `FoodItemPictureAssociation` (
  `fooditemId` int(11) NOT NULL COMMENT '菜品主键',
  `pictureId` int(11) NOT NULL COMMENT '图片id',
PRIMARY KEY (`fooditemId`,`pictureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of FoodItemPictureAssociation
-- ----------------------------

-- ----------------------------
-- Table structure for FoodItemTemplate
-- 菜品模板表
-- 说明：主要应用于营运信息 设置每日 可销售菜品。在营运表中。
-- 在ActualService 表中 关联此表。相当于 每天都对应一个营运模板id，一个营运模板可以应用于多个日期
-- 每次 修改营运模板 新增一个营运模板 （以 主键来区别，模板名称只做标示）
-- ----------------------------
DROP TABLE IF EXISTS `FoodItemTemplate`;
CREATE TABLE `FoodItemTemplate` (
  `foodItemTemplateId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜品模板主键编号',
  `foodItemTemplateName` varchar(20) NOT NULL COMMENT '菜品模板名称',
  `createdAt` datetime  NOT NULL DEFAULT CURRENT_TIMESTAMP()  COMMENT '创建时间',
  `isDeleted` bit(1) NOT NULL  DEFAULT FALSE COMMENT '是否删除',
  PRIMARY KEY (`foodItemTemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of FoodItemTemplate
-- ----------------------------

-- ----------------------------
-- Table structure for Log
-- 系统日志表
-- 说明：1主要记录  后台员工的操作记录，对系统哪些板块进行了 什么样的操作。
--  2 运行时 系统中出现的错误，并可还原 是由 商家/用户 进行了 什么操作。
-- ----------------------------
DROP TABLE IF EXISTS `Log`;
CREATE TABLE `Log` (
  `logId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT  '日志主键id',
  `logType` int(11) NOT NULL COMMENT '日志类型',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT  '创建时间',
  `logContent` varchar(255) NOT NULL COMMENT '日志内容',
  `peopleType` int(11) NOT NULL DEFAULT -1 COMMENT '操作类型（商家，用户，员工）',
  `peopleId` bigint(20) NOT NULL DEFAULT -1 COMMENT '操作人id（商家，用户，员工）',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `isRepair` bit(1) NOT NULL DEFAULT FALSE COMMENT '是否解决错误',
  `repairConten` varchar(255) NOT NULL DEFAULT '' COMMENT '解决操作',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Log
-- ----------------------------



-- ----------------------------
-- Table structure for Message
-- 消息表
-- 说明：消息主要信息。主要记录，消息类型 是普通消息还是系统消息，
-- 参与的人员，可以是 商家和系统  用户和系统  商家和用户。
-- ----------------------------
DROP TABLE IF EXISTS `Message`;
CREATE TABLE `Message` (
  `messageId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息主键id',
  `storeId` bigint(20) NOT NULL COMMENT '商家主键id',
  `customId` bigint(20) NOT NULL COMMENT '用户主键id',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Message
-- ----------------------------

-- ----------------------------
-- Table structure for MessageDetail
-- 消息详细内容表
-- 说明：此表主要对应 消息表Message ，记录每个消息中的聊天内容
--  主要内容由 发送用户类型， 根据用户类型。
-- ----------------------------
DROP TABLE IF EXISTS `MessageDetail`;
CREATE TABLE `MessageDetail` (
  `messageDetailId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息详细内容表主键id',
  `messageId` bigint(20) NOT NULL COMMENT '聊天主体id',
  `sendPeopleId` bigint(20) NOT NULL  COMMENT '发送消息人主键id',
  `sendPeopleType` int(11) NOT NULL COMMENT '消息发送人类型',
  `sendIsRead` bit NOT NULL DEFAULT TRUE COMMENT '消息发送人是否阅读',
  `receivePeopleId` bigint(20) NOT NULL  COMMENT '接受消息人主键id',
  `receivePeopleType` int(11) NOT NULL COMMENT '消息接受人类型',
  `receiveIsRead` bit NOT NULL DEFAULT FALSE COMMENT '消息接受人是否阅读',
  `messageContent` varchar(255) NOT NULL COMMENT '聊天内容',
  `sendTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '发送时间',
  PRIMARY KEY (`messageDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------  
-- Records of MessageDetail
-- ----------------------------



-- ----------------------------
-- Table structure for OperatingSetting 
-- 店铺每日营运信息表
-- 说明：此表主要管理 商家的 营运菜品 和营运日期。每个商家在商家管理后台设定
-- 设计目的： 记录 商户设定 营运日期， 和关联的菜品模板模板id
-- 每日营运信息，关联 菜品模板id FoodItemtemplate。
-- ----------------------------
DROP TABLE IF EXISTS `OperatingSetting`;
CREATE TABLE `OperatingSetting` (
  `storeId` bigint(20) NOT NULL COMMENT '店铺id',
  `date` datetime NOT NULL COMMENT '营运日期',
  `currentFoodItemTemplateId` bigint(20) NOT NULL COMMENT '菜品模板表主键id',
  PRIMARY KEY (`storeId`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of OperatingSetting 
-- ----------------------------

-- ----------------------------
-- Table structure for Order
-- 订单表
-- 说明：主要记录用下单生成的订单，消费 状态，交易双方。
-- 也可用商家收益，平台收益统计。
-- ----------------------------
DROP TABLE IF EXISTS `Order`;
CREATE TABLE `Order` (
  `orderId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单主键编号',
  `uuId` varchar(20) NOT NULL COMMENT '可展示订单编号',
  `addressId` bigint(20) NOT NULL COMMENT '送餐地址编号',
  `storeId` bigint(20) NOT NULL COMMENT '店铺编号',
  `customerId` bigint(20) NOT NULL COMMENT '用户编号',
  `deliveryDate` datetime  NOT NULL COMMENT '选择的送餐日期',
  `deliveryTime` int(11)  NOT NULL COMMENT '0 午餐 1晚餐',
  `createdAt` datetime  NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '下单时间',
  `lastUpdatedAt` datetime  NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  `deliveredTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '送达时间',
  `refundTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '退单时间',
  `totalAmount` decimal(10,2) NOT NULL COMMENT '总金额',
  `subTotal` decimal(10,2) NOT NULL COMMENT '菜品金额总计',
  `taxes` decimal(10,2) NOT NULL COMMENT '税收',
  `tip` decimal(10,2) NOT NULL DEFAULT 0 COMMENT '小费',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `refundReason` varchar(255) NOT NULL DEFAULT ''  COMMENT '退款原因',
  `state` int(11) NOT NULL COMMENT '状态  0-预订单（下单展示页） 1-进行中  2已送达  3已完成（或者带评价） 4已完成 5申请退款中 6 已退款 ',
  `zhangPeriod` int(11) NOT NULL  DEFAULT 0 COMMENT '账期状态（0 为到账，1 已到账）',
  `storeIsDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '商家是否删除',
  `customerIsDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '用户是否删除',
  `customerIsRead` int(11) NOT NULL DEFAULT FALSE COMMENT '用户是否阅读',
  `storeIsRead` int(11) NOT NULL DEFAULT FALSE COMMENT '商家是否阅读',
  `storeEarnings` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商家收益=菜品金额*（1-当前的系统抽成比例）',
  `platformEarnings` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '平台收益=菜品金额总计*当前的系统抽成比例',
  `proportional` decimal(10,2) NOT NULL  DEFAULT 0.00 COMMENT '系统抽成比例',
  PRIMARY KEY (`orderId`,`uuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Order
-- ----------------------------

-- ----------------------------
-- Table structure for OrderAndFoodItemComboAssociation
-- 订单关联 商品 和套餐表 
-- ----------------------------
DROP TABLE IF EXISTS `OrderAndFoodItemComboAssociation`;
CREATE TABLE `OrderAndFoodItemComboAssociation` (
  `orderId` bigint(20) NOT NULL  COMMENT '订单主键编号',
  `comboId` bigint(11) NOT NULL DEFAULT -1 COMMENT '套餐编号',
  `foodItemId` bigint(11) NOT NULL DEFAULT -1 COMMENT '套餐编号',
  `foodItemCount` int(11) NOT NULL DEFAULT 0 COMMENT '菜品数量',
  `comboTemplateCount` int(11) NOT NULL DEFAULT 0 COMMENT '套餐数量',
  `isDeleted` bit(1) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`orderId`,`comboId`,`foodItemId`)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of OrderAndFoodItemComboAssociation
-- ----------------------------



-- ----------------------------
-- Table structure for Picture
-- 图片表
-- 说明：记录用户上传的图片，和图片所存放的链接
-- ----------------------------
DROP TABLE IF EXISTS `Picture`;
CREATE TABLE `Picture` (
  `pictureId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图片主键',
  `pictureUrl` varchar(50) NOT NULL COMMENT '图片存放地址',
  PRIMARY KEY (`pictureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Picture
-- ----------------------------

-- ----------------------------
-- Table structure for Platform
--  平台信息表
-- 记录平台的基本信息和配置信息，
-- ----------------------------
DROP TABLE IF EXISTS `Platform`;
CREATE TABLE `Platform` (
  `platformId` decimal(10,0) NOT NULL COMMENT '平台信息表主键',
  `totalMoney` decimal(10,0) NOT NULL COMMENT '平台现有总资金',
  `toatalEarnings` decimal(10,0) NOT NULL COMMENT '平台总计收益',
  `lunchStartTime` time NOT NULL  COMMENT '系统设置 午餐 配送起始时间' ,
  `lunchEndTime` time NOT NULL  COMMENT '系统设置 午餐 配送结束时间',
  `dinnerStartTime` time NOT NULL  COMMENT '系统设置 晚餐 配送起始时间',
  `dinnerEndTime` time NOT NULL  COMMENT '系统设置 晚餐配送结束时间',
PRIMARY KEY (`platformId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of Platform
-- ----------------------------
-- ----------------------------
-- Table structure for Review
-- 评价表
-- 当订单完成时，用户可对 订单(实际上是对店铺)进行评价。
-- 如果用户不进行评价，当订单完成后3天内 自动进行好评。
-- 当查看店铺评价时,根据是否有评价内容进行展示，（只展示有 评价内容的信息 图片也算，）
-- ----------------------------
DROP TABLE IF EXISTS `Review`;
CREATE TABLE `Review` (
  `reviewId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论 主键编号',
  `tasteScore` double NOT NULL DEFAULT 5 COMMENT '味道评分',
  `serviceScore` double NOT NULL DEFAULT 5 COMMENT '服务评分',
  `weightScore` double NOT NULL DEFAULT 5 COMMENT '分量评分',
  `avgScore` double NOT NULL DEFAULT 5 COMMENT '综合评分',
  `scoreContent` varchar(255) NOT NULL DEFAULT '' COMMENT '评分内容  '' 标示没有评价内容',
  `customerId` bigint(20) NOT NULL COMMENT '用户编号',
  `orderId` bigint(20) NOT NULL COMMENT '点单编号',
  `storeId` bigint(20) NOT NULL COMMENT '店铺编号',
  `reviewTime` datetime NOT NULL COMMENT '评价时间',
  `isAutoReview` bit(1) NOT NULL DEFAULT TRUE  COMMENT '是否自动评价',
  `isDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
  PRIMARY KEY (`reviewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Review
-- ----------------------------


-- ----------------------------
-- Table structure for ReviewPictureAssociation
-- 评价-图片关联表
-- ----------------------------
DROP TABLE IF EXISTS `ReviewPictureAssociation`;
CREATE TABLE `ReviewPictureAssociation` (
  `reviewId` bigint(20) NOT NULL  COMMENT '评论主键编号',
  `pictureId` bigint(20) NOT NULL  COMMENT '图片主键',
  `isDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
  PRIMARY KEY (`reviewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ReviewPictureAssociation
-- ----------------------------

-- ----------------------------
-- Table structure for Role
-- 角色表
-- 记录系统中 员工 所具备的操作权限。
--  系统根据 操作权限，管理 员工 可执行的操作。  
-- ----------------------------
DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role` (
  `roleId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色主键id',
  `roleName` varchar(255) NOT NULL COMMENT '角色名称',
  `roleContent` varchar(255) NOT NULL COMMENT '包含的权限',
  `isDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Role
-- ----------------------------




-- ----------------------------
-- Table structure for SalesSetting
-- 店铺信息表
-- 记录店铺基本信息 和系统设置信息，系统评分由系统根据评价自动评定，
-- 如果开发 午餐，午餐送餐时间，默认为系统送餐时间，如果开放晚餐 默认为系统晚餐送餐时间，
-- 无条件 退款时间 可以 随意修改，截至下单时间可以随时修改。
-- ----------------------------
DROP TABLE IF EXISTS `SalesSetting`;
CREATE TABLE `SalesSetting` (
  `storeId` bigint(20) NOT NULL  COMMENT '商家id',
  `lunchRefundInterval` time NOT NULL COMMENT '午餐无条件退款时间',
  `dinnerRefundInterval` time NOT NULL COMMENT '晚餐无条件退款时间',
  `lunchOrderendTime` time NOT NULL COMMENT '午餐截止下单时间',
  `dinnerOrderendTime` time NOT NULL COMMENT '晚餐截止下单时间',
  `isHaveLunch` bit(1) NOT NULL DEFAULT FALSE  COMMENT '是否开放午餐',
  `isHaveDinner` bit(1) NOT NULL DEFAULT FALSE COMMENT '是否开放晚餐',
  `pictureId` bigint(20) NOT NULL DEFAULT -1 COMMENT '封面图片id',
  PRIMARY KEY (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of SalesSetting
-- ----------------------------
-- ----------------------------
-- Table structure for ShoppingCart
-- 购物车表
-- shoppingcartid 和 customerid 一一对应  ,每个用户对应一个购物车
-- ----------------------------
DROP TABLE IF EXISTS `ShoppingCart`;
CREATE TABLE `ShoppingCart` (
  `shoppingCartId` bigint(20) NOT NULL AUTO_INCREMENT  COMMENT '主键id',
  `customerId` bigint(20) NOT NULL COMMENT '用户编号',
  PRIMARY KEY (`shoppingCartId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of ShoppingCart
-- ----------------------------
-- ----------------------------
-- Table structure for ShoppingCartLineItem
-- 购物车分割表用于记录用户对哪些时间 哪些商家 添加到了购物车
-- ----------------------------
DROP TABLE IF EXISTS `ShoppingCartLineItem`;
CREATE TABLE `ShoppingCartLineItem` (
  `shoppingCartLineItemId` bigint(20) NOT NULL AUTO_INCREMENT  COMMENT '主键id',
  `shoppingCartId` bigint(20) NOT NULL   COMMENT '购物车表主键id',
  `storeId` bigint(20) NOT NULL COMMENT '套餐编号',
  `deliveryDate` datetime NOT NULL COMMENT '选择的送餐日期',
  `deliveryTime` int(11) NOT NULL COMMENT '选择的送餐时间 0 午餐 1晚餐',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT ' 0:in_cart,1:ordered,2:deleted',
  `comboId` bigint(20) NOT NULL   COMMENT 'Combo表主键id',
  `comboCount` bigint(20) NOT NULL DEFAULT -1  COMMENT '套餐数量',
  `foodItemId` bigint(20) NOT NULL DEFAULT -1  COMMENT '菜品表主键编号',
  `foodItemCount` int(11) NOT NULL COMMENT '菜品份数',
  `createdAt` datetime  NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  `updatedAt` datetime  NOT NULL DEFAULT '0000-00-00 00:00:0011' COMMENT '修改时间',
   PRIMARY KEY (`shoppingCartLineItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of ShoppingCartLineItem
-- ----------------------------
-- ----------------------------
-- Table structure for Store
-- 店铺信息表
-- 记录店铺基本信息 和系统设置信息，系统评分由系统根据评价自动评定，
-- 如果开发 午餐，午餐送餐时间，默认为系统送餐时间，如果开放晚餐 默认为系统晚餐送餐时间，
-- 无条件 退款时间 可以 随意修改，截至下单时间可以随时修改。
-- ----------------------------
DROP TABLE IF EXISTS `Store`;
CREATE TABLE `Store` (
  `storeId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商家id',
  `phoneNumber` varchar(25) NOT NULL COMMENT '电话号码',
  `email` varchar(25) NOT NULL COMMENT '邮箱',
  `wechatOpenid` varchar(25) NOT NULL COMMENT '微信id',
  `phoneNumberIsValidated` varchar(25) NOT NULL COMMENT '电话号码',
  `emailIsValidated` varchar(25) NOT NULL COMMENT '邮箱',
  `wechatOpenidIsValidated` varchar(25) NOT NULL COMMENT '微信id',
  `nickName` varchar(255) NOT NULL DEFAULT '' COMMENT '昵称',
  `firstName` varchar(50) NOT NULL DEFAULT '' COMMENT '名',
  `lastName` varchar(50) NOT NULL DEFAULT '' COMMENT '姓',
  `sex` varchar(255) NOT NULL DEFAULT '' COMMENT '性别',
  `balance` decimal(10,0) NOT NULL DEFAULT 0.00  COMMENT '余额',
  `storeName` varchar(50) NOT NULL COMMENT '店铺名称',
  `averageScore` double NOT NULL DEFAULT 0 COMMENT '综合评分',
  `star` int(11) NOT NULL  DEFAULT 0 COMMENT  '星级',
  `introduction` varchar(50) NOT NULL DEFAULT '' COMMENT '简介',
  `businessAddress` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺地址 真实地址',
  `isDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
  PRIMARY KEY (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of Store
-- ----------------------------
-- ----------------------------
-- Table structure for StoreAddressAssociation
-- 店铺-地址关联表 关系 采用 多对多
-- 一个地址可以对应多个店铺，一个店铺可以对应多个地址
-- ----------------------------
DROP TABLE IF EXISTS `StoreAddressAssociation`;
CREATE TABLE `StoreAddressAssociation` (
  `storeId` bigint(20) NOT NULL COMMENT '店铺主键id',
  `addressId` bigint(20) NOT NULL COMMENT '地址主键id',
  `isDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
	 PRIMARY KEY (`storeId`,`addressId`)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of StoreAddressAssociation
-- ----------------------------
-- ----------------------------
-- Table structure for StoreApplication
-- 店铺审核表
-- 记录审核中的店铺。及审核结果
-- ----------------------------
DROP TABLE IF EXISTS `StoreApplication`;
CREATE TABLE `StoreApplication` (
  `storeId` bigint(20) NOT NULL  COMMENT '商家id',
  `state` int(11) NOT NULL COMMENT '0 审核中 1审核成功 2审核失败',
  `applicationResult` varchar(20) NOT NULL  COMMENT '审核结果',
  `isDeleted` bit NOT NULL DEFAULT FALSE COMMENT '是否删除',
  PRIMARY KEY (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of StoreApplication
-- ----------------------------
-- ----------------------------
-- Table structure for StoreApplicationPictureAssociation
-- 店铺审核表
-- 记录审核中的店铺。及审核结果
-- ----------------------------
DROP TABLE IF EXISTS `StoreApplicationPictureAssociation`;
CREATE TABLE `StoreApplicationPictureAssociation` (
  `storeId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '店铺主键id',
  `pictureId` int(11) NOT NULL COMMENT '图片主键id',
  `isDeleted` bit NOT NULL DEFAULT FALSE COMMENT '是否删除',
  PRIMARY KEY (`storeId`,`pictureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of StoreApplicationPictureAssociation
-- ----------------------------
-- ----------------------------
-- Records of Transcation
-- ----------------------------
-- ----------------------------
-- Table structure for StoreAuth
-- 商家账号表
-- 主要记录商家账号的 密钥和 密码 ，以及是否被后台禁止登陆
-- ----------------------------
DROP TABLE IF EXISTS `StoreAuth`;
CREATE TABLE `StoreAuth` (
  `storeAuthId` bigint(20) NOT NULL AUTO_INCREMENT  COMMENT '商家账号主键id',
  `storeId` bigint(20) NOT NULL  COMMENT '商家id',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `storeSecretkey` bigint(20) NOT NULL  COMMENT '商家秘钥',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '注册时间',
  `allowBackgroundLogin` varchar(255) NOT NULL DEFAULT TRUE COMMENT '允许后台登陆',
  `allowLogin` varchar(255) NOT NULL  DEFAULT TRUE COMMENT '允许移动端登陆',
  PRIMARY KEY (`storeAuthId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of StoreAuth
-- ----------------------------
-- ----------------------------
-- Table structure for StorePictureAssociation
-- 店铺-图片关联表
-- 主要用于关联 图片 表和 店铺表
-- ----------------------------
DROP TABLE IF EXISTS `StorePictureAssociation`;
CREATE TABLE `StorePictureAssociation` (
  `storeId` bigint(20) NOT NULL COMMENT '店铺主键id',
  `pictureId` bigint(20) NOT NULL COMMENT '图片主键id',
  `isDeleted` bit NOT NULL DEFAULT FALSE COMMENT '是否删除',
PRIMARY KEY (`storeId`,`pictureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of StorePictureAssociation
-- ----------------------------

-- ----------------------------
-- Table structure for Transcation
-- 系统流水表
-- 记录系统 和微信 支付宝 或者银联 ，applePay 之间发生的交易。
-- 由用户和商家发起请求，通过系统 向 支付结构 发起支付或转账请求，
-- 由支付结构 反馈请求 结果到系统，如果成功修改 请求信息，如果失败说明原因
-- 如  系统余额不足， 系统 可通过短信的方式，通过超级管理员。
-- ----------------------------
DROP TABLE IF EXISTS `Transcation`;
CREATE TABLE `Transcation` (
  `transcationId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '系统流水主键编号',
  `orderId` bigint(20) NOT NULL DEFAULT -1 COMMENT '订单编号',
  `transcationNumber` bigint(20) NOT NULL COMMENT '流水号（可能是微信的流水号，支付宝或者银联）',
  `amount` decimal(10,0) NOT NULL COMMENT '金额',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '创建时间',
  `paymentMethod` int(11) NOT NULL COMMENT '支付方式： 微信， 支付包，银联',
  `type` int(11) NOT NULL COMMENT '用途：0 支付， 1提现 2充值 3退款',
  `customerId` bigint(20) NOT NULL DEFAULT -1 COMMENT '用户主键id',
  `storeId` bigint(20) NOT NULL DEFAULT -1 COMMENT '商家编号',
  `isSucess` int(11) NOT NULL DEFAULT FALSE COMMENT '0 等待中，1充值成功 2 充值失败',
  `failReson` varchar(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `isDeleted` bit NOT NULL  DEFAULT FALSE COMMENT '是否删除',
  PRIMARY KEY (`transcationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Transcation
-- ----------------------------

-- ----------------------------
-- Table structure for Wallet
-- 用户钱包表
-- 记录用户 消费，充值，提现，退款 等交易记录。
-- ----------------------------
DROP TABLE IF EXISTS `Wallet`;
CREATE TABLE `Wallet` (
  `walletId` bigint(20) NOT NULL,
  `walleType` int(11) NOT NULL COMMENT '流水类型：0 支付， 1提现 2充值 3退款',
  `peopleType` varchar(20) NOT NULL COMMENT '用户类型（可以是 商家和用户）',
  `transcationId` varchar(20) NOT NULL COMMENT '对应记录的 系统流水。交易有争论，我们可以追溯到 系统流水 获取转账方式和对应银行或者支付接口 流水单号',
  `peopleId` bigint(20) NOT NULL  COMMENT '用户编号（商家编号或者用户编号）',
  `amount` decimal(10,0) NOT NULL COMMENT '金额',
  `createdAt` datetime  NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '操作时间',
  `lastUpdatedAt` datetime  NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  `isDeleted` bit NOT NULL DEFAULT FALSE COMMENT '是否删除',
  PRIMARY KEY (`walletId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Wallet
-- ----------------------------