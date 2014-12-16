//
//  TopPicturesCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "TopPicturesCell.h"

@implementation TopPicturesCell

// 为滚动试图添加点击方法
-(void) setScrollViewDelegate:(id<UIScrollViewDelegate>)delegate imageArray:(NSMutableArray *)imageArray target:(id)target scrollViewAction:(SEL)scrollViewAction
{
    self.pageScrollView.frame = CGRectMake(0, 0, s_width, s_width/1.875);
    [self.pageScrollView setScrollViewSize:CGSizeMake(s_width, s_width/1.875) delegate:delegate imageArray:imageArray showPageControl:YES withPageControlLocation:PageControlLocationRight];
    
    
    // 点击图片
    self.pageScrollView.userInteractionEnabled = YES;
    UITapGestureRecognizer *pageScrollViewTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:scrollViewAction];
    [self.pageScrollView addGestureRecognizer:pageScrollViewTap];
    [self layoutSubviews];
}


- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
