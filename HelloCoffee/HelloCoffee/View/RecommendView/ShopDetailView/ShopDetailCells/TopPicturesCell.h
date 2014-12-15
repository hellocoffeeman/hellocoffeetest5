//
//  TopPicturesCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageScrollView.h"

@interface TopPicturesCell : UITableViewCell

@property (weak, nonatomic) IBOutlet PageScrollView *pageScrollView;


// 为滚动试图添加点击方法
-(void) setScrollViewDelegate:(id<UIScrollViewDelegate>)delegate imageArray:(NSMutableArray *)imageArray target:(id)target scrollViewAction:(SEL)scrollViewAction;

@end
