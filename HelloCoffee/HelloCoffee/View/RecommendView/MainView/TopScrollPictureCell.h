//
//  TopScrollPictureCell.h
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/27.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageScrollView.h"
@interface TopScrollPictureCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PageScrollView *pageScrollView;

// 为滚动试图添加点击方法
-(void) setScrollViewDelegate:(id<UIScrollViewDelegate>)delegate imageArray:(NSMutableArray *)imageArray target:(id)target scrollViewAction:(SEL)scrollViewAction;

@end
