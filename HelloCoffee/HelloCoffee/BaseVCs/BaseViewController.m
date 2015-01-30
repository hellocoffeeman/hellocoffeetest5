//
//  BaseViewController.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/7.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "BaseViewController.h"
#import "EGORefreshTableHeaderView.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
}
-(UIRefreshControl*)makeRefresh
{
    _refreshControl = [[UIRefreshControl alloc]init];
    _refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"~~刷新~~"];
    [_refreshControl addTarget:self action:@selector(refreshDown) forControlEvents:UIControlEventValueChanged];
    return _refreshControl;
}

#pragma mark - Navigation View 1 -

-(void)makeNavWithTitleLabel:(NSString*)titleLabelStr withRightBtn:(BOOL)withRightBtn rightButtonTitle:(NSString *)rightButtonTitle rightBtnImageURL:(NSString *)rightBtnImageURL target:(id)target rightBtnAction:(SEL)rightAction
{
    [self creatBackCleanView]; // 透明View
    [self creatNavBackView]; // 背景
    [self creatTitleLabelWithTitle:titleLabelStr]; // 标题
    [self creatLeftBackButton]; // 左 - 返回键
    
//    [self.navBackView addSubview:self.backCleanView];
    
//     右 - 功能键
    if (withRightBtn == YES) {
        [self creatRightFoncButtonWithTarget:target action:rightAction btnImgURL:rightBtnImageURL btnTitle:nil];
    }
}

-(void)popLastViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Navigation Section View 2 -

-(void)creatNavigationSectionViewWithTarget:(id)target sectionTitle1:(NSString *)sectionTitle1 actionOne:(SEL)actionOne sectionTitle2:(NSString *)sectionTitle2 actionTwo:(SEL)actionTwo rightBtnImageURL:(NSString *)rightBtnImageURL rightBtnAction:(SEL)rightBtnAction rightBtnTwoImageURL:(NSString *)rightBtnTwoImageURL rightBtnTwoAction:(SEL)rightBtnTwoAction
{
    [self creatBackCleanView]; // 透明View
    [self creatNavBackView]; // 背景
    self.navBackView.alpha = 0.91;
    [self creatNavigationSectionViewWithTarget:target sectionTitle1:sectionTitle1 actionOne:actionOne sectionTitle2:sectionTitle2 actionTwo:actionTwo]; // 分组 Btn
    [self creatLeftBackButton]; // 左 - 返回键
    // 右 - 功能键
    [self creatRightFoncButtonWithTarget:target action:rightBtnAction btnImgURL:rightBtnImageURL btnTitle:nil];
    [self creatRightFoncButtonTwoWithTarget:target action:rightBtnTwoAction btnImgURL:rightBtnTwoImageURL btnTitle:nil];
    
    self.rightBtn.hidden = NO;
    self.rightBtnTwo.hidden = YES;
}

#pragma mark -
#pragma mark - Creat View -
-(void) creatBackCleanView
{
    self.backCleanView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, s_width, 64)];
    self.backCleanView.backgroundColor = [UIColor clearColor];
    self.backCleanView.userInteractionEnabled = YES;
    [self.view addSubview:self.backCleanView];
}

-(void) creatNavBackView
{
    self.navBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, s_width, 64)];
    self.navBackView.backgroundColor = kBlueColor;
    self.navBackView.userInteractionEnabled = YES;
    [self.backCleanView addSubview:self.navBackView];
}

-(void) creatTitleLabelWithTitle:(NSString *)title
{
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, s_width, 44)];
    [self.backCleanView addSubview:self.titleLabel];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:19.5];
    self.titleLabel.userInteractionEnabled = YES;
    self.titleLabel.text = title;
}

-(void) creatNavigationSectionViewWithTarget:(id)target sectionTitle1:(NSString *)sectionTitle1 actionOne:(SEL)actionOne sectionTitle2:(NSString *)sectionTitle2 actionTwo:(SEL)actionTwo
{
    // Section One Btn
    self.sectionBtn1 = [self creatButtonWithBtnFrame:CGRectMake(s_width/2-65, 30, 65, 30) target:target btnTitle:sectionTitle1 btnAction:actionOne];
    // Section Two Btn
    self.sectionBtn2 = [self creatButtonWithBtnFrame:CGRectMake(s_width/2, 30, 65, 30) target:target btnTitle:sectionTitle2 btnAction:actionTwo];
    
    // Section White View
    self.sectionWhiteView = [[UIView alloc] initWithFrame:CGRectMake(s_width/2-65, 64-2, 50, 2)];
    self.sectionWhiteView.backgroundColor = [UIColor whiteColor];
    [self.backCleanView addSubview:self.sectionWhiteView];
}

-(UIButton *) creatButtonWithBtnFrame:(CGRect)btnFrame target:(id)target btnTitle:(NSString *)btnTitle btnAction:(SEL)btnAction
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = btnFrame;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitle:btnTitle forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [button setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.73] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:19.5];
    [button addTarget:target action:btnAction forControlEvents:UIControlEventTouchUpInside];
    [self.backCleanView addSubview:button];
    return button;
}

-(void) creatLeftBackButton
{
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = CGRectMake(5, 20, 44, 44);
    [self.leftBtn setImage:[UIImage imageNamed:@"fanhuibai"] forState:UIControlStateNormal];
    [self.leftBtn addTarget:self action:@selector(popLastViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.backCleanView addSubview:self.leftBtn];
}

-(void) creatRightFoncButtonWithTarget:(id)target action:(SEL)funcAction btnImgURL:(NSString *)btnImgURL btnTitle:(NSString *)btnTitle
{
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.frame = CGRectMake(s_width-44-5, 20, 44 , 44);
    
    if (btnImgURL == nil) {
        [self.rightBtn setTitle:btnTitle forState:UIControlStateNormal];
        [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:16.5];
    }else{
        [self.rightBtn setImage:[UIImage imageNamed:btnImgURL] forState:UIControlStateNormal];
    }
    [self.rightBtn addTarget:target action:funcAction forControlEvents:UIControlEventTouchUpInside];
    [self.backCleanView addSubview:self.rightBtn];
    
}

-(void) creatRightFoncButtonTwoWithTarget:(id)target action:(SEL)funcAction btnImgURL:(NSString *)btnImgURL btnTitle:(NSString *)btnTitle
{
    self.rightBtnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtnTwo.frame = CGRectMake(s_width-44-5, 20, 44 , 44);
    
    if (btnImgURL == nil) {
        [self.rightBtnTwo setTitle:btnTitle forState:UIControlStateNormal];
        [self.rightBtnTwo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.rightBtnTwo.titleLabel.font = [UIFont systemFontOfSize:16.5];
    }else{
        [self.rightBtnTwo setImage:[UIImage imageNamed:btnImgURL] forState:UIControlStateNormal];
    }
    [self.rightBtnTwo addTarget:target action:funcAction forControlEvents:UIControlEventTouchUpInside];
    [self.backCleanView addSubview:self.rightBtnTwo];
    
}


#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)refreshDown
{
    NSLog(@"请重写方法");
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
