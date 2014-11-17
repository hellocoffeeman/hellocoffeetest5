//
//  fabudianpuCell.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/7.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "fabudianpuCell.h"

@implementation fabudianpuCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnDown:(id)sender {
    UIButton *btn = (UIButton*)sender;
    NSLog(@"%ld",btn.tag);
}



@end
