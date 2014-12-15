//
//  ConfirmPaymentAlertView.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/8.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 
 背景 - 半透明 黑 View
 警示框 - 蓝色边框 Img
 
 */


@interface ConfirmPaymentAlertView : UIView

// 显示 警示框
-(void) showConfirmPaymentAlertViewWithSupview:(UIView *)supview target:(id)target paymentActionOne:(SEL)paymentActionOne paymentActionTwo:(SEL)paymentActionTwo totlePrice:(float)totlePrire personCount:(int)personCount reserveDay:(NSString *)reserveDay reserveTime:(NSString *)reserveTime;

@end
