//
//  PageScrollView.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/20.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    PageControlLocationRight = 0,
    
    PageControlLocationCenter
    
}PageControlLocation; // 放置pageControl的位置


@interface PageScrollView : UIScrollView<UIScrollViewDelegate>

-(void)setScrollViewSize:(CGSize)size delegate:(id<UIScrollViewDelegate>)delegate imageArray:(NSMutableArray *)imageArray showPageControl:(BOOL)showPageControl withPageControlLocation:(PageControlLocation)pageControlLocation;



@end
