//
//  ReserveButtonView.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/20.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
typedef enum {
    Follow_Label_ImgV, // Label + ImageView
    Follow_By_Label // "by" + Label
}FollowType; // 显示类型
*/

@interface FollowView : UIView

// 1. "by" + Label
-(void) setFollowType_By_Label_WithNickName:(NSString *)nickName fontSize:(CGFloat)fontSize rectSize:(CGSize)rectSize;

// 2. Label + ImageView
-(void) setFollowType_Label_ImgV_WithNickName:(NSString *)nickName identityType:(IdentityType)identityType  fontSize:(CGFloat)fontSize;

@end
