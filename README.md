# Order
点餐系统开发代码仓
用户表 UserInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
UserId	bgint	20	Y	N	Y	用户的编号  
NickName	varchar	50		Y	Y	昵称
PhoneNumbe	varchar	25		Y	Y	用户手机号
Emial	varchar	50		Y	Y	用户ｅｍｉａｌ
WechatOpenid	varchar	50		Y	Y	微信ｏｐｅｎｉｄ
RoleType	varchar	25		N		角色类型
AllowBackgroundLogin	bit	1		N		是否允许登陆商家后台
Allowlogin	bit	1		N		允许服务端登陆
RealName	varchar	25		Y		真实姓名
Sex	bit	1		Y		性别
IsMerchants	bit	1		Y		是否是商家
	decimal	10		N		余额
RegistType	varchar	10		N		注册类型（微信注册，手机号注册，邮箱注册）
RegistTime	datetime	0		N		注册时间
AddressId	int	10		Y		送餐地址主键编号










商家 MerchantsInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
MerchantsId	bgint	20	Y	N	Y	用户的编号  
NickName	varchar	50		Y	Y	昵称
PhoneNumbe	varchar	25		Y	Y	用户手机号
Emial	varchar	50		Y	Y	用户ｅｍｉａｌ
WechatOpenid	varchar	50		Y	Y	用微信ｏｐｅｎｉｄ
RoleType	varchar	25		N		角色类型
AllowBackgroundLogin	bit	1		N		是否允许登陆商家后台
AllowLogin	bit	1		N		允许服务端登陆
RealName	varchar	25		Y		真实姓名
Sex	bit	1		Y		性别
Balance	decimal	10		N		余额（默认0）
RegistTime	bit	1		N		注册时间
RegistType	datetime	10		N		注册类型（微信注册，手机号注册，邮箱注册）

店铺 StoreInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
列1	列2	列3	列4	列5	列6	列7
StoreOID	bgint	20	Y	N	Y	用户的编号  
StoreName	varchar	50		Y	Y	店铺名称
AverageScore	double	10		Y		综合评分
Introduction	varchar	max		Y		简介
BusinessAddress	varchar	50		Y		商家地址
LunchStartTime	time	20		Y		午餐送餐起始时间
LunchEndTime	time	20		Y		午餐送餐结束时间
DinnerStartTime	time	20		Y		晚餐送餐起始时间
DinnerEndTime	time	20		Y		晚餐送餐结束时间
LunchRefundInterval	time	20		Y		午餐无条件退款时间
DinnerRefundInterval	time	20		Y		晚餐件退款时间
LunchOrderEndTime	time	20		Y		午餐下单截至时间
DinnerOrderEndTime	time	20		Y		晚餐下单截至时间
Star	int	10		Y		消费档次
IsHaveLunch	bit	1		N		是否开放午餐
IsHaveDinner	bit	1		N		是否开放晚餐
PicCount	int	10		Y		店铺照片张数
MerchantsId	bigint			N		商家表主键Id

评价表 EvaluationInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
列1	列2	列3	列4	列5	列6	列7
EvaluationId	bgint	20	Y	N	Y	
TasteScore	double	10		N		味道评分
ServiceScore	double	10		N		服务评分
WeightScore	double	10		N		份量评分
AvgScore	double	10		N		综合评分
ScoreContent	varchar	255		Y		评价内容
UserId	bgint	20		N		用户表主键Id
OrderId	bgint	20		N		订单表主键Id
StoreId	bgint	20		N		店铺表主键Id
ScoreTime	datetime	0		N		评分时间
IsAutoScore	bit	1		N		是否自动评分









菜品表 DishesInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
DishesID	bgint	20	Y	N	Y2	编号
Names	varchar	50		N		商品名称
Price	decimal	10		N		价格
Inventory	int	10		N		库存数量
AdvocateMaterial	varchar	50		Y		商品主材
ComplementaryMaterial	varchar	50		Y		商品辅材
Sort	int			N		商品排序
describe	varchar	255		Y		商品描述
IsPreferential	bit	1		N		是否特惠
PreferentialPrice	decimal	10		Y		特惠价格
IsSpecialOffer	bit	1		N		今日特价
SpecialOfferPrice	decimal	10		Y		是否特价金额
Shelves	bit	1		N		上下架
StoreOID	bit	1		N		所属店铺Id
PicCount	int	1		Y		图片张数

营运信息表 ActualServiceInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
ActualServiceId	bigint	20	Y	N	Y	信息编号
StoreOID	bigint	20		N		店铺主键Id
ServiceDate	datetime	0		Y		日期
DishesTempIdCanEditor	bit	1		Y		菜品模板可编辑
DishesTempId	bigint			N		


	菜品模板信息表表 DishesTempInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
DishesTempId	bigint	20	Y	N	Y	菜品模板主键
DishesTempName	varchar	20				菜品模板名称
IsDelete	bit	1				是否删除
						


	菜品模板信息表表 DishesTempAssociatedInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
DishesTempId	bigint	20	Y	N	Y	菜品模板主键id
DishesId	varchar	max				菜品主键id







	套餐表 PackageInfo			
字段	类型	长度	是否主键	允许为空	是否唯一	备注				
PackageId	bigint	20	Y	N	Y	套餐编号				
PackageName	varchar	20		N		套餐名称				
PackageNumber	int	10		N		菜品分数				
PackageDiscount	double	10		N		折扣比例				
PackageMaxOrderNum	int	10		N		出售分数				
PicId	varchar	20		N		套餐图片编号	
StoreOID	bigint	20		N		店铺主键Id				




