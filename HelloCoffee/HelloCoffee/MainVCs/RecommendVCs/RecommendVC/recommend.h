//
//  recommend.h
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/4.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface recommend : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    
}
@property (copy,nonatomic) NSString *state;
@property (strong, nonatomic)  UITableView *table;

@end
