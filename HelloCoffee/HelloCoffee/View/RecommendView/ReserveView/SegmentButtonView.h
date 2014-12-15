//
//  SegmentButtonView.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/21.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentButtonView : UIView

@property (nonatomic,strong) NSArray *buttonArray;

// Tag : 2001 - 2007
@property (nonatomic,strong) UIButton *selectBtn1;
@property (nonatomic,strong) UIButton *selectBtn2;
@property (nonatomic,strong) UIButton *selectBtn3;
@property (nonatomic,strong) UIButton *selectBtn4;
@property (nonatomic,strong) UIButton *selectBtn5;
@property (nonatomic,strong) UIButton *selectBtn6;
@property (nonatomic,strong) UIButton *selectBtn7;


// 根据 View 的 Frame、传入的参数 初始化
-(void)setButtonsWithCount:(int)count buttonTitles:(NSArray *)titlesArray target:(id)target buttonAction:(SEL)buttonAction;


@end
