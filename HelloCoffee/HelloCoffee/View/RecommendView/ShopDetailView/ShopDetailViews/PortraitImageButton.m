//
//  ImageLabelButton.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/19.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "PortraitImageButton.h"

@interface PortraitImageButton ()

@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGFloat borderWidth;

@property (nonatomic, strong) UIImageView *placeHoldImageView; // 占位 默认背景图
@property (nonatomic, strong) UIImageView *portraitImageView; // 头像
@property (nonatomic, strong) UIImageView *identityImageView; // 身份 图标

@end

@implementation PortraitImageButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void) addImageViewsWithBorderWidth:(CGFloat)borderWidth hadIdentityImgV:(BOOL)hadIdentityImgV identityImageSize:(CGSize)identityImageSize
{
    self.borderWidth = borderWidth; // 记录 边框 width
    
    // 占位 ImageView
    self.placeHoldImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:self.placeHoldImageView];
    
    // 头像 ImageView
    self.portraitImageView = [[UIImageView alloc] initWithFrame:CGRectMake(borderWidth, borderWidth, self.width-borderWidth*2, self.height-borderWidth*2)];
    [self addSubview:self.portraitImageView];
    self.portraitImageView.center = CGPointMake(self.width/2, self.height/2);
    // 圆角
    self.portraitImageView.layer.cornerRadius = self.portraitImageView.bounds.size.width/2;
    self.portraitImageView.layer.masksToBounds = YES;
    
    // 标识 ImageView
    if (hadIdentityImgV == YES) {
        self.identityImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width-identityImageSize.width, self.height-identityImageSize.height, identityImageSize.width, identityImageSize.height)];
        [self addSubview:self.identityImageView];
    }
    
}

-(void) setPortraitImage:(UIImage *)portraitImage borderWidth:(CGFloat)borderWidth hadIdentityImgV:(BOOL)hadIdentityImgV identityType:(IdentityType)identityType identityImageSize:(CGSize)identityImageSize target:(id)target clickAction:(SEL)clickAction
{
    self.width = self.bounds.size.width;
    self.height = self.bounds.size.height;
    self.backgroundColor = [UIColor clearColor];
    
    // 初始化 imageview 放置在 Button 上
    [self addImageViewsWithBorderWidth:borderWidth hadIdentityImgV:hadIdentityImgV identityImageSize:identityImageSize];
    
    // 设置 图片
    self.placeHoldImageView.image = [UIImage imageNamed:@"touxiangkuang.png"];
    self.portraitImageView.image = portraitImage;
    
    // 设置 身份
    self.identityType = identityType;
    
    // 点击头像 Action
    if (target != nil && clickAction != nil) {
        [self addTarget:target action:clickAction forControlEvents:UIControlEventTouchDown];
    }
}

#pragma mark - 重写 SET -
-(void)setPortraitImage:(UIImage *)portraitImage
{
    _portraitImage = nil;
    _portraitImage = portraitImage;
    
    self.portraitImageView.image = portraitImage;
}

-(void)setIdentityType:(IdentityType)identityType
{
    _identityType = identityType;

    if (self.identityImageView) {
        [self setIdentityTypeImageByJudgeIdentityType:identityType];
    }
}

#pragma mark - 根据 IdentityType 设置图片-
-(void)setIdentityTypeImageByJudgeIdentityType:(IdentityType)identityType
{
    // 判断 身份
    switch (identityType) {
        case From_Designer: // 美编
            self.identityImageView.image = [UIImage imageNamed:@"xunzhang.png"];
            break;
        case From_Shopkeeper: // 店主
            self.identityImageView.image = [UIImage imageNamed:@"xunzhang.png"];
            break;
        case From_Customer: // 用户
            self.identityImageView.image = [UIImage imageNamed:@"xunzhang.png"];
            break;
        case From_LoyalUser: // 忠实用户
            self.identityImageView.image = [UIImage imageNamed:@"xunzhang.png"];
            break;
    }
}

@end
