//
//  ChangeReserveInfoView.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/28.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ChangeReserveInfoView.h"

@implementation ChangeReserveInfoView

{
    NSDateFormatter *_dateFormatter; // 默认时间格式
}

#pragma mark - 布局 -

-(void)setChangeReserveInfoView
{
    // 初始化 所有视图
    [self setSubviewsWithFrame];
    
    // 设置 时间格式
    _dateFormatter = [[NSDateFormatter alloc] init] ;
    [_dateFormatter setLocale:[NSLocale currentLocale]];
    [_dateFormatter setDateFormat:@"EEE yyyy年 MM月dd日 HH时mm分"];
    
}

#pragma mark - 添加方法 -

-(void)setSubviewsActionWithTarget:(id)target saveInfoAction:(SEL)saveInfoAction dismissAction:(SEL)dismissAction countChangeAction:(SEL)countChangeAction
{
    // 保存更改 Action
    [self.saveButton addTarget:target action:saveInfoAction forControlEvents:UIControlEventTouchUpInside];
    
    // 取消更改 Action
    [self.cancelButton addTarget:target action:dismissAction forControlEvents:UIControlEventTouchUpInside];
    
    // 视图消失 Action
    UITapGestureRecognizer *transparentViewTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:dismissAction];
    [self.transparentView addGestureRecognizer:transparentViewTap];
    
    // 更改人数 Action
    [self.chooseCountView setButtonsWithCount:5 buttonTitles:@[@"1",@"2",@"3",@"4",@"5"] target:target buttonAction:countChangeAction];
    
    // 更改时间 Picker
    [self.datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
}

#pragma mark - Date Picker -

// Date Picker 显示选择的时间
-(void)setDatePickerInfoWithReserveDate:(NSDate *)reserveDate minimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate
{
    
    [self.datePicker setDatePickerMode:UIDatePickerModeDateAndTime]; // 设置 显示模式
    [self.datePicker setTimeZone:[NSTimeZone timeZoneWithName:@"CCD"]]; // 设置时区
    
    [self.datePicker setDate:reserveDate animated:YES]; // 预定 date
    self.datePicker.minimumDate = minimumDate; // Min Date
    self.datePicker.maximumDate = maximumDate; // Max Date
}

// Date Picker 当值发生改变的时候调用的方法
-(void)datePickerValueChanged:(id)datePicker
{
    NSDate *selectedDate = [datePicker date];
    
    NSString *destDateString = [_dateFormatter stringFromDate:selectedDate];
    
    NSLog(@"Selected Date : %@ ",destDateString);
}

#pragma mark - 重写 Set Hidden -
-(void)setHidden:(BOOL)hidden
{
    if (hidden == NO) {
        
        // 弹出
        [super setHidden:hidden];
        
        [UIView animateWithDuration:0.35 animations:^{
            self.unTransparentView.center = CGPointMake(s_width/2, s_height - 175);
            self.transparentView.alpha = 0.4;
        } completion:nil];
        
    }else{
        // 收回
        [UIView animateWithDuration:0.35 animations:^{
            self.unTransparentView.center = CGPointMake(s_width/2, s_height + 175);
            self.transparentView.alpha = 0;
        } completion:^(BOOL finished) {
            [super setHidden:hidden];
        }];
        
    }
}


#pragma mark - 设置 Frame -
-(void)setSubviewsWithFrame
{
    // 底层部分 - 透明View
    self.transparentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, s_width, s_height)];
    self.transparentView.backgroundColor = [UIColor blackColor];
    self.transparentView.alpha = 0;
    [self addSubview:self.transparentView];
    
    // 下半部分 - 不透明View [ 高度：350 ]
    self.unTransparentView = [[UIView alloc] initWithFrame:CGRectMake(0, s_height + 100, s_width, 350)];
    self.unTransparentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.unTransparentView];

    // 下半部分：
    // (1) save/cancel Button
    self.saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.saveButton.frame = CGRectMake(s_width - 50 - 80, 10, 80, 50);
//    self.saveButton.backgroundColor = [UIColor orangeColor];
    [self.saveButton setTitle:@"保存更改" forState:UIControlStateNormal];
    [self.saveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.unTransparentView addSubview:self.saveButton];
    
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelButton.frame = CGRectMake( 50, 10, 80, 50);
//    self.cancelButton.backgroundColor = [UIColor orangeColor];
    [self.cancelButton setTitle:@"取消更改" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.unTransparentView addSubview:self.cancelButton];
    
    // (2) 更改人数 View + 圆环
    self.chooseCountView = [[SegmentButtonView alloc] initWithFrame:CGRectMake((s_width - 250)/2, 70, 250, 50)];
//    self.chooseCountView.backgroundColor = [UIColor darkTextColor];
    [self.unTransparentView addSubview:self.chooseCountView];
    
    self.loopImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.loopImageView.image = [UIImage imageNamed:@"xuanzhongquan"];
    [self.chooseCountView addSubview:self.loopImageView];
    
    // (3) 更改时间 Picker
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 130, s_width, 216)];
    [self.unTransparentView addSubview:self.datePicker];
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