订单表 OrderInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
OrderId	bigint	20	Y	N	Y	订单编号
AddId	bigint	20		N		送餐地址主键编号
StoreOID	bigint	20		N		商家主键编号
UserId	bigint	20		N		用户主键编号
OderTime	datetime	0		N		下单时间
DeliveryTime	datetime	0		N		送达时间
RefundTime	datetime	0		Y		退款时间
TotalAmount	decimal	0		N		金额
TaxesAndFees	decimal	0		N		税费
Tip	decimal	0		N		小费
Remark	varchar	255		Y		备注
RefundReason	varchar	255		Y		退款理由
State	int	10		N		状态
ZhangPeriod	int	0		N		账期状态
IsEffective	bit	1		N		是否有效
MerchantsIsDelete	bit	1		N		商家是否删除
UserIsDelete	bit	1		N		顾客是否删除
UserIsRead	int	10		N		顾客未查看订单数
MerchantsIsRead	int	10		N		商家未查看订单数
MerchantsEarnings	decimal			Y		商家收益
PlatformEarnings	decimal			Y		平台收益



	


订单中商品详情 OrderOfDishesInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
OrderOfDishesId	bigint	20	Y	N	Y	订单中商品详情编号
OrderId	bigint	20		N		订单主键编号
DishesID	bigint	20		N		菜品主键编号
DishesCount	int	20		N		份数
StoreOID	bigint	10		N		商家主键编号
UserId	bigint	10		N		顾客主键编号
IsPackage	bit			N		
IsPackageId	bigint			Y		



会话表 ChatTitleInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
ChatTitleId	bigint	20	Y	N	Y	会话编号
ChatMerchants	bigint	20		Y		会话对象-顾客
ChatStore	bigint	20		Y		会话对象-商家
IsStstem	bit	1		N		是否系统消息




会话信息表 ChatInfo
列1	列2	列3	列4	列5	列6	列7
字段	类型	长度	是否主键	允许为空	是否唯一	备注
ChatId	bigint	20	Y	N	Y	会话信息编号
ChatTitleId	bigint	20		N		会话主键编号
SendUserId	bigint	20		N		发送人编号
SendType	int	10		N		发送人-类型
ChatContent	varchar	255		N		会话内容
IsHavePic	bit			N		是否有图片











用户表 EmployeesInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
EmployeesId	bgint	20	Y	N	Y	员工编号 
LoginName	varchar	50		N	Y	登陆账号
LoginPwd	varchar	25		N		登陆密码
RoelId	datetime	0		N		权限编号
RealName	varchar	25		Y		真实姓名
RoleName	varchar	25		N		权限名称
CreateTime	datetime	0		N		创建时间
IsSystem	bit	1		N		是否是系统管理员
IsDelete	bit	1		N		是否删除
AllowLogin	bit	1		Y		是否允许登陆




权限表 RoleInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
RoleId	bigint	20	Y	N	Y	权限编号
RoleName	varchar	20		N		权限名称
RoleContent	varchar	max		N		权限集合
IsDelete	bit	1		N		是否删除
CreateTime	datetime	0		N		创建时间



用户流水表 accountsInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
AccountsId	bigint	20	Y	N	Y	流水编号
AccountsType	varchar	20		N		流水类型
CustomType	varchar	20		N		用户类型
CustomId	bigint	20		N		用户编号
Money	decimal	20		N		资金额度
MoneyType	varchar	20		N		资金类型






图片表 PicInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
PicId	bigint	20	Y	N	Y	图片编号
PicUrl	varchar	50		N		图片路径




送餐地址表 AddressInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
AddressId	bigint	20	Y	N	Y	地址编号
Address	varchar	50				地址内容
ZipCode	varchar	50				邮编
IsDelete	bit					是否删除


送餐地址表 LogoInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
LogoId	bigint	20	Y	N	Y	编号
LogoType	int	10		N		记录类型
CreatTime	datetime	0		N		记录时间
LogoContent	varchar	max		N		操作内容
SomeOneType	int	10		Y		操作人员类型
SomeOneId	bigint	20		Y		操作人员主键编号
IP	varchar	20		Y		操作点IP


店铺展示-图片关联表 StoreShowPicInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
StoreId	bigint					店铺id
PicId	bigint					图片id

店铺展示-图片关联表 StoreAuditPicInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
StoreId	bigint			N		店铺id
PicId	bigint			N		图片id






店铺—地址关联表 StoreAddressInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
StoreId	bigint			N		店铺id
AddressId	bigint			N		图片id


店铺展示-图片关联表 DishesPicInfo
列1	列2	列3	列4	列5	列6	列7
字段	类型	长度	是否主键	允许为空	是否唯一	备注
DishesID	bigint			N		店铺id
PicId	bigint			N		图片id

系统支付流水 SerialInfo
列1	列2	列3	列4	列5	列6	列7
字段	类型	长度	是否主键	允许为空	是否唯一	备注
SerialId	bigint		Y	N	Y	
OrderId	bigint					订单编号
SerialNumber	bigint			N		流水号
Amount 	decmial					金额
CreateTime	datetime					时间
MethodOfPayment	int					支付方式（例如：-1 余额 0 微信，1银行卡）
UseTo	int					用途（支付订单，充值账号，提现）
UserId	bigint					用户主键id
MerchantsId	bigint					商家主键id
IsSucess	bit					是否支付成功
FailReason	Varchar	255				失败理由


平台信息管理 PlatformInfo
字段	类型	长度	是否主键	允许为空	是否唯一	备注
TotalMoney	bigint			N		平台总资产
ToatalEarnings	bigint			N		平台总收益

