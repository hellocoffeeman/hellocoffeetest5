//
//  TopPicturesCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "TopPicturesCell.h"

@implementation TopPicturesCell

#pragma mark - 滚动图片 -
// 为滚动视图 添加点击方法
-(void) setScrollViewDelegate:(id<UIScrollViewDelegate>)delegate imageArray:(NSMutableArray *)imageArray target:(id)target scrollViewAction:(SEL)scrollViewAction
{
    self.pageScrollView.frame = CGRectMake(0, 0, s_width, s_width/kTopPictureRatio);
    [self.pageScrollView setScrollViewSize:CGSizeMake(s_width, s_width/kTopPictureRatio) delegate:delegate imageArray:imageArray showPageControl:YES withPageControlLocation:PageControlLocationCenter];
    
    // 点击图片
    self.pageScrollView.userInteractionEnabled = YES;
    UITapGestureRecognizer *pageScrollViewTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:scrollViewAction];
    [self.pageScrollView addGestureRecognizer:pageScrollViewTap];
    [self layoutSubviews];
}


#pragma mark -

- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
