//
//  mianPageCell.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/6.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "mianPageCell.h"

@implementation mianPageCell

- (void)awakeFromNib {
    
    self.mainScroll.delegate = self;
    self.mainScroll.bounces = NO;
//    NSLog(@"!!!!!!!!!!!!!%f",self.mainScroll.frame.size.width);
    self.mainScroll.frame = CGRectMake(10, 5, 300, 160);

}
//重复轮播
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //    if (![scrollView isEqual:self.table]) {
    
    // 已到最后一张，继续拖动
    if( scrollView.contentOffset.x >= (scrollView.contentSize.width - s_width) ){
        
        scrollView.contentOffset = CGPointMake(s_width, 0);
        
    }
    // 已到第一张，继续拖动
    if (scrollView.contentOffset.x < s_width-20) {
        
        scrollView.contentOffset = CGPointMake((scrollView.contentSize.width - (s_width-20)*2), 0);
        
    }
    //    }
    NSLog(@"scroll contentOffset = %@ ",NSStringFromCGPoint(scrollView.contentOffset));
}
//显示隐藏文字
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
   if( scrollView.contentOffset.x > (s_width)*2-100)
   {
       
       [UIView animateWithDuration:0.5 animations:^{
           self.price.alpha = 0;
           self.dianzan.alpha = 0;
           self.shopName.alpha = 0;
           self.title.alpha = 0;
           self.shopAdress.alpha = 0;
           self.adressPic.alpha = 0;
           self.pricePic.alpha = 0;
           self.clickPrise.alpha = 0;
           self.clickPrise.enabled = NO;
           self.priseNum.alpha = 0;
           self.priseNumLabel.alpha = 0 ;
       } completion:^(BOOL finished) {
           
       }];
   }else{
       [UIView animateWithDuration:0.5 animations:^{
           self.pricePic.alpha = 1.0;
           self.price.alpha = 1.0;
           self.dianzan.alpha = 1.0;
           self.shopName.alpha = 1.0;
           self.title.alpha = 1.0;
           self.shopAdress.alpha = 1.0;
           self.adressPic.alpha = 1.0;
           self.clickPrise.alpha = 1.0;
           self.clickPrise.enabled = YES;
           self.priseNum.alpha = 1.0;
           self.priseNumLabel.alpha = 1.0 ;
       } completion:^(BOOL finished) {
           
       }];
       
   }

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
