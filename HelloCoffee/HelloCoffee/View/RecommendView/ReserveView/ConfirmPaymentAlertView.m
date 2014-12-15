//
//  ConfirmPaymentAlertView.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/8.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ConfirmPaymentAlertView.h"

@interface ConfirmPaymentAlertView ()

@property (nonatomic, strong) UIView *blackTransparentView;
@property (nonatomic, strong) UIImageView *borderImageView;

@end

@implementation ConfirmPaymentAlertView


#pragma mark - 显示 支付警示框 -

-(void) showConfirmPaymentAlertViewWithSupview:(UIView *)supview target:(id)target paymentActionOne:(SEL)paymentActionOne paymentActionTwo:(SEL)paymentActionTwo totlePrice:(float)totlePrire personCount:(int)personCount reserveDay:(NSString *)reserveDay reserveTime:(NSString *)reserveTime
{
    // 记录
    CGFloat alert_width = s_width - 20; // 蓝色边框 width
    CGFloat alert_height = 400; // 蓝色边框 height
    
    CGFloat space = 30; // Label 与蓝色边框左右边界的 距离
    CGFloat available_width = alert_width - space*2; // 蓝色边框上Label 除去两边的空隙 剩余可用的宽度
    CGFloat fontSize = 21.5;
    
    // (1) 背景 - 半透明 黑 View
    self.blackTransparentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, s_width, s_height)];
    self.blackTransparentView.backgroundColor = [UIColor blackColor];
    [self addSubview:_blackTransparentView];
    
    // (2) 警示框 - 蓝色边框 Img
    self.borderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, s_height/2 - 180, alert_width, alert_height)]; // s_width-20 * 360
    self.borderImageView.image = [UIImage imageNamed:@"tanchuangkuang"];
    [self addSubview:self.borderImageView];
    
    // (3) 警示框上的 Label
    /*   ------------------------   */
    // “ 店家已成功接受您的订单 ” Label
    UILabel *alertLabel_1 = [[UILabel alloc] initWithFrame:CGRectMake(space, 10, available_width, 30)];
    [self addTextLabel:alertLabel_1 withText:@"店家已成功接受您的订单" fontSize:fontSize textAlignment:NSTextAlignmentCenter];
    // “ 预定金额 ” Label
    UILabel *alertLabel_2 = [[UILabel alloc] initWithFrame:CGRectMake(space, 60, available_width/2, 30)];
    [self addTextLabel:alertLabel_2 withText:@"订单金额" fontSize:fontSize textAlignment:NSTextAlignmentLeft];
    // “ 人数 ” Label
    UILabel *alertLabel_3 = [[UILabel alloc] initWithFrame:CGRectMake(space, 110, available_width/2, 30)];
    [self addTextLabel:alertLabel_3 withText:@"人数" fontSize:fontSize textAlignment:NSTextAlignmentLeft];
    // “ 预到店时间 ” Label
    UILabel *alertLabel_4 = [[UILabel alloc] initWithFrame:CGRectMake(space, 160, available_width/2, 30)];
    [self addTextLabel:alertLabel_4 withText:@"预到店时间" fontSize:fontSize textAlignment:NSTextAlignmentLeft];
    // “ 请选择支付方式进行支付 ” Label
    UILabel *alertLabel_5 = [[UILabel alloc] initWithFrame:CGRectMake(space, 225, available_width, 30)];
    [self addTextLabel:alertLabel_5 withText:@"请选择支付方式进行支付" fontSize:fontSize textAlignment:NSTextAlignmentCenter];
    /*   ------------------------   */
    // “ ￥ -- ” Label
    UILabel *totlePriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(space + available_width/2, 60, available_width/2, 30)];
    [self addTextLabel:totlePriceLabel withText:[NSString stringWithFormat:@"￥ %g",totlePrire] fontSize:fontSize textAlignment:NSTextAlignmentRight];
    // “ -- 人” Label
    UILabel *personCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(space + available_width/2, 110, available_width/2, 30)];
    [self addTextLabel:personCountLabel withText:[NSString stringWithFormat:@"%d 人",personCount] fontSize:fontSize textAlignment:NSTextAlignmentRight];
    // “ --月--日 --:-- ” Label
    UILabel *reserveDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(space + available_width/2, 160, available_width/2, 30)];
    [self addTextLabel:reserveDateLabel withText:[NSString stringWithFormat:[NSString stringWithFormat:@"%@ %@",reserveDay,reserveTime],totlePrire] fontSize:fontSize textAlignment:NSTextAlignmentRight];
    if (reserveDay.length+reserveTime.length > 8) {
        // 如果 字符串过长 文字自适应大小
        reserveDateLabel.adjustsFontSizeToFitWidth = YES;
    }
    
    /*   ------------------------   */

    // (3) 警示框上的 Button
    self.userInteractionEnabled = YES;
    self.blackTransparentView.userInteractionEnabled = YES;
    self.borderImageView.userInteractionEnabled = YES; // ImgView 打开交互
    // 支付方式 1
    UIButton *paymentButton_1 = [UIButton buttonWithType:UIButtonTypeSystem];
    paymentButton_1.frame = CGRectMake(space, 275, available_width, 45);
    [paymentButton_1 setBackgroundImage:[UIImage imageNamed:@"weixinzhifu"] forState:UIControlStateNormal];
    [paymentButton_1 addTarget:target action:paymentActionOne forControlEvents:UIControlEventTouchUpInside];
    [self.borderImageView addSubview:paymentButton_1];
    // 支付方式 2
    UIButton *paymentButton_2 = [UIButton buttonWithType:UIButtonTypeSystem];
    paymentButton_2.frame = CGRectMake(space, 330, available_width, 45);
    [paymentButton_2 setBackgroundImage:[UIImage imageNamed:@"zhifubaozhifu"] forState:UIControlStateNormal];
    [paymentButton_2 addTarget:target action:paymentActionTwo forControlEvents:UIControlEventTouchUpInside];
    [self.borderImageView addSubview:paymentButton_2];

    // 动画 添加到 supview 上
    self.blackTransparentView.alpha = 0.25;
    self.borderImageView.center = CGPointMake(s_width/2, s_height/2*3);
    [self showWithAnimation];
    
    
    
}


#pragma mark - 显示 动画 -
-(void)showWithAnimation
{
    [UIView animateWithDuration:0.35 animations:^{
        self.blackTransparentView.alpha = 0.55;
        self.borderImageView.center = CGPointMake(s_width/2, s_height/2);
    } completion:nil];
}

#pragma mark - 设置 Label上的 字体、对齐方式、文字-

-(void) addTextLabel:(UILabel *)textLabel withText:(NSString *)text fontSize:(CGFloat)fontSize textAlignment:(NSTextAlignment)textAlignment
{
    textLabel.text = text;
    textLabel.textAlignment = textAlignment;
    textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
    // Hiragino Sans GB W3 冬青黑体
    
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor = [UIColor blackColor];
    
    [self.borderImageView addSubview:textLabel];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
