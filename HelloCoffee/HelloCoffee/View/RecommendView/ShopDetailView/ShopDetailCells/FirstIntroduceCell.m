//
//  FirstIntroduceCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "FirstIntroduceCell.h"

@implementation FirstIntroduceCell

#pragma mark - 内容 -
-(void)setInformationWithSomething
{
    // 编辑介绍 Label 自适应高度
}

-(void) setShopImage:(UIImage *)shopImage title:(NSString *)title nickName:(NSString *)nickName dateString:(NSString *)dateString praiseCount:(int)praiseCount buttonTarget:(id)buttonTarget shareAction:(SEL)shareAction praiseAction:(SEL)praiseAction lookMoreAction:(SEL)lookMoreAction
{
    self.shopImageView.image = shopImage;
    
    self.titleLabel.characterSpacing = 0.7f;
    self.titleLabel.text = title; // 标题

    self.by_nickNameLabel.text = nickName;
    self.dateLabel.text = dateString;
    
    [self.shareImgBtn setButtonLeftImage:[UIImage imageNamed:@"img_share"] rightTitle:@"分享转发" target:buttonTarget action:shareAction];
    [self.praiseImgBtn setButtonLeftImage:[UIImage imageNamed:@"img_chan"] rightTitle:[NSString stringWithFormat:@"%d",praiseCount] target:buttonTarget action:praiseAction];
    [self.lookMoreButton addTarget:buttonTarget action:lookMoreAction forControlEvents:UIControlEventTouchDown];
    
    // 下划线
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:self.lookMoreButton.titleLabel.text];
    NSRange contentRange = {0,[content length]};
    [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
    
    self.lookMoreButton.titleLabel.attributedText = content;
    
}

#pragma mark - 点击 [ 头像、文章 ] -


#pragma mark - 布局 -
-(void)updateSubviewsFrame
{

    
    
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
