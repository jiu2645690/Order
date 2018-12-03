/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : localhost:3306
 Source Schema         : order

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 03/12/2018 10:43:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `addressId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '地址主键编号',
  `addressName` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `zipCode` varchar(50) NOT NULL DEFAULT '' COMMENT '邮编',
  `city` varchar(50) NOT NULL DEFAULT '' COMMENT '城市',
  `state` varchar(50) NOT NULL DEFAULT '' COMMENT '州',
  `createdAt` datetime NOT NULL COMMENT '创建时间',    
  `isDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`addressId`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for combo
-- ----------------------------
DROP TABLE IF EXISTS `combo`;
CREATE TABLE `combo`  (
  `comboId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `comboTemplateId` bigint(20) NOT NULL DEFAULT -1 COMMENT 'ComboTemplate表主键id',
  PRIMARY KEY (`comboId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for comboandfooditemassociation
-- ----------------------------
DROP TABLE IF EXISTS `comboandfooditemassociation`;
CREATE TABLE `comboandfooditemassociation`  (
  `comboId` bigint(20) NOT NULL COMMENT 'Combo表主键id',
  `foodItemId` bigint(20) NOT NULL COMMENT '菜品表主键编号',
  `foodItemCount` int(11) NOT NULL DEFAULT -1 COMMENT '菜品份数',
  `isDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`comboId`, `foodItemId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for combotemplate
-- ----------------------------
DROP TABLE IF EXISTS `combotemplate`;
CREATE TABLE `combotemplate`  (
  `comboTemplateId` bigint(20) NOT NULL COMMENT '套餐主键编号',
  `comboTemplateName` varchar(20) NOT NULL DEFAULT '' COMMENT '套餐名称',
  `comboTemplateNumber` int(11) NOT NULL DEFAULT -1 COMMENT '包含菜品分数',
  `comboTemplateDiscount` double NOT NULL DEFAULT -1 COMMENT '折扣比例',
  `comboTemplateRemainingCount` int(11) NOT NULL DEFAULT -1 COMMENT '可出售份数',
  `pictureId` bigint(20) NOT NULL DEFAULT -1 COMMENT '套餐图片id',
  `storeId` bigint(20) NOT NULL DEFAULT -1 COMMENT '店铺主键id',
  PRIMARY KEY (`comboTemplateId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customerId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
  `phoneNumber` varchar(25) NULL DEFAULT '' COMMENT '电话号码',
  `email` varchar(25) NULL DEFAULT '' COMMENT '邮箱',
  `wechatOpenid` varchar(25) NULL DEFAULT '' COMMENT '微信id',
  `phoneNumberIsValidated` varchar(25) NULL DEFAULT '' COMMENT '电话号码',
  `emailIsValidated` varchar(25) NULL DEFAULT '' COMMENT '邮箱',
  `wechatOpenidIsValidated` varchar(25) NULL DEFAULT '' COMMENT '微信id',
  `avatarPictureId` bigint(20) NULL DEFAULT -1 COMMENT '头像对应图片id',
  `createdAt` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `nickName` varchar(25) NULL DEFAULT '' COMMENT '昵称',
  `firstName` varchar(50) NULL DEFAULT '' COMMENT '名',
  `lastName` varchar(50) NULL DEFAULT '' COMMENT '姓',
  `sex` bit(1) NULL DEFAULT b'0' COMMENT '性别',
  `balance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '余额',
  `addressId` bigint(20) NULL DEFAULT -1 COMMENT '取餐地址id',
  PRIMARY KEY (`customerId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for customerauth
-- ----------------------------
DROP TABLE IF EXISTS `customerauth`;
CREATE TABLE `customerauth`  (
  `customerAuthId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户账户表id',
  `customerId` bigint(20) NOT NULL DEFAULT -1 COMMENT '用户主键id',
  `customerSecretkey` varchar(100) NOT NULL DEFAULT '' COMMENT '用户秘钥',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `createdAt` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `allowLogin` varchar(255) NOT NULL DEFAULT '' COMMENT '允许移动端登陆',
  PRIMARY KEY (`customerAuthId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customerstoreconversion
-- ----------------------------
DROP TABLE IF EXISTS `customerstoreconversion`;
CREATE TABLE `customerstoreconversion`  (
  `customerId` bigint(20) NOT NULL COMMENT '用户主键id',
  `storeId` bigint(20) NOT NULL COMMENT '用户主键id',
  `createdAt` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`customerId`, `storeId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `employeeId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '员工主键id',
  `loginName` varchar(255) NOT NULL COMMENT '登陆账号',
  `loginPassword` varchar(255) NOT NULL DEFAULT '' COMMENT '登陆密码',
  `roleId` bigint(20) NOT NULL DEFAULT -1 COMMENT '角色编号',
  `realName` varchar(255) NOT NULL DEFAULT '' COMMENT '真实名称',
  `roleName` varchar(255) NOT NULL DEFAULT '' COMMENT '角色名称',
  `createdAt` datetime NOT NULL COMMENT '创建时间',
  `isAdmin` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否是系统管理员',
  `isDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `allowLogin` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否允许登陆',
  PRIMARY KEY (`employeeId`, `loginName`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `favoriteId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收藏主键id',
  `customerId` bigint(20) NOT NULL DEFAULT -1 COMMENT '用户主键id',
  `storeId` bigint(20) NOT NULL DEFAULT -1 COMMENT '店铺主键id',
  `foodItemId` bigint(20) NOT NULL DEFAULT -1 COMMENT '菜品主键id',
  `comboTemplateId` bigint(20) NOT NULL DEFAULT -1 COMMENT '套餐主键id',
  PRIMARY KEY (`favoriteId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `feedbackId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息人主键id',
  `sendPeopleId` bigint(20) NOT NULL DEFAULT -1 COMMENT '发送消息人主键id',
  `sendPeopleType` int(11) NOT NULL DEFAULT -1 COMMENT '消息发送人类型',
  `sendIsRead` bit(1) NOT NULL DEFAULT b'0' COMMENT '消息发送人是否阅读',
  `receivePeopleId` bigint(20) NOT NULL DEFAULT -1 COMMENT '接受消息人主键id',
  `receivePeopleType` int(11) NOT NULL DEFAULT -1 COMMENT '消息接受人类型',
  `receiveIsRead` bit(1) NOT NULL DEFAULT b'0' COMMENT '消息接受人是否阅读',
  `beReportedStoreId` bigint(255) NOT NULL DEFAULT -1 COMMENT '被举报商家编号：来标示是否是举报信息 和被举报人的主键id，',
  `feedbackContent` varchar(255) NOT NULL DEFAULT '' COMMENT '聊天内容',
  PRIMARY KEY (`feedbackId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for feedbackpictureassociation
-- ----------------------------
DROP TABLE IF EXISTS `feedbackpictureassociation`;
CREATE TABLE `feedbackpictureassociation`  (
  `feedbackId` bigint(20) NOT NULL COMMENT '消息主键id',
  `pictureId` bigint(20) NOT NULL COMMENT '图片主键id',
  PRIMARY KEY (`feedbackId`, `pictureId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fooditem
-- ----------------------------
DROP TABLE IF EXISTS `fooditem`;
CREATE TABLE `fooditem`  (
  `foodItemId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品主键id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜品名称',
  `price` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '价格',
  `remainingCount` int(11) NOT NULL DEFAULT 0 COMMENT '库存数量',
  `primaryIngredient` varchar(255) NOT NULL DEFAULT '' COMMENT '商品主材',
  `complementaryIngredient` varchar(255) NOT NULL DEFAULT '' COMMENT '商品辅材',
  `rank` int(11) NOT NULL DEFAULT -1 COMMENT '商品排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `dailySpecialPrice` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '特惠价格',
  `isAvailable` bit(1) NOT NULL DEFAULT b'0' COMMENT '上下架',
  `storeId` bigint(1) NOT NULL DEFAULT -1 COMMENT '店铺主键id',
  `pictureId` bigint(20) NOT NULL DEFAULT -1 COMMENT '图片主键id',
  PRIMARY KEY (`foodItemId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fooditemandtemplateassociation
-- ----------------------------
DROP TABLE IF EXISTS `fooditemandtemplateassociation`;
CREATE TABLE `fooditemandtemplateassociation`  (
  `foodItemTemplateId` bigint(11) NOT NULL COMMENT '模板编号',
  `foodItemId` bigint(11) NOT NULL COMMENT '菜品编号',
  PRIMARY KEY (`foodItemTemplateId`, `foodItemId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fooditempictureassociation
-- ----------------------------
DROP TABLE IF EXISTS `fooditempictureassociation`;
CREATE TABLE `fooditempictureassociation`  (
  `fooditemId` int(11) NOT NULL COMMENT '菜品主键',
  `pictureId` int(11) NOT NULL COMMENT '图片id',
  PRIMARY KEY (`fooditemId`, `pictureId`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fooditemtemplate
-- ----------------------------
DROP TABLE IF EXISTS `fooditemtemplate`;
CREATE TABLE `fooditemtemplate`  (
  `foodItemTemplateId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜品模板主键编号',
  `foodItemTemplateName` varchar(20) NOT NULL DEFAULT '' COMMENT '菜品模板名称',
  `createdAt` datetime NOT NULL COMMENT '创建时间',
  `isDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`foodItemTemplateId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `logId` bigint(20) NOT NULL COMMENT '日志主键id',
  `logType` int(11) NOT NULL DEFAULT -1 COMMENT '日志类型',
  `createdAt` datetime NOT NULL COMMENT '创建时间',
  `logContent` varchar(255) NOT NULL DEFAULT '' COMMENT '日志内容',
  `peopleType` int(11) NOT NULL DEFAULT -1 COMMENT '操作类型（商家，用户，员工）',
  `peopleId` bigint(20) NOT NULL DEFAULT -1 COMMENT '操作人id（商家，用户，员工）',
  `ip` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`logId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `messageId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息主键id',
  `storeId` bigint(20) NOT NULL DEFAULT -1 COMMENT '商家主键id',
  `customId` bigint(20) NOT NULL DEFAULT -1 COMMENT '用户主键id',
  `createdAt` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`messageId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for messagedetail
-- ----------------------------
DROP TABLE IF EXISTS `messagedetail`;
CREATE TABLE `messagedetail`  (
  `messageDetailId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息详细内容表主键id',
  `messageId` bigint(20) NOT NULL DEFAULT -1 COMMENT '聊天主体id',
  `sendPeopleId` bigint(20) NOT NULL DEFAULT -1 COMMENT '发送消息人主键id',
  `sendPeopleType` int(11) NOT NULL DEFAULT -1 COMMENT '消息发送人类型',
  `sendIsRead` bit(1) NOT NULL DEFAULT b'0' COMMENT '消息发送人是否阅读',
  `receivePeopleId` bigint(20) NOT NULL DEFAULT -1 COMMENT '接受消息人主键id',
  `receivePeopleType` int(11) NOT NULL DEFAULT -1 COMMENT '消息接受人类型',
  `receiveIsRead` bit(1) NOT NULL DEFAULT b'0' COMMENT '消息接受人是否阅读',
  `messageContent` varchar(255) NOT NULL DEFAULT '' COMMENT '聊天内容',
  `sendTime` datetime NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`messageDetailId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for operatingsetting
-- ----------------------------
DROP TABLE IF EXISTS `operatingsetting`;
CREATE TABLE `operatingsetting`  (
  `storeId` bigint(20) NOT NULL COMMENT '店铺id',
  `date` datetime NOT NULL COMMENT '营运日期',
  `currentFoodItemTemplateId` bigint(20) NOT NULL DEFAULT -1 COMMENT '菜品模板表主键id',
  PRIMARY KEY (`storeId`, `date`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orderandfooditemcomboassociation
-- ----------------------------
DROP TABLE IF EXISTS `orderandfooditemcomboassociation`;
CREATE TABLE `orderandfooditemcomboassociation`  (
  `orderId` bigint(20) NOT NULL COMMENT '订单主键编号',
  `comboId` int(11) NOT NULL COMMENT '套餐编号',
  `foodItemId` int(11) NOT NULL COMMENT '套餐编号',
  `foodItemCount` int(11) NOT NULL DEFAULT 0 COMMENT '菜品数量',
  `comboTemplateCount` int(11) NOT NULL DEFAULT 0 COMMENT '套餐数量',
  `isDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`orderId`, `comboId`, `foodItemId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orderform
-- ----------------------------
DROP TABLE IF EXISTS `orderform`;
CREATE TABLE `orderform`  (
  `orderId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单主键编号',
  `uuId` varchar(20) NOT NULL DEFAULT '' COMMENT '可展示订单编号',
  `addressId` bigint(20) NOT NULL DEFAULT -1 COMMENT '送餐地址编号',
  `storeId` bigint(20) NOT NULL DEFAULT -1 COMMENT '店铺编号',
  `customerId` bigint(20) NOT NULL DEFAULT -1 COMMENT '用户编号',
  `deliveryDate` datetime NOT NULL COMMENT '选择的送餐日期',
  `deliveryTime` int(11) NOT NULL DEFAULT -1 COMMENT '0 午餐 1晚餐',
  `createdAt` datetime NOT NULL COMMENT '下单时间',
  `lastUpdatedAt` datetime NOT NULL COMMENT '最后修改时间',
  `deliveredTime` datetime NOT NULL COMMENT '送达时间',
  `refundTime` datetime NOT NULL COMMENT '退单时间',
  `totalAmount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '总金额',
  `subTotal` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '菜品金额总计',
  `taxes` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '税收',
  `tip` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '消费',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `refundReason` varchar(255) NOT NULL DEFAULT '' COMMENT '退款原因',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '状态  0-预订单（下单展示页） 1-进行中  2已送达  3已完成（或者带评价） 4已完成 5申请退款中 6 已退款 ',
  `zhangPeriod` int(11) NOT NULL DEFAULT 0 COMMENT '账期状态（0 为到账，1 已到账）',
  `storeIsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '商家是否删除',
  `customerIsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '用户是否删除',
  `customerIsRead` bit(1) NOT NULL DEFAULT b'0' COMMENT '用户是否阅读',
  `storeIsRead` bit(1) NOT NULL DEFAULT b'0' COMMENT '商家是否阅读',
  `storeEarnings` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '商家收益=菜品金额*（1-当前的系统抽成比例）',
  `platformEarnings` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '平台收益=菜品金额总计*当前的系统抽成比例',
  `proportional` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '系统抽成比例',
  PRIMARY KEY (`orderId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `pictureId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图片主键',
  `pictureUrl` varchar(5000) NOT NULL DEFAULT '' COMMENT '图片存放地址',
  PRIMARY KEY (`pictureId`) 
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for platform
-- ----------------------------
DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform`  (
  `platformId` decimal(10, 0) NOT NULL COMMENT '平台信息表主键',
  `totalMoney` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '平台现有总资金',
  `toatalEarnings` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '平台总计收益',
  `lunchStartTime` time NOT NULL COMMENT '系统设置 午餐 配送起始时间',
  `lunchEndTime` time NOT NULL COMMENT '系统设置 午餐 配送结束时间',
  `dinnerStartTime` time NOT NULL COMMENT '系统设置 晚餐 配送起始时间',
  `dinnerEndTime` time NOT NULL COMMENT '系统设置 晚餐配送结束时间',
  PRIMARY KEY (`platformId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `reviewId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论 主键编号',
  `tasteScore` double NOT NULL DEFAULT 0 COMMENT '味道评分',
  `serviceScore` double NOT NULL DEFAULT 0 COMMENT '服务评分',
  `weightScore` double NOT NULL DEFAULT 0 COMMENT '分量评分',
  `avgScore` double NOT NULL DEFAULT 0 COMMENT '综合评分',
  `scoreContent` varchar(255) NOT NULL DEFAULT '' COMMENT '评分内容  如果未null 标示没有评价内容',
  `customerId` bigint(20) NOT NULL DEFAULT -1 COMMENT '用户编号',
  `orderId` bigint(20) NOT NULL DEFAULT -1 COMMENT '点单编号',
  `storeId` bigint(20) NOT NULL DEFAULT -1 COMMENT '店铺编号',
  `reviewTime` datetime NOT NULL COMMENT '评价时间',
  `isAutoReview` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否自动评价',
  `isDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`reviewId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for reviewpictureassociation
-- ----------------------------
DROP TABLE IF EXISTS `reviewpictureassociation`;
CREATE TABLE `reviewpictureassociation`  (
  `reviewId` bigint(20) NOT NULL COMMENT '评论主键编号',
  `pictureId` bigint(20) NOT NULL DEFAULT -1 COMMENT '图片主键',
  `isDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`reviewId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色主键id',
  `roleName` varchar(255) NOT NULL DEFAULT '' COMMENT '角色名称',
  `roleContent` varchar(255) NOT NULL DEFAULT '' COMMENT '包含的权限',
  `isDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `createdAt` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`roleId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for salessetting
-- ----------------------------
DROP TABLE IF EXISTS `salessetting`;
CREATE TABLE `salessetting`  (
  `storeId` bigint(20) NOT NULL COMMENT '商家id',
  `lunchRefundInterval` time NOT NULL COMMENT '午餐无条件退款时间',
  `dinnerRefundInterval` time NOT NULL COMMENT '晚餐无条件退款时间',
  `lunchOrderendTime` time NOT NULL COMMENT '午餐截止下单时间',
  `dinnerOrderendTime` time NOT NULL COMMENT '晚餐截止下单时间',
  `isHaveLunch` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否开放午餐',
  `isHaveDinner` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否开放晚餐',
  `pictureId` bigint(20) NOT NULL DEFAULT -1 COMMENT '封面图片id',
  PRIMARY KEY (`storeId`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart`  (
  `shoppingCartId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `customerId` bigint(20) NOT NULL DEFAULT -1 COMMENT '用户编号',
  PRIMARY KEY (`shoppingCartId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shoppingcartlineitem
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcartlineitem`;
CREATE TABLE `shoppingcartlineitem`  (
  `shoppingCartLineItemId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `shoppingCartId` bigint(20) NOT NULL DEFAULT -1 COMMENT '购物车表主键id',
  `storeId` bigint(20) NOT NULL DEFAULT -1 COMMENT '套餐编号',
  `deliveryDate` datetime NOT NULL COMMENT '选择的送餐日期',
  `deliveryTime` int(11) NOT NULL DEFAULT 0 COMMENT '选择的送餐时间 0 午餐 1晚餐',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT ' 0:in_cart,1:ordered,2:deleted',
  `comboId` bigint(20) NOT NULL DEFAULT -1 COMMENT 'Combo表主键id',
  `comboCount` bigint(20) NOT NULL DEFAULT 0 COMMENT '套餐数量',
  `foodItemId` bigint(20) NOT NULL DEFAULT -1 COMMENT '菜品表主键编号',
  `foodItemCount` int(11) NOT NULL DEFAULT 0 COMMENT '菜品份数',
  `createdAt` datetime NOT NULL COMMENT '创建时间',
  `updatedAt` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`shoppingCartLineItemId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `storeId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商家id',
  `phoneNumber` varchar(25) NULL DEFAULT '' COMMENT '电话号码',
  `email` varchar(25) NULL DEFAULT '' COMMENT '邮箱',
  `wechatOpenid` varchar(25) NULL DEFAULT '' COMMENT '微信id',
  `phoneNumberIsValidated` varchar(25) NULL DEFAULT '' COMMENT '电话号码',
  `emailIsValidated` varchar(25) NULL DEFAULT '' COMMENT '邮箱',
  `wechatOpenidIsValidated` varchar(25) NULL DEFAULT '' COMMENT '微信id',
  `nickName` varchar(255) NULL DEFAULT '' COMMENT '昵称',
  `firstName` varchar(50) NULL DEFAULT '' COMMENT '名',
  `lastName` varchar(50) NULL DEFAULT '' COMMENT '姓',
  `sex` bit(1) NULL DEFAULT b'0' COMMENT '性别',
  `balance` decimal(10, 0) NULL DEFAULT 0 COMMENT '余额',
  `storeName` varchar(50) NULL DEFAULT '' COMMENT '店铺名称',
  `averageScore` double(10, 2) NULL DEFAULT 0.00 COMMENT '综合评分',
  `star` int(11) NULL DEFAULT 0 COMMENT '星级',
  `introduction` varchar(50) NULL DEFAULT '' COMMENT '简介',
  `businessAddress` varchar(50) NULL DEFAULT '' COMMENT '店铺地址 真实地址',
  `isDeleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除',
  `avatarPictureId` bigint(20) NULL DEFAULT -1 COMMENT '头像对应图片id',
  PRIMARY KEY (`storeId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for storeaddressassociation
-- ----------------------------
DROP TABLE IF EXISTS `storeaddressassociation`;
CREATE TABLE `storeaddressassociation`  (
  `storeId` bigint(20) NOT NULL COMMENT '店铺主键id',
  `addressId` bigint(20) NOT NULL COMMENT '地址主键id',
  `isDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`storeId`, `addressId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for storeapplication
-- ----------------------------
DROP TABLE IF EXISTS `storeapplication`;
CREATE TABLE `storeapplication`  (
  `storeId` bigint(20) NOT NULL COMMENT '商家id',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '0 审核中 1审核成功 2审核失败',
  `applicationResult` varchar(20) NOT NULL DEFAULT '' COMMENT '审核结果',
  `isDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`storeId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for storeapplicationpictureassociation
-- ----------------------------
DROP TABLE IF EXISTS `storeapplicationpictureassociation`;
CREATE TABLE `storeapplicationpictureassociation`  (
  `storeId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '店铺主键id',
  `pictureId` int(11) NOT NULL COMMENT '图片主键id',
  `isDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`storeId`, `pictureId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for storeauth
-- ----------------------------
DROP TABLE IF EXISTS `storeauth`;
CREATE TABLE `storeauth`  (
  `storeAuthId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商家账号主键id',
  `storeId` bigint(20) NULL DEFAULT -1 COMMENT '商家id',
  `password` varchar(255) NULL DEFAULT '' COMMENT '密码',
  `storeSecretkey` varchar(200) NULL DEFAULT '' COMMENT '商家秘钥',
  `createdAt` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `allowBackgroundLogin` varchar(255) NULL DEFAULT '' COMMENT '允许后台登陆',
  `allowLogin` varchar(255) NULL DEFAULT '' COMMENT '允许移动端登陆',
  PRIMARY KEY (`storeAuthId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for storepictureassociation
-- ----------------------------
DROP TABLE IF EXISTS `storepictureassociation`;
CREATE TABLE `storepictureassociation`  (
  `storeId` bigint(20) NOT NULL COMMENT '店铺主键id',
  `pictureId` bigint(20) NOT NULL COMMENT '图片主键id',
  `isDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`storeId`, `pictureId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for transcation
-- ----------------------------
DROP TABLE IF EXISTS `transcation`;
CREATE TABLE `transcation`  (
  `transcationId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '系统流水主键编号',
  `orderId` bigint(20) NOT NULL DEFAULT -1 COMMENT '订单编号',
  `transcationNumber` bigint(20) NOT NULL DEFAULT -1 COMMENT '流水号（可能是微信的流水号，支付宝或者银联）',
  `amount` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '金额',
  `createdAt` datetime NOT NULL COMMENT '创建时间',
  `paymentMethod` int(11) NOT NULL DEFAULT 0 COMMENT '支付方式： 微信， 支付包，银联',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '用途：0 支付， 1提现 2充值 3退款',
  `customerId` bigint(20) NOT NULL DEFAULT -1 COMMENT '用户主键id',
  `storeId` bigint(20) NOT NULL DEFAULT -1 COMMENT '商家编号',
  `isSucess` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否成功',
  `failReson` varchar(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `isDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`transcationId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wallet
-- ----------------------------
DROP TABLE IF EXISTS `wallet`;
CREATE TABLE `wallet`  (
  `walletId` bigint(20) NOT NULL,
  `walleType` int(11) NOT NULL DEFAULT 0 COMMENT '流水类型：0 支付， 1提现 2充值 3退款',
  `peopleType` varchar(20) NOT NULL DEFAULT '0' COMMENT '用户类型（可以是 商家和用户）',
  `transcationId` bigint(20) NOT NULL DEFAULT -1 COMMENT '对应记录的 系统流水。交易有争论，我们可以追溯到 系统流水 获取转账方式和对应银行或者支付接口 流水单号',
  `peopleId` bigint(20) NOT NULL DEFAULT -1 COMMENT '用户编号（商家编号或者用户编号）',
  `amount` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '金额',
  `createdAt` datetime NOT NULL COMMENT '操作时间',
  `lastUpdatedAt` datetime NOT NULL COMMENT '最后修改时间',
  `isDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`walletId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
