//
//  PersonMessageTwoCell.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/12/29.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "PersonMessageTwoCell.h"

@implementation PersonMessageTwoCell

- (void)awakeFromNib {
    // Initialization code
    int num = 0;
    if (s_height == 667) {
        num = 50*1.171;
    }else if (s_height == 736){
        num = 50*1.293;
    }else{
        num = 50;
    }
    
    self.iconBtn = [[PortraitImageButton alloc]init];
    
    self.iconBtn.frame = CGRectMake(13, num/2-20, 40, 40);
    [self addSubview:self.iconBtn];
//    self.iconBtn.layer.masksToBounds = YES;
//    self.iconBtn.layer.cornerRadius = 89;
//    self.iconView.layer.masksToBounds = YES;
//    self.iconView.layer.cornerRadius = 90;
//    self.iconBtn.center = CGPointMake(13+20, num/2);
//     [self setNeedsUpdateConstraints];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(30,num-1, s_width-60, 1)];
    [self addSubview:view];
    view.backgroundColor = [UIColor lightGrayColor];
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
