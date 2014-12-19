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
    self.pageScrollView.frame = CGRectMake(0, 0, s_width, s_width/1.875);
    [self.pageScrollView setScrollViewSize:CGSizeMake(s_width, s_width/1.875) delegate:delegate imageArray:imageArray showPageControl:YES withPageControlLocation:PageControlLocationRight];
    
    
    // 点击图片
    self.pageScrollView.userInteractionEnabled = YES;
    UITapGestureRecognizer *pageScrollViewTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:scrollViewAction];
    [self.pageScrollView addGestureRecognizer:pageScrollViewTap];
    [self layoutSubviews];
}

#pragma mark - 分区 Btn -
// 为 Btn 添加方法
-(void) addTarget:(id)target changeDepartmentAction:(SEL)changeDepartmentAction
{
    [self updataDepartmentsFrame];
    
    [self.leftPartButton addTarget:target action:changeDepartmentAction forControlEvents:UIControlEventTouchDown];
    [self.rightPartButton addTarget:target action:changeDepartmentAction forControlEvents:UIControlEventTouchDown];

}

-(void) updataDepartmentsFrame
{
    CGFloat center_y = s_width/1.875+25;
    self.leftPartButton.center = CGPointMake(s_width/2-70, center_y);
    self.rightPartButton.center = CGPointMake(s_width/2+70, center_y);
    self.blueView.center = CGPointMake(s_width/2-97, center_y);
    self.grayView.center = CGPointMake(s_width/2, center_y);
    
    [self.leftPartButton setTitleColor:kBlueColor forState:UIControlStateSelected];
    [self.rightPartButton setTitleColor:kBlueColor forState:UIControlStateSelected];
    self.blueView.backgroundColor = kBlueColor;
    
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
