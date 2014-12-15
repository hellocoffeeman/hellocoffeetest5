//
//  OrderCoffeeViewController.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/21.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCoffeeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

// 选择 日期、时间、人数
@property (nonatomic, assign) int personCount;


@end
