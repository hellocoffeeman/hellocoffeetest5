//
//  Order.m
//  AlixPayDemo
//
//  Created by 方彬 on 11/2/13.
//
//

#import "Order.h"

@implementation Order

- (NSString *)description {
	NSMutableString * discription = [NSMutableString string];
    if (self.partner) {
        [discription appendFormat:@"partner=\"%@\"", self.partner];//合作者身份ID,String(16),签约的支付宝账号对应的支付宝唯一用户号以 2088 开头的16位纯数字 组成。 （接口参数 ）
    }
	
    if (self.seller) {
        [discription appendFormat:@"&seller_id=\"%@\"", self.seller];//卖家支付宝账号,卖家支付宝账号(邮箱或手机 号码格式)或其对应的支付宝 唯一用户号(以 2088 开头的 纯 16 位数字)。  （接口参数 ）
    }
	if (self.tradeNO) {
        [discription appendFormat:@"&out_trade_no=\"%@\"", self.tradeNO];//商户网站唯一订单号,String(64) ,支付宝合作商户网站唯一订单号。 不可空 （接口参数）//订单ID（由商家自行制定）,接口参数
    }
	if (self.productName) {
        [discription appendFormat:@"&subject=\"%@\"", self.productName];//商品名称  ,String(128),商品的标题/交易标题/订单标 题/订单关键字等。该参数最长为 128 个汉字。 （传值）
    }
	
	if (self.productDescription) {
        [discription appendFormat:@"&body=\"%@\"", self.productDescription];//商品详情,对一笔交易的具体描述信息。如果是多种商品,请将商品描述字符串累加传给 body。 String(512)  （传值）
    }
	if (self.amount) {
        [discription appendFormat:@"&total_fee=\"%@\"", self.amount];//总金额,Number,该笔订单的资金总额,单位为 RMB-Yuan。取值范围为 [0.01,100000000.00],精确 到小数点后两位。
    }
    if (self.notifyURL) {
        [discription appendFormat:@"&notify_url=\"%@\"", self.notifyURL];//String(200) 支付宝服务器主动通知商户网站里指定的页面http路径。  ,服务器异步通知页面路径 ,不可空   （接口参数 ）
    }
	
    if (self.service) {
        [discription appendFormat:@"&service=\"%@\"",self.service];//mobile.securitypay.pay   接口名称 String  ,接口名称。固定值。
    }
    if (self.paymentType) {
        [discription appendFormat:@"&payment_type=\"%@\"",self.paymentType];//1 ,支付类型 String(4),支付类型。默认值为:1(商 品购买)。  不可空
    }
    
    if (self.inputCharset) {
        [discription appendFormat:@"&_input_charset=\"%@\"",self.inputCharset];//utf-8,商户网站使用的编码格式,固定为utf-8。 String
    }
    if (self.itBPay) {
        [discription appendFormat:@"&it_b_pay=\"%@\"",self.itBPay];//30m  未付款交易的超时时间,String ,设置未付款交易的超时时间, 一旦超时,该笔交易就会自动被关闭。当用户输入支付密码、点击确认付款后(即创建支付宝交易后)开始计时。取值范围:1m~15d,或者使 用绝对时间(示例格式: 2014-06-13 16:00:00)。m-分钟,h-小时,d-天,1c- 当天(无论交易何时创建,都 在0点关闭)。该参数数值不接受小数点,如 1.5h,可转换为 90m
    }
    if (self.showUrl) {
        [discription appendFormat:@"&show_url=\"%@\"",self.showUrl];//m.alipay.com 为手机支付宝网站,展示地址,即在支付宝页面时商品名称旁边的“详情”的链接地址
    }
    if (self.rsaDate) {
        [discription appendFormat:@"&sign_date=\"%@\"",self.rsaDate];//可空
    }
    if (self.appID) {
        [discription appendFormat:@"&app_id=\"%@\"",self.appID];//客户端号 String 可空
    }
	for (NSString * key in [self.extraParams allKeys]) {
		[discription appendFormat:@"&%@=\"%@\"", key, [self.extraParams objectForKey:key]];
	}
	return discription;
}


@end
