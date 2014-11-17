//
//  zhutiCell.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/7.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "zhutiCell.h"

@implementation zhutiCell

- (void)awakeFromNib {
    self.zhutiText.userInteractionEnabled = NO;
    self.zhutiScroll.delegate = self;
    self.zhutiScroll.bounces = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if( scrollView.contentOffset.x > 100)
    {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.zhutiText.alpha = 0;
        } completion:^(BOOL finished) {
            
        }];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self.zhutiText.alpha = 1.0;
        } completion:^(BOOL finished) {
            
        }];
        
    }
    
}
@end
