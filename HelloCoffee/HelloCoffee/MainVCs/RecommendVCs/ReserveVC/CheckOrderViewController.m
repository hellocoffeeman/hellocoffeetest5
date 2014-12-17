//
//  CheckOrderViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/25.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "CheckOrderViewController.h"
#import "ReserveDateHandel.h"
#import "CoffeeCountTableViewCell.h"
#import "ChangeReserveInfoView.h"
#include "ConfirmPaymentAlertView.h"

@interface CheckOrderViewController ()
{
    CGFloat _scroll_height;
    int _personCountTag;
    NSTimer * _timer;
    
    CGFloat timeCount;
    UILabel * label1;
    UILabel * label;
    NSInteger count;
    NSInteger num;
}
// 控件
@property (nonatomic, strong) ChangeReserveInfoView *changeReserveInfoView; // 更改预定信息View (弹出)
@property (nonatomic, strong) UIImageView *countdownIV; // 倒计时 ImageView

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView; // 滚动视图 ( 催单时向下滑动 )

@property (weak, nonatomic) IBOutlet UILabel *textLabel1; // "到店信息"
@property (weak, nonatomic) IBOutlet UIView *separateLine1; // 分割线 1
@property (weak, nonatomic) IBOutlet UILabel *textLabel2; // "点选清单"
@property (weak, nonatomic) IBOutlet UIView *separateLine2; // 分割线 2


@property (weak, nonatomic) IBOutlet UIView *showReserveInfoView; // 显示信息 Info View
@property (weak, nonatomic) IBOutlet UILabel *textLabel_1; // "人数"
@property (weak, nonatomic) IBOutlet UILabel *textLabel_2; // "预到店时间"
@property (weak, nonatomic) IBOutlet UILabel *personCountLabel; // 人数
@property (weak, nonatomic) IBOutlet UILabel *chooseDateLabel; // 日期
@property (weak, nonatomic) IBOutlet UILabel *chooseTimeLabel; // 时间


@property (weak, nonatomic) IBOutlet UITableView *orderCoffeeTableView; // TableView
@property (weak, nonatomic) IBOutlet UILabel *totlePriceLabel; // 总价

@property (weak, nonatomic) IBOutlet UIButton *sendOrderButton; // 发送
@property (weak, nonatomic) IBOutlet UIButton *hastenOrderButton; // 催单


// Date Handel
@property (nonatomic, strong) ReserveDateHandel *dateHandel;
@property (nonatomic, assign) float totlePrice; // 总价
@property (nonatomic, assign) BOOL canChange; // 是否还可以更改订单

@end

@implementation CheckOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.navigationItem.title = @"我想来坐坐";
//    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
    self.navigationController.navigationBarHidden = YES;
//    [self makeToolBar:@"我想来坐坐"]; // 需要 黑的Title
    [self makeNavWithTitleLabel:@"我想来坐坐"];
    
    // 设置 返回键 Title
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
//    self.navigationItem.backBarButtonItem = backItem;
//    backItem.title = @" ";
    
    self.dateHandel = [ReserveDateHandel shareReserveDatehandel];
    
    // 布局 ( 初始化 )
    [self updateSubviewsFrame];
    
    // 显示 人数、日期、时间
    [self showReservePersonCountAndTimeInfo];
    _personCountTag = 2000 + self.personCount - 1;

    // 显示 总价
    [self showTotlePrice];
    
    // 订单是否可以更改
    self.canChange = YES;
    
    // 添加 更改预定信息 的点击
    [self addChangeReserveInfoAction];
    
    // 添加 更改预定信息 View
    [self setChangeReserveInfoView];
    
    // 添加 倒计时显示
    [self setCountDownViews];
    
    // TableView
    self.orderCoffeeTableView.delegate = self;
    self.orderCoffeeTableView.dataSource = self;
    self.orderCoffeeTableView.bounces = NO;
    self.orderCoffeeTableView.showsHorizontalScrollIndicator = NO;
    self.orderCoffeeTableView.showsVerticalScrollIndicator = NO;
    self.orderCoffeeTableView.separatorColor = [UIColor clearColor];
    [self.orderCoffeeTableView registerNib:[UINib nibWithNibName:@"CoffeeCountTableViewCell" bundle:nil] forCellReuseIdentifier:@"CoffeeCountTableViewCell"]; // 注册
    

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 布局 -

