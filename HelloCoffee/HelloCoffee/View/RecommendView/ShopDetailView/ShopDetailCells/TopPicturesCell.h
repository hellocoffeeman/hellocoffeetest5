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

@property (weak, nonatomic) IBOutlet UIView *blueView; // width: 5
@property (weak, nonatomic) IBOutlet UIView *grayView; // width: 2
@property (weak, nonatomic) IBOutlet UIButton *leftPartButton; // 左边 Btn
@property (weak, nonatomic) IBOutlet UIButton *rightPartButton; // 右边 Btn




// 为滚动试图添加点击方法
-(void) setScrollViewDelegate:(id<UIScrollViewDelegate>)delegate imageArray:(NSMutableArray *)imageArray target:(id)target scrollViewAction:(SEL)scrollViewAction;
// 为 Btn 添加方法
-(void) addTarget:(id)target changeDepartmentAction:(SEL)changeDepartmentAction;

@end
