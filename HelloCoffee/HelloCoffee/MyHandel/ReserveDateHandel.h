//
//  ReserveDateHandel.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/2.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReserveDateHandel : NSObject

@property (nonatomic, strong) NSDate *reserveDate; // 预定的时间 Date


+(instancetype)shareReserveDatehandel; // 单例

// 方法

-(void) setReserveDateWithNumder:(int)number timeString:(NSString *)timeString; // 将String转化为预定Date

-(NSString *)getNowTimeString; // 当前时间 String

-(NSString *)getReserveTimeString; // 预定时间 String

-(NSString *)getReserveDateStringWithJudge:(BOOL)judge; // 预定日期 String [是否判断 今/明/后天]

-(NSDate *)getMinimumDate; // 选择时间最小值 Date

-(NSDate *)getMaximumDate; // 选择时间最大值 Date

-(NSArray *)getDayStrArray; // 可预订 日期 Array

-(NSArray *)getWeekDayArray; // 可预订 星期 Array




@end
