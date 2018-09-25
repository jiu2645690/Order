/*
Navicat MySQL Data Transfer

Source Server         : 101.37.124.77
Source Server Version : 50722
Source Host           : 101.37.124.77:3306
Source Database       : test1123

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-09-25 23:14:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accountsinfo
-- ----------------------------
DROP TABLE IF EXISTS `accountsinfo`;
CREATE TABLE `accountsinfo` (
  `AccountsId` bigint(20) NOT NULL,
  `AccountsType` varchar(20) NOT NULL COMMENT '流水类型',
  `CustomType` varchar(20) NOT NULL COMMENT '用户类型',
  `CustomId` bigint(20) NOT NULL COMMENT '用户编号',
  `Money` decimal(10,0) NOT NULL COMMENT '资金额度',
  `MoneyType` varchar(255) NOT NULL COMMENT '资金类型（消费，退款，充值，提现 等）',
  PRIMARY KEY (`AccountsId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of accountsinfo
-- ----------------------------

-- ----------------------------
-- Table structure for actualserviceinfo
-- ----------------------------
DROP TABLE IF EXISTS `actualserviceinfo`;
CREATE TABLE `actualserviceinfo` (
  `ActualServiceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `StoreOID` bigint(20) NOT NULL COMMENT '店铺主键Id',
  `ServiceDate` datetime DEFAULT NULL COMMENT '日期',
  `DishesTempIdCanEditor` bit(1) DEFAULT b'0',
  `DishesTempId` bigint(20) DEFAULT NULL COMMENT '菜品模板主键',
  PRIMARY KEY (`ActualServiceId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of actualserviceinfo
-- ----------------------------

-- ----------------------------
-- Table structure for addressinfo
-- ----------------------------
DROP TABLE IF EXISTS `addressinfo`;
CREATE TABLE `addressinfo` (
  `AddressId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Address` varchar(50) DEFAULT NULL COMMENT '地址内容',
  `ZipCode` varchar(50) DEFAULT NULL COMMENT '邮编',
  `IsDelete` bit(1) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`AddressId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of addressinfo
-- ----------------------------

-- ----------------------------
-- Table structure for chatinfo
-- ----------------------------
DROP TABLE IF EXISTS `chatinfo`;
CREATE TABLE `chatinfo` (
  `ChatId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ChatTitleId` bigint(20) NOT NULL COMMENT '会话主键编号',
  `SendUserId` bigint(20) NOT NULL COMMENT '发送人编号',
  `SendType` int(11) NOT NULL COMMENT '发送人-类型',
  `ChatContent` varchar(255) NOT NULL COMMENT '会话内容',
  `IsHavePic` bit(1) NOT NULL COMMENT '是否有图片',
  PRIMARY KEY (`ChatId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of chatinfo
-- ----------------------------

-- ----------------------------
-- Table structure for chattitleinfo
-- ----------------------------
DROP TABLE IF EXISTS `chattitleinfo`;
CREATE TABLE `chattitleinfo` (
  `ChatTitleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ChatMerchants` bigint(20) DEFAULT NULL COMMENT '会话对象-顾客',
  `ChatStore` bigint(20) DEFAULT NULL COMMENT '会话对象-商家',
  `IsStstem` bit(1) NOT NULL COMMENT '是否系统对话',
  PRIMARY KEY (`ChatTitleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of chattitleinfo
-- ----------------------------

-- ----------------------------
-- Table structure for dishesinfo
-- ----------------------------
DROP TABLE IF EXISTS `dishesinfo`;
CREATE TABLE `dishesinfo` (
  `DishesID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Names` varchar(50) NOT NULL COMMENT '商品名称',
  `Price` decimal(10,0) NOT NULL COMMENT '价格',
  `Inventory` int(11) NOT NULL COMMENT '库存数量',
  `AdvocateMaterial` varchar(50) DEFAULT NULL COMMENT '商品主材',
  `ComplementaryMaterial` varchar(50) DEFAULT NULL COMMENT '商品辅材',
  `Sort` int(11) NOT NULL COMMENT '商品排序',
  `describe` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `IsPreferential` bit(1) NOT NULL COMMENT '是否特惠',
  `PreferentialPrice` decimal(10,0) DEFAULT NULL COMMENT '特惠价格',
  `IsSpecialOffer` bit(1) NOT NULL COMMENT '今日特价',
  `SpecialOfferPrice` decimal(10,2) DEFAULT NULL COMMENT '是否特价金额',
  `Shelves` bit(1) DEFAULT NULL COMMENT '上下架',
  `StoreOID` bit(1) NOT NULL COMMENT '所属店铺Id',
  `PicCount` int(11) DEFAULT NULL COMMENT '图片张数',
  PRIMARY KEY (`DishesID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dishesinfo
-- ----------------------------

-- ----------------------------
-- Table structure for dishespicinfo
-- ----------------------------
DROP TABLE IF EXISTS `dishespicinfo`;
CREATE TABLE `dishespicinfo` (
  `DishesID` int(11) NOT NULL COMMENT '菜品主键id',
  `PicId` int(11) NOT NULL COMMENT '图片主键id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dishespicinfo
-- ----------------------------

-- ----------------------------
-- Table structure for dishestempassociatedinfo
-- ----------------------------
DROP TABLE IF EXISTS `dishestempassociatedinfo`;
CREATE TABLE `dishestempassociatedinfo` (
  `DishesTempId` int(11) NOT NULL COMMENT '菜品模板主键id',
  `DishesId` varchar(255) DEFAULT NULL COMMENT '菜品主键id',
  PRIMARY KEY (`DishesTempId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dishestempassociatedinfo
-- ----------------------------

-- ----------------------------
-- Table structure for dishestempinfo
-- ----------------------------
DROP TABLE IF EXISTS `dishestempinfo`;
CREATE TABLE `dishestempinfo` (
  `DishesTempId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜品模板主键id',
  `DishesTempName` varchar(20) DEFAULT NULL COMMENT '菜品模板名称',
  `IsDelete` bit(1) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`DishesTempId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dishestempinfo
-- ----------------------------

-- ----------------------------
-- Table structure for employeesinfo
-- ----------------------------
DROP TABLE IF EXISTS `employeesinfo`;
CREATE TABLE `employeesinfo` (
  `EmployeesId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '员工主键id',
  `LoginName` varchar(255) NOT NULL COMMENT '登陆账号',
  `LoginPwd` varchar(255) NOT NULL COMMENT '登陆密码',
  `RoelId` datetime NOT NULL COMMENT '权限主键编号',
  `RealName` varchar(255) DEFAULT NULL COMMENT '真实名称',
  `RoleName` varchar(255) NOT NULL COMMENT '权限名称',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `IsSystem` bit(1) NOT NULL COMMENT '是否系统管理员',
  `IsDelete` bit(1) NOT NULL COMMENT '是否删除',
  `AllowLogin` bit(1) DEFAULT NULL COMMENT '是否允许登陆',
  PRIMARY KEY (`EmployeesId`,`LoginName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employeesinfo
-- ----------------------------

-- ----------------------------
-- Table structure for evaluationinfo
-- ----------------------------
DROP TABLE IF EXISTS `evaluationinfo`;
CREATE TABLE `evaluationinfo` (
  `EvaluationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `TasteScore` double NOT NULL COMMENT '味道评分',
  `ServiceScore` double NOT NULL COMMENT '服务评分',
  `WeightScore` double NOT NULL COMMENT '份量评分',
  `AvgScore` double NOT NULL COMMENT '综合评分',
  `ScoreContent` varchar(255) DEFAULT NULL COMMENT '评价内容',
  `UserId` bigint(20) NOT NULL COMMENT '用户表主键Id',
  `OrderId` bigint(20) NOT NULL COMMENT '订单表主键Id',
  `StoreId` bigint(20) NOT NULL COMMENT '店铺表主键Id',
  `ScoreTime` datetime NOT NULL COMMENT '评分时间',
  `IsAutoScore` bit(1) NOT NULL COMMENT '是否自动评分',
  PRIMARY KEY (`EvaluationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of evaluationinfo
-- ----------------------------

-- ----------------------------
-- Table structure for logoinfo
-- ----------------------------
DROP TABLE IF EXISTS `logoinfo`;
CREATE TABLE `logoinfo` (
  `LogoId` bigint(20) NOT NULL COMMENT '日志主键id',
  `LogoType` int(11) NOT NULL COMMENT '日志类型（登陆，修改，删除，错误等）',
  `CreatTime` datetime NOT NULL COMMENT '创建时间',
  `LogoContent` varchar(255) NOT NULL COMMENT '日志内容',
  `SomeOneType` int(11) DEFAULT NULL COMMENT '操作人员类型',
  `SomeOneId` bigint(20) DEFAULT NULL COMMENT '操作人员编号',
  `IP` varchar(20) DEFAULT NULL COMMENT '操作人员的ip（主要记录后台操作人员）',
  PRIMARY KEY (`LogoId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of logoinfo
-- ----------------------------

-- ----------------------------
-- Table structure for merchantsinfo
-- ----------------------------
DROP TABLE IF EXISTS `merchantsinfo`;
CREATE TABLE `merchantsinfo` (
  `MerchantsId` int(11) NOT NULL,
  `NickName` varchar(255) DEFAULT NULL COMMENT '昵称',
  `PhoneNumbe` varchar(255) NOT NULL COMMENT '电话号码',
  `Emial` varchar(255) NOT NULL COMMENT '电子邮箱',
  `WechatOpenid` int(11) NOT NULL COMMENT '微信openid',
  `RoleType` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `AllowBackgroundLogin` varchar(255) DEFAULT NULL COMMENT '是否允许登陆商家pc 端',
  `Allowlogin` varchar(255) DEFAULT NULL COMMENT '是否允许登陆移动端',
  `RealName` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `Sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `Balance` decimal(10,0) DEFAULT NULL COMMENT '余额',
  `RegistTime` datetime DEFAULT NULL COMMENT '注册时间',
  `RegistType` varchar(255) DEFAULT NULL COMMENT '注册类型（邮箱注册，电话注册，微信注册）',
  PRIMARY KEY (`MerchantsId`,`PhoneNumbe`,`Emial`,`WechatOpenid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of merchantsinfo
-- ----------------------------

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo` (
  `OrderId` bigint(20) NOT NULL AUTO_INCREMENT,
  `AddressId` bigint(20) NOT NULL COMMENT '地址主键id',
  `StoreOID` bigint(20) NOT NULL COMMENT '店铺主键id',
  `UserId` bigint(20) NOT NULL COMMENT '用户主键id',
  `OderTime` datetime NOT NULL COMMENT '下单时间',
  `DeliveryTime` datetime NOT NULL COMMENT '送达时间',
  `RefundTime` datetime DEFAULT NULL COMMENT '退款时间',
  `TotalAmount` decimal(10,2) NOT NULL COMMENT '总金额',
  `TaxesAndFees` decimal(10,2) NOT NULL COMMENT '税费',
  `Tip` decimal(10,2) NOT NULL COMMENT '小费',
  `Remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `RefundReason` varchar(255) DEFAULT NULL COMMENT '退款理由',
  `State` int(11) NOT NULL COMMENT '状态',
  `ZhangPeriod` int(11) NOT NULL COMMENT '账期状态(未到账，已到账）针对商家',
  `IsEffective` bit(1) NOT NULL COMMENT '是否有效',
  `MerchantsIsDelete` bit(1) NOT NULL COMMENT '商家是否删除',
  `UserIsDelete` bit(1) NOT NULL COMMENT '用户是否删除',
  `UserIsRead` int(11) NOT NULL COMMENT '用户是否阅读',
  `MerchantsIsRead` int(11) NOT NULL COMMENT '商家是否阅读',
  `MerchantsEarnings` decimal(10,0) DEFAULT NULL COMMENT '商家收益',
  `PlatformEarnings` decimal(10,0) DEFAULT NULL COMMENT '平台收益',
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------

-- ----------------------------
-- Table structure for orderofdishesinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderofdishesinfo`;
CREATE TABLE `orderofdishesinfo` (
  `OrderOfDishesId` bigint(20) NOT NULL AUTO_INCREMENT,
  `OrderId` bigint(20) NOT NULL COMMENT '订单主键id',
  `DishesID` bigint(20) NOT NULL COMMENT '菜品主键id',
  `DishesCount` int(11) NOT NULL COMMENT '菜品数量',
  `StoreOID` bigint(20) NOT NULL COMMENT '店铺主键id',
  `UserId` bigint(20) NOT NULL COMMENT '用户主键id',
  `IsPackage` bit(1) NOT NULL COMMENT '是否是套餐',
  `IsPackageId` bigint(20) DEFAULT NULL COMMENT '套餐主键id',
  PRIMARY KEY (`OrderOfDishesId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orderofdishesinfo
-- ----------------------------

-- ----------------------------
-- Table structure for packageinfo
-- ----------------------------
DROP TABLE IF EXISTS `packageinfo`;
CREATE TABLE `packageinfo` (
  `PackageId` bigint(20) NOT NULL COMMENT '套餐主键id',
  `PackageName` varchar(20) DEFAULT NULL COMMENT '套餐名称',
  `PackageNumber` int(11) DEFAULT NULL COMMENT '菜品分数',
  `PackageDiscount` double DEFAULT NULL COMMENT '折扣比例',
  `PackageMaxOrderNum` int(11) DEFAULT NULL COMMENT '出售分数',
  `PicId` varchar(20) DEFAULT NULL COMMENT '套餐图片id',
  `StoreOID` bigint(20) DEFAULT NULL COMMENT '店铺主键id',
  PRIMARY KEY (`PackageId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of packageinfo
-- ----------------------------

-- ----------------------------
-- Table structure for picinfo
-- ----------------------------
DROP TABLE IF EXISTS `picinfo`;
CREATE TABLE `picinfo` (
  `PicId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图片主键id',
  `PicUrl` varchar(50) NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`PicId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of picinfo
-- ----------------------------

-- ----------------------------
-- Table structure for platforminfo
-- ----------------------------
DROP TABLE IF EXISTS `platforminfo`;
CREATE TABLE `platforminfo` (
  `TotalMoney` decimal(10,0) NOT NULL COMMENT '平台现有总金额',
  `ToatalEarnings` decimal(10,0) NOT NULL COMMENT '平台总金额'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of platforminfo
-- ----------------------------

-- ----------------------------
-- Table structure for roleinfo
-- ----------------------------
DROP TABLE IF EXISTS `roleinfo`;
CREATE TABLE `roleinfo` (
  `RoleId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限主键id',
  `RoleName` varchar(255) NOT NULL COMMENT '权限名称',
  `RoleContent` varchar(255) NOT NULL COMMENT '权限名称',
  `IsDelete` bit(1) NOT NULL COMMENT '是否删除',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of roleinfo
-- ----------------------------

-- ----------------------------
-- Table structure for serialinfo
-- ----------------------------
DROP TABLE IF EXISTS `serialinfo`;
CREATE TABLE `serialinfo` (
  `SerialId` bigint(20) NOT NULL AUTO_INCREMENT,
  `OrderId` bigint(20) DEFAULT NULL COMMENT '订单主键id',
  `SerialNumber` bigint(20) DEFAULT NULL COMMENT '流水号',
  `Amount` decimal(10,0) DEFAULT NULL COMMENT '金额',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `MethodOfPayment` int(11) DEFAULT NULL COMMENT '支付方式（例如：-1 余额 0 微信，1银行卡）',
  `UseTo` int(11) DEFAULT NULL COMMENT '用途（支付订单，充值账号，提现',
  `UserId` bigint(20) DEFAULT NULL COMMENT '用户主键id',
  `MerchantsId` bigint(20) DEFAULT NULL COMMENT '商家主键id',
  `IsSucess` bit(1) DEFAULT NULL COMMENT '是否操作成功',
  `FailReason` varchar(255) DEFAULT NULL COMMENT '失败理由',
  PRIMARY KEY (`SerialId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of serialinfo
-- ----------------------------

-- ----------------------------
-- Table structure for storeaddressinfo
-- ----------------------------
DROP TABLE IF EXISTS `storeaddressinfo`;
CREATE TABLE `storeaddressinfo` (
  `StoreId` bigint(20) NOT NULL COMMENT '店铺主键id',
  `AddressId` bigint(20) NOT NULL COMMENT '地址主键id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of storeaddressinfo
-- ----------------------------

-- ----------------------------
-- Table structure for storeauditpicinfo
-- ----------------------------
DROP TABLE IF EXISTS `storeauditpicinfo`;
CREATE TABLE `storeauditpicinfo` (
  `StoreId` bigint(20) NOT NULL COMMENT '店铺主键id',
  `PicId` bigint(20) NOT NULL COMMENT '图片主键id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of storeauditpicinfo
-- ----------------------------

-- ----------------------------
-- Table structure for storeinfo
-- ----------------------------
DROP TABLE IF EXISTS `storeinfo`;
CREATE TABLE `storeinfo` (
  `StoreOID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '店铺主键id',
  `StoreName` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `AverageScore` double DEFAULT NULL COMMENT '平均评分',
  `Introduction` varchar(50) DEFAULT NULL COMMENT '店铺介绍',
  `BusinessAddress` varchar(50) DEFAULT NULL COMMENT '商家地址',
  `LunchStartTime` time DEFAULT NULL COMMENT '午餐送餐起始时间',
  `LunchEndTime` time DEFAULT NULL COMMENT '午餐送餐结束时间',
  `DinnerStartTime` time DEFAULT NULL COMMENT '晚餐送餐起始时间',
  `DinnerEndTime` time DEFAULT NULL COMMENT '晚餐送餐结束时间',
  `LunchRefundInterval` time DEFAULT NULL COMMENT '午餐无条件退款时间',
  `DinnerRefundInterval` time DEFAULT NULL COMMENT '晚餐件退款时间',
  `LunchOrderEndTime` time DEFAULT NULL COMMENT '午餐下单截至时间',
  `DinnerOrderEndTime` time DEFAULT NULL COMMENT '晚餐下单截至时间',
  `Star` int(11) DEFAULT NULL COMMENT '消费档次',
  `IsHaveLunch` bit(1) NOT NULL COMMENT '是否开放午餐',
  `IsHaveDinner` bit(1) NOT NULL COMMENT '是否开放晚餐',
  `PicCount` int(11) DEFAULT NULL COMMENT '店铺照片张数',
  `MerchantsId` bigint(20) NOT NULL COMMENT '商家表主键Id',
  PRIMARY KEY (`StoreOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of storeinfo
-- ----------------------------

-- ----------------------------
-- Table structure for storeshowpicinfo
-- ----------------------------
DROP TABLE IF EXISTS `storeshowpicinfo`;
CREATE TABLE `storeshowpicinfo` (
  `StoreId` bigint(20) NOT NULL COMMENT '店铺主键id',
  `PicId` bigint(20) NOT NULL COMMENT '图片主键id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of storeshowpicinfo
-- ----------------------------

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `UserId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'guid',
  `NickName` varchar(25) DEFAULT NULL COMMENT '昵称',
  `PhoneNumbe` varchar(25) NOT NULL COMMENT '用户手机号',
  `Emial` varchar(25) NOT NULL COMMENT '用户ｅｍｉａｌ',
  `WechatOpenid` varchar(25) NOT NULL COMMENT '微信ｏｐｅｎｉｄ',
  `RoleType` varchar(255) NOT NULL COMMENT '角色类型',
  `AllowBackgroundLogin` bit(1) NOT NULL COMMENT '是否允许登陆商家后台',
  `Allowlogin` bit(1) NOT NULL COMMENT '是否登陆移动端',
  `RealName` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `Sex` bit(1) DEFAULT NULL COMMENT '性别',
  `IsMerchants` bit(1) DEFAULT NULL COMMENT '是否是商家',
  `Balance` decimal(10,0) NOT NULL COMMENT '余额',
  `RegistType` varchar(255) NOT NULL COMMENT '注册类型',
  `RegistTime` datetime NOT NULL COMMENT '注册时间',
  `AddressId` bigint(20) DEFAULT NULL COMMENT '地址主键id',
  PRIMARY KEY (`UserId`,`PhoneNumbe`,`WechatOpenid`,`Emial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
