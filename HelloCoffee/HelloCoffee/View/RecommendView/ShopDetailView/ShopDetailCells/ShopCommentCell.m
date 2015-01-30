//
//  ShopCommentCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ShopCommentCell.h"
#import <CoreText/CoreText.h>

@implementation ShopCommentCell

// 参数 - Model
-(void) setInformationWithSomething
{
   
}

-(void) setNickName:(NSString *)nickName commentString:(NSString *)commentString dateString:(NSString *)dateString replyCount:(int)replyCount target:(id)target replyAction:(SEL)replyAction
{
    
    // 昵称
    self.nickNameLabel.text = nickName;
    
    self.commentLabel.linesSpacing = 6.0f;
    self.commentLabel.text = commentString;

    self.dateLabel.text = dateString;
    self.timeLabel.text = [NSString stringWithFormat:@"%d小时前",(int)(replyCount/5)+1];
    
    
    [self.replyButton setButtonLeftImage:[UIImage imageNamed:@"comment"] rightTitle:[NSString stringWithFormat:@"%d",replyCount] target:target action:replyAction];
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
