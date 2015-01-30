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
//    self.zhutiScroll.bounces = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

//    --》隐藏 文字
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
//    --》隐藏 文字
    if( scrollView.contentOffset.x > (s_width-20)*2-100)
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
//    《--隐藏 文字
}
//重复轮播
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    


        // 已到最后一张，继续拖动
        if( scrollView.contentOffset.x >= (scrollView.contentSize.width - s_width) ){

            scrollView.contentOffset = CGPointMake(s_width, 0);

        }
        // 已到第一张，继续拖动
        if (scrollView.contentOffset.x < s_width-20) {

            scrollView.contentOffset = CGPointMake((scrollView.contentSize.width - (s_width)*2), 0);

        }

    NSLog(@"scroll contentOffset = %@ ",NSStringFromCGPoint(scrollView.contentOffset));
}


@end
