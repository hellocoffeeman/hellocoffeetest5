//
//  ShopCommentCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpacingLabel.h"
#import "ImageButton.h"

@interface ShopCommentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet SpacingLabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet ImageButton *replyButton;
@property (weak, nonatomic) IBOutlet UIView *segmentView;



-(void) setInformationWithSomething; // 参数 - Model

-(void) setNickName:(NSString *)nickName commentString:(NSString *)commentString dateString:(NSString *)dateString replyCount:(int)replyCount target:(id)target replyAction:(SEL)replyAction;

@end
