//
//  OfferServicesScrollView.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/11.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "OfferServicesScrollView.h"

@implementation OfferServicesScrollView


-(void)setImageArrayWithImageArray:(NSArray *)imageArray imageSize:(CGSize)imageSize numberOfImageInEachPage:(int)numberOfImageInEachPage
{
//    CGFloat width = self.bounds.size.width;
//    CGFloat height = self.bounds.size.height;
    CGFloat width = s_width - 48*2;
    CGFloat height = 30;
    CGFloat space = ((width / numberOfImageInEachPage) - imageSize.width)/2; // Image 间隔的一半
    
    self.bounces = NO;
    self.pagingEnabled = YES;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.contentSize = CGSizeMake(width * imageArray.count / numberOfImageInEachPage, height);
    
    
    // 放置 小图标
    for (int i = 0; i < imageArray.count; i++) {
        
        UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(space*(i*2+1) + imageSize.width*i, 0, imageSize.width, imageSize.height)];
        iconImageView.image = imageArray[i];
        
        [self addSubview:iconImageView];
        
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
