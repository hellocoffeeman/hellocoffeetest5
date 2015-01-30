//
//  OrderModel.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/2.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderModel : NSObject

@property (nonatomic, strong) NSString *dateString;
@property (nonatomic, strong) NSString *timeString;
@property (nonatomic, strong) NSString *statusString;

@property (nonatomic, strong) NSString *portraitUrl;

@property (nonatomic, strong) NSString *priceString;
@property (nonatomic, strong) NSString *scheduleString;
@property (nonatomic, strong) NSString *productString;

@property (nonatomic, strong) NSString *orderNum;

@property (nonatomic, strong) NSString *imgStatusString;

@end
