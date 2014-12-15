//
//  PhotoViewController.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/20.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageScrollView.h"


@interface PhotoViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *pictureArray; // 图片数组
@property (nonatomic, assign) int currentPage; // 当前页

@property (weak, nonatomic) IBOutlet PageScrollView *photoScrollView;



@end
