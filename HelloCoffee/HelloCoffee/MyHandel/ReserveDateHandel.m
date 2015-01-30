//
//  ReserveDateHandel.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/2.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ReserveDateHandel.h"

#pragma mark - 声明单例 -
static ReserveDateHandel *_reserveDateHandel = nil;

@interface ReserveDateHandel ()

@property (nonatomic, strong) NSDate *minimumDate; // 选择时间最小值 Date
@property (nonatomic, strong) NSDate *maximumDate; // 选择时间最大值 Date

@property (nonatomic, strong) NSMutableArray *dayStrArray; // 可预订日期 Array
@property (nonatomic, strong) NSMutableArray *weekdayArray; // 可预订星期 Array

@end

@implementation ReserveDateHandel



#pragma mark - 单例 -

+ (instancetype)shareReserveDatehandel
{
    @synchronized(self) {
        if (_reserveDateHandel == nil) {
            _reserveDateHandel = [[ReserveDateHandel alloc] init];
        }
    }
    return _reserveDateHandel;
}

+ (instancetype)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if (_reserveDateHandel == nil) {
            _reserveDateHandel = [super allocWithZone:zone];
            return _reserveDateHandel;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}



#pragma mark - 初始化 时间信息 -
-(void)initDateInformation
{
    // 未调用
    
}

#pragma mark - 将String转化为预定Date -
-(void) setReserveDateWithNumder:(int)number timeString:(NSString *)timeString
{
    // 得到预定的 日期
    NSDate *reserveDate = [NSDate dateWithTimeIntervalSinceNow:24 * 60 * 60 * number];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE yyyy MM月dd日"];
    
    NSString *reserveDateStr = [NSString stringWithFormat:@"%@ %@",[dateFormatter stringFromDate:reserveDate],timeString];
    
    [dateFormatter setDateFormat:@"EEE yyyy MM月dd日 HH:mm"];
    
    self.reserveDate = [dateFormatter dateFromString:reserveDateStr];
    
    NSLog(@"Set - ReserveDate : %@ ",[dateFormatter stringFromDate:self.reserveDate]);
}

#pragma mark - Get 方法 -

// 当前时间 String
-(NSString *)getNowTimeString
{
    NSDate * date=[NSDate date];
    NSDateFormatter * dateFormatter=[[NSDateFormatter alloc]init];
    dateFormatter.dateFormat=@"HH:mm";
    NSString *nowTimeStr = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:date]];
    return nowTimeStr;
}

// 预定时间 String
-(NSString *)getReserveTimeString
{
    NSDateFormatter * dateFormatter=[[NSDateFormatter alloc]init];
    dateFormatter.dateFormat=@"HH:mm";
    NSString *reserveTimeStr = [dateFormatter stringFromDate:self.reserveDate];
    return reserveTimeStr;
}

// 预定日期 String [是否判断 今/明/后天]
-(NSString *)getReserveDateStringWithJudge:(BOOL)judge
{
    NSDateFormatter * dateFormatter=[[NSDateFormatter alloc]init];
    dateFormatter.dateFormat=@"MM月dd日";
    NSString *reserveDateStr = [dateFormatter stringFromDate:self.reserveDate];
    
    // 是否判断
    if (judge) {
        NSArray *array = @[@"今天",@"明天",@"后天"];
        for (int i = 0; i < 3; i++) {
            if ([reserveDateStr isEqualToString:self.dayStrArray[i]]) {
                return [array objectAtIndex:i];
            }
        }
    }
    return reserveDateStr;
}

// 可选星期 Array
-(NSArray *)getWeekDayArray
{
    if (self.dayStrArray.count == 0) {
        [self setOneWeekDateArray]; // 设置 一周可选时间
    }
    return self.weekdayArray;
}

// 可选日期 Array
-(NSArray *)getDayStrArray
{
    if (self.dayStrArray.count == 0) {
        [self setOneWeekDateArray]; // 设置 一周可选时间
    }
    return self.dayStrArray;
}

// 选择时间最小值 Date
-(NSDate *)getMinimumDate
{
    if (self.minimumDate == nil) {
        [self setCanChooseDateRange]; // 设置可选的 max/min时间
    }
    return self.minimumDate;
}

// 选择时间最大值 Date
-(NSDate *)getMaximumDate
{
    if (self.maximumDate == nil) {
        [self setCanChooseDateRange]; // 设置可选的 max/min时间
    }
    return self.maximumDate;
}

#pragma mark - 设置可选的 max/min时间 -
-(void)setCanChooseDateRange
{
    self.minimumDate = [NSDate date]; // Min为当前时间
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    
    NSString *maximumDateStr = [NSString stringWithFormat:@"%@2359",[dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:24 * 60 * 60 * 6] ]];
    
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setLocale:[NSLocale currentLocale]];
    [dateFormatter1 setDateFormat:@"yyyyMMddHHmm "];
    
    self.maximumDate = [dateFormatter1 dateFromString:maximumDateStr]; // Max为最后一天的24点
}

#pragma mark - 得到 一周的可选时间 -
-(void)setOneWeekDateArray
{
    self.dayStrArray = [NSMutableArray array];
    self.weekdayArray = [NSMutableArray array];
    
    // 设置 时间格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:@"EEE MM月dd日"];
    
    for (int i = 0; i < 7; i++) {
        
        NSDate *canChooseDate = [NSDate dateWithTimeIntervalSinceNow:24 * 60 * 60 * i];
        NSString *canChooseDateStr = [dateFormatter stringFromDate:canChooseDate];
        
        NSArray * tempArray = [canChooseDateStr componentsSeparatedByString:@" "]; // 用 "空格" 分隔
        [self.weekdayArray addObject:[self getWeekStringByString:tempArray[0]]];
        [self.dayStrArray addObject:tempArray[1]];
        
    }
}

-(NSString *)getWeekStringByString:(NSString *)string
{
    NSArray *array_1 = @[@"Mon",@"Tue",@"Wed",@"Thu",@"Fri",@"Sat",@"Sun"]; // 英文 系统下
    NSArray *array_2 = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"]; // 中文 系统下
    
    NSArray *array_3 = @[@"周\n一",@"周\n二",@"周\n三",@"周\n四",@"周\n五",@"周\n六",@"周\n日"];
    
    NSInteger i = [array_1 indexOfObject:string];
    
    if (i > 6 || i < 0) { // 若 英文系统下 未找到匹配项
        i = [array_2 indexOfObject:string];
    }
    
    return [array_3 objectAtIndex:i];
}



@end
