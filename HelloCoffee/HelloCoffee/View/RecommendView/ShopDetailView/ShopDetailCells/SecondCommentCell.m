//
//  SecondCommentCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "SecondCommentCell.h"

@implementation SecondCommentCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCommentCount:(int)commentCount
{
//    UIView *blueLineView = [[UIView alloc] initWithFrame:CGRectMake(s_width/2, s_width/kSecondCommentRatio*commentCount + 10 + 10, s_width/2, 1)];
//    blueLineView.backgroundColor = kBlueColor;
//    [self addSubview:blueLineView];
//    
//    if (commentCount < 2) {
//        self.segmentLine.hidden = YES;
//    }
    
}

@end
