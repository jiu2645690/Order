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
-- ��ַ��
-- ˵�������� ϵͳ���Ͳ͵�ַ���û���ͨ�� ��ַ���ʱ� ��ƥ�� ������ �Լ���Ĭ���Ͳ͵�ַ���û�ֻ������һ��Ĭ���Ͳ͵�ַ���̼ҿ��Թ�������Ͳ͵�ַ��
-- ----------------------------
DROP TABLE IF EXISTS `Address`;
CREATE TABLE `Address` (
  `addressId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '��ַ�������',
  `addressName` varchar(50) NOT NULL COMMENT '��ַ',
  `zipCode` varchar(50) NOT NULL COMMENT '�ʱ�',
  `city` varchar(50) NOT NULL COMMENT '����',
  `state` varchar(50) NOT NULL COMMENT '��',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '����ʱ��',
  `isDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Address
-- ----------------------------



-- ----------------------------
-- Table structure for Combo
-- �û��ĵ���ײ� 
-- ----------------------------
DROP TABLE IF EXISTS `Combo`;
CREATE TABLE `Combo` (
  `comboId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `comboTemplateId` bigint(20) NOT NULL   COMMENT 'ComboTemplate������id',
  PRIMARY KEY (`comboId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Combo
-- ----------------------------

-- ----------------------------
-- Table structure for ComboAndFoodItemAssociation
-- ��¼�û��ĵ���ײ� �ж�Ӧ����Щ��Ʒ
-- ----------------------------
DROP TABLE IF EXISTS `ComboAndFoodItemAssociation`;
CREATE TABLE `ComboAndFoodItemAssociation` (
  `comboId` bigint(20) NOT NULL   COMMENT 'Combo������id',
  `foodItemId` bigint(20) NOT NULL COMMENT '��Ʒ���������',
  `foodItemCount` int(11) NOT NULL COMMENT '��Ʒ����',
  `isDeleted` bit NOT NULL DEFAULT FALSE COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`comboId`,`foodItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ComboAndFoodItemAssociation
-- ----------------------------

-- ----------------------------
-- Table structure for ComboTemplate
-- �ײͱ�
-- ˵�������� �����е��ײ͡�һ������ ���� �ж���ײͣ��ײͰ��� ��Ҫ���ٲ�Ʒ��
-- �ɳ��۶��ٷݡ��ۿ۱�����
-- ----------------------------
DROP TABLE IF EXISTS `ComboTemplate`;
CREATE TABLE `ComboTemplate` (
  `comboTemplateId` bigint(20) NOT NULL COMMENT '�ײ��������',
  `comboTemplateName` varchar(20) NOT NULL COMMENT '�ײ�����',
  `comboTemplateNumber` int(11) NOT NULL COMMENT '������Ʒ����',
  `comboTemplateDiscount` double NOT NULL COMMENT '�ۿ۱���',
  `comboTemplateRemainingCount` int(11) NOT NULL COMMENT '�ɳ��۷���',
  `pictureId` varchar(20) NOT NULL COMMENT '�ײ�ͼƬid',
  `storeId` bigint(20) NOT NULL COMMENT '��������id',
  PRIMARY KEY (`comboTemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ComboTemplate
-- ----------------------------



-- ----------------------------
-- Table structure for Customer
-- �û���Ϣ��
-- ˵���������û�������Ϣ�����Ĭ���Ͳ͵�ַ��ע��ʱ�䣬��
-- ----------------------------
DROP TABLE IF EXISTS `Customer`;
CREATE TABLE `Customer` (
  `customerId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '�û�����id',
  `phoneNumber` varchar(25) NOT NULL DEFAULT '' COMMENT '�绰����',
  `email` varchar(25) NOT NULL DEFAULT '' COMMENT '����',
  `wechatOpenid` varchar(25) NOT NULL DEFAULT '' COMMENT '΢��id',
  `phoneNumberIsValidated` varchar(25) NOT NULL DEFAULT FALSE COMMENT '�绰����',
  `emailIsValidated` varchar(25) NOT NULL DEFAULT FALSE COMMENT '����',
  `wechatOpenidIsValidated` varchar(25) NOT NULL DEFAULT FALSE COMMENT '΢��id',
  `avatarPictureId` bigint(20) NOT NULL DEFAULT -1 COMMENT 'ͷ���ӦͼƬid',
  `createdAt` datetime NOT NULL COMMENT '����ʱ��',
  `nickName` varchar(25) NOT NULL COMMENT '�ǳ�',
  `firstName` varchar(50) NOT NULL COMMENT '��',
  `lastName` varchar(50) NOT NULL COMMENT '��',
  `sex` bit(1) NOT NULL COMMENT '�Ա�',
  `balance` decimal(10,0) NOT NULL DEFAULT 0 COMMENT '���',
  `addressId` bigint(20) NOT NULL COMMENT 'ȡ�͵�ַid',
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Customer
-- ----------------------------

-- ----------------------------
-- Table structure for CustomerAuth
-- �û��˻���id
-- ˵���������û��˻����� ����Կ  ���Ƿ񱻺�̨��ֹ��½
-- ----------------------------
DROP TABLE IF EXISTS `CustomerAuth`;
CREATE TABLE `CustomerAuth` (
  `customerAuthId` bigint(20) NOT NULL  COMMENT '�û��˻���id',
  `customerId` bigint(20) NOT NULL  COMMENT '�û�����id',
  `customerSecretkey` bigint(20) NOT NULL  COMMENT '�û���Կ',
  `password` varchar(255) NOT NULL COMMENT '����',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT 'ע��ʱ��',
  `allowLogin` varchar(255) NOT NULL DEFAULT TRUE COMMENT '�����ƶ��˵�½',
  PRIMARY KEY (`customerAuthId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of CustomerAuth
-- ----------------------------


-- ----------------------------
-- Table structure for CustomerStoreConversion
-- �û��̼�ת����
-- ˵����
-- ----------------------------
DROP TABLE IF EXISTS `CustomerStoreConversion`;
CREATE TABLE `CustomerStoreConversion`(
  `customerId` bigint(20) NOT NULL COMMENT '�û�����id',
  `storeId` bigint(20) NOT NULL COMMENT '�û�����id',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '����ʱ��',
  PRIMARY KEY (`customerId`,`storeId` )
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of CustomerStoreConversion
-- ----------------------------


-- ----------------------------
-- Table structure for Employee
-- Ա����Ϣ��
-- ˵�����˱���Ҫ �����̨Ա��������ϵͳ�û���admin  ��������Ա ֻ����һ����������Ա��������̨����Ȩ�ޡ���
-- ���� Ա�����к�̨����Ա��� ������ �����Ա��Ȩ�޵Ľ�ɫ��ӣ� ��ӵ�Ա������ ����Ȩ�ޡ��ֹ�����ģ�顣
-- ----------------------------
DROP TABLE IF EXISTS `Employee`;
CREATE TABLE `Employee` (
  `employeeId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Ա������id',
  `loginName` varchar(255) NOT NULL COMMENT '��½�˺�',
  `loginPassword` varchar(255) NOT NULL COMMENT '��½����',
  `roleId` bigint(20) NOT NULL COMMENT '��ɫ���',
  `realName` varchar(255) NOT NULL COMMENT '��ʵ����',
  `roleName` varchar(255) NOT NULL COMMENT '��ɫ����',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '����ʱ��',
  `isAdmin` bit(1) NOT NULL DEFAULT FALSE COMMENT '�Ƿ���ϵͳ����Ա',
  `isDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '�Ƿ�ɾ��',
  `allowLogin` bit(1) NOT NULL DEFAULT TRUE COMMENT '�Ƿ������½',
  PRIMARY KEY (`employeeId`,`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Employee
-- ----------------------------

-- ----------------------------
-- Table structure for Favorite
-- �ղر�
-- ˵�����û��ղ���Ϣ�� ���˱�ֻ��� �û����û�������ӵ��̻��߲�Ʒ�������ղء�
-- ����favoriatetype ���ж� �ղص��ǵ��̻��ǲ�Ʒ��
-- ----------------------------
DROP TABLE IF EXISTS `Favorite`;
CREATE TABLE `Favorite` (
  `favoriteId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '�ղ�����id',
  `customerId` bigint(20) NOT NULL COMMENT '�û�����id',
  `storeId` bigint(20) NOT NULL DEFAULT -1 COMMENT '��������id',
  `foodItemId` bigint(20) NOT NULL DEFAULT -1 COMMENT '��Ʒ����id',
  `comboTemplateId` bigint(20) NOT NULL DEFAULT -1 COMMENT '�ײ�����id',
   PRIMARY KEY (`favoriteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Favorite
-- ----------------------------

-- ----------------------------
-- Table structure for Feedback
-- ��Ϣ������
-- ˵���������û���ϵͳ ���;ٱ���Ϣ������ϵͳ���û�������Ϣ��
-- ----------------------------
DROP TABLE IF EXISTS `Feedback`;
CREATE TABLE `Feedback` (
  `feedbackId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '��Ϣ������id',
  `sendPeopleId` bigint(20) NOT NULL  COMMENT '������Ϣ������id',
  `sendPeopleType` int(11) NOT NULL COMMENT '��Ϣ����������',
  `sendIsRead` bit NOT NULL DEFAULT FALSE COMMENT '��Ϣ�������Ƿ��Ķ�',
  `receivePeopleId` bigint(20) NOT NULL  COMMENT '������Ϣ������id',
  `receivePeopleType` int(11) NOT NULL COMMENT '��Ϣ����������',
  `receiveIsRead` bit NOT NULL COMMENT '��Ϣ�������Ƿ��Ķ�',
  `beReportedStoreId` varchar(255) NOT NULL DEFAULT -1 COMMENT '���ٱ��̼ұ�ţ�����ʾ�Ƿ��Ǿٱ���Ϣ �ͱ��ٱ��˵�����id��',
  `feedbackContent` varchar(255) NOT NULL COMMENT '��������',
  PRIMARY KEY (`feedbackId`)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Feedback
-- ----------------------------

-- ----------------------------
-- Table structure for FeedbackPictureAssociation
-- ��Ϣ������-ͼƬ������
-- ˵���������û���ϵͳ ���;ٱ���Ϣ��
-- ����favoriatetype ���ж� �ղص��ǵ��̻��ǲ�Ʒ��
-- ----------------------------
DROP TABLE IF EXISTS `FeedbackPictureAssociation`;
CREATE TABLE `FeedbackPictureAssociation` (
  `feedbackId` bigint(20) NOT NULL  COMMENT '��Ϣ����id',
  `pictureId` bigint(20) NOT NULL  COMMENT 'ͼƬ����id',
   PRIMARY KEY (`feedbackId`,`pictureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of FeedbackPictureAssociation
-- ----------------------------

-- ----------------------------
-- Table structure for FoodItem
-- ��Ʒ��
-- ˵���������еĲ�Ʒ��Ļ�����Ϣ��������Ʒ�ļ۸����ƣ����������
-- ͨ������ ����id storeid ��������������
-- ----------------------------
DROP TABLE IF EXISTS `FoodItem`;
CREATE TABLE `FoodItem` (
  `foodItemId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '��Ʒ����id',
  `name` varchar(50) NOT NULL COMMENT '��Ʒ����',
  `price` decimal(10,0) NOT NULL COMMENT '�۸�',
  `remainingCount` int(11) NOT NULL DEFAULT 0 COMMENT '�������',
  `primaryIngredient` varchar(255) NOT NULL DEFAULT '' COMMENT '��Ʒ����',
  `complementaryIngredient` varchar(255) NOT NULL DEFAULT '' COMMENT '��Ʒ����',
  `rank` int(11) NOT NULL COMMENT '��Ʒ����',
  `description` varchar(255) NOT NULL COMMENT '����',
  `dailySpecialPrice` decimal(10,0) NOT NULL COMMENT '�ػݼ۸�',
  `isAvailable` bit(1) NOT NULL DEFAULT FALSE COMMENT '���¼�',
  `storeId` bit(1) NOT NULL COMMENT '��������id',
  `pictureId` bigint(20) NOT NULL DEFAULT -1 COMMENT '����ͼƬ����id',
  PRIMARY KEY (`fooditemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of FoodItem
-- ----------------------------

-- ----------------------------
-- Table structure for FoodItemAndTemplateAssociation
-- ��Ʒ -��Ʒģ�������
-- ----------------------------
DROP TABLE IF EXISTS `FoodItemAndTemplateAssociation`;
CREATE TABLE `FoodItemAndTemplateAssociation` (
  `foodItemTemplateId` int(11) NOT NULL COMMENT 'ģ����',
  `foodItemId` varchar(255) NOT NULL COMMENT '��Ʒ���',
 PRIMARY KEY (`foodItemTemplateId`,`foodItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of FoodItemAndTemplateAssociation
-- ----------------------------

-- ----------------------------
-- Table structure for FoodItemPictureAssociation
-- ��Ʒ-ͼƬ������
-- ˵������Ҫ������Ʒ��ͼƬ ���� һ����Ʒ ��Ӧ ����ͼƬ��
-- ----------------------------
DROP TABLE IF EXISTS `FoodItemPictureAssociation`;
CREATE TABLE `FoodItemPictureAssociation` (
  `fooditemId` int(11) NOT NULL COMMENT '��Ʒ����',
  `pictureId` int(11) NOT NULL COMMENT 'ͼƬid',
PRIMARY KEY (`fooditemId`,`pictureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of FoodItemPictureAssociation
-- ----------------------------

-- ----------------------------
-- Table structure for FoodItemTemplate
-- ��Ʒģ���
-- ˵������ҪӦ����Ӫ����Ϣ ����ÿ�� �����۲�Ʒ����Ӫ�˱��С�
-- ��ActualService ���� �����˱��൱�� ÿ�춼��Ӧһ��Ӫ��ģ��id��һ��Ӫ��ģ�����Ӧ���ڶ������
-- ÿ�� �޸�Ӫ��ģ�� ����һ��Ӫ��ģ�� ���� ����������ģ������ֻ����ʾ��
-- ----------------------------
DROP TABLE IF EXISTS `FoodItemTemplate`;
CREATE TABLE `FoodItemTemplate` (
  `foodItemTemplateId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '��Ʒģ���������',
  `foodItemTemplateName` varchar(20) NOT NULL COMMENT '��Ʒģ������',
  `createdAt` datetime  NOT NULL DEFAULT CURRENT_TIMESTAMP()  COMMENT '����ʱ��',
  `isDeleted` bit(1) NOT NULL  DEFAULT FALSE COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`foodItemTemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of FoodItemTemplate
-- ----------------------------

-- ----------------------------
-- Table structure for Log
-- ϵͳ��־��
-- ˵����1��Ҫ��¼  ��̨Ա���Ĳ�����¼����ϵͳ��Щ�������� ʲô���Ĳ�����
--  2 ����ʱ ϵͳ�г��ֵĴ��󣬲��ɻ�ԭ ���� �̼�/�û� ������ ʲô������
-- ----------------------------
DROP TABLE IF EXISTS `Log`;
CREATE TABLE `Log` (
  `logId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT  '��־����id',
  `logType` int(11) NOT NULL COMMENT '��־����',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT  '����ʱ��',
  `logContent` varchar(255) NOT NULL COMMENT '��־����',
  `peopleType` int(11) NOT NULL DEFAULT -1 COMMENT '�������ͣ��̼ң��û���Ա����',
  `peopleId` bigint(20) NOT NULL DEFAULT -1 COMMENT '������id���̼ң��û���Ա����',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `isRepair` bit(1) NOT NULL DEFAULT FALSE COMMENT '�Ƿ�������',
  `repairConten` varchar(255) NOT NULL DEFAULT '' COMMENT '�������',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Log
-- ----------------------------



-- ----------------------------
-- Table structure for Message
-- ��Ϣ��
-- ˵������Ϣ��Ҫ��Ϣ����Ҫ��¼����Ϣ���� ����ͨ��Ϣ����ϵͳ��Ϣ��
-- �������Ա�������� �̼Һ�ϵͳ  �û���ϵͳ  �̼Һ��û���
-- ----------------------------
DROP TABLE IF EXISTS `Message`;
CREATE TABLE `Message` (
  `messageId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '��Ϣ����id',
  `storeId` bigint(20) NOT NULL COMMENT '�̼�����id',
  `customId` bigint(20) NOT NULL COMMENT '�û�����id',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '����ʱ��',
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Message
-- ----------------------------

-- ----------------------------
-- Table structure for MessageDetail
-- ��Ϣ��ϸ���ݱ�
-- ˵�����˱���Ҫ��Ӧ ��Ϣ��Message ����¼ÿ����Ϣ�е���������
--  ��Ҫ������ �����û����ͣ� �����û����͡�
-- ----------------------------
DROP TABLE IF EXISTS `MessageDetail`;
CREATE TABLE `MessageDetail` (
  `messageDetailId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '��Ϣ��ϸ���ݱ�����id',
  `messageId` bigint(20) NOT NULL COMMENT '��������id',
  `sendPeopleId` bigint(20) NOT NULL  COMMENT '������Ϣ������id',
  `sendPeopleType` int(11) NOT NULL COMMENT '��Ϣ����������',
  `sendIsRead` bit NOT NULL DEFAULT TRUE COMMENT '��Ϣ�������Ƿ��Ķ�',
  `receivePeopleId` bigint(20) NOT NULL  COMMENT '������Ϣ������id',
  `receivePeopleType` int(11) NOT NULL COMMENT '��Ϣ����������',
  `receiveIsRead` bit NOT NULL DEFAULT FALSE COMMENT '��Ϣ�������Ƿ��Ķ�',
  `messageContent` varchar(255) NOT NULL COMMENT '��������',
  `sendTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '����ʱ��',
  PRIMARY KEY (`messageDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------  
-- Records of MessageDetail
-- ----------------------------



-- ----------------------------
-- Table structure for OperatingSetting 
-- ����ÿ��Ӫ����Ϣ��
-- ˵�����˱���Ҫ���� �̼ҵ� Ӫ�˲�Ʒ ��Ӫ�����ڡ�ÿ���̼����̼ҹ����̨�趨
-- ���Ŀ�ģ� ��¼ �̻��趨 Ӫ�����ڣ� �͹����Ĳ�Ʒģ��ģ��id
-- ÿ��Ӫ����Ϣ������ ��Ʒģ��id FoodItemtemplate��
-- ----------------------------
DROP TABLE IF EXISTS `OperatingSetting`;
CREATE TABLE `OperatingSetting` (
  `storeId` bigint(20) NOT NULL COMMENT '����id',
  `date` datetime NOT NULL COMMENT 'Ӫ������',
  `currentFoodItemTemplateId` bigint(20) NOT NULL COMMENT '��Ʒģ�������id',
  PRIMARY KEY (`storeId`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of OperatingSetting 
-- ----------------------------

-- ----------------------------
-- Table structure for Order
-- ������
-- ˵������Ҫ��¼���µ����ɵĶ��������� ״̬������˫����
-- Ҳ�����̼����棬ƽ̨����ͳ�ơ�
-- ----------------------------
DROP TABLE IF EXISTS `Order`;
CREATE TABLE `Order` (
  `orderId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '�����������',
  `uuId` varchar(20) NOT NULL COMMENT '��չʾ�������',
  `addressId` bigint(20) NOT NULL COMMENT '�Ͳ͵�ַ���',
  `storeId` bigint(20) NOT NULL COMMENT '���̱��',
  `customerId` bigint(20) NOT NULL COMMENT '�û����',
  `deliveryDate` datetime  NOT NULL COMMENT 'ѡ����Ͳ�����',
  `deliveryTime` int(11)  NOT NULL COMMENT '0 ��� 1���',
  `createdAt` datetime  NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '�µ�ʱ��',
  `lastUpdatedAt` datetime  NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '����޸�ʱ��',
  `deliveredTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '�ʹ�ʱ��',
  `refundTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '�˵�ʱ��',
  `totalAmount` decimal(10,2) NOT NULL COMMENT '�ܽ��',
  `subTotal` decimal(10,2) NOT NULL COMMENT '��Ʒ����ܼ�',
  `taxes` decimal(10,2) NOT NULL COMMENT '˰��',
  `tip` decimal(10,2) NOT NULL DEFAULT 0 COMMENT 'С��',
  `remark` varchar(255) NOT NULL COMMENT '��ע',
  `refundReason` varchar(255) NOT NULL DEFAULT ''  COMMENT '�˿�ԭ��',
  `state` int(11) NOT NULL COMMENT '״̬  0-Ԥ�������µ�չʾҳ�� 1-������  2���ʹ�  3����ɣ����ߴ����ۣ� 4����� 5�����˿��� 6 ���˿� ',
  `zhangPeriod` int(11) NOT NULL  DEFAULT 0 COMMENT '����״̬��0 Ϊ���ˣ�1 �ѵ��ˣ�',
  `storeIsDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '�̼��Ƿ�ɾ��',
  `customerIsDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '�û��Ƿ�ɾ��',
  `customerIsRead` int(11) NOT NULL DEFAULT FALSE COMMENT '�û��Ƿ��Ķ�',
  `storeIsRead` int(11) NOT NULL DEFAULT FALSE COMMENT '�̼��Ƿ��Ķ�',
  `storeEarnings` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '�̼�����=��Ʒ���*��1-��ǰ��ϵͳ��ɱ�����',
  `platformEarnings` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'ƽ̨����=��Ʒ����ܼ�*��ǰ��ϵͳ��ɱ���',
  `proportional` decimal(10,2) NOT NULL  DEFAULT 0.00 COMMENT 'ϵͳ��ɱ���',
  PRIMARY KEY (`orderId`,`uuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Order
-- ----------------------------

-- ----------------------------
-- Table structure for OrderAndFoodItemComboAssociation
-- �������� ��Ʒ ���ײͱ� 
-- ----------------------------
DROP TABLE IF EXISTS `OrderAndFoodItemComboAssociation`;
CREATE TABLE `OrderAndFoodItemComboAssociation` (
  `orderId` bigint(20) NOT NULL  COMMENT '�����������',
  `comboId` bigint(11) NOT NULL DEFAULT -1 COMMENT '�ײͱ��',
  `foodItemId` bigint(11) NOT NULL DEFAULT -1 COMMENT '�ײͱ��',
  `foodItemCount` int(11) NOT NULL DEFAULT 0 COMMENT '��Ʒ����',
  `comboTemplateCount` int(11) NOT NULL DEFAULT 0 COMMENT '�ײ�����',
  `isDeleted` bit(1) NOT NULL COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`orderId`,`comboId`,`foodItemId`)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of OrderAndFoodItemComboAssociation
-- ----------------------------



-- ----------------------------
-- Table structure for Picture
-- ͼƬ��
-- ˵������¼�û��ϴ���ͼƬ����ͼƬ����ŵ�����
-- ----------------------------
DROP TABLE IF EXISTS `Picture`;
CREATE TABLE `Picture` (
  `pictureId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ͼƬ����',
  `pictureUrl` varchar(50) NOT NULL COMMENT 'ͼƬ��ŵ�ַ',
  PRIMARY KEY (`pictureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Picture
-- ----------------------------

-- ----------------------------
-- Table structure for Platform
--  ƽ̨��Ϣ��
-- ��¼ƽ̨�Ļ�����Ϣ��������Ϣ��
-- ----------------------------
DROP TABLE IF EXISTS `Platform`;
CREATE TABLE `Platform` (
  `platformId` decimal(10,0) NOT NULL COMMENT 'ƽ̨��Ϣ������',
  `totalMoney` decimal(10,0) NOT NULL COMMENT 'ƽ̨�������ʽ�',
  `toatalEarnings` decimal(10,0) NOT NULL COMMENT 'ƽ̨�ܼ�����',
  `lunchStartTime` time NOT NULL  COMMENT 'ϵͳ���� ��� ������ʼʱ��' ,
  `lunchEndTime` time NOT NULL  COMMENT 'ϵͳ���� ��� ���ͽ���ʱ��',
  `dinnerStartTime` time NOT NULL  COMMENT 'ϵͳ���� ��� ������ʼʱ��',
  `dinnerEndTime` time NOT NULL  COMMENT 'ϵͳ���� ������ͽ���ʱ��',
PRIMARY KEY (`platformId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of Platform
-- ----------------------------
-- ----------------------------
-- Table structure for Review
-- ���۱�
-- ���������ʱ���û��ɶ� ����(ʵ�����ǶԵ���)�������ۡ�
-- ����û����������ۣ���������ɺ�3���� �Զ����к�����
-- ���鿴��������ʱ,�����Ƿ����������ݽ���չʾ����ֻչʾ�� �������ݵ���Ϣ ͼƬҲ�㣬��
-- ----------------------------
DROP TABLE IF EXISTS `Review`;
CREATE TABLE `Review` (
  `reviewId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '���� �������',
  `tasteScore` double NOT NULL DEFAULT 5 COMMENT 'ζ������',
  `serviceScore` double NOT NULL DEFAULT 5 COMMENT '��������',
  `weightScore` double NOT NULL DEFAULT 5 COMMENT '��������',
  `avgScore` double NOT NULL DEFAULT 5 COMMENT '�ۺ�����',
  `scoreContent` varchar(255) NOT NULL DEFAULT '' COMMENT '��������  '' ��ʾû����������',
  `customerId` bigint(20) NOT NULL COMMENT '�û����',
  `orderId` bigint(20) NOT NULL COMMENT '�㵥���',
  `storeId` bigint(20) NOT NULL COMMENT '���̱��',
  `reviewTime` datetime NOT NULL COMMENT '����ʱ��',
  `isAutoReview` bit(1) NOT NULL DEFAULT TRUE  COMMENT '�Ƿ��Զ�����',
  `isDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`reviewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Review
-- ----------------------------


-- ----------------------------
-- Table structure for ReviewPictureAssociation
-- ����-ͼƬ������
-- ----------------------------
DROP TABLE IF EXISTS `ReviewPictureAssociation`;
CREATE TABLE `ReviewPictureAssociation` (
  `reviewId` bigint(20) NOT NULL  COMMENT '�����������',
  `pictureId` bigint(20) NOT NULL  COMMENT 'ͼƬ����',
  `isDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`reviewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ReviewPictureAssociation
-- ----------------------------

-- ----------------------------
-- Table structure for Role
-- ��ɫ��
-- ��¼ϵͳ�� Ա�� ���߱��Ĳ���Ȩ�ޡ�
--  ϵͳ���� ����Ȩ�ޣ����� Ա�� ��ִ�еĲ�����  
-- ----------------------------
DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role` (
  `roleId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '��ɫ����id',
  `roleName` varchar(255) NOT NULL COMMENT '��ɫ����',
  `roleContent` varchar(255) NOT NULL COMMENT '������Ȩ��',
  `isDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '�Ƿ�ɾ��',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '����ʱ��',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Role
-- ----------------------------




-- ----------------------------
-- Table structure for SalesSetting
-- ������Ϣ��
-- ��¼���̻�����Ϣ ��ϵͳ������Ϣ��ϵͳ������ϵͳ���������Զ�������
-- ������� ��ͣ�����Ͳ�ʱ�䣬Ĭ��Ϊϵͳ�Ͳ�ʱ�䣬���������� Ĭ��Ϊϵͳ����Ͳ�ʱ�䣬
-- ������ �˿�ʱ�� ���� �����޸ģ������µ�ʱ�������ʱ�޸ġ�
-- ----------------------------
DROP TABLE IF EXISTS `SalesSetting`;
CREATE TABLE `SalesSetting` (
  `storeId` bigint(20) NOT NULL  COMMENT '�̼�id',
  `lunchRefundInterval` time NOT NULL COMMENT '����������˿�ʱ��',
  `dinnerRefundInterval` time NOT NULL COMMENT '����������˿�ʱ��',
  `lunchOrderendTime` time NOT NULL COMMENT '��ͽ�ֹ�µ�ʱ��',
  `dinnerOrderendTime` time NOT NULL COMMENT '��ͽ�ֹ�µ�ʱ��',
  `isHaveLunch` bit(1) NOT NULL DEFAULT FALSE  COMMENT '�Ƿ񿪷����',
  `isHaveDinner` bit(1) NOT NULL DEFAULT FALSE COMMENT '�Ƿ񿪷����',
  `pictureId` bigint(20) NOT NULL DEFAULT -1 COMMENT '����ͼƬid',
  PRIMARY KEY (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of SalesSetting
-- ----------------------------
-- ----------------------------
-- Table structure for ShoppingCart
-- ���ﳵ��
-- shoppingcartid �� customerid һһ��Ӧ  ,ÿ���û���Ӧһ�����ﳵ
-- ----------------------------
DROP TABLE IF EXISTS `ShoppingCart`;
CREATE TABLE `ShoppingCart` (
  `shoppingCartId` bigint(20) NOT NULL AUTO_INCREMENT  COMMENT '����id',
  `customerId` bigint(20) NOT NULL COMMENT '�û����',
  PRIMARY KEY (`shoppingCartId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of ShoppingCart
-- ----------------------------
-- ----------------------------
-- Table structure for ShoppingCartLineItem
-- ���ﳵ�ָ�����ڼ�¼�û�����Щʱ�� ��Щ�̼� ��ӵ��˹��ﳵ
-- ----------------------------
DROP TABLE IF EXISTS `ShoppingCartLineItem`;
CREATE TABLE `ShoppingCartLineItem` (
  `shoppingCartLineItemId` bigint(20) NOT NULL AUTO_INCREMENT  COMMENT '����id',
  `shoppingCartId` bigint(20) NOT NULL   COMMENT '���ﳵ������id',
  `storeId` bigint(20) NOT NULL COMMENT '�ײͱ��',
  `deliveryDate` datetime NOT NULL COMMENT 'ѡ����Ͳ�����',
  `deliveryTime` int(11) NOT NULL COMMENT 'ѡ����Ͳ�ʱ�� 0 ��� 1���',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT ' 0:in_cart,1:ordered,2:deleted',
  `comboId` bigint(20) NOT NULL   COMMENT 'Combo������id',
  `comboCount` bigint(20) NOT NULL DEFAULT -1  COMMENT '�ײ�����',
  `foodItemId` bigint(20) NOT NULL DEFAULT -1  COMMENT '��Ʒ���������',
  `foodItemCount` int(11) NOT NULL COMMENT '��Ʒ����',
  `createdAt` datetime  NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '����ʱ��',
  `updatedAt` datetime  NOT NULL DEFAULT '0000-00-00 00:00:0011' COMMENT '�޸�ʱ��',
   PRIMARY KEY (`shoppingCartLineItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of ShoppingCartLineItem
-- ----------------------------
-- ----------------------------
-- Table structure for Store
-- ������Ϣ��
-- ��¼���̻�����Ϣ ��ϵͳ������Ϣ��ϵͳ������ϵͳ���������Զ�������
-- ������� ��ͣ�����Ͳ�ʱ�䣬Ĭ��Ϊϵͳ�Ͳ�ʱ�䣬���������� Ĭ��Ϊϵͳ����Ͳ�ʱ�䣬
-- ������ �˿�ʱ�� ���� �����޸ģ������µ�ʱ�������ʱ�޸ġ�
-- ----------------------------
DROP TABLE IF EXISTS `Store`;
CREATE TABLE `Store` (
  `storeId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '�̼�id',
  `phoneNumber` varchar(25) NOT NULL COMMENT '�绰����',
  `email` varchar(25) NOT NULL COMMENT '����',
  `wechatOpenid` varchar(25) NOT NULL COMMENT '΢��id',
  `phoneNumberIsValidated` varchar(25) NOT NULL COMMENT '�绰����',
  `emailIsValidated` varchar(25) NOT NULL COMMENT '����',
  `wechatOpenidIsValidated` varchar(25) NOT NULL COMMENT '΢��id',
  `nickName` varchar(255) NOT NULL DEFAULT '' COMMENT '�ǳ�',
  `firstName` varchar(50) NOT NULL DEFAULT '' COMMENT '��',
  `lastName` varchar(50) NOT NULL DEFAULT '' COMMENT '��',
  `sex` varchar(255) NOT NULL DEFAULT '' COMMENT '�Ա�',
  `balance` decimal(10,0) NOT NULL DEFAULT 0.00  COMMENT '���',
  `storeName` varchar(50) NOT NULL COMMENT '��������',
  `averageScore` double NOT NULL DEFAULT 0 COMMENT '�ۺ�����',
  `star` int(11) NOT NULL  DEFAULT 0 COMMENT  '�Ǽ�',
  `introduction` varchar(50) NOT NULL DEFAULT '' COMMENT '���',
  `businessAddress` varchar(50) NOT NULL DEFAULT '' COMMENT '���̵�ַ ��ʵ��ַ',
  `isDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of Store
-- ----------------------------
-- ----------------------------
-- Table structure for StoreAddressAssociation
-- ����-��ַ������ ��ϵ ���� ��Զ�
-- һ����ַ���Զ�Ӧ������̣�һ�����̿��Զ�Ӧ�����ַ
-- ----------------------------
DROP TABLE IF EXISTS `StoreAddressAssociation`;
CREATE TABLE `StoreAddressAssociation` (
  `storeId` bigint(20) NOT NULL COMMENT '��������id',
  `addressId` bigint(20) NOT NULL COMMENT '��ַ����id',
  `isDeleted` bit(1) NOT NULL DEFAULT FALSE COMMENT '�Ƿ�ɾ��',
	 PRIMARY KEY (`storeId`,`addressId`)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of StoreAddressAssociation
-- ----------------------------
-- ----------------------------
-- Table structure for StoreApplication
-- ������˱�
-- ��¼����еĵ��̡�����˽��
-- ----------------------------
DROP TABLE IF EXISTS `StoreApplication`;
CREATE TABLE `StoreApplication` (
  `storeId` bigint(20) NOT NULL  COMMENT '�̼�id',
  `state` int(11) NOT NULL COMMENT '0 ����� 1��˳ɹ� 2���ʧ��',
  `applicationResult` varchar(20) NOT NULL  COMMENT '��˽��',
  `isDeleted` bit NOT NULL DEFAULT FALSE COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of StoreApplication
-- ----------------------------
-- ----------------------------
-- Table structure for StoreApplicationPictureAssociation
-- ������˱�
-- ��¼����еĵ��̡�����˽��
-- ----------------------------
DROP TABLE IF EXISTS `StoreApplicationPictureAssociation`;
CREATE TABLE `StoreApplicationPictureAssociation` (
  `storeId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '��������id',
  `pictureId` int(11) NOT NULL COMMENT 'ͼƬ����id',
  `isDeleted` bit NOT NULL DEFAULT FALSE COMMENT '�Ƿ�ɾ��',
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
-- �̼��˺ű�
-- ��Ҫ��¼�̼��˺ŵ� ��Կ�� ���� ���Լ��Ƿ񱻺�̨��ֹ��½
-- ----------------------------
DROP TABLE IF EXISTS `StoreAuth`;
CREATE TABLE `StoreAuth` (
  `storeAuthId` bigint(20) NOT NULL AUTO_INCREMENT  COMMENT '�̼��˺�����id',
  `storeId` bigint(20) NOT NULL  COMMENT '�̼�id',
  `password` varchar(255) NOT NULL COMMENT '����',
  `storeSecretkey` bigint(20) NOT NULL  COMMENT '�̼���Կ',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT 'ע��ʱ��',
  `allowBackgroundLogin` varchar(255) NOT NULL DEFAULT TRUE COMMENT '�����̨��½',
  `allowLogin` varchar(255) NOT NULL  DEFAULT TRUE COMMENT '�����ƶ��˵�½',
  PRIMARY KEY (`storeAuthId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of StoreAuth
-- ----------------------------
-- ----------------------------
-- Table structure for StorePictureAssociation
-- ����-ͼƬ������
-- ��Ҫ���ڹ��� ͼƬ ��� ���̱�
-- ----------------------------
DROP TABLE IF EXISTS `StorePictureAssociation`;
CREATE TABLE `StorePictureAssociation` (
  `storeId` bigint(20) NOT NULL COMMENT '��������id',
  `pictureId` bigint(20) NOT NULL COMMENT 'ͼƬ����id',
  `isDeleted` bit NOT NULL DEFAULT FALSE COMMENT '�Ƿ�ɾ��',
PRIMARY KEY (`storeId`,`pictureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of StorePictureAssociation
-- ----------------------------

-- ----------------------------
-- Table structure for Transcation
-- ϵͳ��ˮ��
-- ��¼ϵͳ ��΢�� ֧���� �������� ��applePay ֮�䷢���Ľ��ס�
-- ���û����̼ҷ�������ͨ��ϵͳ �� ֧���ṹ ����֧����ת������
-- ��֧���ṹ �������� �����ϵͳ������ɹ��޸� ������Ϣ�����ʧ��˵��ԭ��
-- ��  ϵͳ���㣬 ϵͳ ��ͨ�����ŵķ�ʽ��ͨ����������Ա��
-- ----------------------------
DROP TABLE IF EXISTS `Transcation`;
CREATE TABLE `Transcation` (
  `transcationId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ϵͳ��ˮ�������',
  `orderId` bigint(20) NOT NULL DEFAULT -1 COMMENT '�������',
  `transcationNumber` bigint(20) NOT NULL COMMENT '��ˮ�ţ�������΢�ŵ���ˮ�ţ�֧��������������',
  `amount` decimal(10,0) NOT NULL COMMENT '���',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '����ʱ��',
  `paymentMethod` int(11) NOT NULL COMMENT '֧����ʽ�� ΢�ţ� ֧����������',
  `type` int(11) NOT NULL COMMENT '��;��0 ֧���� 1���� 2��ֵ 3�˿�',
  `customerId` bigint(20) NOT NULL DEFAULT -1 COMMENT '�û�����id',
  `storeId` bigint(20) NOT NULL DEFAULT -1 COMMENT '�̼ұ��',
  `isSucess` int(11) NOT NULL DEFAULT FALSE COMMENT '0 �ȴ��У�1��ֵ�ɹ� 2 ��ֵʧ��',
  `failReson` varchar(255) NOT NULL DEFAULT '' COMMENT 'ʧ��ԭ��',
  `isDeleted` bit NOT NULL  DEFAULT FALSE COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`transcationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Transcation
-- ----------------------------

-- ----------------------------
-- Table structure for Wallet
-- �û�Ǯ����
-- ��¼�û� ���ѣ���ֵ�����֣��˿� �Ƚ��׼�¼��
-- ----------------------------
DROP TABLE IF EXISTS `Wallet`;
CREATE TABLE `Wallet` (
  `walletId` bigint(20) NOT NULL,
  `walleType` int(11) NOT NULL COMMENT '��ˮ���ͣ�0 ֧���� 1���� 2��ֵ 3�˿�',
  `peopleType` varchar(20) NOT NULL COMMENT '�û����ͣ������� �̼Һ��û���',
  `transcationId` varchar(20) NOT NULL COMMENT '��Ӧ��¼�� ϵͳ��ˮ�����������ۣ����ǿ���׷�ݵ� ϵͳ��ˮ ��ȡת�˷�ʽ�Ͷ�Ӧ���л���֧���ӿ� ��ˮ����',
  `peopleId` bigint(20) NOT NULL  COMMENT '�û���ţ��̼ұ�Ż����û���ţ�',
  `amount` decimal(10,0) NOT NULL COMMENT '���',
  `createdAt` datetime  NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '����ʱ��',
  `lastUpdatedAt` datetime  NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '����޸�ʱ��',
  `isDeleted` bit NOT NULL DEFAULT FALSE COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`walletId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Wallet
-- ----------------------------