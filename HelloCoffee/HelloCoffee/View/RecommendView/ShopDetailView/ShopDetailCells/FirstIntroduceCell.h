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

@property (weak, nonatomic) IBOutlet UIImageView *headPortraitImageView; // 头像 ImgV
@property (weak, nonatomic) IBOutlet UIImageView *badgeImageView; // 标签 ImgV
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel; // 昵称 Lable
@property (weak, nonatomic) IBOutlet UILabel *honorLabel; // 头衔 Label
@property (weak, nonatomic) IBOutlet ImageLabelButton *checkButton; // 左：查看数 Btn
@property (weak, nonatomic) IBOutlet ImageLabelButton *praiseButton; // 右：点赞数 Btn
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel; // 编辑介绍 Label

// Cell 方法
-(void) setInformationWithSomething; // 参数 - Model

-(void)addTarget:(id)target withHeadPortraitIVAction:(SEL)headPortraitIVAction introduceLabelAction:(SEL)introduceLabelAction praiseButtonAction:(SEL)praiseButtonAction; // Target - Action
@end
