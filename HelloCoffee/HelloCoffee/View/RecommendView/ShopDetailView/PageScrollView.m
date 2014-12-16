//
//  PageScrollView.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/20.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "PageScrollView.h"

@interface PageScrollView ()

@property (nonatomic, assign) CGSize size;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, assign) PageControlLocation pageControlLocation;
@end

@implementation PageScrollView

#pragma mark - Scroll View -
-(void)setScrollViewSize:(CGSize)size delegate:(id<UIScrollViewDelegate>)delegate imageArray:(NSMutableArray *)imageArray showPageControl:(BOOL)showPageControl withPageControlLocation:(PageControlLocation)pageControlLocation
{
    self.size = size;
    self.imageArray = imageArray;
    
    NSLog(@" PageScrollView size : %@  ",NSStringFromCGSize(size));
    
    int count = (int)imageArray.count;
    
    // 基本设置
    self.bounces = NO;
    self.pagingEnabled = YES;
    self.scrollEnabled = YES;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.contentSize = CGSizeMake(self.size.width * (count + 2 ), self.size.height); // 前后个留出一张图片的大小
    self.contentOffset = CGPointMake(self.size.width, 0);
//    self.delegate = delegate; // 滚动代理
    self.delegate = self;
    
    // 初始化 ImageView
    for (int i = 0; i < imageArray.count+2; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.size.width*i, 0, self.size.width, size.height)];
        imageView.userInteractionEnabled  = YES;
        [self addSubview:imageView];
        
        if (i==0) {
            // 放 最后一张
            imageView.image = imageArray[count-1];
        }else if (i==imageArray.count+1){
            // 放 第一张
            imageView.image = imageArray[0];
        }else{
            imageView.image = imageArray[i-1];
        }
        
    }
    NSLog(@" PageScrollView .frame = %@",NSStringFromCGRect(self.frame));
    NSLog(@" PageScrollView .contentSize = %@",NSStringFromCGSize(self.contentSize));
    
    // page control
    if (showPageControl == YES) {
        [self showPageControlWithPageControlLocation:pageControlLocation numberOfPage:(int)imageArray.count];
    }
    
}

#pragma mark - Page Control -
-(void)showPageControlWithPageControlLocation:(PageControlLocation)pageControlLocation numberOfPage:(int)numberOfPage
{
    self.pageControl = [[UIPageControl alloc] init];
    
    self.pageControl.numberOfPages = numberOfPage;
    self.pageControl.currentPageIndicatorTintColor = kBlueColor;
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    
    switch (pageControlLocation) {
        case PageControlLocationRight:
            self.pageControl.center = CGPointMake(self.size.width-40+self.contentOffset.x, self.bounds.size.height - 18);
            break;
        case PageControlLocationCenter:
            self.pageControl.center = CGPointMake(self.size.width/2, self.bounds.size.height - 18);
            break;
    }
    [self addSubview:self.pageControl];
    
}

#pragma mark - 重复轮播 -
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    // 已到最后一张，继续拖动
    if( scrollView.contentOffset.x >= (scrollView.contentSize.width - self.size.width ) ){
        
        scrollView.contentOffset = CGPointMake(self.size.width, 0);
        
    }
    // 已到第一张，继续拖动
    if (scrollView.contentOffset.x < self.size.width) {
        
        scrollView.contentOffset = CGPointMake((scrollView.contentSize.width -self.size.width*2), 0);
        
    }
    
    // Page Control
    int currentPage = scrollView.contentOffset.x/self.size.width;
    self.pageControl.currentPage = currentPage-1;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    switch (self.pageControlLocation) {
        case PageControlLocationRight:
            self.pageControl.center = CGPointMake(self.size.width-40+self.contentOffset.x, self.bounds.size.height - 18);
            break;
        case PageControlLocationCenter:
            self.pageControl.center = CGPointMake(self.size.width/2, self.bounds.size.height - 18);
            break;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
