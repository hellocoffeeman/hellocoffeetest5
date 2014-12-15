//
//  ReserveViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/20.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ReserveViewController.h"
#import "ReserveDateHandel.h"
#import "OrderCoffeeViewController.h"
#import "ReserveBoxViewController.h"
#import "SegmentButtonView.h"
#import "ChooseTimeSliderView.h"

@interface ReserveViewController ()<ChooseTimeSliderViewDelegate>

// 视图控件

@property (weak, nonatomic) IBOutlet UILabel *chooseDateLabel; // 显示选择日期
@property (weak, nonatomic) IBOutlet SegmentButtonView *chooseWeekdayBtnView; // 选星期几
@property (weak, nonatomic) IBOutlet ChooseTimeSliderView *chooseTimeSliderView;// 选时间
@property (weak, nonatomic) IBOutlet UIImageView *showOpenImageView;// 显示营业状况
@property (weak, nonatomic) IBOutlet SegmentButtonView *chooseCountBtnView; // 选人数
@property (weak, nonatomic) IBOutlet UIImageView *loopImageView; // 圆环

// Date Handel
@property (nonatomic, strong) ReserveDateHandel *dateHandel;

// 记录数据
@property (nonatomic, strong) NSArray *dateArray; // 12月10日 - 12月16日
@property (nonatomic, strong) NSArray *weekdayArray; // 星期一 - 星期日

@property (nonatomic, assign) int weekDayTag; // 记录星期 [Tag: 2000 - 2006]
@property (nonatomic, assign) int personCountTag; // 记录人数 [Tag: 2000 - 2006]
@property (nonatomic, strong) NSString *isOpen; // 是否营业 open/close

@end

@implementation ReserveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"我想来坐坐";
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO; // 滑动边界返回上一级
    
    // 设置 返回键 Title
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    self.navigationItem.backBarButtonItem = backItem;
    backItem.title = @" ";
    
    self.dateHandel = [ReserveDateHandel shareReserveDatehandel];
    
    // 为 dateArray和weekdayArray 赋值
    self.dateArray = [self.dateHandel getDayStrArray];
    self.weekdayArray = [self.dateHandel getWeekDayArray];
 
    // 初始化 控件
    self.chooseWeekdayBtnView.frame = CGRectMake(20, 85, s_width-40, 50);
    [self.chooseWeekdayBtnView setButtonsWithCount:7 buttonTitles:self.weekdayArray target:self buttonAction:@selector(chooseWeekdayButtonAction:)];
    
    self.chooseTimeSliderView.frame = CGRectMake(30, 140, s_width-60, 125);
    self.chooseTimeSliderView.delegate = self;
    [self.chooseTimeSliderView setNowDateString:self.dateArray[0] timeString:[self.dateHandel getNowTimeString]];
    
    self.chooseCountBtnView.frame = CGRectMake(s_width/2-125, 390, 250, 50);
    [self.chooseCountBtnView setButtonsWithCount:5 buttonTitles:[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil] target:self buttonAction:@selector(choosePersonCountButtonAction:)];
    
    
    
    
    // 布局 iPhone 4、5、6
    [self updataSubviewsCenter];


}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - 布局 -
-(void)updataSubviewsCenter{
    
    float centerX = self.view.center.x;
    float centerY = self.view.center.y + 40;

    NSLog(@"centerX = %g  centerY = %g ",centerX,centerY);
    
    // 修改位置
    self.chooseWeekdayBtnView.center = CGPointMake(centerX, centerY - 195);
    self.chooseTimeSliderView.center = CGPointMake(centerX, centerY - 120);
    self.showOpenImageView.center = CGPointMake(centerX, centerY);
    self.chooseCountBtnView.center = CGPointMake(centerX, centerY + 100);
    
    // 修改背景色
    self.chooseWeekdayBtnView.backgroundColor = [UIColor clearColor];
    self.chooseTimeSliderView.backgroundColor = [UIColor clearColor];
    self.chooseCountBtnView.backgroundColor = [UIColor clearColor];

    // 默认选中 人数、日期
    [self chooseWeekdayButtonAction:(UIButton *)[self.chooseWeekdayBtnView viewWithTag:2000]];
    [self choosePersonCountButtonAction:(UIButton *)[self.chooseCountBtnView viewWithTag:2000]];
    
}

