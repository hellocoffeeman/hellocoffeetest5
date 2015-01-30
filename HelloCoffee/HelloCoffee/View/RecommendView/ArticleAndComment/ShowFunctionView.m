//
//  ShowFunctionView.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/30.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "ShowFunctionView.h"

#define kShareViewHeight (s_width/1.65)
#define kCommentViewHeight (s_width/6.5)
#define kShareBtnWidth (s_width/6.7)
#define kTextFieldImgWidth (s_width/1.365)

#define kWhiteColor [[UIColor whiteColor] colorWithAlphaComponent:0.92]
#define kBlackColor [[UIColor blackColor] colorWithAlphaComponent:0.42]

@interface ShowFunctionView ()

@end

@implementation ShowFunctionView

#pragma mark -
#pragma mark - ShareFuncView -
-(void) showShareFuncView
{
    self.hidden = NO;
    
    [self creatClearBackViewWithFrame:CGRectMake(0, s_height, s_width, kShareViewHeight)];
    [self creatBlackBackViewWithFrame:CGRectMake(0, 0, s_width, s_height)];
    [self creatShareViewWithTarget:nil action:nil];
    [self sendSubviewToBack:self.blackBackView];

    [UIView animateWithDuration:0.3 animations:^{
        
        self.blackBackView.backgroundColor = kBlackColor ;
        self.clearBackView.frame = CGRectMake(0, s_height-kShareViewHeight, s_width, kShareViewHeight);

    } completion:^(BOOL finished) {
        self.blackBackView.frame = CGRectMake(0, 0, s_width, s_height-kShareViewHeight);
        
    }];
    
}

-(void) disappearShowFunctionView
{
    self.blackBackView.frame = CGRectMake(0, 0, s_width, s_height);
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.blackBackView.backgroundColor = [UIColor clearColor]  ;
        self.clearBackView.frame = CGRectMake(0, s_height, s_width, kShareViewHeight);
        
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

#pragma mark -
#pragma mark - CommentView -
-(void)showCommentView
{
    self.hidden = NO;
    [self creatClearBackViewWithFrame:CGRectMake(0, s_height, s_width, kCommentViewHeight)];
    [self creatBlackBackViewWithFrame:CGRectMake(0, 0, s_width, s_height)];
    [self creatCommentViewWithTarget:nil sendCommentAction:nil];
    
    [self sendSubviewToBack:self.blackBackView];
    [UIView animateWithDuration:0.3 animations:^{
        
        self.blackBackView.backgroundColor = kBlackColor ;
        self.clearBackView.frame = CGRectMake(0, s_height-kCommentViewHeight, s_width, kCommentViewHeight);
        
    } completion:^(BOOL finished) {
        self.blackBackView.frame = CGRectMake(0, 0, s_width, s_height-kCommentViewHeight);
        
    }];
    
}

#pragma mark -
#pragma mark - Creat View -
-(void) creatClearBackViewWithFrame:(CGRect)frame
{
    self.clearBackView = [[UIView alloc] initWithFrame:frame];
    self.clearBackView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.clearBackView];
}

-(void) creatBlackBackViewWithFrame:(CGRect)frame
{
    self.blackBackView = [[UIView alloc] initWithFrame:frame];
    self.blackBackView.backgroundColor = [UIColor clearColor] ;
    
    // 手势
    self.blackBackView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disappearShowFunctionView)];
    [self.blackBackView addGestureRecognizer:tap];
    
    [self addSubview:self.blackBackView];
}

#pragma mark - Share View -
-(void) creatShareViewWithTarget:(id)target action:(SEL)action
{
    self.shareFuncView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, s_height, kShareViewHeight/3*2)];
    self.shareFuncView.backgroundColor = kWhiteColor;
    [self.clearBackView addSubview:self.shareFuncView];
    
    // - Share 控件 -
    // Label
    UILabel *shareLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, s_width/8)];
    shareLabel.text = @"分享到";
    shareLabel.font = [UIFont systemFontOfSize:16.5];
    [self.clearBackView addSubview:shareLabel];
    
    // Share Button
    NSArray *imageArray = @[@"weibo_icon",@"wecat_icon",@"friend_icon",@"heart_icon"];
    NSArray *textArray = @[@"微博",@"微信",@"朋友圈",@"收藏"];
    for (int i = 0; i < 4; i++) {
        
        CGFloat btn_x = ((s_width-kShareBtnWidth*4)/5)*(i+1) + kShareBtnWidth*i;
        
        // Button
        UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        shareButton.frame = CGRectMake(btn_x, s_width/8, kShareBtnWidth, kShareBtnWidth);
        shareButton.tag = 2000+i;
        [shareButton setBackgroundImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [shareButton addTarget:target action:action forControlEvents:UIControlEventTouchDown];
        [self.clearBackView addSubview:shareButton];
        
        // Label
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(btn_x, s_width/8+kShareBtnWidth, kShareBtnWidth, s_width/9.5)];
        textLabel.text = textArray[i];
        textLabel.font = [UIFont systemFontOfSize:14.5];
        textLabel.textAlignment = NSTextAlignmentCenter;
        [self.clearBackView addSubview:textLabel];
        
    }
    
    // Cancel Button
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelButton.frame = CGRectMake(0, kShareViewHeight/3*2+3.5, s_width, kShareViewHeight/3-3.5);
    self.cancelButton.backgroundColor = kWhiteColor;
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(disappearShowFunctionView) forControlEvents:UIControlEventTouchDown];
    [self.clearBackView addSubview:self.cancelButton];
}

#pragma mark - Comment View -
-(void) creatCommentViewWithTarget:(id)target sendCommentAction:(SEL)sendCommentAction
{
    self.commentView = [[UIView alloc] initWithFrame:self.clearBackView.bounds];
    self.commentView.backgroundColor = kWhiteColor;
    [self.clearBackView addSubview:self.commentView];
    
    //
    self.tf_backImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, kTextFieldImgWidth, kCommentViewHeight-10)];
    self.tf_backImgView.image = [UIImage imageNamed:@"publication_input"];
    [self.clearBackView addSubview:self.tf_backImgView];
    
    //
    self.commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat btn_width = s_width-kTextFieldImgWidth-15 ;
    self.commentButton.frame = CGRectMake(s_width-btn_width-5, 5, btn_width, kCommentViewHeight-10);
    [self.commentButton setBackgroundImage:[UIImage imageNamed:@"publication_but"] forState:UIControlStateNormal];
    [self.clearBackView addSubview:self.commentButton];
    
}

#pragma mark -

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
