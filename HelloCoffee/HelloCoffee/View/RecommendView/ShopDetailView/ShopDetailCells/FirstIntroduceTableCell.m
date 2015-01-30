//
//  FirstIntroduceTableCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/29.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "FirstIntroduceTableCell.h"

@implementation FirstIntroduceTableCell

- (void)awakeFromNib {
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 重写 SET -
-(void) setArticleCount:(int)articleCount
{
//    UIView *blueLineView = [[UIView alloc] initWithFrame:CGRectMake(s_width/2, s_width/kFirstIntroduceRatio*articleCount + 10, s_width/2, 1)];
//    blueLineView.backgroundColor = kBlueColor;
//    [self addSubview:blueLineView];
}


@end
