//
//  ReserveButtonView.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/20.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "FollowView.h"

@interface FollowView ()

@property (nonatomic, strong) UILabel *by_Label;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UIImageView *identityImageView;

@end

@implementation FollowView

#pragma mark - "by" + Label -
-(void) setFollowType_By_Label_WithNickName:(NSString *)nickName fontSize:(CGFloat)fontSize rectSize:(CGSize)rectSize
{
    self.backgroundColor = [UIColor clearColor];
    CGSize stringSize = [self getNewSizeOfRectWithText:nickName limitSize:CGSizeMake(rectSize.width-25, rectSize.height) fontSize:fontSize];
    
    // NickNameLabel
    self.nickNameLabel = [self getNickNameLabelWithFrame:CGRectMake(20, 0, stringSize.width, rectSize.height) fontSize:fontSize textAlignment:NSTextAlignmentLeft];
    self.nickNameLabel.text = nickName;
    self.nickNameLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:self.nickNameLabel];
    
    // By Label
    self.by_Label = [self getByLabelWithFrame:CGRectMake(0, 0, 17, rectSize.height)];
    self.by_Label.textColor = [UIColor lightGrayColor];
    [self addSubview:self.by_Label];
    
}


#pragma mark - Label + ImageView -
-(void)setFollowType_Label_ImgV_WithNickName:(NSString *)nickName identityType:(IdentityType)identityType fontSize:(CGFloat)fontSize
{
    self.backgroundColor = [UIColor clearColor];
    CGSize stringSize = [self getNewSizeOfRectWithText:nickName limitSize:CGSizeMake(self.frame.size.width-20, self.frame.size.height) fontSize:fontSize];
    
    // NickNameLabel
    self.nickNameLabel = [self getNickNameLabelWithFrame:CGRectMake(0, 0, stringSize.width, stringSize.height) fontSize:fontSize textAlignment:NSTextAlignmentLeft];
    self.nickNameLabel.text = nickName;
    [self addSubview:self.nickNameLabel];
    
    // IdentityImgV
    self.identityImageView = [self getIdentityTypeImageViewWithFrame:CGRectMake(stringSize.width +5, stringSize.height-16, 14, 16) identityType:identityType];
    [self addSubview:self.identityImageView];
    
}

#pragma mark - NickNameLabel、ByLabel、IdentityImageView -
-(UILabel *)getNickNameLabelWithFrame:(CGRect)frame fontSize:(CGFloat)fontSize textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textAlignment = textAlignment;
    return label;
}
-(UILabel *)getByLabelWithFrame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:12.5];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"by";
    return label;
}
-(UIImageView *)getIdentityTypeImageViewWithFrame:(CGRect)frame identityType:(IdentityType)identityType
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [self getIdentityImageByIdentityType:identityType];
    return imageView;
}

#pragma mark -
#pragma mark - 根据 IdentityType 设置图片-
-(UIImage *)getIdentityImageByIdentityType:(IdentityType)identityType
{
    // 判断 身份
    switch (identityType) {
        case From_Designer: // 美编
            return [UIImage imageNamed:@"xunzhang.png"];
            break;
        case From_Shopkeeper: // 店主
            return [UIImage imageNamed:@"xunzhang.png"];
            break;
        case From_Customer: // 用户
            return [UIImage imageNamed:@"xunzhang.png"];
            break;
        case From_LoyalUser: // 忠实用户
            return [UIImage imageNamed:@"xunzhang.png"];
            break;
    }
}

#pragma mark - 计算高度 -
-(CGSize)getNewSizeOfRectWithText:(NSString *)text limitSize:(CGSize)limitSize fontSize:(CGFloat)fontSize
{
    /* 文段、限制Size、字号 */
    
    NSDictionary *attributeDic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    CGRect rect = [text boundingRectWithSize:limitSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributeDic context:nil];
    
    return rect.size;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
