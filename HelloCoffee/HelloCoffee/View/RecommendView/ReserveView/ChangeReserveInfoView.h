//
//  ChangeReserveInfoView.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/28.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentButtonView.h"

@interface ChangeReserveInfoView : UIView


/* 
 布局 : View 应该与屏幕一样大
 底层部分 - 是一个可由透明变为半透明的 View
 下半部分 - 是一个不透明的 View
 
 下半部分 :
 上方 - 是保存或取消 Button
 中间 - 是更改人数的 View
 下方 - 是更改时间的 UIDatePicker
*/

@property (nonatomic, strong) UIView *transparentView; // 底层部分 - 透明View
@property (nonatomic, strong) UIView *unTransparentView; // 下半部分 - 不透明View

// 视图均放在下半部分
@property (nonatomic, strong) UIButton *saveButton; // 上方 - 保存Button
@property (nonatomic, strong) UIButton *cancelButton; // 上方 - 取消Button
@property (nonatomic, strong) UIImageView *loopImageView; // 选择人数 圆环
@property (nonatomic, strong) SegmentButtonView *chooseCountView; // 中间 - 更改人数View
@property (nonatomic, strong) UIDatePicker *datePicker; // 下方 - 更改时间Picker


// 方法

-(void)setChangeReserveInfoView; // 初始化View上的视图

-(void)setDatePickerInfoWithReserveDate:(NSDate *)reserveDate minimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate; // 设置DatePicker的时间

-(void)setSubviewsActionWithTarget:(id)target saveInfoAction:(SEL)saveInfoAction dismissAction:(SEL)dismissAction countChangeAction:(SEL)countChangeAction;



@end
