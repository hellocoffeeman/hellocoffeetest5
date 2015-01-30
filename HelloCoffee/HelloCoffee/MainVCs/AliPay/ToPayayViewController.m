//
//  ToPayayViewController.m
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/29.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "ToPayayViewController.h"
#import "Order.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>
@interface ToPayayViewController ()

@end

@implementation ToPayayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self createBtn];
}


-(NSString *)charqie:(NSString *)dateStr AndCan:(NSString *)subStr
{
    //⽅方法名是componentsSeparatedByCharactersInSet //参数是⼀一个NSCharacterSet的集合,⼀一次把集合⾥里⾯面的所有字符都切掉,变成⼀一个数组返回 //参数通过[NSCharacterSet characterSetWithCharactersInString:@"年月⽇日 点分秒"]来⽣生成要切的字符的集合
    NSArray *dateArr = [dateStr componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\"&="]];
    NSLog(@"dateArr=====%@",dateArr);
    NSInteger a= [dateArr indexOfObject:subStr];//@"success"
    NSString *str;
    for (NSInteger i=a+1;i<dateArr.count;i++)
    {
        
        if([dateArr[i] length]!=0)
        {
            NSLog(@"success=%@",dateArr[i]);
            str=dateArr[i];
            break;
        }
    }
    
    return str;
}


-(void)createBtn
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"支付0.01元" forState:UIControlStateNormal];
    btn.frame=CGRectMake(20, 80, 200, 80);
    [self.view addSubview:btn];
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(zhifuDown:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)zhifuDown:(UIButton *)btn
{
    
    
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    //商户ID
    NSString *partner = @"2088711520907419";
    //账号ID
    NSString *seller = @"hccaiwu@hellocoffee.com.cn";//卖家支付宝账号(邮箱或手机 号码格式)或其对应的支付宝 唯一用户号(以 2088 开头的 纯 16 位数字)。
    //商户私钥
    NSString *privateKey = @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKp2WNYFE9lVR/zciOU3qQYHqdns+aP2OaLQkqUnW42msL/vig1XHpiBWZtJ1UWlvVRvLUV94Dq2X+/xXC+1I9rSwv15WpdGH3YAjtg+a/PDu/NF8rUz5lqOypj5Eyc3M3uK9lnGBGkUBd8Ls+BHIywIZ99396k+pPEtp9Ve6F4ZAgMBAAECgYBSm6fRkARefoW0dOuiqaav1WbqxXz1iI3F6W4nuzsTGoTtfxhX/rBFF+pk5xMD/Z4THQ3Db40K5vb3QPB77jzBNIhz+DH6FhV+JnfqEg9K40lP6l+P/vQU0hc1lPznltyCgzH2oUReMPQ0PyDa+6uZEIyNeHJ/fHhEUXgjW70gAQJBANJNRuklU6QQ54diXfNlvQPQ3yMB3nVOfEk0fn6ZAPAQ0YsAtrPwAUNwIqW6OMiGYSMrgBd1CRTdlvhrAvX1lMECQQDPgN1gkjsvaIqjCgoC2ynVCPknEmpsiYXAIyG7Mtu0Vm7vambyItquhKubEY+I4HZS8RJX3qTxfIuGIO0TLmdZAkEAwRlT0yAC/NLIxPb9bVAtjiNrv6knqm62kEEzJOs4gTXwMcImAHKPtmxwY9vp57X7219F7kP4YsBUryUTQuSMAQJAacOJErv2JsfmQgvP5nzG6arVM7ETRZci8Tf27W+SxGx5xtY4+poBVIqS3UsqGd4u8T+m1drJv7x3cTo/HFO+oQJAWYwB04m3uSrcojQgJ3QiwzpgKQh34xTGmGHKDgyRY83zMd63LDVjuTjKytWnidoZWXufNjZqDQNSNGPutpcwJw==";
    //    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([partner length] == 0 || [seller length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"缺少商户ID(partner）或者账号ID(seller)。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                              
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    
    order.tradeNO = [self generateTradeNO]; //订单ID（由商家自行制定）,接口参数
    
    order.productName = @"商品标题";//product.subject; //商品标题
    order.productDescription =@"商品描述"; //product.body; //商品描述
    order.amount = [NSString stringWithFormat:@"%.2f",0.01]; //商品价格
    
    order.notifyURL = @"http://www.xxx.com"; //回调URL
    
    order.service = @"mobile.securitypay.pay";
    
    order.paymentType = @"1";//支付类型。默认值为:1(商品购买)。
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"MyzhifuDmeo";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(privateKey); //RSA签名密钥 根据（私钥）获得 （无须接口参数）
    NSString *signedString = [signer signString:orderSpec];
    
    NSLog(@"signedString==%@",signedString);
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        NSLog(@"orderString==%@",orderString);
        
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
            if([[resultDic objectForKey:@"resultStatus"] integerValue]==9000&&[[self charqie:[resultDic objectForKey:@"result"]AndCan:@"success"] isEqualToString:@"true"])
                
            {
                //sleep(1);
//                SecessPayViewController *secess=[[SecessPayViewController alloc] init];
//                [self.navigationController pushViewController:secess animated:YES];
                
                
            }else
            {
                //sleep(1);
//                PayFauilViewController *fauil=[[PayFauilViewController alloc] init];
//                [self.navigationController pushViewController:fauil animated:YES];
            }
            
            
        }];
        
        //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
}

#pragma mark -
#pragma mark   ==============产生随机订单号==============


- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand(time(0));
    // NSLog(@"$$$$$$$$$$$$$$$$$$$$$$$time(0)==%ld",time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