-(void) viewDidDisappear:(BOOL)animated
{
    self.navigationController.interactivePopGestureRecognizer.enabled = YES; // 滑动边界返回上一级

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 选择 日期、时间、人数 -

// 选择星期几
-(void)chooseWeekdayButtonAction:(UIButton *)button
{
    // 将上一个button的选中取消
    if (self.weekDayTag != 0) {
        UIButton *lastBtn = (UIButton *)[button.superview viewWithTag:self.weekDayTag];
        lastBtn.selected = NO;
    }
    
    button.selected = YES;
    self.weekDayTag = (int)button.tag;
//    self.chooseTimeSliderView.dateLabel.text = self.dateArray[(int)button.tag - 2000];
    
    // 星期上方 显示 对应日期
    self.chooseDateLabel.text = self.dateArray[(int)button.tag - 2000];
    self.chooseDateLabel.center = CGPointMake(button.center.x, button.center.y-35);
    
    NSLog(@"button tag : %d || Date : %@",(int)button.tag,self.dateArray[button.tag-2000]);

}

// 选择人数
-(void)choosePersonCountButtonAction:(UIButton *)button
{
    // 将上一个button的选中取消
    if (self.personCountTag != 0) {
    UIButton *lastBtn = (UIButton *)[button.superview viewWithTag:self.personCountTag];
    lastBtn.selected = NO;
    }
    
    button.selected = YES;
    self.personCountTag = (int)button.tag;
    
    // 改变圆环中心
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    self.loopImageView.center = button.center;
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
    NSLog(@"button tag : %d ",(int)button.tag);
}

#pragma mark - Show Open/Closed -
-(void)theShopIsOpen:(BOOL)isOpen
{
    
    // 判断当前时间是否营业
    if (isOpen) {
        self.isOpen = @"open";
    }else{
        self.isOpen = @"closed";
    }
    // 判断营业状态是否更改
    if (![self.showOpenImageView.image isEqual:[UIImage imageNamed:self.isOpen]]) {
        
        // 状态改变，更改图片
        self.showOpenImageView.image = [UIImage imageNamed:self.isOpen];
        
        [UIView beginAnimations:@"animationID" context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationRepeatAutoreverses:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.showOpenImageView cache:YES];
        [UIView commitAnimations];
        
    }
    
}

#pragma mark - 预定 下一步 -
- (IBAction)nextStepOfReserve:(UIButton *)sender {
    
    if ([self.isOpen isEqualToString:@"open"]) {
       
        NSLog(@"Next Step");
        
        OrderCoffeeViewController *orderCoffeeVC = [[OrderCoffeeViewController alloc] init];
        orderCoffeeVC.personCount = self.personCountTag - 2000 + 1;
        
        // 将选择的String 转化为Date
        [self.dateHandel setReserveDateWithNumder:(self.weekDayTag - 2000) timeString:self.chooseTimeSliderView.timeLabel.text];
            
        [self.navigationController pushViewController:orderCoffeeVC animated:YES];
    
    }else{
        NSLog(@"The shop is closed");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"亲爱的顾客：该时间咖啡厅是已经休息了" delegate:nil cancelButtonTitle:@"更改预定时间" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

#pragma mark - 预定 包场 -
- (IBAction)reserveOneBox:(UIButton *)sender {
    
    NSLog(@"Reserve Box");
    
    ReserveBoxViewController *reserveBoxVC = [[ReserveBoxViewController alloc] init];
    [self.navigationController pushViewController:reserveBoxVC animated:YES];
    
}


#pragma mark -  -


#pragma mark - 辅助方法 -



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
