//
//  WantSeachViewController.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/14.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "BaseViewController.h"
#import "TMQuiltView.h"

typedef enum {
    WantSight = 0,//情景
    WantType,//商区
    WantActivity,//主题
    WantPrise//价格
}Type; // VC显示类型

@interface WantSeachViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic, assign)Type type;

@end
