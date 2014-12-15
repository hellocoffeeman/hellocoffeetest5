//
//  EndInterestedCell.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "EndInterestedCell.h"

@implementation EndInterestedCell

{
    CGRect frame;
    int totlePage; // 总页数
    int currentPage; // 当前页
}

// 传入需要的参数
-(void) setInformationWithPortraitImagesArray:(NSArray *)imagesArray
{
    totlePage = 2;
    currentPage = 1;
    self.portraitImagesArray = imagesArray;

}
// 给Plummet添加方法
-(void)addPlummetIVAction{
    
    UIPanGestureRecognizer * pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)]; // 添加手势
    self.plummetImageView.userInteractionEnabled = YES;
    [self.plummetImageView addGestureRecognizer:pan];
}
// 更改 感兴趣用户头像
-(void)changePortraitImagesWithPage{
    
    if (currentPage > totlePage) {
        currentPage = 1;
    }
    
    for (int i = 0; i < 4; i++) {
        UIImageView *portraitIV = (UIImageView *)[self viewWithTag:2000 + i];
        portraitIV.image = self.portraitImagesArray[currentPage-1];
    }
    
}
#pragma mark - 手势动画 -
-(void)handlePan:(UIPanGestureRecognizer *)pan
{
    
    frame = self.plummetImageView.frame;
    CGPoint point=[pan locationInView:self];
    
    if (point.y<30) {
        return;
    }
    if ([(UIPanGestureRecognizer *)pan state] == UIGestureRecognizerStateChanged) {
        CGPoint point=[pan locationInView:self];
        
        if (point.y<30) {
            return;
        }
        
        frame.origin.y=point.y;
        self.plummetImageView.frame=frame;
        
        self.lineImageView.frame=CGRectMake(23, 10, 2, point.y);
        if (frame.origin.y>=60) {
            
            frame.origin.y=60;
            self.plummetImageView.frame=frame;
            self.lineImageView.frame=CGRectMake(23, 10, 2, self.plummetImageView.center.y-20);
        }
        
    }
    if (([(UIPanGestureRecognizer *)pan state] == UIGestureRecognizerStateEnded) || ([(UIPanGestureRecognizer *)pan state] == UIGestureRecognizerStateCancelled)) {
        
        if (frame.origin.y>=self.plummetImageView.frame.origin.y) {
            [self handleBack];
        }
        frame.origin.y=0;
    }
    
    
}
-(void)handleBack
{
    if (self.plummetImageView.frame.origin.y == 26) {
        return;
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    frame.origin.y=28;
    self.plummetImageView.frame=frame;
    
    self.lineImageView.frame=CGRectMake(23, 10, 2, 20);
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
    // 换一组 感兴趣头像
    currentPage = currentPage + 1;
    [self changePortraitImagesWithPage];
}

- (void)awakeFromNib {
    // Initialization code
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
