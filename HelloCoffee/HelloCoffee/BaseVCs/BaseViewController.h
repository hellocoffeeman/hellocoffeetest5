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
@property (nonatomic, strong) UIView *backCleanView; // 因半透明 NavBackView 会影响Title文字的Alpha
@property(nonatomic,strong)UIView *navBackView;
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UIButton *rightBtnTwo;
@property(nonatomic,strong)UILabel *titleLabel;

@property (nonatomic, strong) UIButton *sectionBtn1;
@property (nonatomic, strong) UIButton *sectionBtn2;
@property (nonatomic, strong) UIView *sectionWhiteView;

//-(void)makeToolBar:(NSString*)title;
-(UIRefreshControl*)makeRefresh;

#pragma mark - Navigation View -
-(void)makeNavWithTitleLabel:(NSString*)titleLabelStr withRightBtn:(BOOL)withRightBtn rightButtonTitle:(NSString *)rightButtonTitle rightBtnImageURL:(NSString *)rightBtnImageURL target:(id)target rightBtnAction:(SEL)rightAction;

#pragma mark - Navigation Section View -
-(void)creatNavigationSectionViewWithTarget:(id)target sectionTitle1:(NSString *)sectionTitle1 actionOne:(SEL)actionOne sectionTitle2:(NSString *)sectionTitle2 actionTwo:(SEL)actionTwo rightBtnImageURL:(NSString *)rightBtnImageURL rightBtnAction:(SEL)rightBtnAction rightBtnTwoImageURL:(NSString *)rightBtnTwoImageURL rightBtnTwoAction:(SEL)rightBtnTwoAction
;

@end
