//
//  ImageLabelButton.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/19.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PortraitImageButton : UIButton

@property (nonatomic, strong) UIImage *portraitImage; // 头像
@property (nonatomic, assign) IdentityType identityType; // 身份

-(void) setPortraitImage:(UIImage *)portraitImage borderWidth:(CGFloat)borderWidth hadIdentityImgV:(BOOL)hadIdentityImgV identityType:(IdentityType)identityType identityImageSize:(CGSize)identityImageSize target:(id)target clickAction:(SEL)clickAction;

@end
