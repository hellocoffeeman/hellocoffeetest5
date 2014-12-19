//
//  FirstIntroduceCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageLabelButton.h"

@interface FirstIntroduceCell : UITableViewCell

// ImageView
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView; // 背景 卡片 ImgV
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UIImageView *portraitBorderImageView; // 头像框 ImgV
@property (weak, nonatomic) IBOutlet UIImageView *headPortraitImageView; // 头像 ImgV
@property (weak, nonatomic) IBOutlet UIImageView *badgeImageView; // 头衔 标签 ImgV

// 渐隐 ImageView
@property (weak, nonatomic) IBOutlet UIImageView *imageGauze_1;
@property (weak, nonatomic) IBOutlet UIImageView *imageGauze_2;
@property (weak, nonatomic) IBOutlet UIImageView *labelGauze;

// Label 
@property (weak, nonatomic) IBOutlet UILabel *titleLabel; // 文章 标题 Label
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel; // 编辑介绍 Label
@property (weak, nonatomic) IBOutlet UILabel *by_label; // "by" Label
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel; // 昵称 Lable
@property (weak, nonatomic) IBOutlet UILabel *honorLabel; // 头衔 Label


// Cell 方法
-(void) setInformationWithSomething; // 参数 - Model

-(void) setPortraitImage:(UIImage *)PortraitImage title:(NSString *)title introduce:(NSString *)introduce nickName:(NSString *)nickName honorString:(NSString *)honorString;

-(void)addTarget:(id)target withHeadPortraitIVAction:(SEL)headPortraitIVAction introduceLabelAction:(SEL)introduceLabelAction praiseButtonAction:(SEL)praiseButtonAction; // Target - Action
@end
