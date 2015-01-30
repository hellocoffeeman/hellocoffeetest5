//
//  PersonMessageCell.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/12/29.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "PersonMessageCell.h"

@implementation PersonMessageCell

- (void)awakeFromNib {
    // Initialization code
   // self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
   
    // Configure the view for the selected state
}
-(void)setPersonMessageCellImage:(UIImage *)image withTitleLabelText:(NSString *)str withBtnTag:(NSInteger)tagNum addTarget:(id)target action:(SEL)action
{
    self.titleImg.image = image;
    self.titleLable.text = str;
    self.NextBtn.tag = tagNum;
    [self.NextBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.NextBtn.userInteractionEnabled = NO;
}
@end