-(void)updateSubviewsFrame{
    
    // (1) 修改 MainScrollView 上视图的布局
    // 记录
    CGFloat space = 10; // 据两边的间隔
    CGFloat frame_width = s_width - 2 * space; // 除去左右间隔后的 Width
    _scroll_height = s_height - 105 - 64; // 滚动视图的高度
    
    CGFloat table_height = _scroll_height - 185; // TabelView 的高度
    if ( self.coffeeNameArray.count*50 < table_height) {
        _scroll_height = _scroll_height - (table_height - self.coffeeNameArray.count*50);
        table_height = self.coffeeNameArray.count*50;
    }
    
    
    // 修改
    self.mainScrollView.frame = CGRectMake(0, 64, s_width, _scroll_height); // 留出Button 的位置 80
    self.mainScrollView.contentSize = CGSizeMake(s_width, _scroll_height);

    self.textLabel1.frame = CGRectMake(space, 10, frame_width , 30);
    self.separateLine1.frame = CGRectMake(space, 50, frame_width, 1);
    self.showReserveInfoView.frame = CGRectMake(space, 55, frame_width, 80);
    self.textLabel2.frame = CGRectMake(space, 140, frame_width , 30);
    self.separateLine2.frame = CGRectMake(space, 175, frame_width, 1);
    self.orderCoffeeTableView.frame = CGRectMake(space, 180, frame_width, table_height);
    
    // (2) 修改 ShowReserveInfoView 上视图的布局
    self.textLabel_1.frame = CGRectMake(0, 5, 110, 30);
    self.textLabel_2.frame = CGRectMake(0, 45, 110, 30);
    self.personCountLabel.frame = CGRectMake(frame_width - 120, 5, 120, 30);
    self.chooseDateLabel.frame = CGRectMake(frame_width - 65 - 95, 45, 95, 30);
    self.chooseTimeLabel.frame = CGRectMake(frame_width - 65, 45, 65, 30);
    
    // (3) 修改 TotlePriceLabel / Button 位置
    self.totlePriceLabel.frame = CGRectMake(s_width - 200 - 50, s_height - 60 - 30 - 10, 200, 30);
    self.sendOrderButton.frame = CGRectMake(45, s_height - 20 - 40, 100, 40);
    self.hastenOrderButton.frame = CGRectMake(s_width - 100 - 45, s_height - 20 - 40, 100, 40);
    
}

-(void)setChangeReserveInfoView
{
    // 从下方弹出的 更改预定信息View
    self.changeReserveInfoView = [[ChangeReserveInfoView alloc] initWithFrame:self.view.frame];
    self.changeReserveInfoView.backgroundColor = [UIColor clearColor];
    self.changeReserveInfoView.hidden = YES;
    
    [self.changeReserveInfoView setChangeReserveInfoView];
    [self.changeReserveInfoView setDatePickerInfoWithReserveDate:self.dateHandel.reserveDate minimumDate:[self.dateHandel getMinimumDate] maximumDate:[self.dateHandel getMaximumDate]]; // Date Picker
    [self.changeReserveInfoView setSubviewsActionWithTarget:self saveInfoAction:@selector(changeReserveInfoViewSaveTheChange) dismissAction:@selector(dismissChangeReserveInfoView) countChangeAction:@selector(personCountDidChange:)]; // Target - Action
    
    [self.view addSubview:self.changeReserveInfoView];

}

-(void)setCountDownViews
{
    // 催单后出现的 倒计时
    self.countdownIV = [[UIImageView alloc] initWithFrame:CGRectMake(s_width/2 - 70, 80, 140, 140)];
    self.countdownIV.image = [UIImage imageNamed:@"quan"];
    [self.view insertSubview:self.countdownIV atIndex:0];
    
    label1 = [[UILabel alloc]initWithFrame:CGRectMake(_countdownIV.center.x-40 , _countdownIV.center.y -40, 100, 30)];
    label1.font = [UIFont systemFontOfSize:13];
    label1.text = @"确定时间还剩：";
    [self.view insertSubview:label1 belowSubview:_countdownIV];
    label = [[UILabel alloc]initWithFrame:CGRectMake(_countdownIV.center.x-15, _countdownIV.center.y -10, 60 ,60 )];
    label.text = @"30";
    label.font=[ UIFont systemFontOfSize:40];
    [self.view insertSubview:label belowSubview:_countdownIV];

}

#pragma mark - 显示 人数、日期、时间-
-(void)showReservePersonCountAndTimeInfo
{
    self.personCountLabel.text = [NSString stringWithFormat:@"%d",self.personCount];
    self.chooseTimeLabel.text = [self.dateHandel getReserveTimeString];
    self.chooseDateLabel.text = [self.dateHandel getReserveDateStringWithJudge:YES]; // 判断日期是否为 今/明/后天
}

