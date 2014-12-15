//
//  CheckOrderViewController.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/25.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//
#import "BaseViewController.h"
#import <UIKit/UIKit.h>

@interface CheckOrderViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

// 选择 日期、时间、人数
@property (nonatomic, assign) int personCount;

@property (nonatomic, strong) NSMutableArray *coffeeNameArray; // coffee 种类
@property (nonatomic, strong) NSMutableArray *coffeePriceArray; // coffee 价格
@property (nonatomic, strong) NSMutableArray *orderCountArray; // 记录每种coffee的杯数


@end
