//
//  BaseViewController.h
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/7.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
{
    UIToolbar *_toolBar;
    UIRefreshControl *_refreshControl;
    BOOL _isRefresh;//下拉刷新
    BOOL _pullup;//上拉

}

@property(nonatomic,strong)UIImageView *titleImg;
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UILabel *titleLabel;

//-(void)makeToolBar:(NSString*)title;
-(UIRefreshControl*)makeRefresh;
-(void)makeNavWithTitleLabel:(NSString*)titleLabelStr;
@end