#pragma mark - 显示总价 -
-(void)showTotlePrice
{
    self.totlePrice = 0;
    for (int i = 0; i < self.coffeePriceArray.count; i++) {
        
        self.totlePrice += [self.orderCountArray[i] intValue] * [self.coffeePriceArray[i] intValue];
    }
    self.totlePriceLabel.text = [NSString stringWithFormat:@"￥ %g",self.totlePrice];
}

#pragma mark - 订单是否可以更改 BOOL ( 重写 Set )-
-(void)setCanChange:(BOOL)canChange
{
    _canChange = canChange;
    
    // 操作
    self.showReserveInfoView.userInteractionEnabled = canChange;
    [self.orderCoffeeTableView reloadData];
    self.sendOrderButton.userInteractionEnabled = canChange;
    self.hastenOrderButton.userInteractionEnabled = canChange;
    
    // Button selected 与 Normal 状态下图片不同
    self.sendOrderButton.selected = !canChange;
    self.hastenOrderButton.selected = !canChange;

}

#pragma mark - 更改预定信息  人数、日期、时间-

#pragma mark - 添加 更改预定的手势 -
-(void)addChangeReserveInfoAction
{
    // 添加 单击手势
    UITapGestureRecognizer *changeReserveInfoTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showChangeReserveInfoView)];
    
    [self.showReserveInfoView addGestureRecognizer:changeReserveInfoTap];

}

#pragma mark - 弹出/收回 更改视图 -

-(void)showChangeReserveInfoView
{
    [self changeReserveInfoViewIsShow:YES];
}
-(void)dismissChangeReserveInfoView
{
    [self changeReserveInfoViewIsShow:NO];
}

-(void)changeReserveInfoViewIsShow:(BOOL)isShow
{
    self.changeReserveInfoView.hidden = !isShow; // Set方法里添加了动画
    
    if (isShow == YES) {
        UIButton *selectButton = (UIButton *)[self.changeReserveInfoView.chooseCountView viewWithTag:self.personCount + 2000 - 1];
        self.changeReserveInfoView.loopImageView.center = selectButton.center;
        [self personCountDidChange:selectButton];
        self.changeReserveInfoView.datePicker.date = self.dateHandel.reserveDate;
    }
    self.mainScrollView.userInteractionEnabled = !isShow;
    self.sendOrderButton.userInteractionEnabled = !isShow;
    self.hastenOrderButton.userInteractionEnabled = !isShow;
}

#pragma mark - 更改 人数 -
-(void)personCountDidChange:(UIButton *)button
{
    
    // 将上一个button的选中取消
    if (_personCountTag != 0) {
        UIButton *lastBtn = (UIButton *)[button.superview viewWithTag:_personCountTag];
        lastBtn.selected = NO;
    }
    
    button.selected = YES;
    _personCountTag = (int)button.tag;
    
    // 改变圆环中心
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    self.changeReserveInfoView.loopImageView.center = button.center;
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
    NSLog(@"button tag : %d ",(int)button.tag);
}
#pragma mark - 取消更改 -
-(void)changeReserveInfoViewCancelTheChange
{
//    _personCountTag = 2000 + self.personCount - 1;
    [self dismissChangeReserveInfoView];
}

#pragma mark - 保存更改 -
-(void)changeReserveInfoViewSaveTheChange
{
    // 更改 预定信息
    self.dateHandel.reserveDate = [self.changeReserveInfoView.datePicker date];
    self.personCount = _personCountTag - 2000 + 1;
    
    [self showReservePersonCountAndTimeInfo];
    [self dismissChangeReserveInfoView];
}

