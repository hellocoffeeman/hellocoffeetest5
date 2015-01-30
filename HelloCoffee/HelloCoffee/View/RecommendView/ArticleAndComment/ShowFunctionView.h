//
//  ShowFunctionView.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/30.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowFunctionView : UIView

@property (nonatomic, strong) UIView *clearBackView;
@property (nonatomic, strong) UIView *blackBackView;

@property (nonatomic, strong) UIView *shareFuncView;
@property (nonatomic, strong) UIButton *cancelButton;

@property (nonatomic, strong) UIView *commentView;
@property (nonatomic, strong) UIImageView *tf_backImgView;
@property (nonatomic, strong) UITextField *commentTextField;
@property (nonatomic, strong) UIButton *commentButton;

// 分享
-(void) showShareFuncView;

// 评论
-(void) showCommentView;

// 消失
-(void) disappearShowFunctionView;


@end
