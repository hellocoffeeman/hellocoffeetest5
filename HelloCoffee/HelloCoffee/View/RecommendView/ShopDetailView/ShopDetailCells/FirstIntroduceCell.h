//
//  FirstIntroduceCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FollowView.h"
#import "SpacingLabel.h"
#import "ImageButton.h"

@interface FirstIntroduceCell : UITableViewCell

// - Label -
@property (weak, nonatomic) IBOutlet SpacingLabel *titleLabel; // 文章 标题 Label
@property (weak, nonatomic) IBOutlet UILabel *by_nickNameLabel; // 署名 By_Name
@property (weak, nonatomic) IBOutlet UILabel *dateLabel; // 日期 Label

// - ImageView -
@property (weak, nonatomic) IBOutlet UIImageView *backImageView; // 店铺图 背景框
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView; // 店铺图

// - Button -
@property (weak, nonatomic) IBOutlet ImageButton *shareImgBtn;
@property (weak, nonatomic) IBOutlet ImageButton *praiseImgBtn;
@property (weak, nonatomic) IBOutlet UIButton *lookMoreButton;

@property (weak, nonatomic) IBOutlet UIView *segmentView;

// Cell 方法
-(void) setInformationWithSomething; // 参数 - Model
-(void) setShopImage:(UIImage *)shopImage title:(NSString *)title nickName:(NSString *)nickName dateString:(NSString *)dateString praiseCount:(int)praiseCount buttonTarget:(id)buttonTarget shareAction:(SEL)shareAction praiseAction:(SEL)praiseAction lookMoreAction:(SEL)lookMoreAction;

@end