#pragma mark - 更改 咖啡数 -
#pragma mark - 加 -
-(void)addOrderCountAction:(UIButton *)button{
    
    // Button所在的Cell
    CoffeeCountTableViewCell *cell = (CoffeeCountTableViewCell *)[[button superview] superview];
    
    // 杯数 +1
    int orderCount = [cell.coffeeCountLabel.text intValue]; // 当前杯数
    if (orderCount <= 9) {
        orderCount ++;
        cell.coffeeCountLabel.text = [NSString stringWithFormat:@"%d",orderCount];
        [self.orderCountArray removeObjectAtIndex:cell.indexPath.row];
        [self.orderCountArray insertObject:cell.coffeeCountLabel.text atIndex:cell.indexPath.row];    }
    
    [self.orderCoffeeTableView reloadRowsAtIndexPaths:@[cell.indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self showTotlePrice];
}
#pragma mark - 减 -
-(void)subtractOrderCountAction:(UIButton *)button{
    
    // Button所在的Cell
    CoffeeCountTableViewCell *cell = (CoffeeCountTableViewCell *)[[button superview] superview];
    
    // 杯数 -1
    int orderCount = [cell.coffeeCountLabel.text intValue]; // 当前杯数
    if (orderCount >= 1) {
        orderCount --;
        cell.coffeeCountLabel.text = [NSString stringWithFormat:@"%d",orderCount];
        [self.orderCountArray removeObjectAtIndex:cell.indexPath.row];
        [self.orderCountArray insertObject:cell.coffeeCountLabel.text atIndex:cell.indexPath.row];
    }
    [self.orderCoffeeTableView reloadRowsAtIndexPaths:@[cell.indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self showTotlePrice];
}

#pragma mark - 发送 / 催单 -

- (IBAction)sendOrderAction:(UIButton *)sender {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"亲爱的顾客：您的这份订单将直接发送至商家\n您可以在“我的订单”中查看订单状态" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"发送", nil];
    alertView.tag = 2002; // 标记 警示框
    
    [alertView show];
}

- (IBAction)pragmamarkTableViewDelegatehastenOrderAction:(UIButton *)sender {
    
    // ScrollView向下滑动,出现倒计时框
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    
    
    if (self.mainScrollView.frame.size.height == _scroll_height) {
        self.mainScrollView.frame = CGRectMake(0, 240, s_width, s_height - 105 - 240);
        [self timerMaker];
        [_timer setFireDate:[NSDate distantPast]];
        self.canChange = NO;

    }else{
        self.mainScrollView.frame = CGRectMake(0, 64, s_width, _scroll_height);
    }
    
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
}

#pragma mark - AlertView Delegate -
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 2002) {
        // 发送 订单
        if (buttonIndex == 1) {
            // 确定 发送
            
            // 选择支付方式 AlertView
            ConfirmPaymentAlertView *alertView = [[ConfirmPaymentAlertView alloc] initWithFrame:self.view.bounds];
            [self.view addSubview:alertView];
            [alertView showConfirmPaymentAlertViewWithSupview:self.view target:self paymentActionOne:@selector(paymentActionOne:) paymentActionTwo:@selector(paymentActionTwo:) totlePrice:self.totlePrice personCount:self.personCount reserveDay:self.chooseDateLabel.text reserveTime:self.chooseTimeLabel.text]; 
            self.canChange = NO;
            self.mainScrollView.userInteractionEnabled = NO;
         
            
            
        }
    }
}

#pragma mark - 支付 Action -
-(void)paymentActionOne:(UIButton *)button
{
    [button.superview.superview removeFromSuperview];
    self.canChange = YES;
    self.mainScrollView.userInteractionEnabled = YES;

}

-(void)paymentActionTwo:(UIButton *)button
{
    [button.superview.superview removeFromSuperview];
    self.canChange = YES;
    self.mainScrollView.userInteractionEnabled = YES;
}



#pragma mark - 定时器 -
-(void)timerMaker
{
    timeCount = 0.0;
    count = 0;
    num = 30;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(runLoop) userInfo:nil repeats:YES];
    [_timer setFireDate:[NSDate distantFuture]];
    
}
-(void)runLoop
{
    timeCount += 3.6;
    count++;
    if (count==100) {
        num -=1;
        label.text=[NSString stringWithFormat:@"%ld",(long)num];
        count = 0;
    }
    
    self.countdownIV.transform = CGAffineTransformMakeRotation(- M_PI / 180 * timeCount);
    
    if (timeCount - 360 * 30>0) {
        if (timeCount -360 * 30<=2.7) {
            
            [_timer setFireDate:[NSDate distantFuture]];
            
            UIAlertView * alertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"亲爱的顾客: \n 商家没有在规定时间内接受到您的订单 \n " delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
            
            self.canChange = YES;
        }
    }
}


#pragma mark - TableView Delegate -

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CoffeeCountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CoffeeCountTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    cell.indexPath = indexPath;
    [cell setCoffeeName:[self.coffeeNameArray objectAtIndex:indexPath.row] orderCount:[self.orderCountArray objectAtIndex:indexPath.row]];
    [cell setTarget:self addButtonAction:@selector(addOrderCountAction:) subtractButtonAction:@selector(subtractOrderCountAction:) canChange:self.canChange];
    
    
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.coffeeNameArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
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
