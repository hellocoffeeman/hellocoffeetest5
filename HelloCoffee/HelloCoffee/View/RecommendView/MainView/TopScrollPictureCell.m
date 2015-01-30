//
//  TopScrollPictureCell.m
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/27.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "TopScrollPictureCell.h"

@implementation TopScrollPictureCell

#pragma mark - 滚动图片 -
// 为滚动视图 添加点击方法
-(void) setScrollViewDelegate:(id<UIScrollViewDelegate>)delegate imageArray:(NSMutableArray *)imageArray target:(id)target scrollViewAction:(SEL)scrollViewAction
{
  
    [self.pageScrollView setScrollViewSize:CGSizeMake(s_width, [UIScreen mainScreen].bounds.size.width*0.35) delegate:delegate imageArray:imageArray showPageControl:YES withPageControlLocation:PageControlLocationCenter];
    if([UIScreen mainScreen].bounds.size.width==414)
    {
     self.pageScrollView.pageControl.center = CGPointMake(s_width/2+[UIScreen mainScreen].bounds.size.width-20, [UIScreen mainScreen].bounds.size.width*0.35-12);
    }
    // 点击图片
    self.pageScrollView.userInteractionEnabled = YES;
    UITapGestureRecognizer *pageScrollViewTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:scrollViewAction];
    [self.pageScrollView addGestureRecognizer:pageScrollViewTap];
    [self layoutSubviews];
}


- (void)awakeFromNib {
    // Initialization code
}

@end
